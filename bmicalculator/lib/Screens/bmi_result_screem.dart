import 'package:bmicalculator/Screens/bmi_screen.dart';
import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  final int age;
  final int weight;
  final double hight;
  final bool isMale;
  final double result;

  BmiResult(
      {super.key,
      required this.age,
      required this.weight,
      required this.hight,
      required this.isMale,
      required this.result});
  // const BmiResult({super.key});

  String calculateWeightCategory(double bmi) {
    String result = '';
    if (bmi < 18.5) {
      result = 'Underweight';
    } else if (bmi >= 18.5 && bmi < 25) {
      result = 'Normal weight';
    } else if (bmi >= 25 && bmi < 30) {
      result = 'Overweight';
    } else {
      result = 'Obese';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    String description = calculateWeightCategory(result);

    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Color.fromARGB(255, 132, 145, 147),
          title: Text(
            'Back',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Result',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: Text(
                'Your BMI is',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: isMale ? Colors.grey : Color(0xFFA5CCD1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${result.round()}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Kg/m2',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                '($description)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(style: BorderStyle.solid)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        height: 60,
                        image: isMale
                            ? AssetImage('images/boy.png')
                            : AssetImage('images/women.png'),
                      ),
                      SizedBox(
                        height: 30,
                        child: Text(
                          '${isMale ? 'male' : 'female'} ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 65,
                        child: Center(
                          child: Text(
                            '$age',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'age',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 65,
                        child: Center(
                          child: Text(
                            " ${hight.round()} ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'hight(CM)',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 65,
                        child: Center(
                          child: Text(
                            '$weight ',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'weight ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(style: BorderStyle.solid)),
              child: Center(
                child: Text(
                  '\t A BMI of 18.5-24.9 indicates that your weight \n \t is in the normal category for a person of your height. \n \tMantaining a healthy weight  reduce the risk of diseases\n \t associated with overweight and obesity.',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ),
            Spacer(),
            Container(
              width: 500,
              height: 50,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(50),
                color: Color(0xFFA0B9BF),
              ),
              child: TextButton(
                onPressed: () {
                  // double result = wight / pow(hight / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BmiScreen(),
                      // BmiResult(
                      //   age: age,
                      //   isMale: isMale,
                      //   weight: wight,
                      //   hight: hight,
                      //   result: result,
                      // ),
                    ),
                  );
                },
                child: const Text(
                  'Return',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
