import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';
import '../providers/shopping_cart_provider.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ShoppingItem=Provider.of<ShoppingCart>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example App '),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer<Counter>(
                  builder: (_,count,ch)=>Text(count.countCount.toString())
                  ),
            Consumer<ShoppingCart>(
                  builder: (_,cart,ch)=>Text(cart.cart.toString())
                  ),
            // Text('${context.watch<ShoppingCart>().count}'),
            // Text('${context.watch<ShoppingCart>().cart}')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('addItem_floatingActionButton'),
        onPressed: () => ShoppingItem.addItem('Bread'),
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }
}