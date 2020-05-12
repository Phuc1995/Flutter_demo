import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lib_feedback/service/feedback_store.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPage createState() => _FeedbackPage();
}

class _FeedbackPage extends State<FeedbackPage> {
  var feedbackStore = Modular.get<FeedbackStore>();
  final controllerName = TextEditingController();
  final controllerMail = TextEditingController();
  final controllerNote = TextEditingController();
  List<String> listPackages = [
    "Option 1",
    "Option 2",
    "Option 3",
    "Option 4",
  ];

  @override
  void initState() {
    super.initState();
    feedbackStore.feedbackModel.check = true;
    feedbackStore.checkbox = true;
    feedbackStore.star = 0;
    feedbackStore.currentStep = 0;
  }

  showConfirm() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Comfirm",),
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)),
            content: Text("Do you want to send your feedback?"),
            actions: [
              FlatButton(
                child: Text("Send"),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/feedback/complete',
                  );
                },
              ),
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  next() {
    feedbackStore.changeName(controllerName.text);
    feedbackStore.changeMail(controllerMail.text);
    feedbackStore.changeNote(controllerNote.text);
    if (!feedbackStore.isVaild) {
    } else if (feedbackStore.currentStep == 1 && feedbackStore.star == 0) {
    } else if (feedbackStore.currentStep == 2 &&
        feedbackStore.feedbackModel.option == null) {
    } else if (feedbackStore.currentStep + 1 == 5 && feedbackStore.isVaild == true && feedbackStore.star != 0 && feedbackStore.feedbackModel.option != null) {
      showConfirm();
    } else if (feedbackStore.currentStep + 1 != 5 ) {
      goTo(feedbackStore.currentStep + 1);
    }
  }

  goTo(int step) {
    setState(() => feedbackStore.currentStep = step);
  }

  cancel() {
    if (feedbackStore.currentStep > 0) {
      goTo(feedbackStore.currentStep - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Feedback"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stepper(
                steps: [
                  Step(
                    isActive: true,
                    title: Text("Infomation"),
                    content: Column(
                      children: <Widget>[
                        Observer(
                          builder: (BuildContext context) {
                            return TextField(
                                controller: controllerMail,
                                decoration: InputDecoration(
                                  labelText: "Mail",
                                  errorText: feedbackStore.isVaildMail
                                      ? null
                                      : feedbackStore.validateMail(),
                                ));
                          },
                        ),
                        Observer(
                          builder: (BuildContext context) {
                            return TextField(
                                controller: controllerName,
                                decoration: InputDecoration(
                                  labelText: "Name",
                                  errorText: feedbackStore.isVaildName
                                      ? null
                                      : feedbackStore.validateName(),
                                ));
                          },
                        )
                      ],
                    ),
                  ),
                  Step(
                    isActive: true,
                    title: Text("Statisfaction"),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("How do you like our servies?"),
                        Observer(
                          builder: (BuildContext context) {
                            return Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.solidStar,
                                    color: (feedbackStore.star >= 1 &&
                                            feedbackStore.star > 0)
                                        ? Colors.red
                                        : Colors.black12,
                                    size: 15.0,
                                  ),
                                  onPressed: () {
                                    if (feedbackStore.star < 1) {
                                      feedbackStore.changeStartest(1);
                                    } else {
                                      feedbackStore.changeStartest(0);
                                    }
                                    ;
                                  },
                                ),
                                IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.solidStar,
                                    color: (feedbackStore.star >= 2 &&
                                            feedbackStore.star > 0)
                                        ? Colors.red
                                        : Colors.black12,
                                    size: 15.0,
                                  ),
                                  onPressed: () {
                                    if (feedbackStore.star < 2) {
                                      feedbackStore.changeStartest(2);
                                    } else {
                                      feedbackStore.changeStartest(1);
                                    }
                                    ;
                                  },
                                ),
                                IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.solidStar,
                                    color: (feedbackStore.star >= 3 &&
                                            feedbackStore.star > 0)
                                        ? Colors.red
                                        : Colors.black12,
                                    size: 15.0,
                                  ),
                                  onPressed: () {
                                    if (feedbackStore.star < 3) {
                                      feedbackStore.changeStartest(3);
                                    } else {
                                      feedbackStore.changeStartest(2);
                                    }
                                    ;
                                  },
                                ),
                                IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.solidStar,
                                    color: (feedbackStore.star >= 4 &&
                                            feedbackStore.star > 0)
                                        ? Colors.red
                                        : Colors.black12,
                                    size: 15.0,
                                  ),
                                  onPressed: () {
                                    if (feedbackStore.star < 4) {
                                      feedbackStore.changeStartest(4);
                                    } else {
                                      feedbackStore.changeStartest(3);
                                    }
                                    ;
                                  },
                                ),
                                IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.solidStar,
                                    color: (feedbackStore.star >= 5 &&
                                            feedbackStore.star > 0)
                                        ? Colors.red
                                        : Colors.black12,
                                    size: 15.0,
                                  ),
                                  onPressed: () {
                                    if (feedbackStore.star < 5) {
                                      feedbackStore.changeStartest(5);
                                    } else {
                                      feedbackStore.changeStartest(4);
                                    }
                                    ;
                                  },
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Step(
                    title: Text("Best package"),
                    content: Column(
                      children: <Widget>[
                        Text("What package do you like most?"),
                        DropDownField(
                          required: false,
                          items: listPackages,
                          enabled: true,
                          hintText: "Choose ",
                          strict: true,
                          onValueChanged: (val) {
                            print(val);
                            feedbackStore.changeOption(val);
                          },
                        )
                      ],
                    ),
                    isActive: true,
                  ),
                  Step(
                    title: Text("Community connection"),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            "Will you introduce our services to your friends?"),
                        Observer(
                          builder: (BuildContext context) {
                            return Row(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: feedbackStore.checkbox,
                                      onChanged: (val) {
                                        feedbackStore.changeCheckbox(val);
                                      },
                                    ),
                                    Text("yes")
                                  ],
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Row(children: <Widget>[
                                  Checkbox(
                                    value: !feedbackStore.checkbox,
                                    onChanged: (val) {
                                      feedbackStore.changeCheckbox(!val);
                                    },
                                  ),
                                  Text("no")
                                ]),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                    isActive: true,
                  ),
                  Step(
                    title: Text("Recommendation"),
                    content: TextField(
                        controller: controllerNote,
                        decoration: InputDecoration(
                          labelText: "note",
                        )),
                    isActive: true,
                  ),
                ],
                currentStep: feedbackStore.currentStep,
                type: StepperType.vertical,
                onStepContinue: next,
                onStepCancel: cancel,
                onStepTapped: (step) => goTo(step),
              ),
            ],
          ),
        ));
  }
}
