import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wallet/pages/block_screen.dart';
import 'package:wallet/pages/card_pages/card_page.dart';
import 'package:wallet/pages/document_pages/document_page.dart';
import 'package:wallet/pages/visit_card_page/visit_card_page.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    CardPage(),
    DocumentPage(),
    VisitCardPage(),
    NewWidget()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Карты',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_present),
            label: 'Документы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Визитки',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Настройки"),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("ПИН код"),
            trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: PinInputPage(isSave: true,),
                    ),
                  );
                },
                icon: Icon(Icons.arrow_forward)),
          )
        ],
      ),
    );
  }
}



class LoadDataWidget extends StatefulWidget {
  @override
  _LoadDataWidgetState createState() => _LoadDataWidgetState();
}

class _LoadDataWidgetState extends State<LoadDataWidget> {
  bool _isLoading = false;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _loadData() async {
    _toggleLoading();
    // Логика загрузки данных
    await Future.delayed(Duration(seconds: 2));
    _toggleLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Пример загрузки данных'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: _loadData,
                child: Text('Загрузить данные'),
              ),
      ),
    );
  }
}







class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Text('Элемент ${index + 1}');
        },
      ),
    );
  }
}
