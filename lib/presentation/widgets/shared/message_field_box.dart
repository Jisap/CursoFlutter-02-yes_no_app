import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue; // Método callback del padre onFieldSubmitted() que devuelve el valor cambiante del submit

  const MessageFieldBox({
    super.key, 
    required this.onValue
  });

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide( color: Colors.transparent ),
      borderRadius: BorderRadius.circular(40)
    );

    final inputDecoration = InputDecoration(
        hintText: 'End your message with a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: (){
            final textValue = textController.value.text; // Boton de la caja del input que devuelve el contenido escrito
            onValue(textValue);                          // onValue recoge el valor del input y lo emite para que otras clases se subscriban a sus cambios
            textController.clear();
          },
        ),
      );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(value);               // Emitimos el valor del input
        textController.clear();       // Limpiamos el input
        focusNode.requestFocus();     // Se mantiene el focus en dicho input
      },
    );
  }
}