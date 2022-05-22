import 'package:flutter/material.dart';
import 'package:zanmelodic/src/config/themes/my_colors.dart';
import 'package:zanmelodic/src/config/themes/styles.dart';

class CutomTextField extends StatefulWidget {
  final Function(String) onChanged;
  final String value;
  final bool isAction;
  final String error;
  final String label;
  const CutomTextField({
    Key? key,
    required this.value,
    required this.onChanged,
    this.isAction = true,
    required this.error,
    required this.label,
  }) : super(key: key);

  @override
  State<CutomTextField> createState() => _CutomTextFieldState();
}

class _CutomTextFieldState extends State<CutomTextField> {
  late TextEditingController _controller;
  String get value => widget.value;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.value);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CutomTextField oldWidget) {
    if (_controller.text != widget.value) {
      _controller.text = widget.value;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget? _buildAction() {
    final List<Widget> actions = [];
    if (value.isNotEmpty && widget.isAction) {
      actions.add(IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(
          Icons.clear,
          color: MyColors.colorGray,
        ),
        onPressed: () {
          widget.onChanged.call("");
        },
      ));
    }

    if (actions.isEmpty) {
      return null;
    }
    if (actions.length == 1) {
      return actions[0];
    }
    return Row(
      children: actions,
      mainAxisSize: MainAxisSize.min,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      controller: _controller,
      style: Style.textTheme()
          .titleMedium!
          .copyWith(fontSize: 23, color: MyColors.colorPrimary),
      autofocus: true,
      decoration: InputDecoration(
          labelText: widget.label,
          errorText: widget.error,
          errorStyle: Style.textTheme()
              .titleMedium!
              .copyWith(fontSize: 10, height: 0.5, color: Colors.red),
          suffixIcon: Padding(
              padding: const EdgeInsets.only(top: 20), child: _buildAction()),
          hintText: 'Zan Hip-hop',
          hintStyle: Style.textTheme()
              .titleMedium!
              .copyWith(fontSize: 23, color: MyColors.colorPrimary),
          labelStyle: Style.textTheme().titleMedium),
    );
  }
}
