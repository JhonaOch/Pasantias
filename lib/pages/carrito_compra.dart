import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:marketplace_v4/graphql/mutations.dart';
import 'package:marketplace_v4/graphql/querys.dart';
import 'package:marketplace_v4/model/productos.dart';
import 'package:marketplace_v4/widget/app_bart.dart';
import 'package:marketplace_v4/widget/list_categorias.dart';
import 'package:marketplace_v4/widget/menu_drawer.dart';
import 'package:marketplace_v4/widget/navigation_bart.dart';

class Carrito extends StatefulWidget {
  @override
  _CarritoState createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  @override
  Widget build(BuildContext context) {
    double envio = 5.00;
    //final insertarTotal= GenrateMutations.factura;

    //var products =ModalRoute.of(context).settings.arguments as ProductTemplate ;
    var products =ModalRoute.of(context).settings.arguments;

    List <ProductTemplate> carrito = [];
    // String name=products.name;
    // double precio=products.listPrice;
    // String desc =products.descriptionSale;

    carrito.add(products);
    print(carrito);

    //double totalProducto =products["list_price"];
    return Scaffold(
      appBar: AppBarE(),
      drawer: MenuDrawer(),
      body: Container(
        color: Colors.yellow[700],
        child: Column(children: [
          //Lista(),

          // ListView.builder(
          //     itemCount: carrito.length,
          //      itemBuilder: (context, index) {
          //       return  Text(carrito[index].name);
                


          //     }),

          Divider(
            height: 1,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
          SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                "Articulos Agregados",
                style: TextStyle(color: Colors.purple, fontSize: 20),
              )),
          Column(
            children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Image.asset("images/televisor.jpg",
                        height: 80, width: 80),
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "name" +
                                  "\n" +
                                  "\$ " +
                                  "list_price".toString() +
                                  "\n" +
                                  "description".toString(),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                                fontFamily: 'Montserrat Regular',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                height: 1,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
            ],
          ),
          SizedBox(height: 10),
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    "Resumen",
                    style: TextStyle(color: Colors.purple, fontSize: 20),
                  )),
              SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text("Total del Producto:",
                          style: TextStyle(
                            fontSize: 15,
                          ))),
                  Text("\$")
                ],
              ),
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text("Envio:",
                          style: TextStyle(
                            fontSize: 15,
                          ))),
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Text("              \$"),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text("Total",
                          style: TextStyle(
                            fontSize: 15,
                          ))),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Divider(
                height: 1,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  "Al comprar el producto, esta de acuerdo con las condiciones de uso y politica de privacidad.",
                  overflow: TextOverflow.clip,
                  style: TextStyle(color: Colors.black54),
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),

          // ListView.builder(
          //       itemCount: carrito.length,
          //       itemBuilder: (context, index) {

          //         return Text(carrito[index].name.toString());

          // }),

          // Mutation(
          //   options: MutationOptions(
          //     document: gql(insertarTotal),
          //   update: (GraphQLDataProxy cache,QueryResult result)  {
          //     return cache;
          //   },
          //   onCompleted: (dynamic data) {
          //     print(data);

          //   },

          //   ),
          //   builder: (RunMutation runMutation, QueryResult result) {
          //     return Column(
          //       children: [

          //         MaterialButton(
          //           child: Text("Submit"),
          //           color: Colors.blue,
          //           onPressed: () => runMutation({
          //             "total":15 ,

          //           }),
          //         ),
          //         Text(
          //           "Result: \n ${result.data.toString()}",
          //         )
          //       ],
          //     );
          //   },

          // ),
        ]),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
