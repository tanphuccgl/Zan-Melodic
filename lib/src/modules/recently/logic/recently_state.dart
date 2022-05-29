// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'recently_bloc.dart';

class RecentlyState extends Equatable {
  final XHandle<List<SongModel>> newList;
  final XHandle<List<SongModel>> mostListenList;

  const RecentlyState({
    required this.newList,
    required this.mostListenList,
  });
  @override
  List<Object?> get props => [
        newList,
        mostListenList,
      ];

  RecentlyState copyWith({
    XHandle<List<SongModel>>? newList,
    XHandle<List<SongModel>>? mostListenList,
  }) {
    return RecentlyState(
      newList: newList ?? this.newList,
      mostListenList: mostListenList ?? this.mostListenList,
    );
  }
}
