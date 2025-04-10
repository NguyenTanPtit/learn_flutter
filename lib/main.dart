import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const IconData refresh = IconData(0xe514, fontFamily: 'MaterialIcons');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SafeArea(
        child: MainScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  final bool loading;

  const MainScreen({this.loading = false});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  late bool _localLoading;

  @override
  void initState() {
    _localLoading = widget.loading;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: MyWidget(_localLoading),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _toggleLoading();
        },
        child: const Icon(MyApp.refresh),
        backgroundColor: Colors.pinkAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _toggleLoading() {
    setState(() {
      _localLoading = !_localLoading;
    });
    if (_localLoading) {
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _localLoading = false;
        });
      });
    }
  }
}

class MyWidget extends StatelessWidget {
  final bool loading;

  const MyWidget(this.loading, {super.key});

  @override
  Widget build(BuildContext context) {
    return loading
        ? const CircularProgressIndicator()
        : const Text(
            'Loaded',
            style: TextStyle(
              fontSize: 24,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Roboto',
              shadows: [
                Shadow(
                  color: Colors.pinkAccent,
                  offset: Offset(1, 2),
                  blurRadius: 3,
                )
              ]
            ),
          );
  }
}
