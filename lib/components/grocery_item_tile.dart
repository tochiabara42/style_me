import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
final VoidCallback onPressed ;

  const GroceryItemTile({ super.key, required this.itemName, required this.itemPrice, required this.imagePath, required this.color, required this.onPressed });

@override
Widget build(BuildContext context) {
  return  Padding(padding: const EdgeInsets.all(12),
    child: Container(
      decoration: BoxDecoration( color: Colors.white, border: Border.all(style: BorderStyle.solid, color: color[200], width: 5), borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
 Image.asset(imagePath,
        height: 64,),
        Text(itemName, style: const TextStyle(fontFamily: 'RobotoMono', fontWeight: FontWeight.bold),),
        MaterialButton(
          onPressed: onPressed,
          color: color[800],
          child: Text('£$itemPrice', style: const TextStyle(fontFamily: 'RobotoMono', fontWeight: FontWeight.bold, color: Colors.white),),
        )
        ],
      ) 
    ),
  );
}
  

}