import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wallet/controllers/cubit/document_cubit.dart';
import 'package:wallet/controllers/wallet_bd.dart';
import 'package:wallet/controllers/cubit/card_cubit.dart';
import 'package:wallet/pages/card_pages/add_card_page.dart';
import 'package:wallet/pages/card_pages/view_card_page.dart';
import 'package:wallet/pages/document_pages/document_add_page.dart';
import 'package:wallet/pages/document_pages/document_edit_page.dart';
import 'package:wallet/pages/document_pages/document_shablon_page.dart';
import 'package:wallet/pages/welcome_pages.dart/second_welcome_page.dart';
import 'package:wallet/pages/welcome_pages.dart/third_welcome_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocumentPage extends StatefulWidget {
  DocumentPage({super.key});
  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    context.read<DocumentCubit>().selectDocument();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 198, 198),
      body: SafeArea(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Документы',
                  style: GoogleFonts.gabriela(
                    color: Color.fromARGB(255, 50, 43, 85),
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                  ),
                ),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    if (context.read<DocumentCubit>().state is DocumentLoaded) {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.topToBottom,
                          child: DocumentEditPage(),
                        ),
                      );
                    }
                  },
                  icon: Icon(Icons.edit))
            ],
          ),
          BlocBuilder<DocumentCubit, DocumentState>(
            builder: (context, state) {
              if (state is DocumentEmpty) {
                return Expanded(
                  child: Column(
                    children: [
                      Center(
                          child: Text(
                        "Добавьте документ",
                        style: GoogleFonts.gabriela(
                          color: Color.fromARGB(255, 50, 43, 85),
                          fontWeight: FontWeight.w900,
                          fontSize: 25,
                        ),
                      )),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SizedBox(
                          height: 60,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: DocumentAddPage(),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 50, 43, 85)),
                              ),
                              child: Text(
                                "Добавить документ",
                                style: GoogleFonts.gabriela(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is DocumentLoaded) {
                return DocumentShablonPage();
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          SizedBox(
            height: 25,
          ),
        ]),
      ),
    );
  }
}
