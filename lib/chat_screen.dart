
// CHAT SCREEN
import 'package:flutter/material.dart';
import 'package:whatsapp_chat_app/chat_model.dart';
import 'package:whatsapp_chat_app/message_model.dart';

class ChatScreen extends StatefulWidget {
  final ChatModel chat;
  
  ChatScreen({required this.chat});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<MessageModel> messages = [
    MessageModel('Hey there! How are you?', true, '10:30 AM'),
    MessageModel('Hi! I\'m doing great, thanks for asking! How about you?', false, '10:31 AM'),
    MessageModel('I\'m good too! Working on a Flutter project', true, '10:32 AM'),
    MessageModel('That sounds exciting! What kind of app?', false, '10:33 AM'),
    MessageModel('A WhatsApp clone actually 😄', true, '10:34 AM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 18,
              child: Text(widget.chat.name[0]),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.chat.name, style: TextStyle(fontSize: 16, color: Colors.white)),
                Text('Online', style: TextStyle(fontSize: 12, color: Colors.white70)),
              ],
            ),
          ],
        ),
        backgroundColor: Color(0xFF075E54),
        actions: [
          IconButton(icon: Icon(Icons.videocam, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.call, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFECE5DD),
                image: DecorationImage(
                  image: AssetImage('assets/chat_bg.png'),
                  fit: BoxFit.cover,
                  opacity: 0.1,
                ),
              ),
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return _buildMessageBubble(message);
                },
              ),
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(MessageModel message) {
    return Align(
      alignment: message.isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: message.isSent ? Color(0xFFDCF8C6) : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(message.text),
            SizedBox(height: 4),
            Text(message.time, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  IconButton(icon: Icon(Icons.emoji_emotions_outlined), onPressed: () {}),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.attach_file), onPressed: () {}),
                  IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
                ],
              ),
            ),
          ),
          SizedBox(width: 8),
          FloatingActionButton(
            mini: true,
            onPressed: () {},
            backgroundColor: Color(0xFF075E54),
            child: Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}