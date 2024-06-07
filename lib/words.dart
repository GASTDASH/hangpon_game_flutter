import 'dart:math';

String get_random_word(String theme) {
  Random _random = new Random();
  String _word = word_list[theme][_random.nextInt(word_list[theme].length)];

  return _word;
}

List<String> words_general = <String>[
  // "дженнифер",
  // "вильям",
  "яблоко",
  "молния",
  "майнкрафт",
  "лошадь",
  "земля",
  "мороз",
  "слово",
  "проверка",
  "бабочка",
  "алмаз",
  "проверка",
  "самовар",
  "милосердие",
  "плутоний",
  "боеголовка",
  "реальность",
  "пиво",
  "блокировка",
  "виноделие",
  "цианид",
  "напиток",
  "проблема",
  "отношение",
  "любовь",
  "книга",
  "смысл",
  "общение",
  "курица",
  "рисование",
  "медведь",
  "звезда",
  "улица",
  "птица",
  "помощь",
  "свет",
  "угол",
  "математика",
  "геометрия",
  "голова",
  "мысль",
  "квадрат",
  "изумруд",
];

List<String> words_pony = <String>[
  "пони",
  "хвост",
  "искорка",
  "единорог",
  "пегас",
  "копыто",
  "подкова",
  "грива",
  "эквестрия",
  "крыло",
  "магия",
  "дракон",
  "дружба",
  "чудо",
];

List<String> words_all = words_general + words_pony;

Map word_list = {
  "all": words_all,
  "general": words_general,
  "pony": words_pony,
};
