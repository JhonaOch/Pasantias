import 'dart:js';

import 'package:flutter/material.dart';
import 'package:marketplace_v4/widget/busqueda.dart';



class AppBarE extends StatefulWidget implements PreferredSizeWidget {
 

  @override
  _AppBarEState createState() => _AppBarEState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _AppBarEState extends State<AppBarE> {
  //Icon actionIcon = new Icon(Icons.search);
  // Widget appBarTitle = new Center(
  //     child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
  //   Column(
  //     children: [
  //       Text(44
  //         'SHOP EC',
  //         style: TextStyle(
  //             color: Colors.white,
  //             fontFamily: 'Montserrat Regular',
  //             fontSize: 15,
  //             fontWeight: FontWeight.bold),
  //         //textAlign:TextAlign.left,
  //       ),
  //     ],
  //   )
  // ]));
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Shop EC"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context,delegate: ProductSearch());
              
                }
              
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              size: 20,
            ),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_bag_rounded,
              size: 20,
            ),
            onPressed: () {
               Navigator.pushNamed(context, '/carrito');
            },
          ),
        ],
      );
  }
}



