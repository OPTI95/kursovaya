import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/controllers/cubit/document_cubit.dart';
import 'package:intl/intl.dart';

class PassportViewPage extends StatelessWidget {
  final int index;
  const PassportViewPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final state = context.read<DocumentCubit>().state as DocumentLoaded;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 198, 198),
      appBar: AppBar(
        title: Text("Паспорт РФ"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "РОССИЙСКАЯ ФЕДЕРАЦИЯ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                          height: 250,
                          width: double.infinity,
                          child: Card(
                            margin: EdgeInsets.all(0),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 25.0, left: 25, right: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Кем выдан",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 109, 109, 109),
                                        fontSize: 14),
                                  ),
                                  Text(
                                    state.list[index].fromIssues.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Дата выдачи",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 109, 109, 109),
                                                fontSize: 14),
                                          ),
                                          Text(
                                            DateFormat('dd.MM.yyyy')
                                                .format(state.list[index].dateExit)
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 16),
                                          )
                                        ],
                                      )),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Код подразделения",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 109, 109, 109),
                                                fontSize: 14),
                                          ),
                                          Text(
                                            state.list[index].codePassport
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 16),
                                          )
                                        ],
                                      ))
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        state.list[index].numberPassport,
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        state.list[index].seriaPassport,
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      Image.asset(
                                        "images/gerb.png",
                                        width: 70,
                                        height: 70,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Diveders(),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Diveders()
                                ],
                              ),
                            ),
                          )),
                      SizedBox(
                          height: 250,
                          width: double.infinity,
                          child: Card(
                            margin: EdgeInsets.all(0),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 25.0, left: 25, right: 25),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Diveders(),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Diveders(),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 125,
                                            height: 165,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    image: AssetImage(state
                                                                .list[index].gender
                                                                .toString()
                                                                .toUpperCase() ==
                                                            "MALE"
                                                        ? "images/man.png"
                                                        : "images/woman.png")),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: const Color.fromARGB(
                                                    255, 213, 213, 213)),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "ФИО",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 109, 109, 109),
                                                      fontSize: 12),
                                                ),
                                                Wrap(children: [
                                                  Text(
                                                    state.list[index].secondName
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    state.list[index].firstName
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    state.list[index].thirdName
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14),
                                                  ),
                                                ]),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Пол",
                                                          style: TextStyle(
                                                              color: Color.fromARGB(
                                                                  255,
                                                                  109,
                                                                  109,
                                                                  109),
                                                              fontSize: 12),
                                                        ),
                                                        Text(
                                                          state.list[index].gender
                                                                      .toString()
                                                                      .toUpperCase() ==
                                                                  "MALE"
                                                              ? "МУЖСКОЙ"
                                                              : "ЖЕНСКИЙ",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 14),
                                                        ),
                                                      ],
                                                    ),
                                                    Spacer(),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Дата рождения",
                                                          style: TextStyle(
                                                              color: Color.fromARGB(
                                                                  255,
                                                                  109,
                                                                  109,
                                                                  109),
                                                              fontSize: 12),
                                                        ),
                                                        Text(
                                                          DateFormat('dd.MM.yyyy')
                                                              .format(state
                                                                  .list[index]
                                                                  .dateBorn)
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 14),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Место рождения",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 109, 109, 109),
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  state.list[index].placeBorn
                                                      .toString()
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ])),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}

class Diveders extends StatelessWidget {
  const Diveders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          color: Colors.red,
          height: 1,
        )),
        SizedBox(
          width: 5,
          height: 1,
        ),
        Expanded(
            child: Divider(
          height: 1,
          color: Colors.red,
        )),
        SizedBox(
          height: 1,
          width: 5,
        ),
        Expanded(
            child: Divider(
          height: 1,
          color: Colors.red,
        )),
        SizedBox(
          height: 1,
          width: 5,
        ),
        Expanded(
            child: Divider(
          height: 1,
          color: Colors.red,
        )),
        SizedBox(
          width: 5,
          height: 1,
        ),
        Expanded(
            child: Divider(
          height: 1,
          color: Colors.red,
        )),
        SizedBox(
          width: 5,
          height: 1,
        ),
        Expanded(
            child: Divider(
          height: 1,
          color: Colors.red,
        )),
        SizedBox(
          width: 5,
        ),
        Expanded(
            child: Divider(
          height: 1,
          color: Colors.red,
        )),
        SizedBox(
          width: 5,
        ),
        Expanded(
            child: Divider(
          height: 1,
          color: Colors.red,
        )),
        SizedBox(
          width: 5,
        ),
        Expanded(
            child: Divider(
          height: 1,
          color: Colors.red,
        )),
      ],
    );
  }
}
