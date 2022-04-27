import 'package:zanmelodic/src/repositories/features/folder/repo.dart';
import 'package:zanmelodic/src/repositories/features/folder/repo_impl.dart';
import 'package:zanmelodic/src/repositories/features/tracks/repo.dart';
import 'package:zanmelodic/src/repositories/features/tracks/repo_impl.dart';

class Domain {
  static Domain? _internal;
  Domain._() {
    tracks = TracksRepositoryImpl();
    folder = FolderRepositoryImpl();
  }
  factory Domain() {
    _internal ??= Domain._();
    return _internal!;
  }

  late final TracksRepository tracks;
  late final FolderRepository folder;
}
