import 'package:lib_feedback/model/feedback_model.dart';
import 'package:mobx/mobx.dart';
part 'feedback_store.g.dart';

class FeedbackStore = _FeedbackStore with _$FeedbackStore;

abstract class _FeedbackStore with Store {

  FeedbackModel feedbackModel;

  _FeedbackStore({this.feedbackModel, this.star});

  @observable
  int star ;

  @observable
  bool checkbox;

  @observable
  String note;

  @action
  changeNote(String newNote){
    note = newNote;
    feedbackModel.note = newNote;
  }

  @action
  changeCheckbox(bool val){
    checkbox = val;
    feedbackModel.check = val;
  }

  @action
  changeStartest(int i){
    star = i;
    feedbackModel.numberStar = i;
  }

  @observable
  int currentStep;

  @action
  changeCurrentStep(int  step) {
    currentStep = step;
  }

  @action
  changeName(String name) {
    feedbackModel.name = name;
  }

  @action
  changeStar(int star) {
    feedbackModel.numberStar = star;
    print(feedbackModel.numberStar);
  }

  @action
  changeMail(String mail) {
    feedbackModel.mail = mail;
  }

  @computed
  bool get isVaild {
    return validateName() == null && validateMail() == null;
  }

  bool get isVaildName {
    return validateName() == null;
  }

  bool get isVaildMail {
    return validateMail() == null;
  }

  String validateName() {
    if (feedbackModel.name == null || feedbackModel.name == "") {
      return "Can not be blank ";
    }
    return null;
  }

  String validateMail() {
    if (feedbackModel.mail == null || feedbackModel.mail == "") {
      return "Can not be blank ";
    }
    return null;
  }

  changeOption(String option){
    feedbackModel.option = option;
  }

}
