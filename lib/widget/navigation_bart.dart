import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
 

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
      return DecoratedBox(
        
        decoration: BoxDecoration(
          color: Colors.black,
          //borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          //height: pantallaL / 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  icon: Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                     Navigator.pushNamed(context, '/inicio');
                            
                  }),
             
              CircleAvatar(
                backgroundColor: Colors.white54,
                child: IconButton(
                    icon:
                        Icon(Icons.shopping_basket, color: Colors.white),
                    onPressed: () {
                       Navigator.pushNamed(context, '/carrito');
                    }),
              ),
              IconButton(
                  icon: Icon(Icons.favorite, color: Colors.white),
                  onPressed: () {}),
             
            ],
          ),
        ),
      
    );
  }
}