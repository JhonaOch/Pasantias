import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:marketplace_v4/graphql/querys.dart';
import 'package:marketplace_v4/widget/app_bart.dart';
import 'package:marketplace_v4/widget/imagenes.dart';
import 'package:marketplace_v4/widget/menu_drawer.dart';
import 'package:marketplace_v4/widget/navigation_bart.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String getCategories = GenerateQuerys.getCategories;
 

 
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final largo = MediaQuery.of(context).size.height;
  
    
    return Scaffold(
      appBar:AppBarE(),

      
      drawer: MenuDrawer(),
      body: Container(
        color: Colors.grey[200],
        child: Column(
         
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  
                     Image(
                      image: AssetImage('images/banner_Mesa de trabajo 1.png'),
                      height: ancho / 2.94,
                    
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              _listaCategorias()
            ])),

      bottomNavigationBar: NavigationBar(),
    );

    
  }
  Widget _listaCategorias(){
    final ancho = MediaQuery.of(context).size.width;
    final largo = MediaQuery.of(context).size.height;

    return Container(
                height: largo / 1.6,
                width: ancho / 1.1,
                color: Colors.white,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      heightFactor: 1.5,
                      widthFactor: 3,
                      child: Text(
                        "Categorias",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Montserrat Regular',
                        ),
                      ),
                    ),
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
                              final category =
                                  response.data["product_category"];

                              return ListView.builder(
                                  itemCount: categories.length,
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

                                                child: Image.asset(
                                                    categories[index]['imagenes'],
                                                    height: 300,
                                                    width: 300,)
                                                // fit: BoxFit.cover),
                                                ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 290,
                                                    width: 300,
                                                  ),
                                                  Text(
                                                    category[index]["name"]
                                                        .toString(),
                                                    
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontFamily:
                                                          'Montserrat Regular',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                       onTap: (){
                            Navigator.pushNamed(context, '/lista',arguments: category[index]["id"].toString());
                            
                            print("ID que envia "+category[index]["id"].toString());
                          },
                          );
                                    
                                  });
                            })),
                    Column(
                      children: [
                        Image(
                          image: AssetImage('images/ofertas-08.png'),
                          height: largo/6,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            

      
      
    }
}
