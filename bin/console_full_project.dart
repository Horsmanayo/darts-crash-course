import 'package:console_full_project/console_full_project.dart'
    as console_full_project;

void main() {
  var name = "usman";
  const isPresent = true;
  final age = 26;
  print("Hello, $name and your age is $age and isPresent is $isPresent");

  String name1 = "horsmanayo";
  int age1 = 26;
  double height = 5.4;
  bool isPresent1 = true;

  print(
      "Hello, $name1 and your age is $age1 and isPresent is $isPresent1 and height is $height");

  final greeting = greet(name: name, age: age);

  List<int> numbers = [1, 2, 3, 4, 5];

  numbers.add(6);
  numbers.add(7);
  numbers.remove(1);
  numbers.removeLast();
  numbers.shuffle();

  Set<String> emails = {"a.com", "b.com", "c.com"};

  emails.add("d.com");
  emails.add("e.com");
  emails.add("a.com");

  Map<String, dynamic> planets = {
    "earth": "blue",
    "mars": "red",
    "venus": "yellow",
    "jupiter": "orange"
  };

//map are key value pair and they are manipulated using the square brackets as opposed to the dot operator
  planets["saturn"] = "purple";

  print(planets);
  print(planets.isEmpty);
  print(planets.containsKey("earth"));
  planets.removeWhere((key, value) => key.length > 4);

  print(planets);

  for (var element in numbers.where((element) => element % 2 > 0)) {
    print(element);
  }

  print(greeting);

  var menuItem = MenuItem(name: "Burger", price: 5.99);
  print(menuItem.name);

  menuItem.setName("Pizza");

  print(menuItem.name);

  var pizza = Pizza(name: "Pizza", price: 10.99, toppings: ["cheese", "onion"]);

  print(pizza.toppings);
  print(pizza.printName());

  var foodCollection = Collection<MenuItem>("Menu Items", [
    pizza,
    menuItem,
  ]);

  print(foodCollection.randomItems());
}

String greet({String? name, required int age}) {
  return ("Hello, $name and my age is $age happening inside greet function");
}

class MenuItem {
  String name;
  double price;

  MenuItem({required this.name, required this.price});

  String printName() {
    return name;
  }

  double printPrice() {
    return price;
  }

  void setName(String name) {
    this.name = name;
  }

  @override
  String toString() {
    return "The name of the menu item is $name and the price is $price";
  }
}

class Pizza extends MenuItem {
  List<String> toppings = [];

  Pizza({required super.name, required super.price, required this.toppings});

  @override
  String printName() {
    return "The name of the pizza is $name";
  }
}

//generic class that takes in a type T
class Collection<T> {
  String name;
  List<T> data = [];

  Collection(this.name, this.data);

  randomItems() {
    data.shuffle();

    return data[0];
  }
}
