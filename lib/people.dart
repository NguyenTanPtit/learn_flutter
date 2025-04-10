class People{

  String? _name;
  String? _email;
  String? _phone;
  String? _address;
  String? _age;

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  People({required String name, required String email, required String phone, required String address, required String age}){
    _name = name;
    _email = email;
    _phone = phone;
    _address = address;
    _age = age;
  }


  static List<People> getPeople() {
    return <People>[
      People(name: 'John Doe',
          email: 'test@gmail.com',
          phone: '1234567890',
          address: '123 Main St',
          age: '25'),
      People(name: 'Jane Doe',
          email: 'test2@gmail.com',
          phone: '1234567890',
          address: '123 Main St',
          age: '25'),
      People(name: 'John Smith',
          email: 'test3@gmail.com,',
          phone: '1234567890',
          address: '123 Main St',
          age: '25')
    ];
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Name: $name, Email: $email, Phone: $phone, Address: $address, Age: $age";
  }

  String? get email => _email;

  String? get age => _age;

  set age(String? value) {
    _age = value;
  }

  String? get address => _address;

  set address(String? value) {
    _address = value;
  }

  String? get phone => _phone;

  set phone(String? value) {
    _phone = value;
  }

  set email(String? value) {
    _email = value;
  }
}