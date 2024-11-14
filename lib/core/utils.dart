import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import 'models/inc_exp.dart';
import 'models/profile.dart';

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String formatNumber(int number) {
  return '\$ ${NumberFormat('#,###').format(number).replaceAll(',', ' ')}';
}

double getStatusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

String boxName = 'incexpgbox';
String keyName = 'incexpList';
List<IncExp> incexpList = [];
bool onboard = true;
Profile profile = Profile(
  name: '',
  email: '',
  username: '',
  image: '',
);

Future<void> getData() async {
  await SharedPreferences.getInstance().then((prefs) async {
    // await prefs.remove('onboard');
    // await prefs.clear();
    onboard = prefs.getBool('onboard') ?? true;
    profile.name = prefs.getString('profileName') ?? '';
    profile.email = prefs.getString('profileEmail') ?? '';
    profile.username = prefs.getString('profileUsername') ?? '';
    profile.image = prefs.getString('profileImage') ?? '';
  });
}

Future<void> saveOnboard() async {
  await SharedPreferences.getInstance().then((prefs) {
    prefs.setBool('onboard', false);
  });
}

Future<void> saveProfile(Profile model) async {
  await SharedPreferences.getInstance().then((prefs) {
    profile = model;
    prefs.setString('profileName', model.name);
    prefs.setString('profileEmail', model.email);
    prefs.setString('profileUsername', model.username);
    prefs.setString('profileImage', model.image);
  });
}

Future<void> initDB() async {
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk(boxName);
  Hive.registerAdapter(IncExpAdapter());
  await getData();
}

Future<void> getModels() async {
  final box = await Hive.openBox(boxName);
  List data = box.get(keyName) ?? [];
  incexpList = data.cast<IncExp>();
}

Future<void> updateModels() async {
  final box = await Hive.openBox(boxName);
  box.put(keyName, incexpList);
  incexpList = await box.get(keyName);
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
