import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class ResultCodeSub extends Bloc<String, String> with ChangeNotifier {
  String myValue = "Not Results";
  String get valueOption => myValue;

  set valueOption(String newValue) {
    myValue = newValue;
    notifyListeners();
  }

  @override
  String get initialState => "Not Results";

  @override
  Stream<String> mapEventToState(String event) async* {
    yield event;
  }
}
