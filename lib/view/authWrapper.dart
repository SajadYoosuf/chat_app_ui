import 'package:flutter/material.dart';
import 'package:whatsapp_chat_app/view/chat_list_screen.dart';
import 'package:whatsapp_chat_app/view/phone_authentication_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        if (snapshot.hasData) {
          return ChatListScreen();
        }

        return PhoneAuthScreen();
      },
    );
  }
}
