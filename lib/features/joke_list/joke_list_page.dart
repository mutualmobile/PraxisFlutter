import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/material.dart';
import 'package:praxis_flutter/application/widgets/platform_scaffold.dart';
import 'package:praxis_flutter/application/extensions/widget_extensions.dart';
import 'package:praxis_flutter/domain/entities/jokes/joke_list.dart';
import 'package:praxis_flutter/features/joke_list/joke_list_controller.dart';

class JokeListPage extends View {
  final JokeList jokeList;

  JokeListPage({Key? key, required this.jokeList}) : super(key: key);

  @override
  _JokeListPageState createState() => _JokeListPageState(jokeList);
}

class _JokeListPageState extends ViewState<JokeListPage, JokeListController> {
  _JokeListPageState(jokeList) : super(JokeListController(jokeList));

  @override
  Widget get view {
    return PraxisScaffold(
        key: globalKey,
        androidAppBar: AppBar(
          title: text(),
        ),
        iosNavBar: CupertinoNavigationBar(
          middle: text(),
        ),
        body: ControlledWidgetBuilder<JokeListController>(
          builder: (context, controller) {
            return ListView.builder(
                itemCount: controller.jokeList.jokeList.length,
                itemBuilder: (context, index) {
                  return Text(controller.jokeList.jokeList[index].joke)
                      .paddingAll(8);
                });
          },
        ));
  }

  Text text() => const Text("Praxis");
}
