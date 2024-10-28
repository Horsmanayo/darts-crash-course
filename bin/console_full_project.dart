void main() async {
  List<String> args = ["fetchPost", "fetchPostTwo"];

  final user1 = User("johndoe", "johndoe@gmail.com", 25);
  user1.login();

  final superUser1 = SuperUser("janedoe", "janedoe@gmail.com", 30);

  print(superUser1.publisher);
}

class User {
  String username;
  String email;
  int age;

  User(this.username, this.email, this.age);

  login() {
    print("User logged in");
  }
}

class SuperUser extends User {
  String? publisher;

  SuperUser(super.username, super.email, super.age) {
    publisher = super.username;
  }

  publish() {
    print("Published");
  }
}
