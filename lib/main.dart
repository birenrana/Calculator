import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int firstnum;
  late int secondnum;
  String texttodisplay = "";
  late String res;
  late String operatortooperform;

  void btnclicked(String btnval) {
    if (btnval == "C") {
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "x" ||
        btnval == "/") {
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortooperform = btnval;
    } else if (btnval == "=") {
      secondnum = int.parse(texttodisplay);
      if (operatortooperform == "+") {
        res = (firstnum + secondnum).toString();
      }
      if (operatortooperform == "-") {
        res = (firstnum - secondnum).toString();
      }
      if (operatortooperform == "x") {
        res = (firstnum * secondnum).toString();
      }
      if (operatortooperform == "/") {
        res = (firstnum ~/ secondnum).toString();
      }
    } else {
      res = int.parse(texttodisplay + btnval).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget custombutton(String btnval) {
    return Expanded(
        child: OutlinedButton(
      onPressed: () => btnclicked(btnval),
      child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Text("$btnval",
              style: TextStyle(fontSize: 25.0, color: Colors.black))),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
        ),
      ),
      // drawer: Drawer(child: Text('Hello World')),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Biren Rana"),
                accountEmail: Text("ranabiren06@gmail.com"),
                currentAccountPicture: CircleAvatar(
                    backgroundImage:
                        NetworkImage("https://picsum.photos/250?image=9"))),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Account"),
              subtitle: Text("Personal"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text("ranabiren06@gmail.com"),
              trailing: Icon(Icons.send),
            ),
          ],
        ),
      ),

      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                "$texttodisplay",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              custombutton("9"),
              custombutton("8"),
              custombutton("7"),
              custombutton("+"),
            ],
          ),
          Row(
            children: <Widget>[
              custombutton("6"),
              custombutton("5"),
              custombutton("4"),
              custombutton("-"),
            ],
          ),
          Row(
            children: <Widget>[
              custombutton("3"),
              custombutton("2"),
              custombutton("1"),
              custombutton("x"),
            ],
          ),
          Row(
            children: <Widget>[
              custombutton("C"),
              custombutton("0"),
              custombutton("="),
              custombutton("/"),
            ],
          )
        ],
      )),
    );
  }
}
