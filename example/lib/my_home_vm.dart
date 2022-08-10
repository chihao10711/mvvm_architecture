part of 'my_home_page.dart';

class MyHomeViewModel extends ViewModel {
  MyHomeViewModel(super.viewState);

  int counter = 0;

  @override
  void dispose() {}

  void incrementCounter() {
    counter++;

    viewState.setState(() {});
  }
}
