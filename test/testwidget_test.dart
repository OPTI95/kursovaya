import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wallet/pages/bottom_navigation_bar_page.dart';
import 'package:wallet/pages/card_pages/card_page.dart';

void main() {
  testWidgets('ThirdWelcomePage UI Test', (WidgetTester tester) async {
    final testWidget = MaterialApp(
      home: ThirdWelcomePage(),
    );
    await tester.pumpWidget(testWidget);
    expect(find.text('Храните визитки'), findsOneWidget);
    expect(find.byType(SizedBox), findsNWidgets(5)); 
    expect(find.byType(Image), findsOneWidget); 
    expect(find.byType(Row), findsOneWidget); 
    expect(find.byType(ElevatedButton), findsOneWidget); 
    expect(find.text('Начать'), findsOneWidget); 
  });

}


class ThirdWelcomePage extends StatelessWidget {
  const ThirdWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 198, 198),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Храните визитки',
                  style: GoogleFonts.gabriela(
                    color: Color.fromARGB(255, 50, 43, 85),
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                  ),
                ),
              ),
              Spacer(),
              Image.asset("images/visit_card.webp"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 17,
                    width: 17,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: 17,
                      width: 17,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                    ),
                  ),
                  Container(
                    height: 29,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 50, 43, 85),
                        shape: BoxShape.circle),
                  ),
                ],
              ),
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
                            type: PageTransitionType.bottomToTop,
                            child: BottomNavigationBarPage(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 50, 43, 85)),
                      ),
                      child: Text(
                        "Начать",
                        style: GoogleFonts.gabriela(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ),
              ),
              SizedBox(
                height: 25,
              ),
            ]),
      ),
    );
  }
}
