# flutter-pos-demo

## Development Setup

This project keeps machine-specific configuration local to each developer machine.

### Flutter

- Install the latest stable Flutter SDK.
- Run `flutter pub get` after cloning the project.
- Use `dart format .`, `flutter analyze`, and `flutter test` before sending changes.

### Android

- Set `JAVA_HOME` locally on your machine for Android builds.
- Do not hardcode `org.gradle.java.home` in the repository.
- Use a valid JDK installation on each machine, then let Gradle pick it up from `JAVA_HOME`.
- If you see a Java home error, confirm that the local JDK path exists and is accessible.

### iOS

- Use Xcode with the latest stable Flutter-supported iOS toolchain.
- Run `flutter pub get` after switching machines or branches.
- If pods become stale, run `cd ios && pod install`.
- For simulator or device builds, make sure Xcode command line tools are selected correctly.

### Windows / macOS

- Keep per-machine SDK paths in environment variables or IDE settings.
- On macOS, set `JAVA_HOME` in your shell profile or IDE.
- On Windows, set `JAVA_HOME` in System Environment Variables.
- Avoid committing local IDE or JDK path settings into the repo.

### Notes

- This repository is offline-first and demo-oriented, so local setup should work without backend dependencies.
- If Android builds fail after moving machines, the first thing to check is `JAVA_HOME`.
