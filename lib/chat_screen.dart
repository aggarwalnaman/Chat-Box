import 'package:codershub/chat_mesage.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages= <ChatMessage>[];

    void _submit(String text){
      _controller.clear();
      ChatMessage message = new ChatMessage(
        text : text,
      );
      setState(() {
        _messages.insert(0, message);
      });
    }

  Widget _textComposer(){
    return IconTheme(
      data: IconThemeData(
        color: Colors.blueAccent[700]
      ),
          child: Container(
        margin: EdgeInsets.symmetric(horizontal : 10.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration : InputDecoration(hintText: "Enter a Message"),
                controller: _controller,
                onSubmitted: _submit,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal:5.0),
              child: new IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _submit(_controller.text),
                
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_,int index) => _messages[index],
              itemCount: _messages.length,
              ),
          ),
          Divider(height: 1.0,),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              ),
            child: _textComposer(),
          ),
        ],
      );
  }
}