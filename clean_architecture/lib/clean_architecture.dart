library clean_architecture;

import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'controller.dart';

export 'controller.dart';
export 'observer.dart';
export 'presenter.dart';
export 'usecase.dart';
export 'view.dart';
export 'background_usecase.dart';

class CleanArchitecture {
  /// Retrieves a Controller from the widget tree if one exists
  /// Can be used in widgets that exist in pages and need to use the same controller
  static Con getController<Con extends Controller>(BuildContext context,
      {bool listen = true}) {
    return Provider.of<Con>(context, listen: listen);
  }

  /// Enable customize default view breakpoints. To do so, just call it before `runApp`.
  ///
  /// ```dart
  /// void main() {
  //    FlutterCleanArchitecture.setDefaultViewBreakpoints(
  //      desktopBreakpointMinimumWidth: 1000,
  //      tabletBreakpointMinimumWidth: 700,
  //      watchBreakpointMinimumWidth: 250,
  //    );
  //    runApp(MyApp());
  //  }
  /// ```
  static void setDefaultViewBreakpoints({
    @required double desktopBreakpointMinimumWidth,
    @required double tabletBreakpointMinimumWidth,
    @required double watchBreakpointMinimumWidth,
  }) {
    ResponsiveSizingConfig.instance.setCustomBreakpoints(
      ScreenBreakpoints(
          desktop: desktopBreakpointMinimumWidth,
          tablet: tabletBreakpointMinimumWidth,
          watch: watchBreakpointMinimumWidth),
    );
  }

  /// Enables logging inside the `FlutterCleanArchitecture` package,
  static void debugModeOn() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      dynamic e = record.error;
      print('${record.loggerName}: ${record.level.name}: ${record.message} ');
      if (e != null) {
        print(e.toString());
      }
    });

    Logger.root.info('Logger initialized.');
  }
}
