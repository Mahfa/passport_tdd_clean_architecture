import 'package:flutter/material.dart';

class LoadFailed extends StatelessWidget{
  final VoidCallback onRetry;

  const LoadFailed(this.onRetry, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 512, maxWidth: 256),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 44, color: Colors.red),
                const SizedBox(width: 16, height: 16),
                const Text(
                  "load failed please retry later",
                  style: TextStyle(color: Colors.red),
                ),
                const SizedBox(width: 16, height: 16),
                ElevatedButton(
                  onPressed: onRetry,
                  child: const Text("retry"),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}