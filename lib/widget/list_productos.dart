import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:marketplace_v4/graphql/querys.dart';
import 'package:marketplace_v4/model/productos.dart';

class ListProduc extends StatefulWidget {
  

  @override
  _ListProducState createState() => _ListProducState();
}

class _ListProducState extends State<ListProduc> {
  final String lista = GenerateQuerys.listaProducts;

  @override
  Widget build(BuildContext context) {

    var idcat = (ModalRoute.of(context).settings.arguments);

    if (idcat == null) {
      idcat = 1;
    }
    final largo = MediaQuery.of(context).size.height;

    return Container(
      height:largo/2.4 ,
      

      child: Query(
          options: QueryOptions(
              document: gql(lista), variables: {'category': idcat}),
          builder: (QueryResult response, {fetchMore, refetch}) {
            // if (response.hasException) {
            //   return Text(response.exception.toString());
            // }
            if (response.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            List product = response.data["product_template"];

            List<ProductTemplate> productos = product.map((e) => ProductTemplate.fromJson(e)).toList();

            //final nombre =response.data["product_template"]["name"];

            return ListView.builder(
                itemCount: productos.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                child: Image.asset("images/televisor.jpg",
                                    height: 80, width: 80),
                              ),
                              Column(
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    //widthFactor: largo/91,
                                    child: Text(
                                      productos[index].name +
                                          "\n" +
                                          productos[index].description
                                              .toString(),
                                      style: TextStyle(
                                          color: Colors.black54,
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: 'Montserrat Regular'),
                                    ),
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                      child: Text("\$ " +
                                          productos[index].listPrice
                                              .toString()),
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.purple),
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.all(10)),
                                          textStyle: MaterialStateProperty.all(
                                              TextStyle(fontSize: 20))),
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
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/detalle',
                          arguments: productos[index]);

                      print("ID que envia " + productos[index].id.toString());
                    },
                  );
                });
          }),

    );
  }
}