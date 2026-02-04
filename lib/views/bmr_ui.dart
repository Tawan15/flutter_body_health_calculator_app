import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class BmrUi extends StatefulWidget {
  const BmrUi({super.key});

  @override
  State<BmrUi> createState() => _BmrUiState();
}

class _BmrUiState extends State<BmrUi> {
  //ตัวควบคุม TextField
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  String selectedGender = 'ชาย'; // ค่าเริ่มต้นเป็นชาย
  double bmrValue = 0;

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
                  'คำนวณหาอัตราการเผาผลาญ(BMR)',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/bmr.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เพศ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('ชาย'),
                        value: 'ชาย',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value ?? 'ชาย';
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('หญิง'),
                        value: 'หญิง',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value ?? 'หญิง';
                          });
                        },
                      ),
                    ),
                  ],
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'อายุ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: ageController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกอายุ (ปี)',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  //คำนวณ BMR
                  onPressed: () {
                    if (weightController.text.isEmpty ||
                        heightController.text.isEmpty ||
                        ageController.text.isEmpty) {
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
                    double age = double.parse(ageController.text);
                    double bmr;

                    if (selectedGender == 'ชาย') {
                      // สำหรับผู้ชาย: BMR = 66 + (13.7 x น้ำหนัก) + (5 x ส่วนสูง) – (6.8 x อายุ)
                      bmr = 66 + (13.7 * weight) + (5 * heightCm) - (6.8 * age);
                    } else {
                      // สำหรับผู้หญิง: BMR = 665 + (9.6 x น้ำหนัก) + (1.8 x ส่วนสูง) – (4.7 x อายุ)
                      bmr = 665 + (9.6 * weight) + (1.8 * heightCm) - (4.7 * age);
                    }

                    setState(() {
                      bmrValue = bmr;
                    });
                  },
                  child: Text('คำนวณ BMR'),
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
                    ageController.clear();
                    setState(() {
                      bmrValue = 0;
                      selectedGender = 'ชาย';
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
                          'BMR',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          bmrValue.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'หน่วย: แคลอรี่ต่อวัน',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
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
