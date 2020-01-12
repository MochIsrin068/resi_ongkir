import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class CityBloc extends Bloc<String, String> with ChangeNotifier {
  String myValue = "1";
  String get valueOption => myValue;

  set valueOption(String newValue) {
    myValue = newValue;
    notifyListeners();
  }

  @override
  String get initialState => "1";

  @override
  Stream<String> mapEventToState(String event) async* {
    yield event;
  }
}
