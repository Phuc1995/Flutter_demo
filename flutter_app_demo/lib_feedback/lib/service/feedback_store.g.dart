// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedbackStore on _FeedbackStore, Store {
  Computed<bool> _$isVaildComputed;

  @override
  bool get isVaild =>
      (_$isVaildComputed ??= Computed<bool>(() => super.isVaild)).value;

  final _$starAtom = Atom(name: '_FeedbackStore.star');

  @override
  int get star {
    _$starAtom.context.enforceReadPolicy(_$starAtom);
    _$starAtom.reportObserved();
    return super.star;
  }

  @override
  set star(int value) {
    _$starAtom.context.conditionallyRunInAction(() {
      super.star = value;
      _$starAtom.reportChanged();
    }, _$starAtom, name: '${_$starAtom.name}_set');
  }

  final _$checkboxAtom = Atom(name: '_FeedbackStore.checkbox');

  @override
  bool get checkbox {
    _$checkboxAtom.context.enforceReadPolicy(_$checkboxAtom);
    _$checkboxAtom.reportObserved();
    return super.checkbox;
  }

  @override
  set checkbox(bool value) {
    _$checkboxAtom.context.conditionallyRunInAction(() {
      super.checkbox = value;
      _$checkboxAtom.reportChanged();
    }, _$checkboxAtom, name: '${_$checkboxAtom.name}_set');
  }

  final _$noteAtom = Atom(name: '_FeedbackStore.note');

  @override
  String get note {
    _$noteAtom.context.enforceReadPolicy(_$noteAtom);
    _$noteAtom.reportObserved();
    return super.note;
  }

  @override
  set note(String value) {
    _$noteAtom.context.conditionallyRunInAction(() {
      super.note = value;
      _$noteAtom.reportChanged();
    }, _$noteAtom, name: '${_$noteAtom.name}_set');
  }

  final _$currentStepAtom = Atom(name: '_FeedbackStore.currentStep');

  @override
  int get currentStep {
    _$currentStepAtom.context.enforceReadPolicy(_$currentStepAtom);
    _$currentStepAtom.reportObserved();
    return super.currentStep;
  }

  @override
  set currentStep(int value) {
    _$currentStepAtom.context.conditionallyRunInAction(() {
      super.currentStep = value;
      _$currentStepAtom.reportChanged();
    }, _$currentStepAtom, name: '${_$currentStepAtom.name}_set');
  }

  final _$_FeedbackStoreActionController =
      ActionController(name: '_FeedbackStore');

  @override
  dynamic changeNote(String newNote) {
    final _$actionInfo = _$_FeedbackStoreActionController.startAction();
    try {
      return super.changeNote(newNote);
    } finally {
      _$_FeedbackStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCheckbox(bool val) {
    final _$actionInfo = _$_FeedbackStoreActionController.startAction();
    try {
      return super.changeCheckbox(val);
    } finally {
      _$_FeedbackStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeStartest(int i) {
    final _$actionInfo = _$_FeedbackStoreActionController.startAction();
    try {
      return super.changeStartest(i);
    } finally {
      _$_FeedbackStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCurrentStep(int step) {
    final _$actionInfo = _$_FeedbackStoreActionController.startAction();
    try {
      return super.changeCurrentStep(step);
    } finally {
      _$_FeedbackStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeName(String name) {
    final _$actionInfo = _$_FeedbackStoreActionController.startAction();
    try {
      return super.changeName(name);
    } finally {
      _$_FeedbackStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeStar(int star) {
    final _$actionInfo = _$_FeedbackStoreActionController.startAction();
    try {
      return super.changeStar(star);
    } finally {
      _$_FeedbackStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeMail(String mail) {
    final _$actionInfo = _$_FeedbackStoreActionController.startAction();
    try {
      return super.changeMail(mail);
    } finally {
      _$_FeedbackStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'star: ${star.toString()},checkbox: ${checkbox.toString()},note: ${note.toString()},currentStep: ${currentStep.toString()},isVaild: ${isVaild.toString()}';
    return '{$string}';
  }
}
