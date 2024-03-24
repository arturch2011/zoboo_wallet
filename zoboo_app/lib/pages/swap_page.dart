import 'package:flutter/material.dart';

class SwapPage extends StatefulWidget {
  const SwapPage({super.key});

  @override
  State<SwapPage> createState() => _SwapPageState();
}

class _SwapPageState extends State<SwapPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Buy Crypto In Split Transactions',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Amount', // Placeholder
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 6), // Espaçamento interno
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                16.0), // Borda arredondada
                            borderSide: const BorderSide(
                                color: Colors.grey), // Cor da borda padrão
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                16.0), // Borda arredondada
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary), // Cor da borda quando em foco
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Parcels', // Placeholder
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 6), // Espaçamento interno
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                16.0), // Borda arredondada
                            borderSide: const BorderSide(
                                color: Colors.grey), // Cor da borda padrão
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                16.0), // Borda arredondada
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary), // Cor da borda quando em foco
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Sllipage (%)', // Placeholder
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 6), // Espaçamento interno
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                16.0), // Borda arredondada
                            borderSide: const BorderSide(
                                color: Colors.grey), // Cor da borda padrão
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                16.0), // Borda arredondada
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary), // Cor da borda quando em foco
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 25),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Enviar'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
