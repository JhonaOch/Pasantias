import 'dart:ui';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marketplace_v4/model/productos.dart';
import 'package:marketplace_v4/widget/app_bart.dart';
import 'package:marketplace_v4/widget/list_categorias.dart';
import 'package:marketplace_v4/widget/navigation_bart.dart';

class DetalleProducts extends StatefulWidget {
  @override
  _DetalleProductsState createState() => _DetalleProductsState();
}

class _DetalleProductsState extends State<DetalleProducts> {
  
  
  @override
  Widget build(BuildContext context) {
     var products =ModalRoute.of(context).settings.arguments as ProductTemplate ;

     
     final largo = MediaQuery.of(context).size.height;
    
     
    return Scaffold(
      appBar:AppBarE(),
      //drawer: MenuDrawer(),
       body: Container(
         color: Colors.yellow[700],
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),

            Lista(),


            
            
            SizedBox(height: 4),

            Divider(
              height: 1,
              thickness: 2,
              indent: 0,
              endIndent: 0,
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Carousel(
                //dotSize: 5.0,
                dotSpacing: 15.0,
                dotColor: Colors.purple[200],
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.transparent,
                dotVerticalPadding: 5.0,


                dotIncreasedColor: Colors.purple,

                images: [
                  Image.asset("images/vestimenta.jpg", fit: BoxFit.scaleDown),
                  Image.asset("images/televisor.jpg", fit: BoxFit.scaleDown),
                  Image.asset("images/stockHombre.jpg", fit: BoxFit.scaleDown)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 1,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Align(
              alignment: Alignment.center,
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(),
                itemSize: 20,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.purple,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(products.name,style: TextStyle(
              color:Colors.purple,
              fontSize: 25,
                  fontFamily: 'Montserrat Regular',
                  fontWeight: FontWeight.bold


            ),),

            SizedBox(height: 10,),
            
            Text(
             
              "  "+ products.descriptionSale.toString(),
              style: TextStyle(color: Colors.purple
              ,fontSize: 23,
                  fontFamily: 'Montserrat Regular',
                  ),
                  overflow: TextOverflow.ellipsis,

            ),
            
            
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("\$"+products.listPrice.toString(), style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold,fontSize: 25)),
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/carrito',
                          arguments: products);
                    },
                    label: Text("Agregar",style: TextStyle(fontSize: 25),),

                    icon: Icon(Icons.shopping_bag_rounded),
                    style:ElevatedButton.styleFrom(
                      primary: Colors.purple
                    ),
                    ),
                   
              ],
            ),

             SizedBox(height: 10,),

             Divider(
              height: 1,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),

            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Text("Comentarios",
              style: TextStyle(color: Colors.purple
              ,fontSize: 18,
                  fontFamily: 'Montserrat Regular',
                  fontWeight: FontWeight.bold
                  ),),
              Text("Ver Todos",
              style: TextStyle(color: Colors.purple
              ,fontSize: 13,
                  fontFamily: 'Montserrat Regular',

                  ),)
            ],),

            SizedBox(height: 10,),

            Divider(
              height: 1,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),

             Column(
                      children: [
                        Image(
                          image: AssetImage('images/ofertas-08.png'),
                          height: largo/11.6,
                        ),
                      ],
                    ),


          
            

          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
