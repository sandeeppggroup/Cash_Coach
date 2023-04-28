import 'package:flutter/material.dart';
import 'package:money_management/screens/home/screen_main.dart';

class ScreenSplashTwo extends StatefulWidget {
  ScreenSplashTwo({super.key});

  @override
  State<ScreenSplashTwo> createState() => _ScreenSplashTwoState();
}

class _ScreenSplashTwoState extends State<ScreenSplashTwo> {
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                  ),
                  child: Image.asset('images/money-management.png'),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  "Simple solution",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "For your budget",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    "Counter and distribute the income correctly.....",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Enter Your Name",
                    labelStyle: TextStyle(fontStyle: FontStyle.italic),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                          color: Colors.green,
                          width: 33,
                          style: BorderStyle.none),
                    ),
                    //fillColor: Colors.green
                  ),
                  onChanged: (String value) {},
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Field cannot be empty ......";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.name,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      checkName();
                      _nameController.clear();
                    },
                    child: const Text('Countinue'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkName() async {
    final name = _nameController.text;
    print(name);
    if (name != '') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return ScreenMain();
          },
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your name'),
          duration: Duration(seconds: 3),
          margin: EdgeInsets.all(20),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
        ),
      );
      // setState(() {});
    }
  }
}
