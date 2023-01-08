import 'package:flutter/material.dart';

Widget setting({required Icon ico, required String type, String data = ""}) =>
    Container(
      height: 65,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF003F75),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            data,
            style: TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Spacer(
            flex: 5,
          ),
          Text(
            type,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Spacer(
            flex: 1,
          ),
          Icon(ico.icon, color: Colors.white),
        ],
      ),
    );
