import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_navigation_bar_page.dart';

class PinInputPage extends StatefulWidget {
  final bool isSave;

  const PinInputPage({super.key, required this.isSave});
  @override
  _PinInputPageState createState() => _PinInputPageState();
}

class _PinInputPageState extends State<PinInputPage> {
  String pin = '';
  bool isError = false;
  void _onNumberPressed(String value) async {
    setState(() {
      if (pin.length < 4) {
        pin += value;
      }
    });
    if (widget.isSave == false && pin.length == 4) {
      if (await loadSavedText(pin)) {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: BottomNavigationBarPage(),
          ),
        );
      } else {
        isError = true;
      }
    }
  }

  void _onDeletePressed() {
    setState(() {
      if (pin.isNotEmpty) {
        pin = pin.substring(0, pin.length - 1);
      }
    });
  }

  Future<bool> loadSavedText(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String pin = prefs.getString('pin') ?? '';
    return pin == text ? true : false;
  }

  Future<void> saveText(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('pin', text);
  }

  
  Future<void> deleteText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('pin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ввод PIN'),
        actions: [
          widget.isSave
              ? Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        Future(() => deleteText()).then((value) {
                          Navigator.pop(context);
                        });
                      },
                      icon: Icon(Icons.delete)),
                  IconButton(
                      onPressed: () async {
                        Future(() => saveText(pin)).then((value) {
                          Navigator.pop(context);
                        });
                      },
                      icon: Icon(Icons.save)),
                ],
              )
              : SizedBox()
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'PIN: $pin',
              style: TextStyle(fontSize: 24.0),
            ),
            isError
                ? Text(
                    'ПИН КОД НЕВЕРНЫЙ!',
                    style: TextStyle(fontSize: 20.0, color: Colors.red),
                  )
                : SizedBox(),
            SizedBox(height: 20.0),
            Wrap(
              children: List.generate(
                10,
                (index) => index == 0
                    ? SizedBox()
                    : Padding(
                        padding: EdgeInsets.all(8),
                        child: PinButton(
                          label: index.toString(),
                          onPressed: () => _onNumberPressed(index.toString()),
                        ),
                      ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 80,
                ),
                Spacer(),
                PinButton(
                  label: "0",
                  onPressed: () => _onNumberPressed("0"),
                ),
                SizedBox(width: 10.0),
                IconButton(
                  icon: Icon(
                    Icons.clear,
                    size: 50,
                  ),
                  onPressed: _onDeletePressed,
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PinButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  PinButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(fontSize: 24),
      ),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(40.0),
      ),
    );
  }
}
