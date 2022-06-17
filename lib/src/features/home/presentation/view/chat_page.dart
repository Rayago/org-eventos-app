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
  ScrollController scrollController = ScrollController();

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
      backgroundColor: Color.fromRGBO(200, 200, 200, 1),
      body: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.only(bottom: 60),
            reverse: false,
            itemCount: messages.length,
            itemBuilder: (context, index) => chat(
                messages[index]["message"].toString(), messages[index]["id"]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 55,
                  child: Card(
                    margin: EdgeInsets.only(
                      left: 8,
                      right: 2,
                      bottom: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextFormField(
                      controller: messageController,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      minLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Mensagem',
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 8),
                  child: CircleAvatar(
                    radius: 20,
                    child: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        if (messageController.text.isEmpty) {
                          print('vazia');
                        } else {
                          setState(() {
                            //messages.insert(0, {"id": 1, "message": messageController.text});
                            messages.add(
                                {"message": messageController.text, "id": 0});
                          });
                          //response(messageController.text);
                          messageController.clear();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BorderRadius borderLeft = const BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
      bottomRight: Radius.circular(15));

  BorderRadius borderRight = const BorderRadius.only(
      topLeft: Radius.circular(15),
      bottomRight: Radius.circular(15),
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
                    color: Color.fromRGBO(38, 38, 38, 0.7),
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
                    gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color.fromRGBO(76, 0, 213, 1),
                        Color.fromRGBO(0, 0, 162, 1),
                        /* Color.fromRGBO(255, 201, 4, 1),
                        Color.fromRGBO(255, 35, 93, 1),
                        Color.fromRGBO(211, 0, 213, 1), */
                      ],
                    ),
                    //color: Color.fromRGBO(76, 0, 213, 1),
                    borderRadius: borderRight,
                  ),
                )
              ],
            ),
    );
  }
}
