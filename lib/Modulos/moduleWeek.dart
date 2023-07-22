import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../class/class_week.dart';

class ModelesWeek extends StatefulWidget {
  List<ClassWeek> getDays;
  int i;
  ModelesWeek(this.getDays, this.i);

  @override
  State<ModelesWeek> createState() => _ModelesWeekState();
}

class _ModelesWeekState extends State<ModelesWeek> {
  MaterialColor Cor() {
    var cor_atual = Colors.grey;
    widget.getDays[widget.i].done
        ? cor_atual = Colors.green
        : widget.getDays[widget.i].needToDo
            ? cor_atual = Colors.grey
            : cor_atual = Colors.red;
    return cor_atual;
  }

  BorderRadius Borda() {
    var borda;
    if (widget.i == 0) {
      return borda = BorderRadius.only(
          bottomLeft: Radius.circular(25), topLeft: Radius.circular(25));
    }
    if (widget.i == 6) {
      return borda = BorderRadius.only(
          bottomRight: Radius.circular(25), topRight: Radius.circular(25));
    }
    return borda = BorderRadius.circular(0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 15,
            decoration: BoxDecoration(
              color: Cor(),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          Text(
            widget.getDays[widget.i].day,
            style: TextStyle(
              fontFamily: "Kalan",
              fontSize: 20,
              color: Cor(),
            ),
          ),
        ],
      ),
    );
  }
}
