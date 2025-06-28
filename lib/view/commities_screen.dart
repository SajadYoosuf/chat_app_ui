import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// COMMUNITIES PAGE
class CommunitiesPage extends StatelessWidget {
  final List<String> communities = [
    'Tech Enthusiasts Worldwide',
    'Flutter Developers Global',
    'Photography Lovers',
    'Travel Adventures',
    'Food & Recipes',
    'Fitness Motivation',
    'Book Club International',
    'Music Lovers United',
    'Gaming Community',
    'Art & Design Hub',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Communities', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF075E54),
        actions: [
          IconButton(icon: Icon(Icons.camera_alt, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Icon(Icons.groups, size: 80, color: Colors.grey[400]),
                SizedBox(height: 16),
                Text(
                  'Stay connected with a community',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Communities bring members together in topic-based groups, and make it easy to get admin announcements.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF25D366),
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Start your community'),
                ),
              ],
            ),
          ),
          Divider(),
          
          // Popular Communities
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('Popular Communities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          
          ...communities.map((community) => ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFF075E54),
              child: Icon(Icons.groups, color: Colors.white),
            ),
            title: Text(community),
            subtitle: Text('${(community.hashCode % 1000 + 100)} members'),
            trailing: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF25D366),
                foregroundColor: Colors.white,
                minimumSize: Size(60, 30),
              ),
              child: Text('Join'),
            ),
          )).toList(),
        ],
      ),
    );
  }
}
