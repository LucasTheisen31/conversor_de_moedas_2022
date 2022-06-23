import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key, required this.erro}) : super(key: key);

  final String erro;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 60,
        ),
        Text(
          erro,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
