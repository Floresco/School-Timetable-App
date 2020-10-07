import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5, right: 30, left: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 1, color: Colors.white),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.2),
                  blurRadius: 12,
                  spreadRadius: 8,
                )
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80"),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Hi Adan",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Here is a list of classes scheduled for\ntoday that you need to check...",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}