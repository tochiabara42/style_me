import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:style_me/components/grocery_item_tile.dart';
import 'package:style_me/screens/screen_two.dart';
import '../model/cart_model.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

void signUserOut() {
  FirebaseAuth.instance.signOut();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: signUserOut,
             icon: const Icon(Icons.logout_outlined),
             )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => Navigator.push(context,  MaterialPageRoute(builder: (context) {
        return const ScreenTwo();
      })), backgroundColor: Colors.black,
      child: const Icon(Icons.shopping_bag_outlined)),
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 48,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Hello,',
            style: TextStyle(fontFamily: 'RobotoMono', fontSize: 50),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Let\'s order fresh items for you!🧺',
              style: TextStyle(fontFamily: 'RobotoMono', fontSize: 15),
            )),
        const SizedBox(
          height: 48,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Text('Fresh items',
              style: TextStyle(fontSize: 20, fontFamily: 'RobotoMono')),
        ),
        Expanded(child: Consumer<CartModel>(builder: (context, value, child) {
          return GridView.builder(
              itemCount: value.shopItems.length,
              padding: const EdgeInsets.all(12) ,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.3),
              itemBuilder: (context, index) {
                return GroceryItemTile(
                  itemName: value.shopItems[index][0],
                  itemPrice: value.shopItems[index][1],
                  imagePath: value.shopItems[index][2],
                  color: value.shopItems[index][3],
                  onPressed: () {
                    Provider.of<CartModel>(context, listen: false).addItemToCart(index);
                  } ,
                );
              });
        }))
      ],
    )));
  }
}
