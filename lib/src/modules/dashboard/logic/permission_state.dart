// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'permission_bloc.dart';

class PermissionState extends Equatable {
  final PermissionStatus status;

  const PermissionState({required this.status});
  @override
  List<Object?> get props => [
        status,
      ];

  PermissionState copyWith({
    PermissionStatus? status,
  }) {
    return PermissionState(
      status: status ?? this.status,
    );
  }
}
