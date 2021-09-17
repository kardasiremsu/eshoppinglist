import 'dart:math';

import 'package:flutter/services.dart';

import 'add_methods.dart';
import 'food_information.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'constants.dart';
import 'delete_methods.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.yellow[300],
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == MyHomePage.routeName) {
          return MaterialPageRoute(builder: (context) => MyHomePage());
        }
        if(settings.name == FoodCategories.routeName){
          return MaterialPageRoute(builder: (context) => FoodCategories());
        }
        if(settings.name == FoodPage.routeName){
          return MaterialPageRoute(builder: (context) => FoodPage(settings.arguments as int));
        }
        if(settings.name == ShoppingCartPage.routeName){
          return MaterialPageRoute(builder: (context) => ShoppingCartPage());//ettings.arguments as ShoppingCartArgument
        }
        if(settings.name == ShoppingCartFoodPage.routeName){
          return MaterialPageRoute(builder: (context) => ShoppingCartFoodPage());//ettings.arguments as ShoppingCartArgument
        }
        return null;
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static String routeName = '/';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedMenu = 0;
  String warning ='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: selectedMenu == 1
                          ? Colors.blueGrey[100]
                          : Colors.white,
                      side: BorderSide(color: Colors.blueGrey, width: 3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  onPressed: () {
                    setState(() {
                      selectedMenu = 1;
                      warning ='';
                    });
                  },
                  child: Text('Haftalık Listemi Oluştur',
                      textAlign: TextAlign.center, style: kMetinStili),
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: selectedMenu == 2
                          ? Colors.blueGrey[100]
                          : Colors.white,
                      side: BorderSide(color: Colors.blueGrey, width: 3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  onPressed: () {
                    setState(() {
                      selectedMenu = 2;
                      warning ='';
                    });
                  },
                  child: Text('Haftalık Listemi Oluşturayım',
                      textAlign: TextAlign.center, style: kMetinStili),
                ),
              ),
            ),
            Center(
                child: Text(
                  'Kişi Sayısı',
                  style: kMetinStili,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlinedButton(onPressed: (){setState(() {
                  Data.numberOfPerson--;
                });},child: Icon(FontAwesomeIcons.minus, size:10)),
                SizedBox(
                  width: 20,
                  height: 10,
                ),
                Text(Data.numberOfPerson.round().toString(),style: kMetinStili),
                SizedBox(
                  width: 20,
                  height: 10,
                ),
                OutlinedButton(onPressed: (){setState(() {
                  Data.numberOfPerson++;
                });},child: Icon(FontAwesomeIcons.plus, size:10)),
              ],
            ),
            FractionallySizedBox(
              widthFactor: 0.4,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blueGrey, width: 3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                onPressed: () {

                  setState(() {
                      if(selectedMenu==0){
                        warning = 'Seçim Yapmalısınız';}
                      else if(selectedMenu == 2){
                        Navigator.pushNamed(context, FoodCategories.routeName);}
                      else {
                        //TODO:Random seçim için fonksiyonlar
                        print('Selected menu');
                        var rng = new Random();
                        var soups = new List.generate(7, (index) =>
                            rng.nextInt(
                                3)); //random olarak 7 tane soups sayısı üretti
                        var maindishes = new List.generate(
                            7, (index) => rng.nextInt(3));

                        for (int i = 0; i < 7; i++){
                          addFood(0, soups[i]);
                          addIngredient(0, soups[i]);

                          addFood(1, maindishes[i]);
                          addIngredient(1, maindishes[i]);
                        }
                      Navigator.pushNamed(context, ShoppingCartPage.routeName);
                      }
                      });
                    },
                child: Text('Oluştur',
                    textAlign: TextAlign.center, style: kMetinStili),
              ),
            ),
            Center(child: Text(warning,style: TextStyle(fontFamily: 'ChakraPetch',color: Colors.red, fontWeight: FontWeight.bold,fontSize: 17),)),
          ],
        ),
      ),
    );
  }
}

class FoodCategories extends StatelessWidget {
  static String routeName = '/FoodCategories';

