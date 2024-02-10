import 'package:assignment/allsettings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedItem = 'All Settings';

  void _onDropdownItemSelected(String? newValue) {
    print(_selectedItem);
    if (newValue != null) {
      setState(() {
        _selectedItem = newValue;
      });
      print('updated ${_selectedItem}');
      if (newValue == 'All Settings') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => allsettings()),
        );
      }
      if (newValue == 'Close') {
        Navigator.pop(context);
      }
    }
  }

  Widget dropdown() {
    return DropdownButton<String>(
      onChanged: _onDropdownItemSelected,
      value: _selectedItem,
      items: ['All Settings', 'Close']
          .map<DropdownMenuItem<String>>(
            (String value) => DropdownMenuItem<String>(
              child: Text(value),
              value: value,
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: dropdown(),
                      );
                    });
              },
              icon: Icon(Icons.settings),
              tooltip: 'Settings',
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.mail, size: 50,color: Colors.red,), 
            SizedBox(width: 10), 
            Text(
              "Gmail",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
