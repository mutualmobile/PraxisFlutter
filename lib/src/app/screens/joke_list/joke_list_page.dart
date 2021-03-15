
import 'package:clean_architecture/clean_architecture.dart';
import 'package:flutter/material.dart';
import 'package:praxis/src/app/screens/joke_list/joke_list_controller.dart';
import 'package:praxis/src/app/screens/screens.dart';
import 'package:praxis/src/domain/entities/joke_list.dart';

class JokeListPage extends View {
  final JokeList jokeList;
  JokeListPage(
      {Key key, this.title,
      @required this.jokeList}
      ) : super(key: key);

  final String title;

  @override
  _JokeListPageState createState() => _JokeListPageState(jokeList);
}

class _JokeListPageState extends ViewState<JokeListPage, JokeListController> {
  _JokeListPageState(jokeList) : super(JokeListController(jokeList));

  @override
  // TODO: implement view
  Widget get view  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Praxis"),
      ),
      body: Scaffold(
        key: globalKey,
        body: Container(
          color: Colors.white,
          child: ListView.builder(
              itemCount:  controller.jokeList.jokeList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${controller.jokeList.jokeList[index].joke}'),
                );
              }
          ),
        ),
      ),
    );
  }

}