  FoodCategories();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[ //Kategori butonları
          FlatButton(color: Colors.blueGrey, onPressed: (){
            Navigator.pushNamed(context, FoodPage.routeName,arguments:0);
          },
            child: Text('ÇORBA',style: TextStyle(fontSize:20, fontFamily: 'ChakraPetch'),), shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),),
          FlatButton(color: Colors.blueGrey, onPressed: (){
            Navigator.pushNamed(context, FoodPage.routeName,arguments:1);
          }, child: Text('ANA YEMEK',style: TextStyle(fontSize:20, fontFamily: 'ChakraPetch')), shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),),
          FlatButton(color: Colors.blueGrey, onPressed: (){Navigator.pushNamed(context, FoodPage.routeName,arguments:2);}, child: Text('SALATA/MEZE', style: TextStyle(fontSize:20, fontFamily: 'ChakraPetch')), shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),),
          FlatButton(color: Colors.blueGrey, onPressed: (){Navigator.pushNamed(context, FoodPage.routeName,arguments:3);}, child: Text('TATLI', style: TextStyle(fontSize:20, fontFamily: 'ChakraPetch')), shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Kişi Sayısı ${Data.numberOfPerson.round()}', style: kMetinStili),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text('Düzenlemek için geri dön', style: kMetinStili),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: FractionallySizedBox(
              widthFactor: 0.3,
              child: OutlinedButton( //Geri Dön butonu
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blueGrey, width: 3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('GERİ DÖN',
                    textAlign: TextAlign.center, style: kMetinStili),
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}


class FoodPage extends StatefulWidget {
  static String routeName = '/FoodPage';
  final int foodIndex;
  FoodPage(this.foodIndex);
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {

    List<Food> foods = Data.categories[widget.foodIndex].foods;
    return Scaffold(
      appBar: MyAppBar(),
      body: ListView.builder(
        itemCount: foods.length, //Hangi yemek kategorisi seçildiyse onun içindeki yemeklerin sayısı
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(foods[index].image, height: 175),
                        SizedBox(height: 10),
                        Text(foods[index].name),
                        FlatButton(
                          height: 25,
                          minWidth: 100,
                          onPressed: () {
                             addFood(widget.foodIndex, index);
                             addIngredient(widget.foodIndex, index);
                             // if(Data.takenShoppingList.containsKey(foods[index])){
                             //   Data.takenShoppingList[foods[index]] = Data.takenShoppingList[foods[index]]!+1; //value 1 arttırma
                             // }
                             // else{
                             //   Data.takenShoppingList[foods[index]] = 1;
                             // }
                            // for (int i = 0; i < foods[index].ingredients.length; i++) {
                            //   if (Data.shoppingCartNames.contains(foods[index].ingredients[i].name)) { //içinde varsa
                            //     print("Ad ${foods[index].ingredients[i].name}, quantity: ${foods[index].ingredients[i].quantity}");
                            //     int value = Data.shoppingCartNames.indexOf(foods[index].ingredients[i].name); //hangi indexteyse
                            //     print("Value= $value");
                            //     Data.shoppingCart[value].quantity +=Data.numberOfPerson.toInt()*foods[index].ingredients[i].quantity;
                            //     print('eklenen +: ${Data.shoppingCart[value].name}, quantity: ${Data.shoppingCart[value].quantity}');
                            //   }
                            //   else {
                            //     Data.shoppingCartNames.add(foods[index].ingredients[i].name);
                            //     //print("Names ${Data.shoppingCartNames[Data.shoppingCartNames.length-1]} eklendi");
                            //     //print("Ad ${foods[index].ingredients[i].name}, quantity: ${foods[index].ingredients[i].quantity}");
                            //     Data.shoppingCart.add(Ingrediendt(id: foods[index].ingredients[i].id, name: foods[index].ingredients[i].name, quantity: foods[index].ingredients[i].quantity*Data.numberOfPerson.toInt()));
                            //     print('eklenen yeni: ${Data.shoppingCart[Data.shoppingCart.length-1].name}, quantity: ${Data.shoppingCart[Data.shoppingCart.length-1].quantity}');
                            //   }
                            // }
                          },
                          color: Colors.blueGrey[100],
                          child: Icon(FontAwesomeIcons.plus, size: 10,),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyAppBar extends StatefulWidget implements PreferredSizeWidget{ //App Bar oluşturmak için
  MyAppBar({Key? key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);
  @override
  final Size preferredSize; // default is 56.0
  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'E-ALIŞVERİŞ LİSTESİ',
        style: TextStyle(fontFamily: 'ChakraPetch'),
      ),
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/images/logo_transparent.png',
        ),
      ),
      actions: [
        TextButton(child: Image.asset('assets/images/bag.png', height: 40,),onPressed: (){
          Navigator.pushNamed(context, ShoppingCartPage.routeName); //arguments: new ShoppingCartArgument(ingredients: shoppingCart
        })
      ],
    );
  }
}

class ShoppingCartPage extends StatefulWidget {
  static String routeName = '/ShoppingCart';
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class FoodListBottom extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: FlatButton(color:Colors.blueGrey[200], onPressed: ()
        {Navigator.pushNamed(context, ShoppingCartFoodPage.routeName);},
          child: Text('Eklenen yemekleri düzenle',style: TextStyle(fontFamily: 'ChakraPetch',fontWeight: FontWeight.bold)),),
      ),
      FlatButton(color:Colors.blueGrey[200], onPressed: ()
      {Navigator.pushNamed(context, ShoppingCartFoodPage.routeName);},
        child: Text('Satın al',style: TextStyle(fontFamily: 'ChakraPetch',fontWeight: FontWeight.bold)),),
    ],);
  }
}

