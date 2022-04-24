import 'package:zanmelodic/src/repositories/features/tracks/repo.dart';
import 'package:zanmelodic/src/repositories/features/tracks/repo_impl.dart';

class Domain {
  static Domain? _internal;
  Domain._() {
    tracks = TracksRepositoryImpl();
  }
  factory Domain() {
    _internal ??= Domain._();
    return _internal!;
  }

  late final TracksRepository tracks;
}
