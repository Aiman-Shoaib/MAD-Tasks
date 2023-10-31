import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Stream<String> getData() async* {
      while (true) {
        await Future.delayed(const Duration(seconds: 1));
        DateTime dateTime = DateTime.now();
        yield "${dateTime.hour}:${dateTime.minute}: ${dateTime.second}";
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: StreamBuilder(
          stream: getData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return Text(
                "${snapshot.data}",
                style: const TextStyle(
                    backgroundColor: Colors.yellow, fontSize: 50),
              );
            }
          },
        ),
      ),
    );
  }
}
