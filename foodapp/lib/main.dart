import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>( // <=== PROVIDER
      create: (context) => Counter(),
      child: MaterialApp(
        title: 'Counter App - Compact',
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Page Title"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<Counter>( // <=== DEPENDENT
                  builder: (context, counter, child) => Text(
                    '${counter.count}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Builder(builder: (context) { // <=== DEPENDENT
                  final counter = Provider.of<Counter>(context, listen: false);
                  return ElevatedButton(
                    onPressed: () => counter.increment(),
                    child: const Text("Increment"),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int count = 0;

  void increment() {
    ++count;
    notifyListeners();
  }
}