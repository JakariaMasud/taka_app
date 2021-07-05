import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EMIScreen extends StatefulWidget {
  @override
  _EMIScreenState createState() => _EMIScreenState();
}

class _EMIScreenState extends State<EMIScreen> {
  final loanController = TextEditingController();
  final interestController = TextEditingController();
  double _loanValue = 0;
  double _interest = 0;
  double _tenure = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          // padding: EdgeInsets.all(20.0),
          color: Colors.blue[50],
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
                child: Center(
                  child: Text(
                    "EMI Calculator",
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Loan Amount'),
                    SizedBox(
                      height: 50.0,
                      width: 80.0,
                      child: TextField(
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.number,
                        controller: loanController,
                        onChanged: (value) {
                          _loanValue = double.parse(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Slider(
                  value: _loanValue,
                  min: 0,
                  max: 10000,
                  onChanged: (value) {
                    setState(() {
                      _loanValue = value;
                      loanController.text = _loanValue.floor().toString();
                    });
                  }),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Rate of Interest'),
                    SizedBox(
                      height: 50.0,
                      width: 80.0,
                      child: TextField(
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.number,
                        controller: interestController,
                        onChanged: (value) {
                          _interest = double.parse(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Slider(
                  value: _interest,
                  min: 0,
                  max: 40,
                  onChanged: (value) {
                    setState(() {
                      _interest = value;
                      interestController.text = _interest.floor().toString();
                    });
                  }),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Loan Tenure'),
                    Text(_tenure.floor().toString()),
                  ],
                ),
              ),
              Slider(
                  value: _tenure,
                  min: 0,
                  max: 25,
                  onChanged: (value) {
                    setState(() {
                      _tenure = value;
                    });
                  }),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Monthly EMI",
                          style: TextStyle(color: Colors.grey, fontSize: 15.0),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "৳ 25000",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Principal Amount",
                          style: TextStyle(color: Colors.grey, fontSize: 15.0),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "৳ 100000",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Total Interest",
                          style: TextStyle(color: Colors.grey, fontSize: 15.0),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "৳ 25000",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Total Amount",
                          style: TextStyle(color: Colors.grey, fontSize: 15.0),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "৳ 100000",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: SfCircularChart(
                  legend: Legend(
                      isVisible: true,
                      overflowMode: LegendItemOverflowMode.wrap),
                  series: <CircularSeries>[
                    DoughnutSeries<ChartData, String>(
                        dataSource: getChartData(),
                        xValueMapper: (chartData, _) {
                          return chartData.type;
                        },
                        yValueMapper: (chartData, _) {
                          return chartData.value;
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<ChartData> getChartData() {
    final List<ChartData> chartDataList = [
      ChartData("Invested Amount", 50),
      ChartData("Est. Returns", 50)
    ];
    return chartDataList;
  }
}

class ChartData {
  String type;
  int value;

  ChartData(this.type, this.value);
}
