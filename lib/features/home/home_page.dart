import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:praxis_flutter/application/widgets/platform_button.dart';
import 'package:praxis_flutter/application/widgets/platform_dialog.dart';
import 'package:praxis_flutter/application/widgets/platform_progress_bar.dart';
import 'package:praxis_flutter/application/widgets/platform_scaffold.dart';
import 'package:praxis_flutter/data/repositories/jokes/data_jokes_repository.dart';

import 'home_controller.dart';

class HomePage extends View {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ViewState<HomePage, HomeController> {
  _HomePageState() : super(HomeController(DataJokesRepository()));

  @override
  Widget get view {
    return PraxisScaffold(
        androidAppBar: AppBar(
          title: appBarTitle(),
        ),
        iosNavBar: CupertinoNavigationBar(
          middle: appBarTitle(),
        ),
        key: globalKey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [heading(), progressIndicator(), aboutWidget()],
        ));
  }

  ControlledWidgetBuilder<HomeController> aboutWidget() {
    return ControlledWidgetBuilder<HomeController>(
        builder: (context, controller) {
      return PraxisButton(
          title: "About",
          onPressed: () {
            showAlertDialog(
                context: context,
                title: "About Praxis",
                content:
                    "PraxisFlutter is a sample flutter app which can be used as a base project for other projects written in flutter. "
                    "The app uses clean architecture to provide a robust base to the app.\n\n"
                    "The http library is used to fetch jokes along with the async/await which handles connections asynchronously and makes the app more reliable.",
                defaultActionText: "OK");
          });
    });
  }

  heading() {
    return const Text(
      "Chuck Norris Random Joke Generator",
    );
  }

  ControlledWidgetBuilder<HomeController> progressIndicator() {
    return ControlledWidgetBuilder<HomeController>(
        builder: (context, controller) {
      if (controller.showProgress) {
        return const PraxisProgressBar();
      } else {
        return PraxisButton(
            title: "Show 5 random Jokes",
            onPressed: () {
              controller.fetchJokeList();
            });
      }
    });
  }

  Text appBarTitle() => const Text("Praxis");
}
