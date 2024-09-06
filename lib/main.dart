import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final phoneController = TextEditingController();

final phoneMask = TextInputMask(mask: ['(99) 9999-9999', '(99) 99999-9999']);

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mask Test"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: phoneController,
                inputFormatters: [phoneMask],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Telefone"),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  String phone = phoneController.text.replaceAll(RegExp(r'[\(\) -]'), '');
                  print(phone);
                },
                child: const Text('Pegar valor'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
