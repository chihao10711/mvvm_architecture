part of 'value_notifier.dart';

class ValueNotifierViewModel extends ViewModel<ValueNotifierPageState> {
  ValueNotifierViewModel(super.viewState);

  final ValueNotifier<int> counter = ValueNotifier(0);

  void incrementCounter() {
    counter.value++;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
