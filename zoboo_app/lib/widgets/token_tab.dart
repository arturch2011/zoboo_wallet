import 'package:flutter/material.dart';

class TokenListView extends StatefulWidget {
  const TokenListView({super.key});

  @override
  State<TokenListView> createState() => _TokenListViewState();
}

class _TokenListViewState extends State<TokenListView> {
  final List tokens = [
    {
      'name': 'Bitcoin',
      'quantity': 1,
      'symbol': 'BTC',
      'value': 100000,
      'image': '',
    },
    {
      'name': 'Ethereum',
      'quantity': 2,
      'symbol': 'ETH',
      'value': 2000,
      'image': '',
    },
    {
      'name': 'Binance Coin',
      'quantity': 3,
      'symbol': 'BNB',
      'value': 300,
      'image': '',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tokens.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                ),
                title: Text(tokens[index]['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: Row(
                  children: <Widget>[
                    Text('${tokens[index]['quantity'].toString()}'),
                    SizedBox(width: 10),
                    Text('${tokens[index]['symbol']}'),
                    Spacer(),
                    Text('\$${tokens[index]['value'].toString()}',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              SizedBox(width: 10),
            ],
          );
        },
      ),
    );
  }
}
