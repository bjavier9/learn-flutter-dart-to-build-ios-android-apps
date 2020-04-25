
class Person {
  bool isActive;
  String balance;
  String picture;
  int age;
  String eyeColor;
  String name;
  String greeting;
  String favoriteFruit;

  Person({
    this.isActive,
    this.balance,
    this.picture,
    this.age,
    this.eyeColor,
    this.name,
    this.greeting,
    this.favoriteFruit,
  });

   Person.fromJsonMap( Map<String, dynamic> person ) {

    isActive      = person['isActive'];
    balance  = person['balance'];
    picture    = person['picture'];
    age      = person['age'];
    eyeColor          = person['eyeColor'];
    name        = person['name'];
    greeting       = person['greeting'];
    favoriteFruit = person['favoriteFruit'];

  }
}
