import 'package:flutter/material.dart';
import 'package:playground/screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> saveData(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
  }

  @override
  void dispose() {
    super.dispose();
    username.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: SizedBox(
            height: 550,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'LOGIN',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: username,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Cannot be Empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          label: Text('Username'),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Cannot be Empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          label: Text('Password'),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 54),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            if (username.text == 'asep' &&
                                password.text == '12344321') {
                              saveData(username.text);
                              // Jika validasi berhasil
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Form valid'),
                                backgroundColor: Colors.green,
                              ));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            } else {
                              // Jika validasi gagal
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Form tidak valid'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          } else {
                            // Jika validasi gagal
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Form tidak valid'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        SizedBox(width: 42, child: Center(child: Text('OR'))),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Register'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
