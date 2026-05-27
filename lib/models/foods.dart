class Foods {
  final int id;
  final int estado;
  final int idType;
  final String name;
  final double top;
  final String time;
  final String img;

  Foods(
      {required this.id,
      required this.estado,
      required this.idType,
      required this.name,
      required this.top,
      required this.time,
      required this.img});

  factory Foods.fromMap(Map<String, dynamic> map) {
    return Foods(
      id: map['id'],
      estado: map['estado'],
      idType: map['id_type'],
      name: map['name'],
      top: map['top'],
      time: map['time'],
      img: map['img'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'estado': estado,
      'id_type': estado,
      'name': name,
      'top': top,
      'time': time,
      'img': img,
    };
  }
}

List<Foods> getFoods() {
  return foodsFinalista.map((item) => Foods.fromMap(item)).toList();
}

const List<Map<String, dynamic>> foodsFinalista = [
  {
    'id': 1,
    'estado': 1,
    'id_type': 1,
    'name': 'Ensalada Frutal con Higos',
    "top": 1.2,
    "time": "20",
    "img": "assets/images/food_headers/01/food_01.png",
  },
  {
    'id': 2,
    'estado': 1,
    'id_type': 2,
    'name': 'plato ',
    "top": 1.2,
    "time": "12",
    "img": "asdadsa,jpg",
  },
  {
    'id': 3,
    'estado': 1,
    'id_type': 2,
    'name': 'plato ',
    "top": 1.2,
    "time": "12",
    "img": "asdadsa,jpg",
  },
];
