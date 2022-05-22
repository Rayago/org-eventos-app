import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

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
      //botao para enviar mensagens pelo bot
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (messageController.text.isEmpty) {
            print('vazia');
          } else {
            setState(() {
              //messages.insert(0, {"id": 1, "message": messageController.text});
              messages.add({"message": messageController.text, "id": 1});
            });
            //response(messageController.text);
            messageController.clear();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      //botao para enviar mensagens pelo bot
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
            SizedBox(height: 20),
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
                  padding: EdgeInsets.only(left: 10, bottom: 3),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    color: Color.fromRGBO(54, 54, 62, 0.5),
                  ),
                  child: TextFormField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: 'Mensagem',
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
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
                    /* FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    } */
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BorderRadius borderLeft = BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
      bottomRight: Radius.circular(15));

  BorderRadius borderRight = BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
      bottomLeft: Radius.circular(15));

  TextStyle styleText =
      TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600);

  Widget chat(String message, int id) {
    return Padding(
      padding: id == 1
          ? EdgeInsets.fromLTRB(10, 5, 80, 5)
          : EdgeInsets.fromLTRB(80, 5, 10, 5),
      child: id == 1
          ? Wrap(
              alignment: WrapAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 5,
                    bottom: 5,
                  ),
                  child: Text(message, style: styleText),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(76, 0, 213, 0.5),
                    borderRadius: borderLeft,
                  ),
                )
              ],
            )
          : Wrap(
              alignment: WrapAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 5,
                    bottom: 5,
                  ),
                  child: Text(
                    message,
                    style: styleText,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(76, 0, 213, 1),
                    borderRadius: borderRight,
                  ),
                )
              ],
            ),
    );
  }
}
