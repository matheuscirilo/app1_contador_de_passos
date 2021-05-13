import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infotext = "Pode Entrar";
  void _changePeople(int interacao) {
    setState(() {
      _people += interacao;
      if(_people<0){
        _infotext="Mundo Invertido?";
      }else if(_people<=10){
        _infotext="Pode Entrar";
      }else{
        _infotext="Restaurante Cheio";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        'images/restaurants.jpg',
        fit: BoxFit.cover,
        height: 1000.0,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Pessoas: $_people",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextButton(
                  child: Text("+1",
                      style: TextStyle(color: Colors.white, fontSize: 40.0)),
                  onPressed: () {
                    _changePeople(1);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextButton(
                  child: Text("-1",
                      style: TextStyle(color: Colors.white, fontSize: 40.0)),
                  onPressed: () {
                    _changePeople(-1);
                  },
                ),
              ),
            ],
          ),
          Text(_infotext,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0)),
        ],
      )
    ]);
  }
}
