import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wallet/controllers/cubit/document_cubit.dart';
import 'package:wallet/controllers/wallet_bd.dart';

class InnViewPage extends StatelessWidget {
  const InnViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 198, 198),
      appBar: AppBar(
        title: Text("ИНН"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: ListView(
          children: [
            SizedBox(
              height: 280,
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
                            "СВИДЕТЕЛЬСТВО",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 126, 126, 126),
                            ),
                          ),
                          Text(
                            "О ПОСТАНОВКЕ НА УЧЕТ В НАЛОГОВОМ ОРГАНЕ",
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (context.read<DocumentCubit>().state
                                    as DocumentLoaded)
                                .list[0]
                                .inn,
                            style: TextStyle(
                                color: Color.fromARGB(255, 118, 118, 118),
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "ФИО",
                            style: TextStyle(
                                color: Color.fromARGB(255, 109, 109, 109),
                                fontSize: 14),
                          ),
                          Row(
                            children: [
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
                              SizedBox(
                                width: 5,
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
                              SizedBox(
                                width: 5,
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
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
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
                                        Spacer(),
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
                                              DateFormat('dd MM yyyy')
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
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Место рождения",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 109, 109, 109),
                                          fontSize: 14),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          (context.read<DocumentCubit>().state
                                                  as DocumentLoaded)
                                              .list[0]
                                              .placeBorn,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                "images/gerb.png",
                                width: 80,
                                height: 80,
                              )
                            ],
                          ),
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
