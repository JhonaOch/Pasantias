import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:marketplace_v4/graphql/querys.dart';
import 'package:marketplace_v4/model/busqueda.dart';
import 'package:marketplace_v4/model/productos.dart';

class ProductSearch extends SearchDelegate {
  final  getProductos = GenerateQuerys.getProduct;
  var recientes;
  var busquedaPorId;

  final productos = GenerateQuerys.buscarProduc;
  @override
  List<Widget> buildActions(BuildContext context) {
    //las acciones de nuestro appBar

    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //Icono a la izquierda del Appbar

    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //Sugerencias cuando la persona escribe
         
         return Container(
           
           child: Query(
        options: QueryOptions(
            document: gql(productos),variables: {'name': query.toLowerCase()},
        ),
        builder: (QueryResult response, {fetchMore, refetch}) {
             if (response.hasException) {
                           return Center(child: CircularProgressIndicator());

             }
            if (response.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            List product = response.data["product_template"];

            List<ProductTemplate> productos = product.map((e) => ProductTemplate.fromJson(e)).toList();

            

       


                   return ListView.builder(
               itemCount: productos.length,
               itemBuilder: (context,i){
                   busquedaPorId=productos[i].name.toLowerCase().toString();
                  return ListTile(
                    leading: Icon(Icons.production_quantity_limits_rounded),
                    title: Text(busquedaPorId.toLowerCase().toString()),
                    onTap: () {
                      close(context, null);
                      Navigator.pushNamed(context, '/detalle',
                            arguments: product[i]);
                    },
                  );
                });
                 

                 
        }),
         );
  

       
           


          

             
  }
}
