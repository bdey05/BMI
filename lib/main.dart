import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: BMICalculator(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  BMICalculatorState createState() {
    return BMICalculatorState();
  }
}
class BMICalculatorState extends State<BMICalculator> {

  final _formKey = GlobalKey<FormState>();
  final age = TextEditingController();
  final gender = TextEditingController();
  final weight = TextEditingController();
  final height = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child:
        SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 15),
            SizedBox(height: 100, width: 225, child: Image.asset("assets/logo.png")),
            Center(
              child: Text(
                "Complete the form in order to calculate your BMI",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: age,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                hintText: 'Enter your age',
                fillColor: Color(0xfff0f5fc),
                filled: true,
                labelText: 'Age',
                  floatingLabelStyle: const TextStyle(color: Color(0xff3f3cf3), fontSize: 18)
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please fill in the field';
                }
                if (int.tryParse(value) == null){
                  return 'Please enter a valid integer age';
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: gender,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  hintText: 'Enter your gender (Male or Female)',
                  fillColor: Color(0xfff0f5fc),
                  filled: true,
                  labelText: 'Gender',
                  floatingLabelStyle: const TextStyle(color: Color(0xff3f3cf3), fontSize: 18)
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please fill in the field';
                }
                if (value.toLowerCase() != "male" && value.toLowerCase() != "female"){
                  return 'Please enter \"Male\" or \"Female\" for your gender';
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: weight,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  hintText: 'Enter your weight in pounds',
                  fillColor: Color(0xfff0f5fc),
                  filled: true,
                  labelText: 'Weight',
                  floatingLabelStyle: const TextStyle(color: Color(0xff3f3cf3), fontSize: 18)
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please fill in the field';
                }
                if (int.tryParse(value) == null){
                  return 'Please enter a valid integer weight';
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: height,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  hintText: 'Enter your height in inches',
                  fillColor: Color(0xfff0f5fc),
                  filled: true,
                  labelText: 'Height',
                  floatingLabelStyle: const TextStyle(color: Color(0xff3f3cf3), fontSize: 18)
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please fill in the field';
                }
                if (int.tryParse(value) == null){
                  return 'Please enter a valid integer height';
                }
                return null;
              },
            ),
            Container(
                padding: const EdgeInsets.all(15),
                child:
                ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                            )
                        ),
                      backgroundColor: MaterialStateProperty.all(Color(0xff3f3cf3)),

                    ),

                  child:
                      Padding(padding: EdgeInsets.all(12),
                      child: const Text("Calculate", style: TextStyle(fontSize: 20),),),
                  onPressed: () {
                      if (_formKey.currentState!.validate()){
                        var personHeight = int.parse(height.text);
                        var personWeight = int.parse(weight.text);
                        var BMI = (703 * personWeight) / (personHeight * personHeight);
                        BMI = double.parse((BMI).toStringAsFixed(1));
                        var result = "";
                        if (BMI < 18.5){
                          result = "Your BMI is " + BMI.toString() + " which is in the Underweight range";
                        }
                        else if (BMI >= 18.5 && BMI <= 24.9){
                          result = "Your BMI is " + BMI.toString() + " which is in the Healthy range";
                        }
                        else if (BMI >= 25 && BMI <= 29.9){
                          result = "Your BMI is " + BMI.toString() + " which is in the Overweight range";
                        }
                        else {
                          result = "Your BMI is " + BMI.toString() + " which is in the Obese range";
                        }


                          showDialog(context: context,  builder: (BuildContext context) => AlertDialog(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: Color(0xff3f3cf3),
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Center(
                                child: Text("BMI Results",
                                    style: TextStyle(
                                      fontFamily: 'TTNorms',
                                      fontWeight: FontWeight.bold,
                                      wordSpacing: 0,
                                      letterSpacing: 0,
                                      fontSize: 20,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          ),

                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(
                                  Radius.circular(8.0))),
                          backgroundColor: Colors.black,
                          content:
                          Container(
                            alignment: Alignment.center,
                              height: 65,
                              child: Text(result, style: TextStyle(color: Colors.white, fontSize: 17), textAlign: TextAlign.center,)
                          )


                        ),);
                      }
                  },
                )
            ),
          ],
        ),
      )
      )
    );
  }
}