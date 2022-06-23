import 'package:conversor_de_moedas_2022/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const request = 'https://api.hgbrasil.com/finance?format=json&key=7eb1add7';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        textSelectionTheme:  TextSelectionThemeData(
          cursorColor: Colors.black,//cor do cursor
          selectionColor: Colors.amber.shade100,//cor da selecao do texto
          selectionHandleColor: Colors.amber.shade700,//cor do botao de arrastar o cursor
        ),

      ),
      home: HomePage(),
    );
  }
}

Future<Map> getDados() async{
  http.Response response = await http.get(Uri.parse(request));
  // Aguarda a resposta http get e, em seguida, decodifica a resposta formatada em json.
  return convert.jsonDecode(response.body);

}
