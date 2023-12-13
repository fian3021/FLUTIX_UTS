import 'package:flutter/material.dart';

class Success_Checkout extends StatelessWidget {
  const Success_Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(52, 50, 56, 1),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 68),
            Container(
              width: 250,
              height: 250,
              alignment: AlignmentDirectional.center,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/success_checkout.png"),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Happy Watching!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'You have successfully\nbought the ticket',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
            SizedBox(height: 106),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFB4D429),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: Container(
                width: 240,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  'My Wallet',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF363538),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF363538),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFB4D429)),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Container(
                width: 240,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  'Back to Home',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFB1B1B1),
                    fontSize: 18,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
