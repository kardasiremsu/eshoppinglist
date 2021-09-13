
class Ingrediendt{
  int id;
  String name;
  int quantity;
  Ingrediendt({required this.id, required this.name, required this.quantity});
}

class Food{
  int id;
  String name;
  List<Ingrediendt> ingredients;
  String image;
  Food({required this.id, required this.name, required this.ingredients, required this.image});
}

class Category{
  int id;
  String name;
  List<Food> foods;
  Category({required this.id, required this.name, required this.foods});
}

class Data{
  static List<Ingrediendt> ingredients = getIngredients();
  static List<Food> soups = getSoups();
  static List<Food> mainfoods = getMainFood();
  static Map<Food,int> takenShoppingList = new Map<Food,int>();
  static List<Ingrediendt> shoppingCart = List<Ingrediendt>.empty(growable: true);
  static List<Category> categories = getCategories();
  static double numberOfPerson = 0;
  static List<Category> getCategories() => <Category>[
    new Category(id: 0, name: 'Çorbalar', foods: soups),
    new Category(id: 1, name:'Ana Yemekler', foods: mainfoods),
    // new Category(id: 2, name: 'Salata/Meze', foods: salads),
    // new Category(id: 3, name: 'Tatlı', foods: sweets),
//deneme
  ];
  static List<Ingrediendt> getIngredients() => <Ingrediendt>[
    new Ingrediendt(id: 0, name: 'Salça', quantity: 0),
    new Ingrediendt(id: 1, name: 'Tuz', quantity: 0),
    new Ingrediendt(id: 2, name: 'Pirinç', quantity: 0),
    new Ingrediendt(id: 3, name: 'Soğan', quantity: 0),
    new Ingrediendt(id: 4, name: 'Yağ', quantity: 0),
    new Ingrediendt(id: 5, name: 'Sarımsak', quantity: 0),
    new Ingrediendt(id: 6, name: 'Patates', quantity: 0),
    new Ingrediendt(id: 7, name: 'Domates', quantity: 0),
    new Ingrediendt(id: 8, name: 'Kırmızı Mercimek', quantity: 0),
    new Ingrediendt(id: 9, name: 'Un', quantity: 0),
    new Ingrediendt(id: 10, name: 'Bulgur', quantity: 0),
    new Ingrediendt(id: 11, name: 'Tavuk', quantity: 0),
  ];
  static List<Food> getSoups() => <Food>[
    new Food(id: 0, name: 'Mercimek Çorbası', ingredients: <Ingrediendt>[ ingredients[0], ingredients[1], ingredients[8],ingredients[9]],
    //<int>[0,1,8,9],
    // <Ingrediendt>[
    //   new Ingrediendt(id: ingredients[0].id, name: ingredients[0].name, quantity: 50),
    //   new Ingrediendt(id: ingredients[1].id, name: ingredients[1].name, quantity: 10),
    //   new Ingrediendt(id: ingredients[8].id, name: ingredients[8].name, quantity: 100),
    //   new Ingrediendt(id: ingredients[9].id, name: ingredients[9].name, quantity: 50)],
        image: 'assets/images/foto0.jpg'),
    new Food(id: 1, name: 'Ezogelin Çorbası', ingredients: <Ingrediendt>[ ingredients[10], ingredients[1], ingredients[4]],
    //<int>[1,10,4],
    // <Ingrediendt>[new Ingrediendt(id: ingredients[0].id, name: ingredients[0].name, quantity: 100),
    //   new Ingrediendt(id: ingredients[1].id, name: ingredients[1].name, quantity: 10),
    //   new Ingrediendt(id: ingredients[10].id, name: ingredients[10].name, quantity: 100),
    //   new Ingrediendt(id: ingredients[4].id, name: ingredients[4].name, quantity: 10)],
        image: 'assets/images/foto1.jpg'),
    new Food(id: 2, name: 'Tavuk Suyu Çorbası', ingredients:
     <Ingrediendt>[ ingredients[0], ingredients[11], ingredients[4]],
    //   new Ingrediendt(id: ingredients[1].id, name: ingredients[1].name, quantity: 10),
    //   new Ingrediendt(id: ingredients[11].id, name: ingredients[11].name, quantity: 200),
    //   new Ingrediendt(id: ingredients[4].id, name: ingredients[4].name, quantity: 10)],
        image: 'assets/images/foto2.jpg')
  ];
  static List<Food> getMainFood() => <Food>[
    new Food(id: 0, name: 'Karnı Yarık', ingredients: <Ingrediendt>[ ingredients[2], ingredients[5], ingredients[8]],
    //<int>[0,1,8,9],
    // <Ingrediendt>[
    //   new Ingrediendt(id: ingredients[0].id, name: ingredients[0].name, quantity: 50),
    //   new Ingrediendt(id: ingredients[1].id, name: ingredients[1].name, quantity: 10),
    //   new Ingrediendt(id: ingredients[8].id, name: ingredients[8].name, quantity: 100),
    //   new Ingrediendt(id: ingredients[9].id, name: ingredients[9].name, quantity: 50)],
        image: 'assets/images/foto100.jpg'),
    new Food(id: 1, name: 'Pilav', ingredients: <Ingrediendt>[ ingredients[0], ingredients[7], ingredients[3]],
    //<int>[0,1,8,9],
    // <Ingrediendt>[
    //   new Ingrediendt(id: ingredients[0].id, name: ingredients[0].name, quantity: 50),
    //   new Ingrediendt(id: ingredients[1].id, name: ingredients[1].name, quantity: 10),
    //   new Ingrediendt(id: ingredients[8].id, name: ingredients[8].name, quantity: 100),
    //   new Ingrediendt(id: ingredients[9].id, name: ingredients[9].name, quantity: 50)],
        image: 'assets/images/foto101.jpg'),
    new Food(id: 2, name: 'Nohut Yemeği', ingredients: <Ingrediendt>[ ingredients[0], ingredients[1], ingredients[8], ingredients[9]],
    //<int>[0,1,8,9],
    // <Ingrediendt>[
    //   new Ingrediendt(id: ingredients[0].id, name: ingredients[0].name, quantity: 50),
    //   new Ingrediendt(id: ingredients[1].id, name: ingredients[1].name, quantity: 10),
    //   new Ingrediendt(id: ingredients[8].id, name: ingredients[8].name, quantity: 100),
    //   new Ingrediendt(id: ingredients[9].id, name: ingredients[9].name, quantity: 50)],
        image: 'assets/images/foto102.jpg')
  ];


}