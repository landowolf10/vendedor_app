import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vendedor_app/src/providers/push_notifications_provider.dart';

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

    //final args = ModalRoute.of(context).settings.arguments;

    return Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: 400,
                  child: Center(
                    child: ListView(
                      children: [
                        Text("Cliente: $clientData",
                            style: TextStyle(fontSize: 20, color: Colors.red)),
                        SizedBox(height: 30),
                        Text("Pedido: $foodData",
                            style: TextStyle(fontSize: 20, color: Colors.red)),
                        SizedBox(height: 30),
                        Text("Cantidad producto: $quantityPerProd",
                            style: TextStyle(fontSize: 20, color: Colors.red)),
                        SizedBox(height: 30),
                        Text("Telefono: $phoneNumber",
                            style: TextStyle(fontSize: 20, color: Colors.red)),
                        SizedBox(height: 30),
                        Text("Colonia: $colony",
                            style: TextStyle(fontSize: 20, color: Colors.red)),
                        SizedBox(height: 30),
                        Text("Calle: $street",
                            style: TextStyle(fontSize: 20, color: Colors.red)),
                        SizedBox(height: 30),
                        Text("Número: $streetNumber",
                            style: TextStyle(fontSize: 20, color: Colors.red)),
                      ],
                    ),
                  ),
                )
              ],
            ),
            /*Center(
            child: SizedBox(
              height: 400,
              child: Column(
                children: [
                  Text(clientData,
                      style: TextStyle(fontSize: 20, color: Colors.red)),
                  Text(foodData,
                      style: TextStyle(fontSize: 20, color: Colors.red)),
                ],
              ),
            ),
          ),*/
            SizedBox(height: 50),
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
                  onPressed: () {}),
            )
          ],
        ));
  }
}
