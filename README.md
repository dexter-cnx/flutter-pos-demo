# flutter-pos-demo

## Development Setup

This project keeps machine-specific configuration local to each developer machine.

### Flutter

- Install the latest stable Flutter SDK.
- Run `flutter pub get` after cloning the project.

### Makefile (Recommended)

To simplify common tasks, you can use `make` (or `.\make.ps1` on Windows):
- `make get` / `.\make.ps1 get` - Run `flutter pub get`
- `make gen-i18n` / `.\make.ps1 gen-i18n` - Sync translations from CSV to JSON
- `make build-runner` / `.\make.ps1 build-runner` - Run code generation
- `make format` / `.\make.ps1 format` - Format code
- `make analyze` / `.\make.ps1 analyze` - Analyze code
- `make fix-web` / `.\make.ps1 fix-web` - Apply Isar web fixes
- `make run-web` / `.\make.ps1 run-web` - Run on Chrome
- `make run-windows` / `.\make.ps1 run-windows` - Run on Windows

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

### Web Demo

[Demo](https://dexter-cnx.github.io/flutter-pos-demo/)