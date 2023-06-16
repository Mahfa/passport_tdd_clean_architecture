import 'package:flutter/material.dart';

typedef EnterNameWidgetCallback = Function(String name);

class EnterNameWidget extends StatefulWidget {
  final EnterNameWidgetCallback onConfirm;

  const EnterNameWidget(this.onConfirm, {super.key});

  @override
  State<StatefulWidget> createState() => _EnterNameWidgetState();
}

class _EnterNameWidgetState extends State<EnterNameWidget> {
  TextEditingController nameTEC = TextEditingController();

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
                const Icon(Icons.person, size: 44, color: Colors.blue),
                const SizedBox(width: 16, height: 16),
                TextField(
                  controller: nameTEC,
                  maxLength: 50,
                  decoration: const InputDecoration(hintText: "name"),
                ),
                const SizedBox(width: 16, height: 16),
                ElevatedButton(
                  onPressed: () => widget.onConfirm(nameTEC.text),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search, size: 16, color: Colors.white),
                      SizedBox(width: 8, height: 8),
                      Text("get passport info"),
                    ],
                  ),
                ),
                const SizedBox(width: 16, height: 16),
                const Text(
                  "** no matter what you enter as name a random passport info will show every time :)",
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameTEC.dispose();
    super.dispose();
  }
}
