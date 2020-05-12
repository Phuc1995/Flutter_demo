import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lib_feedback/service/feedback_store.dart';
class FeedbackComplete extends StatelessWidget {
  var feedbackStore = Modular.get<FeedbackStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Survey"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10,50,10,50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Thank you", style: TextStyle( fontSize: 24, fontWeight: FontWeight.bold),),
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Your feedback has been sent to ${feedbackStore.feedbackModel.mail}", style: TextStyle( fontSize: 20,),),
            ),
            SizedBox(height: 100,),
            IconButton(
              icon: Icon(Icons.home, size: 50,),
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  '/home',
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
