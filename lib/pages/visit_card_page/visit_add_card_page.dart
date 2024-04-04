import 'dart:io';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wallet/controllers/cubit/contact_cubit.dart';
import 'package:wallet/controllers/cubit/document_cubit.dart';
import 'package:wallet/controllers/wallet_bd.dart';
import 'package:wallet/pages/bottom_navigation_bar_page.dart';
import 'package:wallet/pages/card_pages/card_page.dart';
import 'package:intl/intl.dart';
import 'package:wallet/pages/document_pages/document_page.dart';
import 'package:wallet/pages/visit_card_page/visit_card_page.dart';

class VisitCardAddPage extends StatefulWidget {
  VisitCardAddPage({super.key});

  @override
  State<VisitCardAddPage> createState() => _VisitCardAddPageState();
}

class _VisitCardAddPageState extends State<VisitCardAddPage> {
  final TextEditingController secondName =
      TextEditingController(text: "Амерханов");
  final TextEditingController firstName = TextEditingController(text: "Апти");
  final TextEditingController position =
      TextEditingController(text: "Архитектор");
  final TextEditingController companyName =
      TextEditingController(text: "СтройДом");
  final TextEditingController phoneNumber =
      TextEditingController(text: "79380181638");
  final TextEditingController email =
      TextEditingController(text: "95killboy95@gmail.com");
  final TextEditingController website =
      TextEditingController(text: "https://stroydom.moscow/");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 198, 198),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back)),
                    Text(
                      'Добавление визитной карточки',
                      style: GoogleFonts.gabriela(
                        color: const Color.fromARGB(255, 50, 43, 85),
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: secondName,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Фамилия",
                  hintStyle: const TextStyle(color: Colors.white70),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  fillColor: const Color.fromARGB(150, 198, 171, 249),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: firstName,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Имя",
                  hintStyle: const TextStyle(color: Colors.white70),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  fillColor: const Color.fromARGB(150, 198, 171, 249),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: position,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Должность",
                  hintStyle: const TextStyle(color: Colors.white70),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  fillColor: const Color.fromARGB(150, 198, 171, 249),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: companyName,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Название компании",
                  hintStyle: const TextStyle(color: Colors.white70),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  fillColor: const Color.fromARGB(150, 198, 171, 249),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: phoneNumber,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                maxLength: 11,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Номер телефона",
                  hintStyle: const TextStyle(color: Colors.white70),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  fillColor: const Color.fromARGB(150, 198, 171, 249),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: email,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Почта",
                  hintStyle: const TextStyle(color: Colors.white70),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  fillColor: const Color.fromARGB(150, 198, 171, 249),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: website,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                maxLength: 24,
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                  hintText: "Сайт",
                  hintStyle: const TextStyle(color: Colors.white70),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  fillColor: const Color.fromARGB(150, 198, 171, 249),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Проверка на пустые данные перед добавлением контакта
                      if (firstName.text.isEmpty ||
                          secondName.text.isEmpty ||
                          position.text.isEmpty ||
                          companyName.text.isEmpty ||
                          phoneNumber.text.isEmpty ||
                          email.text.isEmpty ||
                          website.text.isEmpty) {
                        // Ошибка: Пустые данные добавления контакта
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Ошибка"),
                            content: Text("Пожалуйста, заполните все поля."),
                            actions: [
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("OK"),
                              ),
                            ],
                          ),
                        );
                      } else {
                        await context
                            .read<ContactCubit>()
                            .addContact(ContactData(
                              id: null,
                              firstName: firstName.text,
                              lastName: secondName.text,
                              position: position.text,
                              companyName: companyName.text,
                              phoneNumber: phoneNumber.text,
                              email: email.text,
                              website: website.text,
                            ));
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.topToBottom,
                            child: BottomNavigationBarPage(),
                          ),
                        );
                      }
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 50, 43, 85)),
                    ),
                    child: Text(
                      "Добавить визитную карту",
                      style: GoogleFonts.gabriela(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
