import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:praxis/src/data/repositories/data_jokes_repository.dart';

import 'home_controller.dart';

class HomePage extends View {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ViewState<HomePage, HomeController> {
  _HomePageState() : super(HomeController(DataJokesRepository()));

  @override
  Widget get view {
    print("3984756947869");
      return Scaffold(
        appBar: AppBar(
          title: Text("Praxis"),
        ),
        key: globalKey,
        body: Container(
            color: Colors.white,
            child: SizedBox.expand(
              child:  Column(
                children: [
                  ControlledWidgetBuilder<HomeController>(builder: (context, controller) {
                    return Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: controller.showProgress,
                      child: LinearProgressIndicator(),
                    );
                  }),
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding:  const EdgeInsets.only(bottom: 20.0),
                            child: new Text("Chuck Norris Random Joke Generator", style: new TextStyle(fontSize: 20.0, color: Colors.grey)),
                          ),
                          ControlledWidgetBuilder<HomeController>(builder: (context, controller) {
                            return RaisedButton(
                              child: const Text('Show 5 random Jokes', style: const TextStyle(fontSize: 20.0)),
                              color: Color.fromRGBO(46, 204, 113, 1.0),
                              textColor: Colors.white,
                              elevation: 4.0,
                              splashColor: Colors.blueGrey,
                              onPressed: () {controller.fetchJokeList();},
                              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                            );
                          }),
                          ControlledWidgetBuilder<HomeController>(builder: (context, controller) {
                            return RaisedButton(
                              child: const Text('About', style: const TextStyle(fontSize: 20.0)),
                              color: Color.fromRGBO(46, 204, 113, 1.0),
                              textColor: Colors.white,
                              elevation: 4.0,
                              splashColor: Colors.blueGrey,
                              onPressed: () {},
                              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                            );
                          })
                        ],
                      )
                  )
                ],
              ),
            )
        )
      );
  }
}