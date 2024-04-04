import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet/controllers/cubit/card_cubit.dart';
import 'package:wallet/controllers/cubit/contact_cubit.dart';
import 'package:wallet/controllers/cubit/document_cubit.dart';
import 'package:wallet/pages/bottom_navigation_bar_page.dart';
import 'package:wallet/pages/card_pages/add_card_page.dart';
import 'package:wallet/pages/card_pages/card_page.dart';
import 'package:wallet/pages/document_pages/document_add_page.dart';
import 'package:wallet/pages/document_pages/document_page.dart';
import 'package:wallet/pages/document_pages/document_shablon_page.dart';
import 'package:wallet/pages/document_pages/passport_view_page.dart';
import 'package:wallet/pages/document_pages/polis_oms_page.dart';
import 'package:wallet/pages/document_pages/snils_view_page.dart';
import 'package:wallet/pages/visit_card_page/visit_add_card_page.dart';
import 'package:wallet/pages/visit_card_page/visit_card_page.dart';
import 'package:wallet/pages/visit_card_page/visit_card_view_page.dart';
import 'package:wallet/pages/welcome_pages.dart/first_welcome_page.dart';
import 'package:wallet/pages/welcome_pages.dart/second_welcome_page.dart';
import 'package:wallet/pages/welcome_pages.dart/third_welcome_page.dart';
import 'package:dcdg/dcdg.dart';
import 'pages/block_screen.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String pin = await loadSavedText();
  runApp(MainApp(
    pin: pin,
  ));
}

Future<String> loadSavedText() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('pin') ?? '';
}

class MainApp extends StatelessWidget {
  final String pin;
  const MainApp({super.key, required this.pin});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CardCubit(),
        ),
        BlocProvider(
          create: (context) => DocumentCubit(),
        ),
        BlocProvider(
          create: (context) => ContactCubit(),
        ),
      ],
      child: MaterialApp(
          //   debugShowCheckedModeBanner: false, home: PolisOMSPage()),
          debugShowCheckedModeBanner: false,
          home: pin == "" ? FirstWelcomePage() : PinInputPage(isSave: false)),
    );
  }
}
