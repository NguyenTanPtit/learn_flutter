class User{
  final String name;

  User(this.name);
}
class UserService {
  Future<User> fetchUser() async {
    await Future.delayed(Duration(seconds: 2));
    return User("Tan dep trai");
  }
}

Stream<int> timerStream() async*{
  int i = 0;
  while (true){
    await Future.delayed(Duration(seconds: 1));
    yield i++;
  }
}