part of mvvm_architecture;

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

abstract class ViewState<V extends StatefulWidget, VM extends ViewModel>
    extends State<V> with RouteAware {
  late final VM _viewModel;

  VM get viewModel => _viewModel;

  String get _sanitizedRoutePageName {
    return '$runtimeType'.replaceAll('_', '').replaceAll('State', '');
  }

  VM createViewModel();

  @mustCallSuper
  @override
  void initState() {
    super.initState();
    _viewModel = createViewModel();
    logger('Created $runtimeType.');
    viewModel.init();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.onReady();
    });
  }

  @mustCallSuper
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // subscribe for the change of route
    ModalRoute<Object?>? modalRoute = ModalRoute.of(context);
    if (ModalRoute.of(context) != null && modalRoute is PageRoute) {
      routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
    }
  }

  /// Called when the top route has been popped off, and the current route
  /// shows up.
  @mustCallSuper
  @override
  void didPopNext() {
    logger('🚚 $_sanitizedRoutePageName didPopNext');
    viewModel.routingDidPopNext();
  }

  /// Called when the current route has been pushed.
  @mustCallSuper
  @override
  void didPush() {
    logger('🚚 $_sanitizedRoutePageName didPush');
    viewModel.routingDidPush();
  }

  /// Called when the current route has been popped off.
  @mustCallSuper
  @override
  void didPop() {
    logger('🚚 $_sanitizedRoutePageName didPop');
    viewModel.routingDidPop();
  }

  /// Called when a new route has been pushed, and the current route is no
  /// longer visible.
  @mustCallSuper
  @override
  void didPushNext() {
    logger('🚚 $_sanitizedRoutePageName didPushNext');
    viewModel.routingDidPushNext();
  }

  @mustCallSuper
  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    logger('Disposing $runtimeType.');
    viewModel.dispose();
    super.dispose();
  }

  void logger(Object object) {
    dev.log(object.toString());
  }
}
