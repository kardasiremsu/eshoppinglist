

import 'food_information.dart';

void deleteIngredient(int index){
  for(int i = 0; i < Data.takenShoppingList.keys.elementAt(index).ingredients.length; i++){
    if(Data.takenShoppingList.keys.elementAt(index).ingredients[i].quantity>1){
      print("azaltma ${Data.takenShoppingList.keys.elementAt(index).ingredients[i].name}");
      Data.takenShoppingList.keys.elementAt(index).ingredients[i].quantity--;
    }
    else if(Data.takenShoppingList.keys.elementAt(index).ingredients[i].quantity==1){
      print("silme: ${Data.takenShoppingList.keys.elementAt(index).ingredients[i].name}");
      Data.shoppingCart.remove(Data.takenShoppingList.keys.elementAt(index).ingredients[i]);
    }}
}
void deleteFood(int index){
  print("Yemek Silme: ${Data.takenShoppingList.keys.elementAt(index).name}");
  if(Data.takenShoppingList.values.elementAt(index) == 1){ //bir yemeği silecekse
    Data.takenShoppingList.remove(Data.takenShoppingList.keys.elementAt(index));
    deleteIngredient(index);
  }

  else{ //Birden fazla aynı yemeği silecekse
    Data.takenShoppingList.remove(Data.takenShoppingList.keys.elementAt(index));
    for(int j=0; j< Data.takenShoppingList.values.elementAt(index).toInt(); j++){

      deleteIngredient(index);
    }
  }


}

