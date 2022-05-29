import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';
import 'package:zanmelodic/src/modules/permission/logic/permission_bloc.dart';

class AccessPermission extends StatelessWidget {
  const AccessPermission({Key? key, required this.widget}) : super(key: key);
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PermissionBloc, PermissionState>(
      builder: (context, state) {
        return state.status != PermissionStatus.granted
            ? Center(
                child: TextButton(
                    onPressed: () =>
                        context.read<PermissionBloc>().requestStorage(),
                    child: Text(
                      'Click here to access permission',
                      textAlign: TextAlign.center,
                      style: Style.textTheme().titleMedium!.copyWith(
                          color: MyColors.colorWhite.withOpacity(0.5)),
                    )),
              )
            : widget;
      },
    );
  }
}
