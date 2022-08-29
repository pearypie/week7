import 'package:calcurator/imports.dart';
import 'package:calcurator/model/historyitem.dart';
import 'package:calcurator/provider/calculator_provider.dart';
import 'package:calcurator/screens/calculator.dart';
import 'package:calcurator/screens/history.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HistoryItemAdapter());
  await Hive.openBox<HistoryItem>('history');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculatorProvider>(
      create: (_) => CalculatorProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          brightness: Brightness.dark,
          accentColor: yellowColor,
          appBarTheme: AppBarTheme(
            color: backgroundColor,
            elevation: 0.0,
          ),
          textTheme: TextTheme(
            headline3: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            caption: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFFFCE2DB),
              fontSize: 18.0,
            ),
          ),
        ),
        routes: {
          '/': (context) => Calculator(),
          '/history': (context) => History(),
        },
      ),
    );
  }
}
