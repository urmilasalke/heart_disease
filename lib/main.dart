import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Heart Disease Diagnosis",
    home: SIForm(),
    theme: ThemeData(
        primaryColor: Colors.indigo, accentColor: Colors.indigoAccent),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  @override
  final _minimumPadding = 5.0;
  var _ca = ['1 ', '2', '3'];
  String _currentCA;

  var _chest_pain = [
    'typical angina',
    'atypical angina',
    'non-angina pain',
    'asmptomatic'
  ];
  String _currentChestPain;

  var _slope = ['flat', 'down sloping'];
  String currentSlop;

  var _thal = ['normal', 'fixed defect', 'reversible defect'];
  String _currentThal;

  // int selectedRadio;

  int sex;

  int set = 0;
  int set2 = 0;

  int exang;
  int sugar;

  void initState() {
    super.initState();
    sex = 0;
    exang = 0;
    sugar = 0;
  }

  setSelectedSex(int val) {
    setState(() {
      sex = val;
    });
  }

  setSelectedexang(int xang) {
    setState(() {
      exang = xang;
    });
  }

  setSelectedsugar(int gar) {
    setState(() {
      sugar = gar;
    });
  }

  var displayResult = ' ';

  TextEditingController ageControlled = TextEditingController();
  TextEditingController thalachControlled = TextEditingController();
  TextEditingController bpControlled = TextEditingController();
  TextEditingController colestrolControlled = TextEditingController();
  TextEditingController oldControlled = TextEditingController();

  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    // title:Text("");

    return Scaffold(
      // resizeToAvoidBottomPadding: false,

      appBar: AppBar(
        title: Text("Heart Disease Diagnosis"),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(
          children: <Widget>[
            //Image
            getImageAsset(),

            //textField

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          //style: textStyle,
                          controller: ageControlled,
                          decoration: InputDecoration(
                              labelText: "Age",
                              hintText: "Enter Enter age",
                              labelStyle: textStyle,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          //style: textStyle,
                          controller: thalachControlled,
                          decoration: InputDecoration(
                              labelText: "Thalach",
                              hintText: "Enter Thalach",
                              labelStyle: textStyle,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                  ],
                )),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Sex",
                      style: textStyle,
                    ),
                    Radio(
                      value: 1,
                      groupValue: sex,
                      onChanged: (val) {
                        setSelectedSex(val);
                      },
                    ),
                    Text("Male"),
                    Radio(
                      value: 2,
                      groupValue: sex,
                      onChanged: (val) {
                        setSelectedSex(val);
                      },
                    ),
                    Text("Female"),
                  ],
                )),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Text("Exang", style: textStyle),
                    Radio(
                      value: 3,
                      groupValue: exang,
                      onChanged: (xang) {
                        setSelectedexang(xang);
                      },
                    ),
                    Text("Yes"),
                    Radio(
                      value: 4,
                      groupValue: exang,
                      onChanged: (xang) {
                        setState(() {
                          setSelectedexang(xang);
                        });
                      },
                    ),
                    Text("No"),
                  ],
                )),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Text(
                      " Chest Pain",
                      style: textStyle,
                    ),
                    Container(
                      width: _minimumPadding * 5,
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        hint: Text(
                          'Select Chest Pain',
                          style: textStyle,
                        ),
                        // style: textStyle,
                        value: _currentChestPain,
                        onChanged: (newSlopSelected) {
                          setState(() {
                            //  this.currentSlop=newSlopSelected;
                            _currentChestPain = newSlopSelected;
                          });
                        },

                        items: _chest_pain.map((String slopeValue) {
                          return DropdownMenuItem<String>(
                            child: new Text(slopeValue),
                            value: slopeValue,
                          );
                        }).toList(),
                        //value: 'slope1',
                        //isExpanded: false,

                        //   value:currentSlop,
                      ),
                    ),
                    Container(
                      width: _minimumPadding * 5,
                    ),
                  ],
                )),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          //    style: textStyle,
                          controller: oldControlled,
                          decoration: InputDecoration(
                              labelText: "OldPeak",
                              hintText: "Enter Old peak",
                              labelStyle: textStyle,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                  ],
                )),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          //  style:textStyle,
                          controller: bpControlled,
                          decoration: InputDecoration(
                              labelText: "B.P.",
                              hintText: "Enter B.P.",
                              labelStyle: textStyle,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                  ],
                )),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Slop",
                      style: textStyle,
                    ),
                    Container(
                      width: _minimumPadding * 5,
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        hint: Text(
                          'Select Slope',
                          style: textStyle,
                        ),
                        //   style: textStyle,
                        value: currentSlop,
                        onChanged: (newSlopSelected) {
                          setState(() {
                            //  this.currentSlop=newSlopSelected;
                            currentSlop = newSlopSelected;
                          });
                        },

                        items: _slope.map((String slopeValue) {
                          return DropdownMenuItem<String>(
                            child: new Text(slopeValue),
                            value: slopeValue,
                          );
                        }).toList(),
                        //value: 'slope1',
                        //isExpanded: false,

                        //   value:currentSlop,
                      ),
                    )
                  ],
                )),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          //    style: textStyle,
                          controller: colestrolControlled,
                          decoration: InputDecoration(
                              labelText: "Colestrol",
                              hintText: "Enter Colestrol",
                              labelStyle: textStyle,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                  ],
                )),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Text(
                      "CA",
                      style: textStyle,
                    ),
                    Container(
                      width: _minimumPadding * 5,
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        hint: Text(
                          'Select CA',
                          style: textStyle,
                        ),

                        value: _currentCA,
                        onChanged: (newSlopSelected) {
                          setState(() {
                            //  this.currentSlop=newSlopSelected;
                            _currentCA = newSlopSelected;
                          });
                        },

                        items: _ca.map((String slopeValue) {
                          return DropdownMenuItem<String>(
                            child: new Text(slopeValue),
                            value: slopeValue,
                          );
                        }).toList(),
                        //value: 'slope1',
                        //isExpanded: false,

                        //   value:currentSlop,
                      ),
                    )
                  ],
                )),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Fasting Blood Sugar",
                      style: textStyle,
                    ),
                    Radio(
                      value: 5,
                      groupValue: sugar,
                      onChanged: (gar) {
                        setState(() {
                          setSelectedsugar(gar);
                        });
                      },
                    ),
                    Text("True"),
                    Radio(
                      value: 6,
                      groupValue: sugar,
                      onChanged: (gar) {
                        setState(() {
                          setSelectedsugar(gar);
                        });
                      },
                    ),
                    Text("False"),
                  ],
                )),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
