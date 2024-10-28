// import 'package:console_full_project/console_full_project.dart'
//     as console_full_project;
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<Post> fetchPost() {
  const delayed = Duration(seconds: 2);
  return Future.delayed(delayed, () {
    return Post({"title": "Hello, World", "content": "This is a post"});
  });
}

class Post {
  Map<String, dynamic> data;

  Post(this.data);
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

class PostTwo {
  int userId;
  int id;
  String title;
  String body;

  PostTwo(this.userId, this.id, this.title, this.body);

  @override
  String toString() {
    return 'PostTwo{userId: $userId, id: $id, title: $title, body: $body}';
  }
}

class PostTwoCollection {
  List<PostTwo> posts;

  PostTwoCollection(this.posts);

  @override
  String toString() {
    return 'PostTwoCollection{posts: $posts}';
  }
}

Future<PostTwo> fetchPostTwo() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;

    return PostTwo(jsonResponse['userId'], jsonResponse['id'],
        jsonResponse['title'], jsonResponse['body']);
  } else {
    throw Exception('Failed to load post');
  }
}
