import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as timeZone;
import 'package:timezone/data/latest.dart' as tz;

void main() {
  tz.initializeTimeZones();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'TimeZone'),
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
  String timeZoneString = '';

  @override
  void initState() {
    super.initState();
    convertLocalToDetroit();
  }

  void convertLocalToDetroit() async {
    /// For 'Europe/London'
    // var longDate =  DateTime.fromMillisecondsSinceEpoch(1619464480 * 1000);//Result 2021-04-26 20:14:40.000+0100
    //  final result =  timeZone.TZDateTime.from(longDate, timeZone.getLocation('Europe/London'));

    /// For 'Asia/Tokyo'
    // var longDate =  DateTime.fromMillisecondsSinceEpoch(1619466835 * 1000);//Result 2021-04-27 04:53:55.000+0900
    // var longDate =  DateTime.fromMillisecondsSinceEpoch(1619515418 * 1000);//Result 2021-04-27 18:23:38.000+0900
    // final result =  timeZone.TZDateTime.from(longDate, timeZone.getLocation('Asia/Tokyo'));

    /// For 'America/Toronto'
    var longDate =  DateTime.fromMillisecondsSinceEpoch(1619432202 * 1000);//Result 2021-04-26 06:16:42.000-0400//Sun Rise
    // var longDate =  DateTime.fromMillisecondsSinceEpoch(1619482429 * 1000);//Result 2021-04-26 20:13:49.000-0400//Sun Set
    final result =  timeZone.TZDateTime.from(longDate, timeZone.getLocation('America/Toronto'));

    print('Result $result');
    setState(() {
      timeZoneString = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          '$timeZoneString',
          style: Theme.of(context).textTheme.headline4,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
