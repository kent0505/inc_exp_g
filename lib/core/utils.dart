import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import 'models/inc_exp.dart';

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String timestampToString(int timestamp) {
  // timestamp to 22.06.2000
  try {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('dd.MM.yyyy').format(date);
  } catch (e) {
    return 'Error';
  }
}

String dateToString(DateTime date) {
  // DateTime to 22.06.2000
  try {
    return DateFormat('dd.MM.yyyy').format(date);
  } catch (e) {
    return 'Error';
  }
}

String timeToString(DateTime time) {
  // DateTime to 22:00
  try {
    return DateFormat('HH:mm').format(time);
  } catch (e) {
    return 'Error';
  }
}

DateTime stringToDate(String date) {
  // 22.06.2000 to DateTime
  try {
    return DateFormat('dd.MM.yyyy').parse(date);
  } catch (e) {
    return DateTime.now();
  }
}

String formatNumber(int number) {
  return NumberFormat('#,###').format(number);
}

double getStatusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

double getBottom(BuildContext context) {
  return MediaQuery.of(context).viewPadding.bottom;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

void logger(Object message) {
  try {
    developer.log(message.toString());
  } catch (e) {
    debugPrint(e.toString());
  }
}

String boxName = 'incexpgbox';
String keyName = 'incexpList';
List<IncExp> incexpList = [];
bool onboard = true;

Future<void> getData() async {
  try {
    await SharedPreferences.getInstance().then((prefs) {
      // await prefs.remove('onboard');
      // await prefs.clear();
      onboard = prefs.getBool('onboard') ?? true;
    });
  } catch (e) {
    logger(e);
  }
}

Future<void> saveOnboard() async {
  try {
    await SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('onboard', false);
    });
  } catch (e) {
    logger(e);
  }
}

Future<void> initDB() async {
  try {
    await Hive.initFlutter();
    // await Hive.deleteBoxFromDisk(boxName);
    Hive.registerAdapter(IncExpAdapter());
    await getData();
  } catch (e) {
    logger(e);
  }
}

Future<void> getModels() async {
  try {
    final box = await Hive.openBox(boxName);
    List data = box.get(keyName) ?? [];
    incexpList = data.cast<IncExp>();
    logger(incexpList.length);
  } catch (e) {
    logger(e);
  }
}

Future<void> updateModels() async {
  try {
    final box = await Hive.openBox(boxName);
    box.put(keyName, incexpList);
    incexpList = await box.get(keyName);
  } catch (e) {
    logger(e);
  }
}

String getCategoryAsset(String cat) {
  if (cat == 'Investment') return 'assets/cat1.svg';
  if (cat == 'Food') return 'assets/cat2.svg';
  if (cat == 'Transport') return 'assets/cat3.svg';
  if (cat == 'Procurement') return 'assets/cat4.svg';
  if (cat == 'Rest') return 'assets/cat5.svg';
  if (cat == 'Passive') return 'assets/cat6.svg';
  if (cat == 'Salary') return 'assets/cat7.svg';
  if (cat == 'Rent') return 'assets/cat8.svg';
  if (cat == 'Business') return 'assets/cat9.svg';
  if (cat == 'Freelance') return 'assets/cat10.svg';
  if (cat == 'Investment ') return 'assets/cat11.svg';
  if (cat == 'Dividends') return 'assets/cat12.svg';
  if (cat == 'Royalty') return 'assets/cat13.svg';
  return 'assets/cat1.svg';
}

List<String> getCategories(bool isIncome) {
  return isIncome
      ? [
          'Passive',
          'Salary',
          'Rent',
          'Business',
          'Freelance',
          'Investment ',
          'Dividends',
          'Royalty',
        ]
      : [
          'Investment',
          'Food',
          'Transport',
          'Procurement',
          'Rest',
        ];
}
