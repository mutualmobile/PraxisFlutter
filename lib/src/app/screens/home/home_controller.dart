import 'package:clean_architecture/clean_architecture.dart';
import 'package:praxis/src/app/screens/home/home_presenter.dart';
import 'package:praxis/src/domain/entities/joke_list.dart';

class HomeController extends Controller {

  final HomePresenter homePresenter;

  HomeController(jokesRepo)
    : homePresenter = HomePresenter(jokesRepo);

  @override
  void initListeners() {
    homePresenter.getJokeListOnNext = (JokeList jokeList) {
      refreshUI();
    };
    homePresenter.getJokeListOnComplete = () {
    };

    homePresenter.getJokeListOnError = (e) {
      logger.severe(e);
      refreshUI();
    };
  }

  void fetchJokeList() => homePresenter.getJokeList();

}