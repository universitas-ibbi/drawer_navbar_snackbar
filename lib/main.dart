import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  List pages = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(color: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Pilih Menu dibawah :",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: Text("Menu 1"),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Menu 2"),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Menu 3"),
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          const snackBar = SnackBar(
            content: Text(
              "Hello ini snackbar",
              style: TextStyle(fontSize: 20.0),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // showDialog(
          //     context: context,
          //     builder: (context) {
          //       return AlertDialog(
          //         title: Text("Hello Dialog"),
          //         content: Text("Hello ini kotak dialog"),
          //         actions: [
          //           TextButton(onPressed: () {}, child: Text("Batal")),
          //           TextButton(onPressed: () {}, child: Text("Simpan"))
          //         ],
          //       );
          //     });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: "Explore",
              icon: Icon(Icons.explore),
            ),
            BottomNavigationBarItem(
              label: "Book",
              icon: Icon(Icons.book),
            ),
            BottomNavigationBarItem(
              label: "Favorit",
              icon: Icon(Icons.favorite),
            )
          ]),
    );
  }
}

class SnackbarInfo extends StatelessWidget {
  const SnackbarInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text("Hello ini snackbar"),
    );
  }
}
