import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:marketplace_v4/graphql/querys.dart';
import 'package:marketplace_v4/model/categorias.dart';
import 'package:marketplace_v4/model/productos.dart';
import 'package:marketplace_v4/widget/app_bart.dart';
import 'package:marketplace_v4/widget/imagenes.dart';
import 'package:marketplace_v4/widget/list_categorias.dart';
import 'package:marketplace_v4/widget/list_productos.dart';
import 'package:marketplace_v4/widget/menu_drawer.dart';
import 'package:marketplace_v4/widget/navigation_bart.dart';

class ListProducts extends StatefulWidget {
  @override
  _ListProductsState createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {

  final String name = GenerateQuerys.nombreCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarE(),
      //drawer: Drawer(

      body: Container(
          color: Colors.yellow[700],
          child: Column(
            children: [
              Lista(),
              Divider(
                height: 5,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              SizedBox(
                height: 10,
              ),
              _name(),
             ListProduc(),
              SizedBox(
                height: 5,
              ),

              Column(
                      children: [
                        Image(
                          image: AssetImage('images/Tercer benner paquetes.jpg'),
                          height: 106,
                        ),
                      ],
                    ),
            ],
          )),
      bottomNavigationBar: NavigationBar(),
    );
  }

  

  Widget _name() {

    var products =ModalRoute.of(context).settings.arguments;
    //print("HOLKA");
    //print(products);

    if (products == null) {
      products = 1  ;
    }
    return Expanded(
      child: Query(
          options:
              QueryOptions(document: gql(name), variables: {'category': products}),
          builder: (QueryResult response, {fetchMore, refetch}) {
            if (response.hasException) {
              return Text(response.exception.toString());
            }
            if (response.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            //List category = response.data["product_category"];
            
           //List<CategoryTemplate> categorias = category.map((e) => CategoryTemplate.fromJson(e)).toList();
            List category = response.data["product_category"];

                              //print(category);

            

           

            return ListView.builder(
                itemCount: category.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            category[index]["name"].toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Montserrat Regular'),
                          ),
                        ]),
                  );
                });
          }),
    );
  }

 


}
