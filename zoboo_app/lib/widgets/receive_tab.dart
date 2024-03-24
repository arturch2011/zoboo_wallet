import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:clipboard/clipboard.dart';

class QrCodeWidget extends StatelessWidget {
  final String qrData;
  final String name;

  QrCodeWidget({super.key, required this.qrData, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Sombra
            spreadRadius: 1,
            blurRadius: 5,
            // Ajuste a sombra vertical aqui
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(name),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              FlutterClipboard.copy(qrData).then((value) {
                const snackBar = SnackBar(
                  content: Text('Copiado para a área de transferência'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('${qrData.substring(0, 10)}...',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(width: 5),
                const Icon(Icons.copy, size: 15),
              ]),
            ),
          ),
          SizedBox(height: 20),
          PrettyQrView.data(
            data: qrData,
            decoration: const PrettyQrDecoration(),
          )
        ],
      ),
    );
  }
}
