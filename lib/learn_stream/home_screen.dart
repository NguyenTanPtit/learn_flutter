import 'package:flutter/material.dart';
import 'package:learn_flutter/learn_stream/timer_stream.dart';
import 'package:learn_flutter/learn_stream/user_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final UserService _userService = UserService();

  User? _user;
  String? _err;
  bool _isLoading = false;

  void _loadUser() async {
    setState(() {
      _isLoading = true;
      _err = null;
      _user = null;
    });
    try {
      final user = await _userService.fetchUser();
      setState(() {
        _user = user;
      });
    } catch (e) {
      setState(() {
        _err = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Stream + Future demo"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const TimerStreamWidget(),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _isLoading ? null : _loadUser,
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.redAccent)
                    : const Text("Tải dữ liệu giả lập"),
              ),
              const SizedBox(height: 20),
              if (_user != null)
                Text(
                  "User name: ${_user?.name}",
                  style: TextStyle(fontSize: 20),
                ),
              if (_err != null) Text("Lỗi $_err"),
            ],
          ),
        ));
  }
}
