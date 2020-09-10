import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
List<String> precioProducto = new List<String>();

class PedidoRealizado extends StatefulWidget {
  @override
  PedidoRealizadoState createState() => new PedidoRealizadoState();
}

class PedidoRealizadoState extends State<PedidoRealizado> {
    @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*final logo = Hero(
      tag: "hero",
      child: Image.asset("img/botanaxLogo.png"),
    );*/

    final arg = ModalRoute.of(context).settings.arguments;

    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Text(arg),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 44.0,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.red,
                      child: Text(
                        'Productos pedidos',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () {

                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
