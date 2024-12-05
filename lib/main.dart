import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Example',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  int lastNumber = 0;
  late StreamController<int> numberStreamController;
  late StreamTransformer<int, int> transformer;
  late StreamSubscription<int> subscription1;
  late StreamSubscription<int> subscription2;
  String values = '';

  Color bgColor = Colors.blueGrey;

  @override
  void initState() {
    super.initState();

    // Initialize transformer
    transformer = StreamTransformer<int, int>.fromHandlers(
      handleData: (value, sink) {
        sink.add(value * 10); // Transform value by multiplying it by 10
      },
      handleError: (error, stackTrace, sink) {
        sink.add(-1); // Handle error by adding -1
      },
      handleDone: (sink) {
        sink.close(); // Close the sink when stream is done
      },
    );

    // Initialize stream controller with broadcast
    numberStreamController = StreamController<int>.broadcast();

    // Subscription 1: Append numbers to 'values'
    subscription1 = numberStreamController.stream.listen((event) {
      setState(() {
        values += '$event - ';
      });
    });

    // Subscription 2: Append numbers to 'values' again (for demonstration)
    subscription2 = numberStreamController.stream.listen((event) {
      setState(() {
        values += '$event - ';
      });
    });

    // Additional listener with transformation
    numberStreamController.stream.transform(transformer).listen((event) {
      setState(() {
        lastNumber = event;
      });
    }).onError((error) {
      setState(() {
        lastNumber = -1;
      });
    });
  }

  @override
  void dispose() {
    // Dispose of stream controller and subscriptions
    numberStreamController.close();
    subscription1.cancel();
    subscription2.cancel();
    super.dispose();
  }

  void addRandomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(10);
    if (!numberStreamController.isClosed) {
      numberStreamController.add(randomNumber);
    } else {
      setState(() {
        lastNumber = -1;
      });
    }
  }

  void stopStream() {
    numberStreamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stream Example',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              values,
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: addRandomNumber,
              child: const Text('New Random Number'),
            ),
            ElevatedButton(
              onPressed: stopStream,
              child: const Text('Stop Stream'),
            ),
          ],
        ),
      ),
    );
  }
}
