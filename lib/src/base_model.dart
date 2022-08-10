part of mvvm_architecture;

abstract class ViewModel<V extends State> {
  final V _viewState;

  ViewModel(this._viewState);

  V get viewState => _viewState;

  BuildContext get context => viewState.context;

  /// This method is executed exactly once for each State object Flutter's
  /// framework creates.
  void init() {}

  /// Schedule a callback for the end of this frame.
  ///
  /// Does *not* request a new frame.
  void onReady() {}

  ///  This method is executed whenever the Widget's Stateful State gets
  /// disposed. It might happen a few times, always matching the amount of times
  /// `init` is called.
  void dispose();

  /// Called when the top route has been popped off, and the current route
  /// shows up.
  void routingDidPopNext() {}

  /// Called when the current route has been pushed.
  void routingDidPush() {}

  /// Called when the current route has been popped off.
  void routingDidPop() {}

  /// Called when a new route has been pushed, and the current route is no
  /// longer visible.
  void routingDidPushNext() {}
}
