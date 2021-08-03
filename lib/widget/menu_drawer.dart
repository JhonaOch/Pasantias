import 'package:flutter/material.dart';
import 'package:marketplace_v4/pages/home.dart';





class MenuDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  final name = ' BIENVENIDO ';
  final urlImage = "images/mascota.jpg";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
       
        child: Material(
          color:  Colors.white,
          child: ListView(
            children: <Widget>[

    
              Container(
                padding: padding,
                child: Column(
                  children: [
                    SizedBox(height: 24),
                    Text("Servicio al cliente",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                    SizedBox(height: 10,),
                   
                    GestureDetector(child: Text("Mas compras",style: TextStyle(fontSize: 23)),
                    onTap: (){
                      Navigator.pushNamed(context, '/inicio');

                    },),
                     Divider(
                                      height: 1,
                                      thickness: 2,
                                      indent: 0,
                                      endIndent: 0,
                                    ),
                    GestureDetector(child: Text("Servio al cliente",style: TextStyle(fontSize: 23)),
                    onTap: (){

                    },),
                     Divider(
                                      height: 1,
                                      thickness: 2,
                                      indent: 0,
                                      endIndent: 0,
                                    ),
                    GestureDetector(child: Text("Preguntas frecuentes",style: TextStyle(fontSize: 23)),
                    onTap: (){

                    },),
                     Divider(
                                      height: 1,
                                      thickness: 2,
                                      indent: 0,
                                      endIndent: 0,
                                    ),
                                    SizedBox(height: 10,),
                                    Text("Promocion",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                    GestureDetector(child: Text("Aplicar Promocion",style: TextStyle(fontSize: 23)),
                    onTap: (){

                    },),
                     Divider(
                                      height: 1,
                                      thickness: 2,
                                      indent: 0,
                                      endIndent: 0,
                                    ),

                                    SizedBox(height: 80,),

                    Row(
                      children: [
                        Image.asset("images/mascota.jpg",height: 370,)
                      ],
                    )

                    

                     //if (!Responsive.isDesktop(context)) CloseButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
