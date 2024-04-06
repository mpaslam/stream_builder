import 'dart:async';

import 'package:flutter/material.dart';

class NumberStreamPage extends StatefulWidget {
  @override
  _NumberStreamPageState createState() => _NumberStreamPageState();
}

class _NumberStreamPageState extends State<NumberStreamPage> {
  late StreamController<int> _numberStreamController;

  @override
  void initState() {
    super.initState();

    // Create a stream controller and add numbers to the stream.
    _numberStreamController = StreamController<int>();
    _startAddingNumbers(); // Start adding numbers to the stream.
  }

  void _startAddingNumbers() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 2)); // Delay for 2 seconds.
      _numberStreamController.sink.add(i); // Add the number to the stream.
    }
  }

  @override
  void dispose() {
    _numberStreamController.close(); // Close the stream when disposing.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamBuilder Example'),
      ),
      body: Center(
        child: StreamBuilder<num>(
          stream: _numberStreamController.stream,
          builder: (context, systm) {
            if (systm.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Display a loading indicator when waiting for data.
            } else if (systm.hasError) {
              return Text(
                  'Error: ${systm.error}'); // Display an error message if an error occurs.
            } else if (!systm.hasData) {
              return const Text(
                  'No data available'); // Display a message when no data is available.
            } else {
              return Text(
                'Latest Number: ${systm.data}',
                style: const TextStyle(fontSize: 24),
              ); // Display the latest number when data is available.
            }
          },
        ),
      ),
    );
  }
}
