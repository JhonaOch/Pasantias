import 'package:flutter/material.dart';
import 'package:marketplace_v4/pages/carrito_compra.dart';
import 'package:marketplace_v4/pages/detalle_products.dart';
import 'package:marketplace_v4/pages/home.dart';
import 'package:marketplace_v4/pages/list_products.dart';
import 'package:marketplace_v4/widget/app_bart.dart';

Map<String,WidgetBuilder> getApplicacionesRutas(){

  return<String,WidgetBuilder>{
    '/' :(BuildContext context) =>  Home(),
    '/lista' :(BuildContext context) =>  ListProducts(),
    '/detalle':(BuildContext context) =>  DetalleProducts(),
    '/carrito':(BuildContext context) =>  Carrito(),
    //'/prueba':(BuildContext context) =>  Prueba()

   
    

  };

}