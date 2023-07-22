import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/providerSongs.dart';

class SonsBotao extends StatefulWidget {
  int i;
  SonsBotao({super.key, required this.i});

  @override
  State<SonsBotao> createState() => _SonsBotaoState();
}

class _SonsBotaoState extends State<SonsBotao> {
  @override
  Widget build(BuildContext context) {
    final Provider_song dateSongProvide = Provider.of(context);
    return Column(
      children: [
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: () => {
            Navigator.of(context).pushNamed("/pageSong",
                arguments: dateSongProvide.pegarSongs[widget.i])
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(330, 70),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.all(Radius.circular(25)),
            ),
          ),
          child: Text(dateSongProvide.pegarSongs[widget.i].nome),
        ),
      ],
    );
  }
}
