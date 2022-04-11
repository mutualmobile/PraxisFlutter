import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praxis_flutter/presentation/core/widgets/abstract_plaform_widget.dart';

class PraxisButton
    extends AbstractPlatformWidget<CupertinoButton, MaterialButton> {
  final String title;
  final Function() onPressed;
  const PraxisButton({Key? key, required this.title, required this.onPressed}) : super(key: key);

  @override
  CupertinoButton buildCupertino(BuildContext context) {
    return CupertinoButton(onPressed: onPressed, child: Text(title));
  }

  @override
  MaterialButton buildMaterial(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).colorScheme.secondary,
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
