import 'package:carttrack/components/CartTrackComponents/header.dart';
import 'package:flutter/material.dart';
import 'package:carttrack/components/CartTrackComponents/footer.dart';
import 'package:carttrack/components/main_button.dart';
import 'package:carttrack/components/CartTrackComponents/citas_card.dart';
import 'package:carttrack/components/CartTrackComponents/calendar.dart';

class ProgramarCitaScreen extends StatefulWidget {
  const ProgramarCitaScreen({super.key});

  @override
  State<ProgramarCitaScreen> createState() => _ProgramarCitaScreenState();
}

class _ProgramarCitaScreenState extends State<ProgramarCitaScreen> {
  int? selectedCardIndex;
  TimeOfDay selectedTime = TimeOfDay(hour: 11, minute: 30);
  String selectedVehicle = "Tesla Model X 2023";

  final List<String> vehicles = [
    "Tesla Model X 2023",
    "Chevrolet Tahoe 2025",
  ];

  void _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFF0500C6),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _selectVehicle() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: ListView.builder(
            itemCount: vehicles.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  vehicles[index],
                  style: TextStyle(
                    color: Color(0xFF0500C6),
                    fontFamily: 'Mundial',
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedVehicle = vehicles[index];
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF5FC),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
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
                SizedBox(height: 54),
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Solicita una Cita",
                      style: TextStyle(
                        color: Color(0xFF0500C6),
                        fontSize: 30,
                        fontFamily: 'Mundial',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 34),
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tipo de Cita",
                      style: TextStyle(
                        color: Color(0xFF0500C6),
                        fontSize: 20,
                        fontFamily: 'Mundial',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 14),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Primera columna
                      Column(
                        children: [
                          ReparacionCard(
                            textCard: 'Mantenimiento',
                            isSelected: selectedCardIndex == 0,
                            onTap: () => setState(() => selectedCardIndex = 0),
                          ),
                          SizedBox(height: 16),
                          ReparacionCard(
                            textCard: 'Aire\nAcondicionado',
                            isSelected: selectedCardIndex == 1,
                            onTap: () => setState(() => selectedCardIndex = 1),
                          ),
                          SizedBox(height: 16),
                          ReparacionCard(
                            textCard: 'Revisión\nEléctrica',
                            isSelected: selectedCardIndex == 2,
                            onTap: () => setState(() => selectedCardIndex = 2),
                          ),
                        ],
                      ),
                      SizedBox(width: 16),
                      // Segunda columna
                      Column(
                        children: [
                          ReparacionCard(
                            textCard: 'Reparación',
                            isSelected: selectedCardIndex == 3,
                            onTap: () => setState(() => selectedCardIndex = 3),
                          ),
                          SizedBox(height: 16),
                          ReparacionCard(
                            textCard: 'Frenos',
                            isSelected: selectedCardIndex == 4,
                            onTap: () => setState(() => selectedCardIndex = 4),
                          ),
                          SizedBox(height: 16),
                          ReparacionCard(
                            textCard: 'Revisión\nGeneral',
                            isSelected: selectedCardIndex == 5,
                            onTap: () => setState(() => selectedCardIndex = 5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14),
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Selecciona una Fecha",
                      style: TextStyle(
                        color: Color(0xFF0500C6),
                        fontSize: 20,
                        fontFamily: 'Mundial',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: CustomCalendar(
                    firstDay: DateTime.now(),
                    lastDay: DateTime.now().add(const Duration(days: 365)),
                    onDaySelected: (selectedDay, focusedDay) {
                      // Handle the selected date here
                    },
                  ),
                ),
                SizedBox(height: 14),
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Selecciona una Hora",
                      style: TextStyle(
                        color: Color(0xFF0500C6),
                        fontSize: 20,
                        fontFamily: 'Mundial',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 14),
                Container(
                  width: 327,
                  height: 67,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFC8DCEA),
                        offset: Offset(0, 4),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: _selectTime,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedTime.format(context),
                          style: TextStyle(
                            color: Color(0xFF0500C6),
                            fontSize: 20,
                            fontFamily: 'Mundial',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.keyboard_arrow_up,
                                color: Color(0xFF0500C6)),
                            Icon(Icons.keyboard_arrow_down,
                                color: Color(0xFF0500C6)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 44),
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Vehículo",
                      style: TextStyle(
                        color: Color(0xFF0500C6),
                        fontSize: 20,
                        fontFamily: 'Mundial',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 14),
                Container(
                  width: 327,
                  height: 99,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFC8DCEA),
                        offset: Offset(0, 4),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: _selectVehicle,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedVehicle,
                          style: TextStyle(
                            color: Color(0xFF0500C6),
                            fontSize: 20,
                            fontFamily: 'Mundial',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.keyboard_arrow_up,
                                color: Color(0xFF0500C6)),
                            Icon(Icons.keyboard_arrow_down,
                                color: Color(0xFF0500C6)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 100)
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Footer(),
          )
        ],
      ),
    );
  }
}
