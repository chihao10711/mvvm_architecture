import 'package:flutter/material.dart';
import 'package:mvvm_architecture/mvvm_architecture.dart';

part 'value_notifier_vm.dart';

class ValueNotifierPage extends StatefulWidget {
  const ValueNotifierPage({Key? key}) : super(key: key);

  @override
  State<ValueNotifierPage> createState() => ValueNotifierPageState();
}

class ValueNotifierPageState
    extends ViewState<ValueNotifierPage, ValueNotifierViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MVVM with ValueNotifier"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ValueListenableBuilder<int>(
              valueListenable: viewModel.counter,
              builder: (context, value, _) {
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            )
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
  ValueNotifierViewModel createViewModel() {
    return ValueNotifierViewModel(this);
  }
}
