import 'package:flutter/cupertino.dart';

import '../class/classSongs.dart';
import '../class/class_week.dart';
import '../class/class_words.dart';
import '../dummy_data/data.dart';

class Provider_song extends ChangeNotifier {
  final Map<int, classSongs> _Songs_atuai = {...songData};

  List<classSongs> get pegarSongs {
    return [..._Songs_atuai.values];
  }

  classSongs PeloIndex(index) {
    return _Songs_atuai.values.elementAt(index);
  }

  void adicionar(id, nameSong, song, nota) {
    _Songs_atuai.putIfAbsent(id, () => classSongs(id, nameSong, song, nota));
    notifyListeners();
  }

  final Map<String, ClassWeek> _week = {...semanas};

  List<ClassWeek> get getDays {
    return [..._week.values];
  }

  List<class_words> words = [];

  void addWords(word) {
    words.add(word);
    notifyListeners();
  }
}
