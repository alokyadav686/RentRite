import 'package:flutter/material.dart';
import 'package:rentrite/contants/colors.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.White,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            "RentRite AI",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            
          ),
        ), 
      ),
      body: Column(
        
      ),
    );
  }
   Widget chatBubble(String text, bool isSent) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSent ? AppColors.primaryColor : Colors.transparent,
          border: isSent ? null : Border.all(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSent ? Colors.white : AppColors.primaryColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
