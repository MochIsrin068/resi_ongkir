import 'package:check_receipt/bloc/chargeCodeBLoc.dart';
import 'package:check_receipt/bloc/cityBloc.dart';
import 'package:check_receipt/bloc/provinceBloc.dart';
import 'package:check_receipt/bloc/receiptCodeBloc.dart';
import 'package:check_receipt/bloc/resultsCodeSub.dart';
import 'package:check_receipt/bloc/subBloc.dart';
import 'package:check_receipt/ui/splashScreen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<ReceiptCodeBloc>(
          create: (context) => ReceiptCodeBloc(),
        ),
        BlocProvider<ChargeCodeBloc>(
          create: (context) => ChargeCodeBloc(),
        ),
        BlocProvider<ProvinceBloc>(
          create: (context) => ProvinceBloc(),
        ),
        BlocProvider<CityBloc>(
          create: (context) => CityBloc(),
        ),
        BlocProvider<SubBloc>(
          create: (context) => SubBloc(),
        ),
        BlocProvider<ResultCodeSub>(
          create: (context) => ResultCodeSub(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplahScreen(),
        theme: ThemeData(
            fontFamily: 'SanFrancisco',
            primaryColor: Colors.blueAccent,
            scaffoldBackgroundColor: Colors.white),
      ),
    );
  }
}
