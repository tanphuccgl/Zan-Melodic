import 'package:zanmelodic/src/repositories/features/album/repo.dart';
import 'package:zanmelodic/src/repositories/features/album/repo_impl.dart';
import 'package:zanmelodic/src/repositories/features/artist/repo.dart';
import 'package:zanmelodic/src/repositories/features/artist/repo_impl.dart';
import 'package:zanmelodic/src/repositories/features/audio_online/repo.dart';
import 'package:zanmelodic/src/repositories/features/audio_online/repo_impl.dart';
import 'package:zanmelodic/src/repositories/features/favorites/repo.dart';
import 'package:zanmelodic/src/repositories/features/favorites/repo_impl.dart';
import 'package:zanmelodic/src/repositories/features/folder/repo.dart';
import 'package:zanmelodic/src/repositories/features/folder/repo_impl.dart';
import 'package:zanmelodic/src/repositories/features/most_listen/repo.dart';
import 'package:zanmelodic/src/repositories/features/most_listen/repo_impl.dart';
import 'package:zanmelodic/src/repositories/features/playlist/repo.dart';
import 'package:zanmelodic/src/repositories/features/playlist/repo_impl.dart';
import 'package:zanmelodic/src/repositories/features/song/repo.dart';
import 'package:zanmelodic/src/repositories/features/song/repo_impl.dart';

class Domain {
  static Domain? _internal;
  Domain._() {
    song = SongRepositoryImpl();
    album = AlbumRepositoryImpl();
    playlist = PlaylistRepositoryImpl();
    favorites = FavoriteRepositoryImpl();
    folder = FolderRepositoryImpl();
    audio = AudioRepositoryImpl();
    mostListen = MostListenRepositoryImpl();
    artist = ArtistRepositoryImpl();
  }
  factory Domain() {
    _internal ??= Domain._();
    return _internal!;
  }

  late final SongRepository song;
  late final AlbumRepository album;
  late final PlaylistRepository playlist;
  late final FavoriteRepository favorites;
  late final FolderRepository folder;
  late final AudioRepository audio;
  late final MostListenRepository mostListen;
  late final ArtistRepository artist;
}
