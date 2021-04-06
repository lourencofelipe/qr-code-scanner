import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generate extends StatefulWidget {
  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  //Link default para o QrCode.
  String qrData = "https://google.com";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Plugin para gerar um novo qr code.
            QrImage(data: qrData),

            //Criando qr code por meio do usuário.
            SizedBox(
              height: 20.0,
            ),
            Text("Pegue o Link/Dado com o QR CODE"),
            TextField(
              controller: qrText,
              decoration: InputDecoration(
                hintText: "Link/Dado",
              ),
            ),

            SizedBox(height: 20.0),
            FlatButton(
              padding: EdgeInsets.all(15.0),
              child: Text("GERAR QR CODE"),
              onPressed: () {
                if (qrText.text.isEmpty) {
                  setState(() {
                    qrData = "https://flutter.dev";
                  });
                } else {
                  setState(() {
                    qrData = qrText.text;
                  });
                }
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.blue, width: 3.0)),
            ),
          ],
        ),
      ),
    );
  }

  final qrText = TextEditingController();
}
