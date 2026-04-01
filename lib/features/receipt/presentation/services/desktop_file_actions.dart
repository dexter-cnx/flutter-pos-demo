import 'desktop_file_actions_stub.dart'
    if (dart.library.io) 'desktop_file_actions_io.dart' as impl;

Future<bool> openSavedFile(String path) => impl.openSavedFile(path);

Future<bool> openContainingFolder(String path) =>
    impl.openContainingFolder(path);
