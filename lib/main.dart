import 'package:flutter/material.dart';
import 'package:vendedor_app/src/pages/main_menu.dart';
import 'package:vendedor_app/src/pages/pedido_estatus.dart';

void main() {
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'Botanax',
        initialRoute: 'menu',
        routes: {
          'menu': (BuildContext c) => Menu(),
          'pedido_realizado': (BuildContext c) => PedidoRealizado()
        },);
  }
}
