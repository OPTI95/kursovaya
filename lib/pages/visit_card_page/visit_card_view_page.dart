import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/controllers/cubit/contact_cubit.dart';

class VisitCardViewPage extends StatelessWidget {
  final int index;
  const VisitCardViewPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Визитная карточка"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(24),
            child: SizedBox(
              height: 250,
              width: double.infinity,
              child: Card(
                color: Color.fromARGB(255, 255, 191, 191),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      (context.read<ContactCubit>().state as ContactLoaded)
                          .list[index]
                          .companyName,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        BarcodeWidget(
                          barcode: Barcode.qrCode(),
                          data: (context.read<ContactCubit>().state
                                  as ContactLoaded)
                              .list[index]
                              .email,
                          width: 100,
                          height: 100,
                          color: Colors.black,
                          drawText: true,
                          style: const TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (context.read<ContactCubit>().state
                                          as ContactLoaded)
                                      .list[index]
                                      .firstName +
                                  " " +
                                  (context.read<ContactCubit>().state
                                          as ContactLoaded)
                                      .list[index]
                                      .lastName,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text((context.read<ContactCubit>().state
                                    as ContactLoaded)
                                .list[index]
                                .position),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(Icons.phone),
                                SizedBox(
                                  width: 5,
                                ),
                                Text((context.read<ContactCubit>().state
                                        as ContactLoaded)
                                    .list[index]
                                    .phoneNumber)
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(Icons.email),
                                SizedBox(
                                  width: 5,
                                ),
                                Text((context.read<ContactCubit>().state
                                        as ContactLoaded)
                                    .list[index]
                                    .email)
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(Icons.web),
                                SizedBox(
                                  width: 5,
                                ),
                                Text((context.read<ContactCubit>().state
                                        as ContactLoaded)
                                    .list[index]
                                    .website)
                              ],
                            )
                          ],
                        ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<ContactCubit>().deleteContact(
                    (context.read<ContactCubit>().state as ContactLoaded)
                        .list[index]
                        .id);
              },
              child: Text('Удалить'))
        ],
      ),
    );
  }
}
