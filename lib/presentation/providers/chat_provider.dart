


import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{                          // Puede notificar cuando hay cambios

  final chatScrollController = ScrollController(); // Permite tenener el control de un solo scroll
  final getYesNoAnswer = GetYesNoAnswer();           // Instancia de la petición http

  List<Message> messageList = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya regresastes del trabajo ?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage( String text ) async{                 // Recibe el mensaje del input -> Modifica el estado de messageList
    if(text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me); // Definimos el tipo de variable que maneja esta clase (Message)
    messageList.add(newMessage);                                 // Lo añadimos a la lista de mensajes 

    if( text.endsWith('?')){                                     // Si el mensaje termina en ?
      herReply();                                                // Esperamos una respuesta de la api 
    }

    notifyListeners();                                           // Le decimos a flutter que hay un cambio en el estado de la lista -> redibuja todo
    moveScrollToBottom();                                        // Movemos el scroll abajo del todo
  }

  Future<void> herReply() async{                                // Respuesta de la api
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async{
    await Future.delayed(const Duration(milliseconds: 100));
    
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,  // posición al la máxima posición que pueda dar
      duration: const Duration( milliseconds: 300),   // duración
      curve: Curves.easeOut                           // tipo animación  
    );
  }
}