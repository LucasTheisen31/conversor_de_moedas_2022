import 'package:conversor_de_moedas_2022/main.dart';
import 'package:conversor_de_moedas_2022/pages/error_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'home_page2.dart';
import 'loading_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "\$ Conversor Moedas 2022 \$",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber.shade700,
      ),
      body: FutureBuilder<Map>(
          //Widget que se constrói com base no último instantâneo de interação com um Future
          future: getDados(),
          //O futuro deve ter sido obtido antes, apos obter o future que neste caso é uma funcao para pegar os dados das cotaçoes, ira construir a tela, ou ira mostrar um widget de carregamento
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return LoadingPage();
              default:
                if (snapshot.hasError) {
                  return ErrorPage(erro: 'Erro ao carregar os dados...');
                } else {
                  return HomePage2(
                    dolar: snapshot.data!['results']['currencies']['USD']
                        ['buy'],
                    bitcoin: snapshot.data!['results']['currencies']['BTC']
                        ['buy'],
                  );
                }
            }
          }),
    );
  }
}
