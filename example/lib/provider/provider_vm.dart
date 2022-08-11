part of 'provider_page.dart';

class ProviderViewModel extends ViewModel<ProviderPageState> {
  ProviderViewModel(super.viewState);

  final CounterNotifier counterNotifier = CounterNotifier();

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
