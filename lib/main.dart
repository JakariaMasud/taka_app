import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taka_app/EMIScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Leads")),
            BottomNavigationBarItem(
                icon: Icon(Icons.login), title: Text("Sales")),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle), title: Text("Create")),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate), title: Text("Calculator")),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text("Account")),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: Container(
          color: Colors.blue[100],
          child: ListView(
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.75))
                ], color: Colors.white),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      margin: EdgeInsets.only(right: 8.0),
                      child: Text(
                        "Help",
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8.0, top: 15.0, bottom: 8.0),
                child: Text(
                  'Calculators',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                ),
              ),
              CalculatorCard(
                cardTitle: "SIP Calculator",
                cardIcon: "icons/sip.svg",
              ),
              CalculatorCard(
                cardTitle: "LumpSum Calculator",
                cardIcon: "icons/lumpSum.svg",
              ),
              CalculatorCard(
                cardTitle: "MutualFund Return Calculator",
                cardIcon: "icons/mutualfund.svg",
              ),
              CalculatorCard(
                cardTitle: "EPF Calculator",
                cardIcon: "icons/epf.svg",
              ),
              CalculatorCard(
                cardTitle: "FD Calculator",
                cardIcon: "icons/fd.svg",
              ),
              CalculatorCard(
                cardTitle: "NPS Calculator",
                cardIcon: "icons/nps.svg",
              ),
              CalculatorCard(
                cardTitle: "Retirement Calculator",
                cardIcon: "icons/retirement.svg",
              ),
              CalculatorCard(
                cardTitle: "EMI Calculator",
                cardIcon: "icons/emi.svg",
              ),
              // ElevatedButton(onPressed: (){
              //    Navigator.push(context, MaterialPageRoute(builder: (context)=>EMIScreen()));
              // }, child: Text("Go to Emi"))
            ],
          ),
        ),
      ),
    );
  }
}

class CalculatorCard extends StatelessWidget {
  final String cardTitle;
  final String cardIcon;

  const CalculatorCard({Key key, this.cardTitle, this.cardIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              SvgPicture.asset(cardIcon, height: 20, width: 20),
              SizedBox(
                width: 3.0,
              ),
              Text(
                cardTitle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
