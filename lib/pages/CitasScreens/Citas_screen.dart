import 'package:carttrack/pages/CitasScreens/Crear_citas_screen.dart';
import 'package:carttrack/pages/CitasScreens/Programar_cita_screen.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../../components/CartTrackComponents/header.dart';
import '../../components/CartTrackComponents/footer.dart';
import '../../components/main_button.dart';
import '../../components/CartTrackComponents/calendar.dart';

// Define the date range for the calendar
final firstDay = DateTime.utc(2025, 1, 1);
final lastDay = DateTime.utc(2025, 12, 31);

class CitasScreen extends StatefulWidget {
  const CitasScreen({super.key});

  @override
  State<CitasScreen> createState() => _CitasScreenState();
}

class _CitasScreenState extends State<CitasScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  late DateTime _focusedDay;
  late DateTime? currentDay;
  DateTime? _selectedDay;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    // Set _focusedDay based on the current date
    if (now.isBefore(firstDay)) {
      _focusedDay = firstDay;
    } else if (now.isAfter(lastDay)) {
      _focusedDay = lastDay;
    } else {
      _focusedDay = now;
    }
    // Set currentDay only if it falls within the range, otherwise null
    currentDay = (now.isAfter(firstDay) && now.isBefore(lastDay)) ? now : null;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBF5FC),
      body: Stack(
        children: [
          Column(
            children: [
              Header(
                height: 217,
                opacity: 0.2,
                showBackArrow: true,
                onBackPressed: () => Navigator.pop(context),
                backArrowColor: 'images/icons/left_arrow_white.png',
                title: 'Citas',
                icon: 'images/icons/citas_header.png',
                widthA: 190.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: SizedBox(
                            width: 327,
                            child: MainButton(
                              text: 'Solicitar Cita',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProgramarCitaScreen()));
                              },
                              backgroundColor: const Color(0xFF0500C6),
                              textColor: Colors.white,
                              height: 70,
                              margin: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Citas Activas (1)",
                                style: TextStyle(
                                  color: Color(0xFF0500C6),
                                  fontSize: 20,
                                  fontFamily: 'Mundial',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                height: 67,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xFFC8DCEA),
                                      offset: Offset(0, 4),
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "Reparación",
                                          style: TextStyle(
                                            color: Color(0xFF0500C6),
                                            fontSize: 18,
                                            fontFamily: 'Mundial',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Tahoe 2024 | 01-08-2024",
                                          style: TextStyle(
                                            color: Color(0xFF6B7280),
                                            fontSize: 14,
                                            fontFamily: 'Mundial',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 40),
                              const Text(
                                "Pendiente (0)",
                                style: TextStyle(
                                  color: Color(0xFF0500C6),
                                  fontSize: 20,
                                  fontFamily: 'Mundial',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "No hay citas pendientes de aprobación.",
                                style: TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 16,
                                  fontFamily: 'Mundial',
                                ),
                              ),
                              const SizedBox(height: 40),
                              const Text(
                                "Calendario de Citas",
                                style: TextStyle(
                                  color: Color(0xFF0500C6),
                                  fontSize: 20,
                                  fontFamily: 'Mundial',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomCalendar(
                                firstDay: firstDay,
                                lastDay: lastDay,
                                selectedDay: _selectedDay,
                                onDaySelected: (selectedDay, focusedDay) {
                                  setState(() {
                                    _selectedDay = selectedDay;
                                    _focusedDay = focusedDay;
                                  });
                                },
                              ),
                              SizedBox(height: 100)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Footer(),
          ),
        ],
      ),
    );
  }
}
