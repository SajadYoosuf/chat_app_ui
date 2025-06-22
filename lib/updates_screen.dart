import 'package:flutter/material.dart';

// UPDATES PAGE
class UpdatesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Updates', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF075E54),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          // My Status Section
          ListTile(
            leading: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF25D366),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 16),
                  ),
                ),
              ],
            ),
            title: Text('My status'),
            subtitle: Text('Tap to add status update'),
            onTap: () {},
          ),
          Divider(),

          // Recent Updates
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Recent updates',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          ...List.generate(
            5,
            (index) => ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFF25D366), width: 2),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: Text('U${index + 1}'),
                ),
              ),
              title: Text('User ${index + 1}'),
              subtitle: Text('${(index + 1) * 5} minutes ago'),
              onTap: () {},
            ),
          ),

          Divider(),

          // Viewed Updates
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Viewed updates',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          ...List.generate(
            3,
            (index) => ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 2),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: Text('V${index + 1}'),
                ),
              ),
              title: Text('Viewed User ${index + 1}'),
              subtitle: Text('Today, ${10 + index}:00 AM'),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
