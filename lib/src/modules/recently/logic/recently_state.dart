// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'recently_bloc.dart';

class RecentlyState extends Equatable {
  final XHandle<List<SongModel>> newSongs;
  final XHandle<List<SongModel>> mostListen;

  const RecentlyState({
    required this.newSongs,
    required this.mostListen,
  });
  @override
  List<Object?> get props => [
        newSongs,
        mostListen,
      ];

  RecentlyState copyWith({
    XHandle<List<SongModel>>? newSongs,
    XHandle<List<SongModel>>? mostListen,
  }) {
    return RecentlyState(
      newSongs: newSongs ?? this.newSongs,
      mostListen: mostListen ?? this.mostListen,
    );
  }
}
