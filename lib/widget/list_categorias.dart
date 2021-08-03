




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:marketplace_v4/graphql/querys.dart';
import 'package:marketplace_v4/model/categorias.dart';

import 'imagenes.dart';

class Lista extends StatefulWidget {
 

  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  final String getCategories = GenerateQuerys.getCategories;
  @override
  Widget build(BuildContext context) {
  
      final ancho = MediaQuery.of( context).size.width;
    final largo = MediaQuery.of(context).size.height;

    return Container(
                height: largo/4 ,
                width: ancho,
               
                child: Column(
                  children: [
                   
                    Expanded(
                        child: Query(
                            options: QueryOptions(document: gql(getCategories)),
                            builder: (QueryResult response,
                                {fetchMore, refetch}) {
                              if (response.hasException) {
                                return Text(response.exception.toString());
                              }
                              if (response.isLoading) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              List category = response.data["product_category"];

                              //print(category);

                                  List<CategoryTemplate> categorias = category.map((e) => CategoryTemplate.fromJson(e)).toList();

                                 // print(categorias);

                                  

                              return ListView.builder(
                                  itemCount: categorias.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                                                          child: Container(
                                        // margin: EdgeInsets.all(20),
                                        height: ancho / 2.3,
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                                //borderRadius: BorderRadius.circular(8000),

                                                child: Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Image.asset(
                                                      categories[index]['imagenes'],
                                                      height: 130,
                                                      width: 130,),
                                                )
                                                // fit: BoxFit.cover),
                                                ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 150,
                                                    width: 150,
                                                  ),
                                                  Text(
                                                    categorias[index].name
                                                        .toString().toUpperCase(),
                                                    
                                                    style: TextStyle(
                                                      color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Montserrat Regular'
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                       onTap: (){
                            Navigator.pushNamed(context, '/lista',arguments: categorias[index].id);
                            
                            print("ID que envia "+categorias[index].id.toString());
                          },
                          );
                                    
                                  });
                            })),
                   
                  ],
                ),

    );
            

      
      
      
    
  }
}

Widget _lista() {
   
    

}