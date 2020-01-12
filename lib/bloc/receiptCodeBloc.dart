import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class ReceiptCodeBloc extends Bloc<String, String> with ChangeNotifier {
  String myValue = "jne";
  String get valueOption => myValue;

  set valueOption(String newValue) {
    myValue = newValue;
    notifyListeners();
  }

  @override
  String get initialState => "jne";

  @override
  Stream<String> mapEventToState(String event) async* {
    yield event;
  }
}
