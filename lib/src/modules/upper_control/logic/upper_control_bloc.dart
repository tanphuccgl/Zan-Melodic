import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';

part 'upper_control_state.dart';

class UpperControlBloc<T extends UpperControlState> extends Cubit<T> {
  UpperControlBloc(T initialState) : super(initialState);

  Future<void> fetchListOfSongs() async {}

  void onSortNameToList() {
    emit(state.copyWithItems(isSortName: !state.isSortName) as T);
  }

  void onShuffleToList() {
    emit(state.copyWithItems(isShuffle: !state.isShuffle) as T);
  }
}
