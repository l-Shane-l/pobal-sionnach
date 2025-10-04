# Our Application Architecture: A Guide to State Management

This document explains the official architecture for managing state in our Flutter application. The goal is to create a system that is predictable, testable, and easy for any engineer to work with.

The entire architecture is built on one core principle: **Separation of Concerns**. Each part of the system has one, and only one, job.

## The Three Layers of Our Architecture

Our app is divided into three distinct layers that communicate in a strict, one-way flow. Understanding the role of each layer is the key to working on this codebase.

### 1. The Data Layer: Model & Repository

This layer is responsible for the data itself and how we get it.

#### The Model (`ProductModel`)

*   **Job**: To define the shape of our data. It is the single source of truth for what a "Product" is.
*   **Key Features**:
    *   **Immutable**: Built with `freezed`, meaning once a model is created, it cannot be changed. This prevents bugs. To update it, you must create a new copy using the `.copyWith()` method.
    *   **Serialization**: Knows how to convert itself to and from JSON (`.fromJson()`/`.toJson()`) for talking to APIs like Firebase.
*   **Analogy**: The architectural blueprint for a house.

#### The Repository (`ProductRepository`)

*   **Job**: To be the only part of the app that communicates with the outside world (e.g., Firebase). It handles all I/O operations.
*   **Key Features**:
    *   **Data Translation**: It takes raw data (like a JSON map from Firestore) and uses the model's `.fromJson()` method to turn it into a clean, type-safe `ProductModel` object.
    *   **Simple API**: It exposes simple methods like `watchProduct(id)` or `updateProduct(id, data)`.
*   **Analogy**: The specialist clerk 🗂️. The rest of the app doesn't know the complex rules of talking to Firebase; it just gives simple orders to the repository.

### 2. The State Management Layer: Provider & Notifier

This layer is the "brain" of our application, powered by Riverpod.

#### The Notifier (`ProductState`)

*   **Job**: To hold and manage the app's local, interactive state. This is the only place in the entire app where state can be changed.
*   **Key Features**:
    *   **Holds State**: It contains the current version of our model (e.g., the `ProductModel` the user is looking at).
    *   **Exposes Update Logic**: It has methods (like our `update` method) that contain the logic for creating a new state.
*   **Analogy**: The manager 👨‍💼. They hold the official report (the state) and are the only one authorized to approve changes.

### 3. The Presentation Layer: UI (Widgets)

This is what the user sees and interacts with.

#### The UI (`ProductScreen`)

*   **Job**: To display the state from the Notifier and to capture user input.
*   **Key Features**:
    *   **Listens to State**: Uses `ref.watch()` to subscribe to a Notifier. When the Notifier's state changes, the UI automatically rebuilds.
    *   **Sends Actions**: Uses `ref.read()` to call methods on the Notifier to request a state change (e.g., when a button is pressed).
*   **Analogy**: The public-facing dashboard. It displays information from the manager and has buttons to submit change requests.

## The Rules of Communication & Data Flow

The layers are not a free-for-all. They communicate in a strict, one-way flow that makes our app predictable.

**UI -> Notifier -> Repository -> Firebase**

### The Write Flow (How State is Changed)

This is the most important concept. When a user wants to change something:

1.  The UI widget calls a method on the Notifier. It **does not** talk to the repository directly.
    *   `ref.read(productStateProvider(id).notifier).update(...)`
2.  The Notifier immediately updates its local state using `copyWith`. The UI, which is watching, instantly rebuilds. The app feels fast.
3.  An automatic sync provider (our `productSync` listener) is constantly watching the Notifier. When it sees the state change, it automatically calls the Repository.
4.  The Repository takes the new data and saves it to Firebase.

This one-way flow ensures that every change to our app's state happens in a single, predictable, and traceable way.

## How to Implement a New Feature (The Pattern in Action)

Now that you understand the "why," here is the "how." Follow these steps every time.

**Scenario**: We want to add a "user review" feature (a star rating and a comment) to our product.

### Step 1: Update the Model (The Blueprint)

Go to `lib/data/models/product_model.dart` and add the new fields.

```dart
@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    // ... existing fields
    @Default(true) bool isAvailable,

    // Add your new fields here
    int? starRating,
    String? reviewComment,

  }) = _ProductModel;
  // ...
}
```

### Step 2: Run the Code Generator

In your terminal, run the build runner to update the generated files (`.freezed.dart` and `.g.dart`).

