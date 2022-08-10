A Flutter MVVM (Model-View-ViewModel) implementation. It uses property-based data binding to establish a connection between the ViewModel and the View, and drives the View changes through the ViewModel.

### main.dart

```dart
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/mvvm_architecture.dart';

import 'my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter MVVM Demo'),
      navigatorObservers: [routeObserver],
    );
  }
}

```

### my_home_page.dart (ViewState)

```dart
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/mvvm_architecture.dart';

part 'my_home_vm.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends ViewState<MyHomePage, MyHomeViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${viewModel.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  MyHomeViewModel createViewModel() {
    return MyHomeViewModel(this);
  }
}

```

### my_home_vm.dart (ViewModel)

```dart
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

```

## License

[MIT](LICENSE)
