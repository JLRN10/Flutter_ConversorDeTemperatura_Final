import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var temp = 0.00;

  @override
  Widget build(BuildContext context) {
    var inputTempController = TextEditingController();

    final inputTemperatura = Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        controller: inputTempController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            hintText: "Introduce la temperatura",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusColor: Colors.white),
      ),
    );

    final btnTemperatura = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FlatButton(
            color: Color.fromARGB(254, 0, 204, 255),
            onPressed: () {
              print(inputTempController.text);
              temp = (int.parse(inputTempController.text) * 1.8) + 32;
              print(temp);
              setState(() {});
              Future.delayed(Duration(seconds: 2), () {
                return showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: Text("Conversión"),
                          content: Text("$temp Grados"),
                        ));
              });
            },
            child: Text(
              "Grados",
              style: TextStyle(color: Colors.black),
            )),
        FlatButton(
            color: Color.fromARGB(254, 0, 204, 255),
            onPressed: () {
              temp = (int.parse(inputTempController.text) - 32) / 1.8;
              setState(() {});
              Future.delayed(Duration(seconds: 2), () {
                return showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: Text("Conversion"),
                          content: Text("$temp Fahrenheit"),
                        ));
              });
            },
            child: Text("Fahrenheit", style: TextStyle(color: Colors.black)))
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Convertidor de Temperatura",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromARGB(254, 118, 215, 196),
      ),
      body: Container(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          inputTemperatura,
          btnTemperatura,
        ]),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("imagenes/fondo_temp.jpg"),
                //  image: Image.file(file)   Permite hacer uso de imagenes dentro del dispositivo
                fit: BoxFit.fill)),
      ),
    );
  }
}
