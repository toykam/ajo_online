import 'package:ajo_online/Pages/MosqueFinderPage/MosqueListPage/mosque_list_provider.dart';
import 'package:ajo_online/utils/routes.dart';
import 'package:ajo_online/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MosqueListProvider())
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (settings) => RouteGenerator.onGenerateRoute(settings),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AjoOnlineButton(
              child: Text('Auth App'),
              onPressed: () => Navigator.of(context).pushNamed('/login')
            ),
            SizedBox(height: 10,),
            AjoOnlineButton(
              child: Text('Mosque App'),
              onPressed: () => Navigator.of(context).pushNamed('/mosque_list')
            ),
            SizedBox(height: 10,),
            AjoOnlineButton(
              child: Text('Settings Page'),
              onPressed: () => Navigator.of(context).pushNamed('/settings')
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/mosque_list'),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
