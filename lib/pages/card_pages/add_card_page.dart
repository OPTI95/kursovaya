import 'dart:io';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wallet/controllers/wallet_bd.dart';
import 'package:wallet/pages/bottom_navigation_bar_page.dart';
import 'package:wallet/pages/card_pages/card_page.dart';

class AddCardPage extends StatefulWidget {
  AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final TextEditingController nameCard = TextEditingController();
  final TextEditingController barcode = TextEditingController();
  final TextEditingController cvcCode = TextEditingController();
  final TextEditingController numberCode = TextEditingController();
  String _scanBarcode = '';

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      barcode.text = barcodeScanRes;
      _scanBarcode = barcodeScanRes;
    });
  }

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
                      'Добавление дисконтной карты',
                      style: GoogleFonts.gabriela(
                        color: const Color.fromARGB(255, 50, 43, 85),
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: nameCard,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Название карты",
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
                  Expanded(
                    child: TextField(
                      controller: barcode,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      maxLines: 1,
                      onChanged: (val) {
                        _scanBarcode = val;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintText: "Штрих код",
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
                  ),
                  IconButton(
                      onPressed: () async {
                        await scanBarcodeNormal();
                      },
                      icon: const Icon(Icons.qr_code_scanner))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: numberCode,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Номер карты*",
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
                controller: cvcCode,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                maxLength: 3,
                decoration: InputDecoration(
                  hintText: "Код CVC*",
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
              _scanBarcode == ''
                  ? Container()
                  : Column(
                      children: [
                        BarcodeWidget(
                          barcode: Barcode.code128(),
                          data: _scanBarcode,
                          width: 200,
                          height: 100,
                          color: Colors.black,
                          drawText: true,
                          style: const TextStyle(fontSize: 16),
                        ),
                        BarcodeWidget(
                          barcode: Barcode.qrCode(),
                          data: _scanBarcode,
                          width: 200,
                          height: 100,
                          color: Colors.black,
                          drawText: true,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (nameCard.text.isEmpty ||
                          barcode.text.isEmpty ||
                          cvcCode.text.isEmpty ||
                          numberCode.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Ошибка, пустые данные добавления карты"),
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
                        final database = WalletDatabase();
                        final card = CardData(
                          name: nameCard.text,
                          barcode: barcode.text,
                          cvcCode: cvcCode.text,
                          cardNumber: numberCode.text,
                        );
                        await database.insertCard(card);
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
                      "Добавить карту",
                      style: GoogleFonts.gabriela(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
