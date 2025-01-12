import 'package:flutter/material.dart';
import 'package:quizapp/sonucekrani.dart';
import 'package:quizapp/sorular.dart';

class AnaSayfa extends StatefulWidget {
  AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  Color mainColor = Color(0xFF252c4a);
  Color secondColor = Color(0xFF117eeb);
  PageController? _controller =
      PageController(initialPage: 0); //page controller ekledim
  bool bastiMi = false; //değişken atadım
  Color dogrucevap = Colors.green;
  Color yanliscevap = Colors.red;
  Color butonrengi = Color(0xFF117eeb);
  int skor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: EdgeInsets.all(8),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller!,
          onPageChanged: (page) {
            setState(() {
              bastiMi = false;
            });
          },
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Soru ${index + 1} / ${Questions.length}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 30),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 5,
                  thickness: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  Questions[index].Questions!,
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
                for (int i = 0;
                    i < Questions[index].answers!.length;
                    i++) //işlem matematiğini yaptım.
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    //aralarına mesafe koydudm knk
                    child: MaterialButton(
                      shape: StadiumBorder(),
                      color: bastiMi
                          ? Questions[index].answers!.entries.toList()[i].value
                              ? dogrucevap
                              : yanliscevap
                          : secondColor,
                      onPressed: bastiMi
                          ? () {}
                          : () {
                              setState(() {
                                bastiMi = true;
                              });
                              if (Questions[index]
                                  .answers!
                                  .entries
                                  .toList()[i]
                                  .value) {
                                skor += 10;
                              } else {
                                setState(() {
                                  butonrengi = yanliscevap;
                                });
                              }
                              ;
                            },
                      child: Text(
                        Questions[index].answers!.keys.toList()[i],
                        //soruları çapırdım
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                        onPressed: bastiMi
                            ? index + 1 == Questions.length
                                ? () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Sonucekrani(skor)));
                                  }
                                : () {
                                    _controller!.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.linear);
                                  }
                            : null,
                        child: Text(
                          index + 1 == Questions.length
                              ? "Sonuçları Göster"
                              : "Sonraki Soru",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                )
              ],
            );
          },
          itemCount: Questions.length,
        ),
      ),
    );
  }
}

class QuestionModel {
  String? Questions;
  Map<String, bool>? answers;

  QuestionModel(this.Questions, this.answers);
}
