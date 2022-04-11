import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:praxis_flutter/presentation/core/widgets/abstract_plaform_widget.dart';

class PraxisScaffold
    extends AbstractPlatformWidget<CupertinoPageScaffold, Scaffold> {
  const PraxisScaffold(
      {Key? key, required this.body, this.androidAppBar, this.iosNavBar})
      : super(key: key);

  final Widget body;
  final PreferredSizeWidget? androidAppBar;
  final ObstructingPreferredSizeWidget? iosNavBar;

  @override
  CupertinoPageScaffold buildCupertino(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
      navigationBar: iosNavBar,
      child: SizedBox(
        child: body,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  @override
  Scaffold buildMaterial(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: androidAppBar,
      body: SizedBox(
        child: body,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
