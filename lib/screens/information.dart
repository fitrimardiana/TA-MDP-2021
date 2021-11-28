import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  @override
  _Information createState() => _Information();
}

class _Information extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('About this Application',
                style: TextStyle(fontWeight: FontWeight.bold)),
                 SizedBox(width: 10),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.topLeft,
        child: Text(
            'CookMate adalah aplikasi resep makanan sederhana yang dibuat dengan tools Flutter untuk memenuhi tugas akhir praktikum Mobile Device Programing 2021 Teknik Komputer UNDIP.',
            style: TextStyle(height: 2, fontSize: 15, color: Colors.black), textAlign: TextAlign.center),
      ),
    );
  }
}