```sh
dart run build_runner build --delete-conflicting-outputs
```

### Step 3: Update the UI (The Dashboard)

Go to your widget file. Display the new data and add a button to call the Notifier's `update` method.

```dart
// Display the new data
Text('Rating: ${product.starRating ?? 'Not Rated'}'),

// Add a button to request a change
ElevatedButton(
  onPressed: () {
    // Call the Notifier's update method with instructions.
    ref.read(productStateProvider(productId).notifier).update(
      (currentProduct) => currentProduct.copyWith(
        starRating: 5,
        reviewComment: 'This product is great!',
      ),
    );
  },
  child: const Text('Submit 5-Star Review'),
)
```

You are done. The existing Notifier and sync provider will handle the rest automatically. By following this pattern, you are managing state in a way that is consistent with the entire application.

## Complete Code Reference

Here are the full files for the generic Product example, which serve as a template for this architecture.

### 1. The Model (`lib/data/models/product_model.dart`)

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();
  @override
  DateTime fromJson(Timestamp timestamp) => timestamp.toDate();
  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String name,
    required double price,
    @TimestampConverter() required DateTime lastUpdated,
    String? description,
    @Default(0) int stockCount,
    @Default(true) bool isAvailable,
    int? starRating,
    String? reviewComment,
  }) = _ProductModel;

  const ProductModel._();

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
```

### 2. The Repository (`lib/data/repositories/product_repository.dart`)

```dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sionnach_ui_community/data/models/product_model.dart';

class ProductRepository {
  final FirebaseFirestore _firestore;
  ProductRepository(this._firestore);

  Stream<ProductModel?> watchProduct(String id) {
    return _firestore
        .collection('products')
        .doc(id)
        .snapshots()
        .map((docSnap) {
      if (docSnap.exists && docSnap.data() != null) {
        return ProductModel.fromJson({...docSnap.data()!, 'id': docSnap.id});
      }
      return null;
    });
  }

  Future<void> updateProduct(String id, Map<String, dynamic> data) {
    return _firestore.collection('products').doc(id).set(data, SetOptions(merge: true));
  }
}
```

### 3. The Providers (`lib/application/providers/product_providers.dart`)

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sionnach_ui_community/data/models/product_model.dart';
import 'package:sionnach_ui_community/data/repositories/product_repository.dart';
import 'package:sionnach_ui_community/data/providers/repository_providers.dart';

part 'product_providers.g.dart';

@riverpod
Stream<ProductModel?> currentProduct(CurrentProductRef ref, String productId) {
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.watchProduct(productId);
}

@riverpod
class ProductState extends _$ProductState {
  @override
  AsyncValue<ProductModel?> build(String productId) {
    return ref.watch(currentProductProvider(productId));
  }

  void update(ProductModel Function(ProductModel currentProduct) updater) {
    if (state.value == null) return;
    final updatedProduct = updater(state.value!);
    state = AsyncData(updatedProduct);
  }
}

@riverpod
void productSync(ProductSyncRef ref, String productId) {
  final productRepository = ref.read(productRepositoryProvider);

  ref.listen(productStateProvider(productId), (previous, next) {
    final product = next.value;
    final previousProduct = previous?.value;

    if (next.hasValue && product != null && product != previousProduct) {
      try {
        productRepository.updateProduct(product.id, product.toJson());
      } catch (error) {
        ref.read(productStateProvider(productId).notifier).state = previous ?? const AsyncValue.loading();
      }
    }
  });
}
```

## Further Reading & Resources

This architecture is heavily inspired by the best practices in the Flutter community. To deepen your understanding, please review the source materials:

*   **[Flutter Riverpod 2.0: The Ultimate Guide](https://codewithandrea.com/articles/flutter-state-management-riverpod/)**: A comprehensive guide to Riverpod.
*   **[How to Auto-Generate your Providers with Flutter Riverpod Generator](https://codewithandrea.com/articles/flutter-riverpod-generator/)**: Explains the code generation we use.
*   **[Flutter: Riverpod Async Notifiers & AsyncNotifierProvider](https://codewithandrea.com/articles/flutter-riverpod-async-notifier/)**: A deep dive into the `AsyncNotifier` pattern.
*   **[Reddit: Riverpod is not complicated](https://www.reddit.com/r/FlutterDev/comments/1bqozbg/riverpod_is_not_complicated_getting_started_guide/)**: A good discussion and getting started guide.
