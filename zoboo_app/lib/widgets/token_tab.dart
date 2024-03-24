import 'package:flutter/material.dart';

class TokenListView extends StatefulWidget {
  final int balance;
  const TokenListView({super.key, required this.balance});

  @override
  State<TokenListView> createState() => _TokenListViewState();
}

class _TokenListViewState extends State<TokenListView> {
  final List tokens = [
    {
      'name': 'Ethereum',
      'quantity': 2,
      'symbol': 'ETH',
      'value': 2000,
      'image': '',
    },
  ];
  @override
  Widget build(BuildContext context) {
    int balance = widget.balance;
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
                    Text(balance.toString()),
                    SizedBox(width: 10),
                    Text('${tokens[index]['symbol']}'),
                    Spacer(),
                    Text('\$ ${(balance * 3570).toStringAsFixed(2)}',
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
