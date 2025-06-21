import 'package:flutter/material.dart';

class StepsList extends StatelessWidget {

  final int idFood;
  final String name;
  final String description;

  const StepsList({super.key, required this.idFood, required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$idFood - $name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 6),
              Text(
                description,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 10),
              Text(
                "10 mins ago",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 16),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFFFFF1DC), // fondo naranja claro
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.notifications, // puedes cambiarlo por otro ícono
            color: Colors.orange,
            size: 24,
          ),
        )
      ],
    );
  }
}
