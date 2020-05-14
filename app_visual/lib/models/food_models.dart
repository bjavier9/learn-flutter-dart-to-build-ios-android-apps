class FoodModel {
  final String name;
  final double price;
  final double weight;
  final double calory;
  final double protein;
  final String item;
  final String imgPath;

  FoodModel(
      {this.name,
      this.price,
      this.weight,
      this.calory,
      this.protein,
      this.item,
      this.imgPath});

  static List<FoodModel> list = [
    FoodModel(
        name: "Tacos de wacamole",
        price: 3.56,
        calory: 356,
        protein: 34,
        item:
            'Tacos de trozos de lomo de cerdo marinados en una salsa de tres chiles con jugos de naranja y piña. Deliciosos en sus tortillas de maíz recién hechas, con rebanadas de piña, cilantro y cebolla.',
        weight: 12.00,
        imgPath:
            'https://foodandtravel.mx/wp-content/uploads/2017/02/shutterstock_567759586.jpg'),
    FoodModel(
        name: "Pescado Frito",
        price: 3.56,
        calory: 356,
        protein: 34,
        item:
            'Tacos de trozos de lomo de cerdo marinados en una salsa de tres chiles con jugos de naranja y piña. Deliciosos en sus tortillas de maíz recién hechas, con rebanadas de piña, cilantro y cebolla.',
        weight: 12.00,
        imgPath:
            'https://static.vix.com/es/sites/default/files/styles/1x1/public/imj/elgranchef/c/como-preparar-pescado-frito-.jpg?itok=q3uAvXD3'),
    FoodModel(
        name: "Desayuno tipico",
        price: 3.56,
        calory: 356,
        protein: 34,
        item:
            'Tacos de trozos de lomo de cerdo marinados en una salsa de tres chiles con jugos de naranja y piña. Deliciosos en sus tortillas de maíz recién hechas, con rebanadas de piña, cilantro y cebolla.',
        weight: 12.00,
        imgPath:
            'https://i.pinimg.com/originals/9e/33/2c/9e332cf2dc6788a27ee2d9dc8d0c53cd.jpg')
  ];
}
