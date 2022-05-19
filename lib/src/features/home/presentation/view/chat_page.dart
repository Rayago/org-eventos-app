import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final messageController = TextEditingController();

  List<Map> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 0, 162, 1),
        title: const Text('Chat'),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace),
          onPressed: () {
            Modular.to.navigate('/auth/home');
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                reverse: false,
                itemCount: messages.length,
                itemBuilder: (context, index) => chat(
                    messages[index]["message"].toString(),
                    messages[index]["id"]),
              ),
            ),
            const Divider(
              height: 5,
              color: Color.fromRGBO(0, 0, 162, 1),
            ),
            Container(
              child: ListTile(
                title: Container(
                  padding: EdgeInsets.only(left: 10, bottom: 5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromRGBO(220, 220, 220, 1),
                  ),
                  child: TextFormField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: 'Escreva sua mensagem',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.send_rounded,
                    size: 30,
                    color: Color.fromRGBO(0, 0, 162, 1),
                  ),
                  onPressed: () {
                    if (messageController.text.isEmpty) {
                      print('vazia');
                    } else {
                      setState(() {
                        //messages.insert(0, {"id": 1, "message": messageController.text});
                        messages
                            .add({"message": messageController.text, "id": 0});
                      });
                      //response(messageController.text);
                      messageController.clear();
                    }
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget chat(String message, int id) {
    return Container();
  }
}
