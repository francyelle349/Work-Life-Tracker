import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/suggestion/services/suggestionsList.dart';

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({super.key});

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  String workMethod = "";

  @override
  Widget build(BuildContext context) {
    setState(() {
      workMethod = WorkerHoursMethod(WorkerHours);
    });

    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background for readability
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Main Suggestion Text with a Border
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color.fromARGB(255, 247, 177, 171), width: 2),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: Text(
                workMethod.isEmpty
                    ? "Too many pauses? Aim for uninterrupted focus periods"
                    : workMethod,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),

            // Row of Hours Worked and Paused Numbers
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Hours Worked
                _buildInfoCard(
                  title: "Hours Worked",
                  value: WorkerHours.toString(),
                  icon: Icons.timer,
                  color: Color.fromARGB(255,199, 211, 191),
                ),
                const SizedBox(width: 20), // Space between cards
                // Paused Numbers
                _buildInfoCard(
                  title: "Paused Numbers",
                  value: PauseNumber.toString(),
                  icon: Icons.pause_circle,
                  color: Color.fromARGB(255, 255, 201, 181),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Info Cards
  Widget _buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.5), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
