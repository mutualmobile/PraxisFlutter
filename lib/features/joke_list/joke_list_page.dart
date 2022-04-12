import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_flutter/features/joke_list/jokes_cubit.dart';
import 'package:praxis_flutter/presentation/core/extensions/widget_extensions.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_button.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_progress_bar.dart';
import 'package:praxis_flutter/presentation/core/widgets/platform_scaffold.dart';

class JokesPage extends StatelessWidget {
  const JokesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => JokesCubit(),
      child: BlocListener<JokesCubit, JokesState>(
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
        body: BlocBuilder<JokesCubit, JokesState>(builder: (context, state) {
          return Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                state is JokesLoading
                    ? const PraxisProgressBar()
                    : state is JokesLoaded
                        ? buildJokesList(state)
                        : state is JokesException
                            ? retryButton(state, context)
                            : Container()
              ],
            ),
          );
        }));
  }

  ListView buildJokesList(JokesLoaded state) {
    return ListView.builder(
        itemCount: (state).jokes.jokes.length,
        itemBuilder: (context, index) {
          return Text(state.jokes.jokes[index].joke).paddingAll(8);
        });
  }

  Text text() => const Text("Praxis");

  retryButton(JokesException state, BuildContext context) {
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
