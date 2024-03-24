import 'package:flutter/material.dart';

class TransferTab extends StatefulWidget {
  const TransferTab({super.key});

  @override
  State<TransferTab> createState() => _TransferTabState();
}

class _TransferTabState extends State<TransferTab> {
  final List<String> moedas = ['USD', 'EUR', 'BRL'];
  // Adicione mais moedas conforme necessário
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
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
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Address', // Placeholder
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6), // Espaçamento interno
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(16.0), // Borda arredondada
                        borderSide: const BorderSide(
                            color: Colors.grey), // Cor da borda padrão
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(16.0), // Borda arredondada
                        borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .primary), // Cor da borda quando em foco
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.content_paste),
                  onPressed: () {
                    // Implemente a funcionalidade de colar aqui
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Valor',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                DropdownButton<String>(
                  items: moedas.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {
                    // Implemente a funcionalidade de mudança de moeda aqui
                  },
                ),
              ],
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Enviar')),
        ],
      ),
    );
  }
}
