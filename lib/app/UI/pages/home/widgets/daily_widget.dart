import 'package:flutter/material.dart';

import 'package:best_self/app/UI/json/day_month.dart';



class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  int activeDay = 0;
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    
    var color = Theme.of(context);
    return SingleChildScrollView(
      child: Container(
        color: color.primaryColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 5, right: 20, left: 20, bottom: 2),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(days.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          activeDay = index;
                        });
                      },
                      child: Container(
                        width: (MediaQuery.of(context).size.width - 40) / 7,
                        child: Column(
                          children: [
                            Text(
                              days[index]['label'],
                              style: const TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: activeDay == index
                                      ? color.canvasColor
                                      : Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: activeDay == index
                                          ? color.primaryColor
                                          : Colors.black.withOpacity(0.5))),
                              child: Center(
                                child: Text(
                                  days[index]['day'],
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: activeDay == index
                                          ? color.primaryColor
                                          : color.cardColor),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
