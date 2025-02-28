import 'package:flutter/material.dart';
import 'package:live_coding_test/button_widget.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _controller = TextEditingController();
  List<int> _bilanganPrima = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 75,
            ),
            appBar(),
            const SizedBox(height: 50),
            Text(
              'Bilangan Prima',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'masukkan angka untuk menghasilkan bilangan prima',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 24),
            Text(
              'Input Angka',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Masukkan angka',
              ),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
                text: 'Generate Bilangan Prima',
                onTap: () {
                  setState(() {
                    _bilanganPrima =
                        generateBilanganPrima(int.parse(_controller.text));
                  });
                }),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: _bilanganPrima.length,
                itemBuilder: (context, index) {
                  return Text(_bilanganPrima[index].toString());
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/coffee-cup.png',
          width: 32,
          height: 32,
        ),
        Text(
          "Test Apps",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
      ],
    );
  }

  List<int> generateBilanganPrima(int n) {
    List<int> bilanganPrima = [];
    for (int i = 2; i <= n; i++) {
      bool isPrime = true;
      for (int j = 2; j < i; j++) {
        if (i % j == 0) {
          isPrime = false;
          break;
        }
      }
      if (isPrime) {
        bilanganPrima.add(i);
      }
    }
    return bilanganPrima;
  }
}
