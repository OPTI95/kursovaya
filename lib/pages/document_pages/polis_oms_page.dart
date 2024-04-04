import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wallet/controllers/cubit/document_cubit.dart';

class PolisOMSPage extends StatelessWidget {
  const PolisOMSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 198, 198),
      appBar: AppBar(
        title: Text("Полис ОМС"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 350,
              child: Card(
                clipBehavior: Clip.hardEdge,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: const Color.fromARGB(255, 222, 222, 222),
                      height: 50,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "ПОЛИС",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 126, 126, 126),
                            ),
                          ),
                          Text(
                            "ОБЯЗАТЕЛЬНОГО МЕЖДУ СТРАХОВАНИЯ",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 126, 126, 126),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      (context.read<DocumentCubit>().state
                                              as DocumentLoaded)
                                          .list[0]
                                          .polisOMS,
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 118, 118, 118),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Фамилия",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 109, 109, 109),
                                      fontSize: 14),
                                ),
                                Text(
                                  (context.read<DocumentCubit>().state
                                          as DocumentLoaded)
                                      .list[0]
                                      .secondName
                                      .toString()
                                      .toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                Text(
                                  "Имя",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 109, 109, 109),
                                      fontSize: 14),
                                ),
                                Text(
                                  (context.read<DocumentCubit>().state
                                          as DocumentLoaded)
                                      .list[0]
                                      .firstName
                                      .toString()
                                      .toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                Text(
                                  "Отечество",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 109, 109, 109),
                                      fontSize: 14),
                                ),
                                Text(
                                  (context.read<DocumentCubit>().state
                                          as DocumentLoaded)
                                      .list[0]
                                      .thirdName
                                      .toString()
                                      .toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Дата рождения",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 109, 109, 109),
                                              fontSize: 14),
                                        ),
                                        Text(
                                          DateFormat('dd.MM.yyyy')
                                              .format((context
                                                      .read<DocumentCubit>()
                                                      .state as DocumentLoaded)
                                                  .list[0]
                                                  .dateBorn)
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Пол",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 109, 109, 109),
                                              fontSize: 14),
                                        ),
                                        Text(
                                          (context.read<DocumentCubit>().state
                                                          as DocumentLoaded)
                                                      .list[0]
                                                      .gender
                                                      .toString()
                                                      .toUpperCase() ==
                                                  "MALE"
                                              ? "МУЖСКОЙ"
                                              : "ЖЕНСКИЙ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Spacer()
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            "images/gerb.png",
                            width: 100,
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
