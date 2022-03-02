// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      // <=== PROVIDER
      create: (context) => Counter(),
      child: MaterialApp(
        title: 'Counter App - Compact',
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Page Title"),
          ),
          body: const Home(),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int count;
  @override
  void initState() {
    Provider.of<Counter>(context).count = 5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var count = context.watch<Counter>(); // <=== WATCH
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<Counter>(
            // <=== DEPENDENT
            builder: (context, counter, child) => Text(
              '${count}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Builder(builder: (context) {
            // <=== DEPENDENT
            final counter = context.read<Counter>();
            return Column(
              children: [
                RaisedButton(
                  onPressed: () => counter.increment(),
                  child: const Text("Next Screen"),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) {
                          Counter count = context.watch<Counter>();
                          return ChangeNotifierProvider.value(
                              value: count, child: const SecondScreen());
                        }),
                      ),
                    );
                  },
                  child: const Text("Increment"),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int count = 5;

  void increment() {
    ++count;
    notifyListeners();
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    print('Inistate');
    controller = TextEditingController();
    // func(BuildContext context) {
    //   context.watch()<Counter>.count = 5;
    // }

    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant SecondScreen oldWidget) {
    print('Update the widget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var count = context.watch<Counter>();
    // func(context); // <=== WATCH
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: Colors.red,
              width: 200,
              height: 200,
              child: Center(child: Text(count.toString())),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final counter = context.read<Counter>();
              counter.increment();
            },
            child: Text("Increment"),
          ),
        ],
      ),
    );
  }
}

// class MyCounter extends StateProvider {}
// class CounterStateNotifier extends StateNotifier<Counter> {
//   CounterStateNotifier([Counter? counter]) : super(counter ?? Counter(0));

//   void increment() {
//     state = Counter(state.count + 1);
//   }
// }