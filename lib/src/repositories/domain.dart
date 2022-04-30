import 'package:zanmelodic/src/repositories/features/album/repo.dart';
import 'package:zanmelodic/src/repositories/features/album/repo_impl.dart';
import 'package:zanmelodic/src/repositories/features/song/repo.dart';
import 'package:zanmelodic/src/repositories/features/song/repo_impl.dart';

class Domain {
  static Domain? _internal;
  Domain._() {
    song = SongRepositoryImpl();
    album = AlbumRepositoryImpl();
  }
  factory Domain() {
    _internal ??= Domain._();
    return _internal!;
  }

  late final SongRepository song;
  late final AlbumRepository album;
}
