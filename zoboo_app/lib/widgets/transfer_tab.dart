import 'package:flutter/material.dart';

class TransferTab extends StatefulWidget {
  const TransferTab({super.key});

  @override
  State<TransferTab> createState() => _TransferTabState();
}

class _TransferTabState extends State<TransferTab> {
  final List<String> moedas = ['ETH', 'BTC', 'BNB'];
  String moedaSelecionada = 'ETH';
  // Adicione mais moedas conforme necessário
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
          SizedBox(height: 20),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Amount', // Placeholder
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
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: const Color.fromRGBO(217, 217, 217, 1),
                  ),
                  child: DropdownButton<String>(
                    value: moedaSelecionada,
                    onChanged: (value) {
                      setState(() {
                        moedaSelecionada = value!;
                      });
                    },
                    items: moedas.map((String tipo) {
                      return DropdownMenuItem<String>(
                        value: tipo,
                        child: Text(tipo),
                      );
                    }).toList(),
                    borderRadius: BorderRadius.circular(16.0),
                    dropdownColor: const Color.fromRGBO(217, 217, 217, 1),
                    isDense: true,
                    enableFeedback: true,
                    menuMaxHeight: 200,
                    underline: Container(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: Text('Enviar')),
        ],
      ),
    );
  }
}
