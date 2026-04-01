import 'dart:io';

Future<bool> openSavedFile(String path) async {
  return _runForPlatform(
    windows: () => Process.run('cmd', ['/c', 'start', '', path]),
    macos: () => Process.run('open', [path]),
    linux: () => Process.run('xdg-open', [path]),
  );
}

Future<bool> openContainingFolder(String path) async {
  final folderPath = File(path).parent.path;

  return _runForPlatform(
    windows: () => Process.run('explorer', [folderPath]),
    macos: () => Process.run('open', [folderPath]),
    linux: () => Process.run('xdg-open', [folderPath]),
  );
}

Future<bool> _runForPlatform({
  required Future<ProcessResult> Function() windows,
  required Future<ProcessResult> Function() macos,
  required Future<ProcessResult> Function() linux,
}) async {
  try {
    late final ProcessResult result;
    if (Platform.isWindows) {
      result = await windows();
    } else if (Platform.isMacOS) {
      result = await macos();
    } else if (Platform.isLinux) {
      result = await linux();
    } else {
      return false;
    }

    return result.exitCode == 0;
  } catch (_) {
    return false;
  }
}
