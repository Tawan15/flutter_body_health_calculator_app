import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  //ตัวควบคุม TextField
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  double bmiValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'คำนวณหาค่าดัชนีมวลร่างกาย (BMI)',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/bmi.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนักตัว',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกน้ำหนักตัว (kg)',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนสูง',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: heightController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกส่วนสูง (cm)',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  //คำนวณ BMI
                  onPressed: () {
                    if (weightController.text.isEmpty ||
                        heightController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.blue,
                        ),
                      );
                      return;
                    }

                    double weight = double.parse(weightController.text);
                    double heightCm = double.parse(heightController.text);
                    double heightM = heightCm / 100;
                    double bmi = weight / (heightM * heightM);
                  
                    setState(() {
                      bmiValue = bmi;
                    });
                  },
                  child: Text('คำนวณ BMI'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    fixedSize: Size(MediaQuery.of(context).size.width, 50),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    weightController.clear();
                    heightController.clear();
                    setState(() {
                      bmiValue = 0;
                    });
                  },
                  child: Text('Reset'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 70, 86, 100),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    fixedSize: Size(MediaQuery.of(context).size.width, 50),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  //ความกว้างของกล่องคอนเทนเนอร์
                  padding: EdgeInsets.all(20),
                  //ระยะห่างภายในกล่องคอนเทนเนอร์
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    //สีพื้นหลังของกล่องคอนเทนเนอร์
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
                    //ขอบของกล่องคอนเทนเนอร์
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'BMI',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          bmiValue.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
