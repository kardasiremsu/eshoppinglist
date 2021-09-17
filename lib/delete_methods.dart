

import 'food_information.dart';

void deleteIngredient(int index) {
  Food food = Data.takenShoppingList.keys.elementAt(index);
  for (int i = 0; i < food.ingredients.length; i++) {
    int value = Data.shoppingCartNames.indexOf(
        food.ingredients[i].name); //hangi indexteyse

    if (Data.shoppingCart[value].quantity -
        food.ingredients[i].quantity * Data.numberOfPerson.toInt() >
        0) { //Shopping cartta quantity*kiiş sayısından fazla içerik varsa azalt

      Data.shoppingCart[value].quantity = Data.shoppingCart[value].quantity -
          food.ingredients[i].quantity * Data.numberOfPerson.toInt();
      print("azaltma ${food.ingredients[i].name}, quantity:${Data
          .shoppingCart[value].quantity}");
    }
    else if (Data.shoppingCart[value].quantity -
        food.ingredients[i].quantity * Data.numberOfPerson.toInt() <=
        0) { //0 sa sil
      print("silme: ${food.ingredients[i].name}");

      Data.shoppingCart.removeAt(value);
    }
  }
}
void deleteFood(int index) {
  print("Yemek Silme: ${Data.takenShoppingList.keys
      .elementAt(index)
      .name}");
  if (Data.takenShoppingList.values.elementAt(index) ==
      1) { //bir yemeği silecekse
    Data.takenShoppingList.remove(Data.takenShoppingList.keys.elementAt(index));
    deleteIngredient(index);
  }

  else { //Birden fazla aynı yemeği silecekse
    Data.takenShoppingList.remove(Data.takenShoppingList.keys.elementAt(index));
    for (int j = 0; j <
        Data.takenShoppingList.values.elementAt(index).toInt(); j++) {
      deleteIngredient(index);
    }
  }
}
