import 'food_information.dart';

void addFood(categoryIndex, index){
  if(Data.takenShoppingList.containsKey(Data.categories[categoryIndex].foods[index])){
    Data.takenShoppingList[Data.categories[categoryIndex].foods[index]] = Data.takenShoppingList[Data.categories[categoryIndex].foods[index]]!+1; //value 1 arttırma
  }
  else{
    Data.takenShoppingList[Data.categories[categoryIndex].foods[index]] = 1;
  }
}

void addIngredient(categoryIndex, index){ //index which food
  for (int i = 0; i < Data.categories[categoryIndex].foods[index].ingredients.length; i++) {
    if (Data.shoppingCartNames.contains(Data.categories[categoryIndex].foods[index].ingredients[i].name)) { //içinde varsa
      int value = Data.shoppingCartNames.indexOf(Data.categories[categoryIndex].foods[index].ingredients[i].name); //hangi indexteyse
      Data.shoppingCart[value].quantity +=Data.numberOfPerson.toInt()*Data.categories[categoryIndex].foods[index].ingredients[i].quantity;
      print('Miktarı arttırılan: ${Data.shoppingCart[value].name}, quantity: ${Data.shoppingCart[value].quantity}');
    }
    else {
      Data.shoppingCartNames.add(Data.categories[categoryIndex].foods[index].ingredients[i].name);
      //print("Names ${Data.shoppingCartNames[Data.shoppingCartNames.length-1]} eklendi");
      //print("Ad ${foods[index].ingredients[i].name}, quantity: ${foods[index].ingredients[i].quantity}");
      Data.shoppingCart.add(Ingrediendt(id: Data.categories[categoryIndex].foods[index].ingredients[i].id, name: Data.categories[categoryIndex].foods[index].ingredients[i].name, quantity: Data.categories[categoryIndex].foods[index].ingredients[i].quantity*Data.numberOfPerson.toInt()));
      print('Yeni eklenen: ${Data.shoppingCart[Data.shoppingCart.length-1].name}, quantity: ${Data.shoppingCart[Data.shoppingCart.length-1].quantity}');
    }
  }
}