//import 'dart:js_util';

import 'dart:js_util';

import 'package:assignment/signature.dart';
import 'package:assignment/starwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class allsettings extends StatefulWidget {
  const allsettings({Key? key}) : super(key: key);

  @override
  State<allsettings> createState() => _allsettingsState();
}

class _allsettingsState extends State<allsettings> {
  String _selectedLang = "Select the Language";
  String _selectedCode = "Select the code";

  void _onChangeLang(String? newLang) {
    setState(() {
      _selectedLang = newLang!;
    });
  }

  void _onChangeCode(String? newCode) {
    setState(() {
      _selectedCode = newCode!;
    });
  }

  Widget langDropdown(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height / 4,
      // width: MediaQuery.of(context).size.width / 2,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(200, 20, 300, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      "Language:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Spacer(),
                    Text("Gmail display language: ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                    DropdownButton<String>(
                      value: _selectedLang,
                      onChanged: _onChangeLang,
                      items: <String>[
                        'Select the Language',
                        'English',
                        'Spanish',
                        'French',
                        'German',
                        'Italian',
                        'Chinese',
                        'Japanese',
                        'Russian',
                        'Portuguese',
                        'Arabic',
                        'Korean',
                      ].map<DropdownMenuItem<String>>((String val) {
                        return DropdownMenuItem<String>(
                          child: Text(val),
                          value: val,
                        );
                      }).toList(),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("Phone Number:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    Spacer(),
                    Spacer(),
                    Text("Default country code:",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                    DropdownButton<String>(
                      value: _selectedCode,
                      onChanged: _onChangeCode,
                      items: <String>[
                        'Select the code',
                        'English',
                        'Spanish',
                        'French',
                        'German',
                        'Italian',
                        'Chinese',
                        'Japanese',
                        'Russian',
                        'Portuguese',
                        'Arabic',
                        'Korean',
                      ].map<DropdownMenuItem<String>>((String val) {
                        return DropdownMenuItem<String>(
                          child: Text(val),
                          value: val,
                        );
                      }).toList(),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _setsty = 'Choose your style';

  void _onchangestyle(String? newsty) {
    setState(() {
      if (newsty != null) {
        _setsty = newsty;
      }
    });
  }

  String _setsize = 'Medium';

  void _onchangesize(String? newsize) {
    setState(() {
      if (newsize != null) {
        _setsize = newsize;
      }
    });
  }

  Color _selectedColor = Colors.black;

  void _onColorSelected(Color? color) {
    setState(() {
      _selectedColor = color!;
    });
  }

  Widget colorPickerDropdown(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Color>(
          value: _selectedColor,
          onChanged: _onColorSelected,
          items: <Color>[
            Colors.red,
            Colors.green,
            Colors.blue,
            Colors.yellow,
            Colors.orange,
            Colors.purple,
            Colors.pink,
            Colors.teal,
            Colors.brown,
            Colors.grey,
            Colors.black,
            Colors.white,
          ].map<DropdownMenuItem<Color>>((Color color) {
            return DropdownMenuItem<Color>(
              value: color,
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    color: color,
                  ),
                  SizedBox(width: 8),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // String colorToString(Color color) {
  //   return color == Colors.black
  //       ? 'Black'
  //       : color == Colors.white
  //           ? 'White'
  //           : color.toString();
  // }
  List<Widget> inUseStars = [];
  List<Widget> notInUseStars = [];

  @override
  void initState() {
    super.initState();
    notInUseStars.clear();
    for (int i = 0; i < 4; i++) {
      notInUseStars.add(buildStar(i));
    }
    //inUseStars.add(buildStar(0));
  }

  Widget _buildStarWidget() {
    return Icon(Icons.star, color: Colors.yellow, size: 30);
  }

  Widget buildStar(int index) {
    return Draggable(
      data: index,
      child: _buildStarWidget(),
      feedback: _buildStarWidget(),
      childWhenDragging: SizedBox.shrink(),
    );
  }

  Widget textStyleWidget(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height / 4,
      // width: MediaQuery.of(context).size.width / 2,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(200, 0, 300, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Row(
                    children: [
                      Text("Default text style:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3))
                            ]),
                        child: Row(
                          children: [
                            DropdownButton(
                              onChanged: _onchangestyle,
                              value: _setsty,
                              items: <String>[
                                'sans-serif',
                                'Verdana',
                                'Choose your style'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                );
                              }).toList(),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DropdownButton<String>(
                              onChanged: _onchangesize,
                              value: _setsize,
                              items: <String>['Large', 'Medium', 'Small']
                                  .map<DropdownMenuItem<String>>((String val) {
                                return DropdownMenuItem<String>(
                                  child: Text(val),
                                  value: val,
                                );
                              }).toList(),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            colorPickerDropdown(context),
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.text_format)),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  String style = "sans-serif";

  void _onchangesty(String? newsty) {
    setState(() {
      style = newsty!;
    });
  }

  Widget sign() {
    return Container(
      child: DropdownButton<String>(
          value: style,
          onChanged: _onchangesty,
          items: ['sans-serif', 'Verdana', 'Choose your style']
              .map<DropdownMenuItem<String>>((String val) {
            return DropdownMenuItem(
              child: Text(val),
              value: val,
            );
          }).toList()),
    );
  }

  String signaturee = "No Signature";

  void _onchanesign(String? newsign) {
    setState(() {
      signaturee = newsign!;
    });
  }

  Widget wid() {
    return Row(
      children: [
        Column(
          children: [
            Text("Signature defaults"),
            Text("FOR NEW EMAILS USE"),
            DropdownButton<String>(
              items: ['No Signature', 'Naresh'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  signaturee = newValue!;
                });
              },
              value: signaturee,
            ),
          ],
        )
      ],
    );
  }

  Widget wid1() {
    return Row(
      children: [
        Column(
          children: [
            Text("ON REPLY/FORWARD USE"),
            DropdownButton<String>(
              items: ['No Signature', 'Naresh'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  signaturee = newValue!;
                });
              },
              value: signaturee,
            ),
          ],
        )
      ],
    );
  }

  // Widget fontsize(){
  //   r
  // }
  // late String label = "";
  // List<String> inUseStars = [];
  // List<String> notInUseStars = ['Star 1', 'Star 2', 'Star 3'];
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Settings'),
        ),
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              langDropdown(context),
              Divider(),
              SizedBox(
                width: 20,
              ),
              textStyleWidget(context),
              SizedBox(height: 10),
              Divider(),
              //   SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.fromLTRB(200, 40, 0, 0),
                child: Text("Stars:",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ),
              Column(
                children: [
                  //Text("Stars:"),
                  //SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(right: 420),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //Spacer(),
                        Text("In Use :",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                        ...inUseStars
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 300),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Not in Use:",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                          ...notInUseStars
                              .map((star) => Draggable(
                                    data: notInUseStars.indexOf(star),
                                    child: star,
                                    feedback: star,
                                    childWhenDragging: SizedBox.shrink(),
                                  ))
                              .toList()
                        ]),
                  )
                ],
              ),
              DragTarget<int>(
                onAccept: (int starindex) {
                  print('onAccept triggered with starindex: $starindex');
                  setState(() {
                    notInUseStars.removeAt(starindex);
                    inUseStars.add(buildStar(starindex));
                    print("star added successfully ${starindex}");
                  });
                },
                builder: (context, candidatedata, rejecteddata) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: inUseStars.map((star) {
                        return Draggable<int>(
                          data: inUseStars.indexOf(star),
                          child: star,
                          feedback: star,
                          childWhenDragging: Container(),
                        );
                      }).toList());
                },
              ),
              Divider(),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 30,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 300,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 200),
                          child: Text("Signature:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 380),
                          child: signature(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 1, right: 270, top: 30),
                          child: TextField(
                            decoration: InputDecoration(
                              // hintText: 'Enter your signature here...',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          child: Row(children: [
                            sign(),
                            Text('|'),
                            SizedBox(
                              width: 7,
                            ),
                            DropdownButton<String>(
                              onChanged: _onchangesize,
                              value: _setsize,
                              items: <String>['Large', 'Medium', 'Small']
                                  .map<DropdownMenuItem<String>>((String val) {
                                return DropdownMenuItem<String>(
                                  child: Text(val),
                                  value: val,
                                );
                              }).toList(),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.format_bold)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.format_italic)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.format_underline)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.text_format)),
                                  Text('|'),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  IconButton(
                                      onPressed: () {}, icon: Icon(Icons.link)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.image)),
                                  Text('|'),
                                  SizedBox(
                                    width: 7,
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              // SizedBox(width: 50,),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 500),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                          wid(),
                          SizedBox(
                            width: 150,
                          ),
                          wid1(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 600),
                        child: Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value ?? false;
                            });
                          },
                        ),
                      ),
                      Text(
                    'Only send a response to people in my Contacts',
                    style: TextStyle(fontSize: 16),
                  ),
                    ],
                  ),
                  
                ],
              ),
              Divider()
            ],
          ),
        ));
  }
}
