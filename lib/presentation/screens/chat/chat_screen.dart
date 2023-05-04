import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.imgbin.com%2F6%2F1%2F19%2Fimgbin-avatar-drawing-redhead-avatar-woman-wearing-eyeglasses-gCTzbUpcc1u4e3gdHXdbWYVV6.jpg&f=1&nofb=1&ipt=d19e60b5fa33f0695869549c267940b4ef9e67e065cbc7f663600280d7949674&ipo=images'),
          ),
        ),
        title: const Text('Mi amor'),
        centerTitle: false,
      ),

      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: Column(
          children: [
            
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (contex, index){

                  final message = chatProvider.messageList[index];
                 
                  return ( message.fromWho == FromWho.hers )
                    ? HerMessageBubble(message: message) 
                    : MyMessageBubble( message : message ); 
                   
                } 
              )
            ),
            
            MessageFieldBox( onValue:(value) => chatProvider.sendMessage(value)), // Despues de escribir -> cb:onValue y se envía al provider el valor -> modifica el estado
          ],),
      ),
    );
  }
}

