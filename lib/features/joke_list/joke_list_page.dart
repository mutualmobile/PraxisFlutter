import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/joke_list/jokes_cubit.dart';
import 'package:praxis_flutter/models/ui_state.dart';
import 'package:praxis_flutter/presentation/core/extensions/widget_extensions.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_button.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_progress_bar.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_scaffold.dart';
import 'package:praxis_flutter/ui/model/jokes/ui_joke.dart';

class JokesPage extends StatelessWidget {
  const JokesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => JokesCubit(),
      child: BlocListener<JokesCubit, UiState<UIJokeList>>(
        child: const JokeListPage(),
        listener: (context, state) {},
      ),
    );
  }
}

class JokeListPage extends StatelessWidget {
  const JokeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PraxisScaffold(
        androidAppBar: AppBar(
          title: text(),
        ),
        iosNavBar: CupertinoNavigationBar(
          middle: text(),
        ),
        body: BlocBuilder<JokesCubit, UiState<UIJokeList>>(
            builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            children: [
              state is Loading
                  ? const Align(
                      child: PraxisProgressBar(),
                      alignment: Alignment.center,
                    )
                  : state is Success
                      ? buildJokesList(state as Success)
                      : state is Failure
                          ? retryButton(state as Failure, context)
                          : Container()
            ],
          );
        }));
  }

  ListView buildJokesList(Success state) {
    return ListView.builder(
        itemCount: state.data.jokes.length,
        itemBuilder: (context, index) {
          return Text(state.data.jokes[index].joke).paddingAll(8);
        });
  }

  Text text() => const Text("Praxis");

  retryButton(Failure state, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PraxisButton(
              title: "Retry ?",
              onPressed: () {
                context.read<JokesCubit>().loadJokes();
              }),
          Text(state.exception.toString()).paddingAll(8),
        ],
      ),
    );
  }
}
