import 'package:flutter/material.dart';

class PersonData extends StatelessWidget {
  const PersonData({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage("https://i.pravatar.cc/100?img=1"),
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Laura Wilson", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Lagos, Nigeria", style: TextStyle(color: Colors.grey)),
          ],
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Follow"),
        ),
      ],
    );
  }
}
