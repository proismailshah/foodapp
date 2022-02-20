import 'package:flutter/material.dart';
// import 'package:flutter_inherited_widget_demo/view/count_state.dart';



void main() => runApp(const RootWidget()); 

class RootWidget extends StatefulWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  int count = 0;
  void addCounter() {
    setState(() {
      count++;
    });
  }

  void removeCounter() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CountState(
      count: count,
      addCounter: addCounter,
      removeCounter: removeCounter,
      child:const InheritedWidgetDemo(),
    );
  }
}

class InheritedWidgetDemo extends StatelessWidget {
  const InheritedWidgetDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterState = CountState.of(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:const Text(
            'Counter Inherited Widget Demo',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Items add & remove: ${counterState.count}',
                style:const TextStyle(fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton(
                      onPressed: counterState.removeCounter.call,
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child:  FloatingActionButton(
                      onPressed: counterState.addCounter.call,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CountState extends InheritedWidget {

  final int count;
  final Widget child;
  final VoidCallback addCounter;
  final VoidCallback removeCounter;

 const CountState({Key? key,required this.count,required this.child,required this.addCounter,required this.removeCounter})
      : super(key: key, child: child);

  static CountState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<CountState>()!);
  }

  @override
  bool updateShouldNotify(CountState oldWidget) {
    //return true;
    return count != oldWidget.count;
  }
}