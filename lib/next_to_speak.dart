import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechConcept extends StatefulWidget {
  @override
  State<TextToSpeechConcept> createState() => _TextToSpeechConceptState();
}

class _TextToSpeechConceptState extends State<TextToSpeechConcept> {
  final FlutterTts _flutterTts = FlutterTts();

  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Text to Speech',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 90,),
            Padding(
              padding: const EdgeInsets.all(30),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Enter text',
                ),
              ),
            ),
            SizedBox(height: 90),
            CircleAvatar(
              radius: 20,
              child: IconButton(onPressed: () {
                _speak(_textController.text);
              }, icon: Icon(Icons.mic)),
            )
          ],
        ),
      ),
    );
  }

  Future _speak(String text) async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1);
    await _flutterTts.speak(text);
  }
}
