import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praxis_flutter/application/extensions/widget_extensions.dart';
import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis_data/repositories/jokes/data_jokes_repository.dart';
import 'package:praxis_flutter/application/widgets/platform_button.dart';
import 'package:praxis_flutter/application/widgets/platform_dialog.dart';
import 'package:praxis_flutter/application/widgets/platform_progress_bar.dart';
import 'package:praxis_flutter/application/widgets/platform_scaffold.dart';
import 'package:praxis_data/mapper/jokes/jokes_mappers.dart';
import 'package:praxis_flutter/features/home/home_vm.dart';
import 'package:praxis_flutter/routing/routes.dart';

class HomePage extends View {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ViewState<HomePage, HomeVM> {
  _HomePageState() : super(HomeVM());

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
          children: [heading().paddingAll(4), showRandomJokes().paddingAll(4), aboutWidget().paddingAll(4)],
        ));
  }

  ControlledWidgetBuilder<HomeVM> aboutWidget() {
    return ControlledWidgetBuilder<HomeVM>(
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

  Widget heading() {
    return const Text(
      "Chuck Norris Random Joke Generator",
    );
  }

  Text appBarTitle() => const Text("Praxis");

  ControlledWidgetBuilder<HomeVM> showRandomJokes() {
    return ControlledWidgetBuilder<HomeVM>(
        builder: (context, controller) {
          return  PraxisButton(
              title: "Show 5 random Jokes",
              onPressed: () {
                controller.navigateJokes();
              });
        });

  }
}
