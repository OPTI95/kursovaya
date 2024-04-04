import 'dart:io';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wallet/controllers/cubit/document_cubit.dart';
import 'package:wallet/controllers/validator.dart';
import 'package:wallet/controllers/wallet_bd.dart';
import 'package:wallet/pages/bottom_navigation_bar_page.dart';
import 'package:wallet/pages/card_pages/card_page.dart';
import 'package:intl/intl.dart';
import 'package:wallet/pages/document_pages/document_page.dart';

class DocumentAddPage extends StatefulWidget {
  DocumentAddPage({super.key});

  @override
  State<DocumentAddPage> createState() => _DocumentAddPageState();
}

class _DocumentAddPageState extends State<DocumentAddPage> {
  final TextEditingController secondName = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController thirdName = TextEditingController();
  final TextEditingController snils = TextEditingController();
  final TextEditingController inn = TextEditingController();
  final TextEditingController polisOMS = TextEditingController();
  final TextEditingController numberPassport = TextEditingController();
  final TextEditingController seriaPassport = TextEditingController();
  final TextEditingController snilsPassport = TextEditingController();
  final TextEditingController fromIssues = TextEditingController();
  final TextEditingController codePassport = TextEditingController();
  final TextEditingController placeBorn = TextEditingController();
  String selectedGender = '';
  DateTime selectedDateBorn = DateTime.now();
  DateTime selectedDateExit = DateTime.now();

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
                      'Добавление личной информации',
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
                controller: thirdName,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Отчество",
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
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 198, 171, 249),
                      ),
                    ),
                    child: Text(
                      'Выбрать дату рождения',
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Дата: ${DateFormat('dd.MM.yyyy').format(selectedDateBorn)}',
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RadioListTile(
                    title: Text('Мужской'),
                    value: 'male',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Женский'),
                    value: 'female',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value.toString();
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: placeBorn,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Место рождения",
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
                controller: snils,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                maxLength: 11,
                decoration: InputDecoration(
                  hintText: "СНИЛС",
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
                controller: inn,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                maxLength: 12,
                decoration: InputDecoration(
                  hintText: "ИНН",
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
                controller: polisOMS,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                maxLength: 16,
                decoration: InputDecoration(
                  hintText: "ПОЛИС ОМС",
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
                controller: numberPassport,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                maxLength: 4,
                decoration: InputDecoration(
                  hintText: "Номер паспорта",
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
                controller: seriaPassport,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                maxLength: 6,
                decoration: InputDecoration(
                  hintText: "Серия паспорта",
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
                controller: fromIssues,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Кем выдан",
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
                controller: codePassport,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Код подразделения",
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
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => _selectDateExit(context),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 198, 171, 249),
                      ),
                    ),
                    child: Text(
                      'Выбрать дату выдачи',
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Дата: ${DateFormat('dd.MM.yyyy').format(selectedDateExit)}',
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      PersonData personData = PersonData(
                        id: null,
                        secondName: secondName.text,
                        firstName: firstName.text,
                        thirdName: thirdName.text,
                        snils: snils.text,
                        inn: inn.text,
                        polisOMS: polisOMS.text,
                        numberPassport: numberPassport.text,
                        seriaPassport: seriaPassport.text,
                        snilsPassport: snilsPassport.text,
                        fromIssues: fromIssues.text,
                        codePassport: codePassport.text,
                        placeBorn: placeBorn.text,
                        gender: selectedGender,
                        dateBorn: selectedDateBorn,
                        dateExit: selectedDateExit,
                      );

                      if (DataValidator.validate(personData)) {
                        context.read<DocumentCubit>().addDocument(personData);
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.topToBottom,
                            child: BottomNavigationBarPage(),
                          ),
                        );
                      } else {
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
                      }
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 50, 43, 85)),
                    ),
                    child: Text(
                      "Добавить информацию",
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateBorn,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDateBorn) {
      setState(() {
        selectedDateBorn = picked;
      });
    }
  }

  Future<void> _selectDateExit(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateExit,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDateExit) {
      setState(() {
        selectedDateExit = picked;
      });
    }
  }
}
