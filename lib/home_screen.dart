import 'package:flutter/material.dart';
import 'package:qr_scanner_generator/scan.dart';
import 'package:qr_scanner_generator/generate.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('QR Code Scanner & Generator'),
        ),
        body: Center(
            child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ScanScreen()),
                            );
                          },
                          child: const Text('SCAN QR CODE')
                      ),
                    ),
                   Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => GenerateScreen()),
                            );
                          },
                          child: const Text('GENERATE QR CODE')
                      ),
                    ),
                ],
              )
          ),
        );
  }
}

