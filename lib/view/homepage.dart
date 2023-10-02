import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();

  }
  Future<void> speak(String text, double pitch, BuildContext context) async {
    String language = context.locale.languageCode;
    await flutterTts.setLanguage(language);
    await flutterTts.setPitch(pitch);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,color: Colors.black,))
        ],
      ),
           body: Column(
        children: [
          Container(
            width:400,height: 700,

            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/mayavi/s1.jpg')),
            ),
            child: Stack(
              children: [
                Positioned(
                  top:110,
                  left: 55,
                  child: GestureDetector(
                    onTap: (){
                      speak('dialog1'.toString(), 1.5, context);
                    },
                    child: Container(
                      width: 80,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
