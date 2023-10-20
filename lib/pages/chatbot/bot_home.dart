import 'package:fitnesssl/pages/chatbot/bot_screen.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:fitnesssl/pages/messenger/chat_home.dart';

class BotHome extends StatefulWidget {
  const BotHome({Key? key}) : super(key: key);

  @override
  _BotHomeState createState() => _BotHomeState();
}

class _BotHomeState extends State<BotHome> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          color: Color(0xFF323232),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatHome(),
              ),
            );
          },
        ),
        title: Row(
          children: [
            Image.asset(
              'images/bot.png',
              width: 50,
              height: 50,
              // color: Color(0xFF008FA0),
              fit: BoxFit.cover,
            ),
            SizedBox(width: 15), // Add spacing between the image and the title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fitty ChatBot',
                  style: TextStyle(
                    color: Color(0XFF323232),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 10,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Online',
                      style: TextStyle(
                        color: Color(0XFF323232),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        centerTitle: false,
        elevation: 1,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
          child: Column(
            children: [
              // chat bot screen (bot body)
              Expanded(
                child: MessagesScreen(messages: messages),
              ),
              SizedBox(height: 10),

              // message typing space
              Material(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding:
                      EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F8FF),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black54,
                    ),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Chat with me...",
                            hintStyle: TextStyle(color: Colors.black45),
                          ),
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          sendMessage(_controller.text);
                          _controller.clear();
                        },
                        icon: Icon(Icons.send),
                        iconSize: 28,
                        color: Color.fromARGB(255, 97, 95, 95),
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

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(
          Message(
            text: DialogText(text: [text]),
          ),
          true,
        );
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
        queryInput: QueryInput(
          text: TextInput(text: text),
        ),
      );
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({
      'message': message,
      'isUserMessage': isUserMessage,
    });
  }
}
