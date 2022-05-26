// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'type_song_bloc.dart';

class TypeSongState extends Equatable {
  final XHandle<List<SongModel>> newList;
  final XHandle<List<SongModel>> mostListenList;

  const TypeSongState({
    required this.newList,
    required this.mostListenList,
  });
  @override
  List<Object?> get props => [
        newList,
      ];

  TypeSongState copyWith({
    XHandle<List<SongModel>>? newList,
    XHandle<List<SongModel>>? mostListenList,
  }) {
    return TypeSongState(
      newList: newList ?? this.newList,
      mostListenList: mostListenList ?? this.mostListenList,
    );
  }
}
