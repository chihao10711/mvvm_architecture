import 'package:flutter/material.dart';
import 'package:mvvm_architecture/mvvm_architecture.dart';
import 'package:provider/provider.dart';

import 'counter_notifier.dart';

part 'provider_vm.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  State<ProviderPage> createState() => ProviderPageState();
}

class ProviderPageState extends ViewState<ProviderPage, ProviderViewModel> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel.counterNotifier,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("MVVM with Provider"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Consumer<CounterNotifier>(
                builder: (context, value, _) {
                  return Text(
                    '${value.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: viewModel.counterNotifier.incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  @override
  ProviderViewModel createViewModel() {
    return ProviderViewModel(this);
  }
}
