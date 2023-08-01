import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:style_me/model/cart_model.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: Colors.black,
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                      itemCount: value.cartItems.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                                decoration:
                                    BoxDecoration(
                                      border: Border.all(color: const Color.fromARGB(255, 209, 206, 206), width: 3),
                                    borderRadius: BorderRadius.circular(12)),
                                child: ListTile(
                                  leading: Image.asset(value.cartItems[index][2], height: 30,),
                                  title: Text(value.cartItems[index][0], style: const TextStyle(fontFamily: 'RobotoMono'),),
                                  // ignore: prefer_interpolation_to_compose_strings
                                  subtitle: Text('£' + value.cartItems[index][1],  style: const TextStyle(fontFamily: 'RobotoMono')) ,
                                  trailing: IconButton(onPressed: () => Provider.of<CartModel>(context, listen: false).removeItemFromCart(index), icon: const Icon(Icons.cancel))
                                )));
                      })),
                    Padding(padding: const EdgeInsets.all(36.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.green,
                        borderRadius: BorderRadius.circular(0)),
                        padding: const EdgeInsets.all(24),
                        child:  Row(
                          children: [
                         Column(
                          children: [
                            const Text('Total price'),
                            Text(value.calculateTotal(), style: const TextStyle(fontFamily: 'RobotoMono'),)
                          ],
                         )
                          ],
                        )
                        
                      )
                      ) ,
            ],
          );
        },
      ),
    );
  }
}
