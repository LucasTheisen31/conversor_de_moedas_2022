import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage2 extends StatefulWidget {
  HomePage2({Key? key, required this.dolar, required this.bitcoin})
      : super(key: key);

  double real = 0;
  double dolar;
  double bitcoin;

  @override
  _HomePage2State createState() =>
      _HomePage2State(dolar: dolar, bitcoin: bitcoin);
}

class _HomePage2State extends State<HomePage2> {
  final TextEditingController _realControler = TextEditingController();
  final TextEditingController _dolarControler = TextEditingController();
  final TextEditingController _bitcoinControler = TextEditingController();

  _HomePage2State({required this.dolar, required this.bitcoin});

  double dolar;
  double bitcoin;

  void _alterouReal(String text) {
    if(text.isEmpty){
      limparCampos();
      return;
    }
    double real = double.parse(text);
    _dolarControler.text = (real / dolar).toStringAsFixed(2);
    _bitcoinControler.text = (real / bitcoin).toStringAsFixed(10);
  }

  void _alterouDolar(String text) {
    if(text.isEmpty){
      limparCampos();
      return;
    }
    double dolar = double.parse(text);
    _realControler.text = (dolar * this.dolar).toStringAsFixed(2);
    _bitcoinControler.text = (dolar * this.dolar / bitcoin).toStringAsFixed(10);
  }

  void _alterouBitcoin(String text) {
    if(text.isEmpty){
      limparCampos();
      return;
    }
    double btc = double.parse(text);
    _realControler.text = (btc * bitcoin).toStringAsFixed(2);
    _dolarControler.text = (btc * bitcoin / dolar).toStringAsFixed(2);
  }

  void limparCampos() {
    _realControler.text = '';
    _dolarControler.text = '';
    _bitcoinControler.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "assets/images/bitcoin.png",
                  fit: BoxFit.cover,
                ),
              ),
              radius: 70,
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              height: 15,
            ),
            buildTextFormField(
              labelText: 'Real',
              prefixText: 'R\$: ',
              controler: _realControler,
              funcao: _alterouReal,
              iconButton: IconButton(
                onPressed: null,
                icon: SvgPicture.asset(
                  'assets/icon/currency-brl.svg',
                  color: Colors.amber.shade700,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            buildTextFormField(
              labelText: 'Dolar',
              prefixText: 'US\$: ',
              controler: _dolarControler,
              funcao: _alterouDolar,
              sufixIcon: Icon(
                Icons.attach_money,
                color: Colors.amber.shade700,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            buildTextFormField(
              labelText: 'Bitcoin',
              prefixText: 'BTC: ',
              iconButton: IconButton(
                onPressed: null,
                icon: SvgPicture.asset('assets/icon/currency-btc.svg',
                    color: Colors.amber.shade700),
              ),
              controler: _bitcoinControler,
              funcao: _alterouBitcoin,
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: limparCampos,
                icon: Icon(Icons.refresh),
                label: Text("Limpar Campos"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber.shade700,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildTextFormField({
    required String labelText,
    required String prefixText,
    required TextEditingController controler,
    required Function funcao,
    Icon? sufixIcon,
    IconButton? iconButton,
  }) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: controler,
      onChanged: (texto) {
        funcao(texto);
      },
      decoration: InputDecoration(
        label: Text(
          labelText,
          style: TextStyle(
            color: Colors.amber.shade700,
            fontSize: 22,
          ),
        ),
        prefixText: prefixText,
        suffixIcon: sufixIcon != null ? sufixIcon : iconButton,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.grey.shade900,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.amber.shade700,
            width: 2,
          ),
        ),
      ),
    );
  }
}
