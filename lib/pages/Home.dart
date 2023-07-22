import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Modulos/ModuleAnimacao.dart';
import '../Modulos/moduleBotaoInicio.dart';
import '../Modulos/moduleWeek.dart';
import '../Provider/providerSongs.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Provider_song itens = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Image.network(
                "https://cdn-icons-png.flaticon.com/512/3135/3135823.png"),
          )
        ],
        backgroundColor: const Color.fromARGB(255, 49, 49, 49),
      ),
      drawer: Drawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < itens.getDays.length; i++)
                      ModelesWeek(itens.getDays, i),
                  ],
                ),
                ModuleAnimacao(),
              ],
            )),
            Container(
              height: 300,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 40, 40, 0.774),
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(50),
                  topEnd: Radius.circular(50),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ModuleBotaoInicio(
                        Nome: "Jogar",
                        Icone: Icons.cloud_download_outlined,
                        Path: "/jogarPage",
                      ),
                      ModuleBotaoInicio(
                          Nome: "Música",
                          Icone: Icons.library_music_outlined,
                          Path: "/songPage")
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ModuleBotaoInicio(
                        Nome: "Texto",
                        Icone: Icons.keyboard_alt_outlined,
                        Path: "/textoPage",
                      ),
                      ModuleBotaoInicio(
                        Nome: "Colocar",
                        Icone: Icons.cloud_download_outlined,
                        Path: "/colocarPage",
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