class _ShoppingCartPageState extends State<ShoppingCartPage> { //Listedekileri bastırıyor.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),

        bottomNavigationBar: FoodListBottom(),
        body: ListView.builder(
            itemCount: Data.shoppingCart.length,
            itemBuilder: (context, int index) {
              return Slidable(

                secondaryActions: <Widget>[
                  IconSlideAction(
                      icon: FontAwesomeIcons.minus,
                      caption: 'Azalt',
                      color: Colors.blue,
                      //not defined closeOnTap so list will get closed when clicked
                      onTap: () async {
                        int intvalue =0;
                        await showDialog(
                            context: context,
                            builder: (BuildContext context)=>AlertDialog(
                              title: new Text(
                                'Ne kadar azaltmak istiyorsanız girin',
                                style: kMetinStili,
                              ),
                              content:TextField(

                                onChanged:(String value) async {
                                  intvalue = int.parse(value);
                                },
                                decoration: InputDecoration(
                                  hintText: 'Miktar',
                                ),keyboardType: TextInputType.number,inputFormatters:<TextInputFormatter>[ FilteringTextInputFormatter.digitsOnly],
                              ),


                              actions: [
                                TextButton(onPressed: (){  setState(() {

                                if(Data.shoppingCart[index].quantity-intvalue <= 0){ //Tek kaldıysa listeden sil
                                  Data.shoppingCart.removeAt(index);
                                }
                                else{  //Birden fazlaysa quantityi verilen miktar kadar azalt
                                  Data.shoppingCart[index].quantity-= intvalue; //Valueyu  yapılacak
                                }
                              });
                              Navigator.pop(context);
                              }, child: Text('Azalt', style: kMetinStili,))],
                            ));
                      }
                  ),
                  IconSlideAction(
                      icon: Icons.clear,
                      color: Colors.red,
                      caption: 'Sil',
                      closeOnTap: false, //list will not close on tap
                      onTap: () {
                        setState(() {
                          Data.shoppingCart.removeAt(index);
                        });
                      }
                  )
                ],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor:Colors.yellow[100],
                    leading: Text(Data.shoppingCart[index].quantity.toString()),
                    title: Text(Data.shoppingCart[index].name), //Text("${items[index]}"),
                    //subtitle: Text(""),
                    trailing: Icon(FontAwesomeIcons.eraser),
                  ),
                ),
                actionPane: SlidableDrawerActionPane(),
              );
            }),

            );
          }
  }


  /*Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            new Expanded(
              child: ListView.builder(
                itemCount: Data.shoppingCart.length,
                itemBuilder: (context, index) {
                  Ingrediendt ingredient = Data.shoppingCart[index];
                  return Dismissible( //sağa kaydırarak silme özelliği
                    key: Key(ingredient.name),
                        child:
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ListTile(tileColor:Colors.yellow[100], leading: Text(Data.shoppingCart[index].quantity.toString()),title: Text(Data.shoppingCart[index].name),),
                          ),
                      );
                  },
                    ),
            ),
            FlatButton(color:Colors.blueGrey[200], onPressed: (){Navigator.pushNamed(context, ShoppingCartFoodPage.routeName);}, child: Text('Eklenen yemekleri düzenle',style: TextStyle(fontFamily: 'ChakraPetch',fontWeight: FontWeight.bold)),),
          ],
        ),*/
  class ShoppingCartFoodPage extends StatefulWidget {
    static String routeName = '/ShoppingCartFoodPage';
    const ShoppingCartFoodPage({Key? key}) : super(key: key);

    @override
    _ShoppingCartFoodPageState createState() => _ShoppingCartFoodPageState();
  }

  class _ShoppingCartFoodPageState extends State<ShoppingCartFoodPage> {
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        appBar: MyAppBar(),
        bottomNavigationBar: FlatButton(color:Colors.blueGrey[200], onPressed: ()
        {Navigator.pushNamed(context, ShoppingCartPage.routeName);},
          child: Text('İçeriği düzenle',style: TextStyle(fontFamily: 'ChakraPetch',fontWeight: FontWeight.bold)),),
        body: ListView.builder(

            itemCount: Data.takenShoppingList.keys.length,
            itemBuilder: (context, int index) {
              return Slidable(

                secondaryActions: <Widget>[
                  IconSlideAction(
                      icon: FontAwesomeIcons.minus,
                      caption: 'Azalt',
                      color: Colors.blue,
                      //not defined closeOnTap so list will get closed when clicked
                      onTap: () {
                        setState(() {
                          if(Data.takenShoppingList[Data.takenShoppingList.keys.elementAt(index)] == 1){ //Tek kaldıysa listeden sil
                            Data.takenShoppingList.remove(Data.takenShoppingList.keys.elementAt(index));
                            deleteIngredient(index);
                          }
                          else{  //Birden fazlaysa quantityi azalt
                            Data.takenShoppingList[Data.takenShoppingList.keys.elementAt(index)] = (Data.takenShoppingList[Data.takenShoppingList.keys.elementAt(index)]!-1);
                            deleteIngredient(index);
                          }
                        });
                      }
                  ),
                  IconSlideAction(
                      icon: Icons.clear,
                      color: Colors.red,
                      caption: 'Sil',
                      closeOnTap: false, //list will not close on tap
                      onTap: () {
                        setState(() {
                          for(int j=0; j< Data.takenShoppingList.values.elementAt(index).toInt(); j++){
                            deleteIngredient(index);
                          }
                          Data.takenShoppingList.remove(Data.takenShoppingList.keys.elementAt(index));
                        });
                      }
                  )
                ],
                child: ListTile(
                  leading: Text(Data.takenShoppingList.values.elementAt(index).toString()),
                  title: Text("${Data.takenShoppingList.keys.elementAt(index).name}"), //Text("${items[index]}"),
                  //subtitle: Text(""),
                  trailing: Icon(FontAwesomeIcons.eraser),
                ),
                actionPane: SlidableDrawerActionPane(),
              );
            }),
      );
   
    }
  }


