import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Registration",
          style: GoogleFonts.poppins(fontSize: 22),
        ),
        elevation: 0,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.only(top: 20,bottom: 20,left: 5,right: 5),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                'Username',
                style: GoogleFonts.ptSansCaption(
                  textStyle: TextStyle(
                      color: Color(0xff5A636A),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: const Color(0xffE7E4F4),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                'First Name',
                style: GoogleFonts.ptSansCaption(
                  textStyle: TextStyle(
                      color: Color(0xff5A636A),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: const Color(0xffE7E4F4),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                'Email',
                style: GoogleFonts.ptSansCaption(
                  textStyle: TextStyle(
                      color: Color(0xff5A636A),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: const Color(0xffE7E4F4),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                'Phone',
                style: GoogleFonts.ptSansCaption(
                  textStyle: TextStyle(
                      color: Color(0xff5A636A),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: const Color(0xffE7E4F4),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                'Date of Birth',
                style: GoogleFonts.ptSansCaption(
                  textStyle: TextStyle(
                      color: Color(0xff5A636A),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 10),
              child: TextFormField(
                controller: TextEditingController(
                    text: "${selectedDate.toLocal()}".split(" ")[0]),
                onTap: () => selectDate(context),
                readOnly: true,
                decoration: InputDecoration(
                  fillColor: const Color(0xffE7E4F4),
                  // hintText: 'dd-mm-yyyy',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                    suffixIcon: Icon(Icons.calendar_month),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                'Password',
                style: GoogleFonts.ptSansCaption(
                  textStyle: TextStyle(
                      color: Color(0xff5A636A),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: const Color(0xffE7E4F4),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: 137,
                height: 51,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    backgroundColor: Color(0xff0D1F23),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account ?'),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        ' Log In',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
}

