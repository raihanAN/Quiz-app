import 'package:flutter/material.dart';

class Starts extends StatelessWidget {
  const Starts(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.7,
            child: Image.asset(
              'assets/images/Puskesmas.png',
              width: 300,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Puskesmas.com",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
            ),
            label: const Text('Mulai'),
            icon: const Icon(Icons.login_sharp),
          ),
        ],
      ),
    );
  }
}