/*ListView.builder(
            itemCount: Data.takenShoppingList.keys.length,
            itemBuilder: (context, index) {
              Food food = Data.takenShoppingList.keys.elementAt(index);
               return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Slidable(actionPane: SlidableScrollActionPane(), actions:
                  [IconSlideAction(caption:'Azalt', icon: FontAwesomeIcons.minus,onTap: (){setState(() {
                    if(Data.takenShoppingList.values.elementAt(index) >1){
                      Data.takenShoppingList[Data.takenShoppingList.keys.elementAt(index)] = (Data.takenShoppingList[Data.takenShoppingList.keys.elementAt(index)]!-1);
                    }
                    else{
                      Data.takenShoppingList.remove(Data.takenShoppingList.keys.elementAt(index));
                    }
                    for (int i = 0; i < Data.takenShoppingList.keys.elementAt(index).ingredients.length; i++) {
                      if(Data.takenShoppingList.keys.elementAt(index).ingredients[i].quantity>1){
                        print("azaltma");
                        Data.takenShoppingList.keys.elementAt(index).ingredients[i].quantity--;
                      }
                      else if(Data.takenShoppingList.keys.elementAt(index).ingredients[i].quantity==1){
                        print("silme");
                        Data.shoppingCart.remove(Data.takenShoppingList.keys.elementAt(index).ingredients[i]);
                      }}
                  });

                  },)]
                      ,child: ListTile(tileColor:Colors.yellow[100], leading: Text(Data.takenShoppingList.values.elementAt(index).toString()),title: Text(Data.takenShoppingList.keys.elementAt(index).name),)),
                );
            },
          ),*/
  /*Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
        new Expanded(
          child: ListView.builder(
            itemCount: Data.takenShoppingList.keys.length,
            itemBuilder: (context, index) {
              Food food = Data.takenShoppingList.keys.elementAt(index);


              return Dismissible( //sağa kaydırarak silme özelliği
                onDismissed: (direction){
                  print("Index: $index");
                  setState(() {


                    for (int i = 0; i < Data.takenShoppingList.keys.elementAt(index).ingredients.length; i++) {
                      if(Data.takenShoppingList.keys.elementAt(index).ingredients[i].quantity ==1){
                        Data.shoppingCart.remove(Data.takenShoppingList.keys.elementAt(index).ingredients[i]);
                        print("Çıkarılan ${Data.takenShoppingList.keys.elementAt(index).ingredients[i].name}");
                      }
                      else{
                        Data.takenShoppingList.keys.elementAt(index).ingredients[i].quantity--;
                        print("Azaltılan ${Data.takenShoppingList.keys.elementAt(index).ingredients[i].name}, Quantity: ${Data.takenShoppingList.keys.elementAt(index).ingredients[i].quantity}");
                      }
                    }
                    Data.takenShoppingList.remove(Data.takenShoppingList.keys.elementAt(index));
                    print("Çıkarılan ${Data.takenShoppingList.keys.elementAt(index).name}");
                  });
                },
                key: Key(food.name),
                child:
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Slidable(actionPane: SlidableScrollActionPane(), actions: [IconSlideAction(caption:'Azalt', icon: FontAwesomeIcons.minus,onTap: (){},)],child: ListTile(tileColor:Colors.yellow[100], leading: Text(Data.takenShoppingList.values.elementAt(index).toString()),title: Text(Data.takenShoppingList.keys.elementAt(index).name),)),
                ),

              );
            },
          ),
        ),
      ],
      ),*/
