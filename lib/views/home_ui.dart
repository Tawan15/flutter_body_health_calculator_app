import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_app/views/about_ui.dart';
import 'package:flutter_body_health_calculator_app/views/bmi_ui.dart';  
import 'package:flutter_body_health_calculator_app/views/bmr_ui.dart';

int currentIndexStatus = 1;
List<Widget> showBody = [
  BmiUi(),
  AboutUi(),
  BmrUi(),
];

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: (Text(
          'Body Health Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          setState(() {
            currentIndexStatus = value;
          });
        },
        currentIndex: currentIndexStatus,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'ABOUT',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center_outlined),
            label: 'BMI',
          ),
          
        ],
      ),
      body: showBody[currentIndexStatus],
    );
  }
}
