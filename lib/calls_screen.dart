import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_chat_app/call_model.dart';

// CALLS PAGE
class CallsPage extends StatelessWidget {
  final List<CallModel> calls = [
    CallModel('John Doe', 'Outgoing', 'video', '10:30 AM'),
    CallModel('Sarah Wilson', 'Incoming', 'audio', '9:45 AM'),
    CallModel('Mike Johnson', 'Missed', 'video', 'Yesterday'),
    CallModel('Emily Davis', 'Outgoing', 'audio', 'Yesterday'),
    CallModel('Alex Brown', 'Incoming', 'audio', '2 days ago'),
    CallModel('Lisa Garcia', 'Missed', 'video', '3 days ago'),
    CallModel('David Miller', 'Outgoing', 'video', '4 days ago'),
    CallModel('Anna Taylor', 'Missed', 'audio', '1 week ago'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calls', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF075E54),
        actions: [
          IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        itemCount: calls.length,
        itemBuilder: (context, index) {
          final call = calls[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Text(call.name[0]),
            ),
            title: Text(call.name),
            subtitle: Row(
              children: [
                Icon(
                  call.type == 'Incoming' ? Icons.call_received :
                  call.type == 'Outgoing' ? Icons.call_made : Icons.call_received,
                  size: 16,
                  color: call.type == 'Missed' ? Colors.red : Colors.green,
                ),
                SizedBox(width: 4),
                Text('${call.type}, ${call.time}'),
              ],
            ),
            trailing: IconButton(
              icon: Icon(
                call.callType == 'video' ? Icons.videocam : Icons.call,
                color: Color(0xFF075E54),
              ),
              onPressed: () {},
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF25D366),
        child: Icon(Icons.add_call, color: Colors.white),
      ),
    );
  }
}
