import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vendedor_app/src/providers/push_notifications_provider.dart';
import 'package:vendedor_app/main.dart';

class Menu extends StatefulWidget {
  @override
  MenuState createState() => new MenuState();
}

class MenuState extends State<Menu> {
  @override
  void initState() {
    super.initState();

    final pushProvider = new PushNotificatinProvider();
    pushProvider.initNotifications();

    pushProvider.mensajesStream.listen((data) {
      navigatorKey.currentState.pushNamed('pedido_realizado', arguments: data);
    });
  }

  @override
  Widget build(BuildContext context) {
    /*final logo = Hero(
      tag: "hero",
      child: Image.asset("img/botanaxLogo.png"),
    );*/
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 150),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 44.0,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.red,
                      child: Text(
                        'Ir al carrito',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () {}),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
