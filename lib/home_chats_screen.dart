// CHATS PAGE
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_chat_app/chat_model.dart';
import 'package:whatsapp_chat_app/chat_screen.dart';

class ChatsPage extends StatelessWidget {
  final List<ChatModel> chats = [
    ChatModel('John Doe', 'Hey there! How are you?', '10:30 AM', 2),
    ChatModel('Sarah Wilson', 'Can we meet tomorrow?', '9:45 AM', 0),
    ChatModel('Mike Johnson', 'Thanks for the help!', 'Yesterday', 0),
    ChatModel('Emily Davis', 'Good morning! 😊', 'Yesterday', 1),
    ChatModel('Alex Brown', 'See you later', '2 days ago', 0),
    ChatModel('Lisa Garcia', 'How was your weekend?', '3 days ago', 0),
    ChatModel('David Miller', 'Great job on the project!', '4 days ago', 0),
    ChatModel('Anna Taylor', 'Let\'s catch up soon', '1 week ago', 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF075E54),
        actions: [
          IconButton(icon: Icon(Icons.camera_alt, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Text(chat.name[0], style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            title: Text(chat.name, style: TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text(chat.lastMessage, maxLines: 1, overflow: TextOverflow.ellipsis),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(chat.time, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                if (chat.unreadCount > 0)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Color(0xFF25D366),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      chat.unreadCount.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
              ],
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatScreen(chat: chat)),
              
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF25D366),
        child: Icon(Icons.chat, color: Colors.white),
      ),
    );
  }
}