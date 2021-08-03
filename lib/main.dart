import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:marketplace_v4/routes/rutas.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //Implementacion EndPoint Graphql 
  final HttpLink httpLink = new HttpLink('http://localhost:8080/v1/graphql');
  //Implementacion EndPoint Graphql solo para operaciones de suscription 
  final WebSocketLink webSocketLink =new WebSocketLink('ws://localhost:8080/v1/graphql',
  config: SocketClientConfig(
   autoReconnect: true,inactivityTimeout: Duration(seconds: 30),
  ));
  @override
  Widget build(BuildContext context) {
    //Contatenacion del endpoint para la realizacion de las operaciones de suscription.
    final link = Link.split((request) => request.isSubscription, webSocketLink, httpLink);
    final ValueNotifier<GraphQLClient> client = 
    new ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: link,
        //Datos de cache de la aplicacion nivel graphql
        cache: GraphQLCache()
        ));

    return GraphQLProvider(
      //Implementacion del cliente.
      client: client,
      child: MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget),
            maxWidth: 1600,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(450, name: MOBILE),
              ResponsiveBreakpoint.resize(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: TABLET),
              ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ],
          ),

        initialRoute: '/lista',
        //Rutas de la aplicacion
        routes: getApplicacionesRutas(),
        
        theme: Theme.of(context).copyWith(platform: TargetPlatform.android),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

