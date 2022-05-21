part of 'upper_control_bloc.dart';

class UpperControlState extends Equatable {
  final bool isSortName;
  final bool isShuffle;

  const UpperControlState({
    this.isSortName = false,
    this.isShuffle = false,
  });

  @override
  List<Object?> get props => [
        isSortName,
        isShuffle,
      ];

  UpperControlState copyWithItems({
    bool? isSortName,
    bool? isShuffle,
  }) {
    return UpperControlState(
      isSortName: isSortName ?? this.isSortName,
      isShuffle: isShuffle ?? this.isShuffle,
    );
  }
}
