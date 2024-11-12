import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/suggestion/services/suggestionsList.dart';
import 'package:flutter_application_1/features/tracker/functions/formatTimer.dart';
import 'package:timer_controller/timer_controller.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({super.key});

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  int _selectedIndex = 0;
  late TimerController _controller;
  TextEditingController textEditingControllerTimer = TextEditingController();

  int _remainingTime = 0;

  @override
  void initState() {
    super.initState();
    _controller = TimerController.seconds(7200);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background for better readability
      appBar: AppBar(
        title: const Text("Time Tracker"),
        backgroundColor: const Color.fromARGB(255,216, 170, 150),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TimerControllerListener(
          controller: _controller,
          listenWhen: (previousValue, currentValue) =>
              previousValue.status != currentValue.status,
          listener: (context, timerValue) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Status: ${timerValue.status.name}'),
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Timer Display
              TimerControllerBuilder(
                controller: _controller,
                builder: (context, timerValue, _) {
                  Color timerColor = Colors.black;
                  switch (timerValue.status) {
                    case TimerStatus.initial:
                      timerColor = Colors.black;
                      break;
                    case TimerStatus.running:
                      timerColor = const Color.fromARGB(255,199, 211, 191);
                      break;
                    case TimerStatus.paused:
                      timerColor = Colors.grey;
                      break;
                    case TimerStatus.finished:
                      timerColor = Colors.red;
                      break;
                  }
                  return Center(
                    child: Text(
                      formatTime(timerValue.remaining),
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: timerColor,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),

              // Timer Input
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: textEditingControllerTimer,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Enter hours",
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Action Buttons
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: [
                // Variável para armazenar o tempo restante


_buildActionButton(
  title: "Start",
  color: const Color.fromARGB(255, 255, 201, 181),
  onPressed: () {
    setState(() {
      // Obtém o valor de entrada do usuário
      final input = textEditingControllerTimer.text;

      // Verifica se existe tempo restante para retomar de onde parou
      if (_remainingTime > 0) {
        // Retoma a partir do tempo restante
        _controller = TimerController.seconds(_remainingTime);
      } else {
        // Inicia um novo timer se não houver tempo restante
        _controller = TimerController.seconds(int.parse(input) * 3600);
        WorkerHours += int.parse(input);
      }

      // Começa o timer
      _controller.start();
    });
  },
),
_buildActionButton(
  title: "Pause",
  color: const Color.fromARGB(255, 247, 177, 171),
  onPressed: () {
    setState(() {
      // Armazena o tempo restante antes de pausar
      _remainingTime = _controller.value.remaining;
      _controller.pause();

      // Incrementa o contador de pausas
      PauseNumber += 1;
    });
  },
),

                  _buildActionButton(
                    title: "Reset",
                    color: const Color.fromARGB(255,216, 170, 150),
                    onPressed: () {
                      setState(() {
                        _controller.reset();
                      });
                    },
                  ),
                  _buildActionButton(
                    title: "Restart",
                    color: const Color.fromARGB(255,199, 211, 191),
                    onPressed: () {
                     setState(() {
                        _controller.restart();
                     });
                    },
                  ),
                  _buildActionButton(
                    title: "Add Timer",
                    color: const Color.fromARGB(255, 128, 113, 130),
                    onPressed: () {
                      setState(() {
                        _controller = TimerController.seconds(
                            int.parse(textEditingControllerTimer.text) * 3600);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Function for Action Buttons
  Widget _buildActionButton({
    required String title,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