//
                    Text(
                      "Thal",
                      style: textStyle,
                    ),
                    Container(
                      width: _minimumPadding * 5,
                    ),

                    Expanded(
                      child: DropdownButton<String>(
                        hint: Text(
                          'Select Thal',
                          style: textStyle,
                        ),
                        //   style: textStyle,
                        value: _currentThal,
                        onChanged: (newSlopSelected) {
                          setState(() {
                            //  this.currentSlop=newSlopSelected;
                            _currentThal = newSlopSelected;
                          });
                        },

                        items: _thal.map((String slopeValue) {
                          return DropdownMenuItem<String>(
                            child: new Text(slopeValue),
                            value: slopeValue,
                          );
                        }).toList(),
                        //value: 'slope1',
                        //isExpanded: false,

                        //   value:currentSlop,
                      ),
                    )
                  ],
                )),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Colors.orange,
                        textColor: Theme.of(context).primaryColorDark,
                        child: Text("Diagnosis", textScaleFactor: 1),
                        onPressed: () {
                          setState(() {
                            this.displayResult = _diagnosisReturns();
                          });
                        },
                      ),
                    ),
                    Container(
                      width: _minimumPadding * 5,
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.orange,
                        textColor: Theme.of(context).primaryColorDark,
                        child: Text("Reset", textScaleFactor: 1),
                        onPressed: () {
                          setState(() {
                            _reset();
                          });
                        },
                      ),
                    ),
                    Container(
                      width: _minimumPadding * 5,
                    ),
                    Expanded(
                      child: RaisedButton(
                          color: Colors.orange,
                          textColor: Theme.of(context).primaryColorDark,
                          child: Text("Cancel", textScaleFactor: 1),
                          onPressed: () {
                            exit(0);
                          }),
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text(
                this.displayResult,
                style: textStyle,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/hospital.jpeg');
    Image image = Image(
      image: assetImage,
      width: 150.0,
      height: 150.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 3),
    );
  }

  String _diagnosisReturns() {
    int age = int.parse(ageControlled.text);
    int thalach = int.parse(thalachControlled.text);
    int bp = int.parse(bpControlled.text);
    int colestrol = int.parse(colestrolControlled.text);
    double oldpeak = double.parse(oldControlled.text);
    String ca = _currentCA;
    String thal = _currentThal;
    String cp = _currentChestPain;
    // String slope=currentSlop;

    if (sex == 1 &&
        (oldpeak > -2.6 && oldpeak < 2.4) &&
        (thalach > 60 && thalach < 124)) {
      set = 1;
    } else if (sex == 2 &&
        (thal == 'fixed defect' || thal == 'reversible defect') &&
        (colestrol > 0 && colestrol < 295)) {
      set = 1;
    } else if ((thal == 'fixed defect' || thal == 'reversible defect') &&
        (colestrol > 295 && colestrol < 603)) {
      set = 1;
    } else if (sex == 1 &&
        (thal == 'fixed defect' || thal == 'reversible defect') &&
        (oldpeak > 2.5 && oldpeak < 6.2) &&
        (exang == 4)) {
      set = 1;
    } else if ((oldpeak > 2.5 && oldpeak < 6.2) &&
        (sugar == 5) &&
        (exang == 4)) {
      set = 1;
    }

//    ///2nd
    if (cp == 'asymptomatic' && sugar == 5 && oldpeak > 1.2) {
      set2 = 1;
    } else if ((sugar == 6) &&
        (ca == 1 || ca == 2 || ca == 3) &&
        (thalach > 131 && thalach < 202) &&
        (bp > 118 && bp < 200) &&
        (exang == 4)) {
      set2 = 1;
    } else if ((sugar == 6) &&
        (thal == 'normal' || thal == 'fixed defect') &&
        (age > 58 && age < 63)) {
      set2 == 1;
    }

    if (cp == 'asymptomatic' &&
        (ca == 1 || ca == 2 || ca == 3) &&
        sex == 1 &&
        (thalach > 60 && thalach < 131)) {
      set2 = 1;
    }

    String result = "Heart disease is positive";

    String result2 = "Result is negative";

    if (set == 1 || set2 == 1) {
      return result;
    } else {
      return result2;
    }
  }

  void _reset() {
    ageControlled.text = " ";
    thalachControlled.text = " ";
    bpControlled.text = " ";
    colestrolControlled.text = " ";
    oldControlled.text = " ";
    currentSlop=null;
    _currentCA=null;
    _currentThal=null;
    _currentChestPain=null;
    displayResult = " ";
    sex = 0;
    exang = 0;
    sugar = 0;
  }
}
