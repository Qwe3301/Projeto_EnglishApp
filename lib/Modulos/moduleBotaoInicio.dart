import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModuleBotaoInicio extends StatefulWidget {
  ModuleBotaoInicio({required this.Nome, required this.Icone, required this.Path});
  final String Nome;
  final IconData Icone;
  final String Path;

  @override
  State<ModuleBotaoInicio> createState() => _ModuleBotaoInicioState();
}

class _ModuleBotaoInicioState extends State<ModuleBotaoInicio> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(140, 130),
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(25))),
      onPressed: () => {Navigator.of(context).pushNamed(widget.Path)},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.Nome,
            style: TextStyle(
                fontSize: 25,
                fontFamily: "Kalan",
                color: const Color.fromARGB(255, 49, 49, 49),
                fontWeight: FontWeight.bold),
          ),
          Icon(
            widget.Icone,
            color: const Color.fromARGB(255, 49, 49, 49),
          )
        ],
      ),
    );
  }
}
