import 'package:flutter/material.dart';
import 'package:quizapp/Anasayfa.dart';

class Sonucekrani extends StatefulWidget {
  final int skor;

  const Sonucekrani(this.skor, {Key? key}) : super(key: key);

  @override
  State<Sonucekrani> createState() => _SonucekraniState();
}

class _SonucekraniState extends State<Sonucekrani> {
  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xFF252c4a);
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Tebrikler",
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Skorunuz:",
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "${widget.skor}",
              style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AnaSayfa()));
              },
              child: Text(
                "Quizz'i tekrarla",
              ),
              elevation: 0,
              color: Colors.orangeAccent,
              textColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
