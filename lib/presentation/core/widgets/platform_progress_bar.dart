import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praxis_flutter/presentation/core/widgets/abstract_plaform_widget.dart';

class PraxisProgressBar
    extends AbstractPlatformWidget<
        CupertinoActivityIndicator,
        CircularProgressIndicator> {

  const PraxisProgressBar({Key? key})
      : super(key: key);

  @override
  CupertinoActivityIndicator buildCupertino(BuildContext context) {
    return const CupertinoActivityIndicator();
  }

  @override
  CircularProgressIndicator buildMaterial(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
