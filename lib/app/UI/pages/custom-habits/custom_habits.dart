import 'package:flutter/material.dart';

void showHabitForm(BuildContext context, Size size) {
  final TextEditingController habitController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  List<bool> selectedDays = List<bool>.filled(7, false);

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
        child: Container(
          height: size.height * 0.8,
          color: Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Crea tu nuevo habito',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextField(
                      controller: habitController,
                      decoration: const InputDecoration(
                        labelText: 'Ingrese su hábito',
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        final TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                        );
                        if (picked != null && picked != selectedTime) {
                          selectedTime = picked;
                        }
                      },
                      child: Text(
                          'Seleccione una hora: ${selectedTime.format(context)}'),
                    ),
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Seleccione los días:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(7, (index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  color: selectedDays[index]
                                      ? Colors.blue
                                      : Colors.grey,
                                  width:
                                      2.0, // Aumenta el grosor del borde aquí
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Cambia el radio del borde aquí
                                ),
                              ),
                              onPressed: () {
                                selectedDays[index] = !selectedDays[index];
                                // Redraw the widget to reflect the change in color
                                (context as Element).markNeedsBuild();
                              },
                              child: Text(
                                _getDayName(index),
                                style: TextStyle(
                                  color: selectedDays[index]
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 8.0), // Agrega margen superior aquí
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'En caso de no seleccionar días, se tomará como hábito diario',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Fondo blanco
                    foregroundColor: const Color.fromARGB(
                        255, 242, 242, 242), // Letras azul oscuro
                    shadowColor: Colors.black, // Color de la sombra
                    elevation: 5, // Tamaño de la sombra
                    side: const BorderSide(
                      color: Color.fromARGB(
                          255, 230, 230, 230), // Borde de color azul
                      width: 1, // Grosor del borde
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Bordes redondeados
                    ),
                  ).copyWith(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.pressed)) {
                          return Colors.blue; // Fondo azul cuando se presiona
                        }
                        return Colors.white; // Fondo blanco por defecto
                      },
                    ),
                    foregroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.pressed)) {
                          return Colors
                              .white; // Letras blancas cuando se presiona
                        }
                        return const Color.fromARGB(255, 128, 128,
                            128); // Letras azul oscuro por defecto
                      },
                    ),
                    side: WidgetStateProperty.resolveWith<BorderSide>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.pressed)) {
                          return const BorderSide(
                              color: Colors.blue,
                              width: 1); // Borde azul cuando se presiona
                        }
                        return const BorderSide(
                            color: Color.fromARGB(255, 242, 242, 242),
                            width: 1); // Borde gris por defecto
                      },
                    ),
                  ),
                  child: const Text('Guardar Hábito'),
                  onPressed: () {
                    // Aquí puedes manejar el guardado del hábito
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

String _getDayName(int index) {
  switch (index) {
    case 0:
      return 'Lunes';
    case 1:
      return 'Martes';
    case 2:
      return 'Miércoles';
    case 3:
      return 'Jueves';
    case 4:
      return 'Viernes';
    case 5:
      return 'Sábado';
    case 6:
      return 'Domingo';
    default:
      return '';
  }
}
