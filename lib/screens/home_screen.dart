import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterNum=Provider.of<Counter>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Text('Provider Example App '),
          Consumer<Counter>(
            builder: (_,count,ch)=>Text(count.countCount.toString())
            ),
        ]),
        // title: Text('Provider Example App (${counterNum.count})'),
        // title: Text('Provider Example App (${context.watch<Counter>().count})'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Text('You have pushed the button this many times:'),
                Consumer<Counter>(
                  builder: (_,count,ch)=>Text(count.countCount.toString())
                  ),
              ],
            ),
            
            Count(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Text('to 2nd screen'),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: Key('decrement_floatingActionButton'),
            onPressed: () => counterNum.decrement(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            key: Key('reset_floatingActionButton'),
            // onPressed: () => context.read<Counter>().reset(),
            onPressed: () => counterNum.reset(),
            tooltip: 'Reset',
            child: Icon(Icons.exposure_zero),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            key: Key('increment_floatingActionButton'),
            onPressed: () => counterNum.increment(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class Count extends StatelessWidget {
  Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<Counter>().count}',
        key: Key('counterState'), style: Theme.of(context).textTheme.headline4);
  }
}