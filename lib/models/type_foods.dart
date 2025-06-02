class TypeFood {
  final int id;
  final int estado;
  final String nombre;
  final String img;

  TypeFood({
    required this.id,
    required this.estado,
    required this.nombre,
    required this.img,
  });

  factory TypeFood.fromMap(Map<String, dynamic> map) {
    return TypeFood(
      id: map['id'],
      estado: map['estado'],
      nombre: map['nombre'],
      img: map['img'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'estado': estado,
      'nombre': nombre,
      'img': img,
    };
  }
}

List<TypeFood> getTypeFoods() {
  return typeFoods.map((item) => TypeFood.fromMap(item)).toList();
}

const List<Map<String, dynamic>> typeFoods = [
  { 'id': 1, 'estado': 1, 'nombre': 'Entradas / Aperitivos', 'img': 'assets/images/01.jpg' },
  { 'id': 2, 'estado': 1, 'nombre': 'Platos principales', 'img': 'assets/images/02.jpg' },
  { 'id': 3, 'estado': 1, 'nombre': 'Acompañamientos / Guarniciones', 'img': 'assets/images/03.jpg' },
  { 'id': 4, 'estado': 1, 'nombre': 'Ensaladas', 'img': 'assets/images/04.jpg' },
  { 'id': 5, 'estado': 1, 'nombre': 'Sopas y caldos', 'img': 'assets/images/05.jpg' },
  { 'id': 6, 'estado': 1, 'nombre': 'Postres', 'img': 'assets/images/06.jpg' },
  { 'id': 7, 'estado': 1, 'nombre': 'Bebidas', 'img': 'assets/images/07.jpg' },
  { 'id': 8, 'estado': 1, 'nombre': 'Salsas y aderezos', 'img': 'assets/images/08.jpg' },
  { 'id': 9, 'estado': 1, 'nombre': 'Snacks / Picoteo', 'img': 'assets/images/09.jpg' },
];
