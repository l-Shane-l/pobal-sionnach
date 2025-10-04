# Sionnach UI - A Community-Built Irish Learning App

Welcome to the official open-source repository for the Sionnach UI. This project is a community-driven effort to build a powerful and engaging Irish language learning tool that anyone can use, contribute to, and help shape.

You can see the main application this project is based on at [www.sionnach.app](https://www.sionnach.app).

This community edition is not just a demo; it's a functional application that you can use right now. You can load in your own Irish sentences and start practicing immediately. Our goal is for this app to grow and become a truly useful resource, guided by the community.

## Our Philosophy: Learn, Build, and Grow Together

This project serves two main purposes: to create a great open-source learning app and to identify talented developers who can help us build the future of Sionnach.

It's built using a portion of the code taken directly from our main application, which is approaching 100,000 lines of code. The main app is broken down into features, each ranging from a few thousand to 10,000 lines, structured just like this one. This ~2,000 line project is a perfect representation of a single feature. By learning your way around this codebase, you are gaining the exact skills needed to work on the core project.

We are committed to helping you learn. We will provide help and guidance in pull requests and discussions, keeping everything in a public space so that everyone can benefit from the conversation.

## A True Open-Source Playground

This community version is a parallel app, not just a demo. We encourage you to treat it as your own. Fork it, experiment with it, and take it in new directions.

Unlike our main application with its thousands of users, this project is a space for creativity and learning without the pressure of a production environment. Break things, try new ideas, and build the features you want to see. This is your chance to contribute to a truly open-source project from the ground up.

## The Path to the Core Team

While this is a community-led project, we are also looking for developers to join our main team. We offer a clear path for those who demonstrate their skills and commitment here.

**Anyone who makes 5+ meaningful commits, or one truly remarkable contribution, will be invited to join the core Sionnach team.**

Once on the core team, the expectation is that you will be a fully autonomous developer, able to manage your own work and contribute to our main, more complex application.

## How to Get Started: The `Scoil`

To get you up to speed, we've created the `Scoil` (Irish for "school") directory. This is your primary learning resource.

**Your First Steps:**

1.  **Listen to the Podcast**: Start with `Scoil/01_Podcast_Project_Overview.m4a`. This will give you the high-level vision for the project and our team.
2.  **Watch the Video**: Next, watch `Scoil/02_Video_Architecture_Walkthrough.mp4`. This 8-minute video provides a visual guide to our architecture.
3.  **Read the Architecture Guide**: Finally, dive into the **[Scoil/ARCHITECTURE.md](Scoil/ARCHITECTURE.md)** file. This document is the key to our entire system.

Once you have a firm grasp of the architecture, you can start exploring the code and thinking about how you can contribute.

## How to Contribute & What to Build

We value quality over quantity. A small, well-implemented feature with clean code and a clear understanding of the architecture is far more impressive than a large, messy one.

When you are ready, pick a task from the suggestions below, or propose your own. Your pull request will be the start of our conversation.

### Contribution Guidelines

Merged contributions become part of the learning platform for the next developer. Therefore, we expect your PR to be a complete package:
- **Tests**: Your feature or fix should be well-tested.
- **Documentation**: Update any relevant documentation. If you add a new feature, document how it works.
- **Content for Learners**: If you add a feature that requires content (like new lesson types), provide the necessary JSON data and explain how to use it.

### Suggested Projects

This UI was intentionally left simple. The main Sionnach app has rich feedback, animations, and more. Here are some ideas to get you started:

1.  **Make the Interface More Engaging**:
    *   Add animations for correct/incorrect answers.
    *   Implement visual feedback when a user completes a sentence or a lesson (e.g., a progress bar, confetti).
    *   Improve the layout and responsiveness of the custom keyboard.

2.  **Add New Content & Features**:
    *   **Spaced Repetition**: Design a simple UI for a spaced repetition system (SRS). The logic can be simple for now, focusing on the user interface for reviewing words or sentences.
    *   **On-the-Fly Lesson Creation**: Build a feature that allows users to create a simple lesson (a list of sentence pairs) directly on their device. The created lesson should be stored in a local JSON file.
    *   **Integrate a Public API**: Find a public API (e.g., a dictionary API) and build a feature around it. All content must be self-contained within the app; no external databases.

3.  **Strengthen the Foundation**:
    *   **Add a Testing Framework**: Set up a robust testing environment using `flutter_test` and `mocktail`. Write unit tests for our existing providers and logic. Since our architecture separates concerns, this should be straightforward.
    *   **Implement Routing**: Integrate `go_router` to manage navigation. You could start by creating a simple "Settings" or "About" page and navigating to it. Our main app uses `go_router` with code generation, and we recommend the same approach here.
    *   **Set Up CI/CD**: Create a GitHub Actions workflow that automatically runs `flutter analyze` on every pull request. This is a critical step to ensure code quality across the project.
    *   **Build a Documentation Site**: Establish a GitHub Wiki or a GitHub Pages site for the project. This could host more in-depth documentation, tutorials, or architectural diagrams that don't fit in the `README.md`.

When you submit a pull request, explain your changes and why you made them in the context of our architecture. We look forward to seeing what you build.

## Community & Support

Have questions or want to chat with other developers? Join our community on Discord:

- **[Sionnach Community Discord](https://discord.gg/rVvPBjbW)**

## Project Structure

This repository contains the core UI components of the lesson screen.

```
lib/
├── features/
│   └── lesson/
│       ├── model/           # Data models (SentencePair, LessonDefinition)
│       ├── presentation/    # Widgets and Screens
│       ├── provider/        # State management (Riverpod providers)
│       └── widget/          # Reusable UI components
├── lesson_screen.dart       # Main screen for the lesson feature
├── main.dart                # App entry point
└── style/                   # Theme, colors, and app styling
```

## How to Impress Us

We welcome contributions that improve the user interface and experience. We value quality over quantity. A small, well-implemented feature with clean code and a clear understanding of the architecture is far more impressive than a large, messy one.

- **UI Improvements**: Better layouts, animations, responsiveness.
- **Accessibility**: Screen reader support, keyboard navigation.
- **Theming**: Dark mode improvements, color schemes.
- **New Features**: Think about what could make the learning experience better.
- **Bug Fixes**: UI glitches, layout issues.

When you submit a pull request, explain your changes and why you made them in the context of our architecture.

## Technical Stack

- **Flutter**: Cross-platform UI framework
- **Riverpod**: State management
- **Freezed**: Immutable data classes
- **go_router**: Navigation (used in the main app)
- **Testing**: `flutter_test` with `mocktail` for mocking
- **build_runner**: Code generation

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Questions?

For questions about contributing or the full Sionnach app, please [contact us/open an issue].
# pobal-sionnach
