import 'package:flutix/model/wallet.dart';
import 'package:flutix/screens/success_topup.dart';
import 'package:flutix/widgets/back.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Wallet_Topup extends StatefulWidget {
  const Wallet_Topup({super.key});

  @override
  State<Wallet_Topup> createState() => _Wallet_TopupState();
}

class _Wallet_TopupState extends State<Wallet_Topup> {
  final TextEditingController _NominalController = TextEditingController();
  final currencyFormatter =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp.');
  final numberFormatter = NumberFormat.decimalPattern('id_ID');
  int selectedButtonIndex = -1;
  // double availableBalance = 280000.0;

  @override
  Widget build(BuildContext context) {
    final walletProvider = WalletProvider.of(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(54, 53, 56, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(54, 53, 56, 1),
        leading: GestureDetector(
          child: Icon(
            Icons.keyboard_double_arrow_left_outlined,
            size: 30,
            color: Color.fromARGB(255, 180, 212, 41),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 75),
          child: Text('Top Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
              )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 36, left: 36, right: 36.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter Nominal (Min. Rp10.000)',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            SizedBox(height: 13.0),
            TextFormField(
              controller: _NominalController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                TextInputFormatter.withFunction((oldValue, newValue) {
                  final parsedValue =
                      int.tryParse(newValue.text.replaceAll(',', ''));
                  if (parsedValue != null) {
                    final formattedValue = numberFormatter.format(parsedValue);
                    return newValue.copyWith(
                      text: formattedValue,
                      selection: TextSelection.collapsed(
                          offset: formattedValue.length),
                    );
                  }
                  return newValue;
                }),
              ],
              style: TextStyle(
                  color: Color(0xFFB4D429),
                  fontSize: 20,
                  fontFamily: 'Encode Sans Condensed',
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                prefixText: 'Rp. ',
                prefixStyle: TextStyle(
                  color: Color(0xFFB1B1B1),
                  fontSize: 20,
                  fontFamily: 'Encode Sans Condensed',
                  fontWeight: FontWeight.w500,
                ),
                filled: true,
                fillColor: Color(0xFF363538),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFB1B1B1)),
                  borderRadius: BorderRadius.circular(6),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFB4D429)),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            SizedBox(height: 13.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available Balance',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Rp.${walletProvider.saldo.toString()}',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFFB4D429),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 13.0),
            Text(
              'Instant',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 18.0),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildElevatedButton('Rp.\n10.000', 0),
                    buildElevatedButton('Rp.\n50.000', 1),
                  ],
                ),
                SizedBox(height: 36.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildElevatedButton('Rp.\n100.000', 2),
                    buildElevatedButton('Rp.\n200.000', 3),
                  ],
                ),
                SizedBox(height: 36.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildElevatedButton('Rp.\n250.000', 4),
                    buildElevatedButton('Rp.\n500.000', 5),
                  ],
                ),
              ],
            ),
            SizedBox(height: 36.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final String nominalText = _NominalController.text.trim();
                  if (nominalText.isEmpty) {
                    showEmptyTextFieldWarning();
                  } else {
                    final double nominal = double.parse(
                        _NominalController.text.replaceAll('.', ''));
                    if (nominal >= 10000) {
                      walletProvider.topUp(nominal);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Success_Topup(),
                        ),
                      );
                    } else {
                      showMinimumTopUpWarning();
                    }
                  }
                },
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
                    'Top Up Now',
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
            ),
          ],
        ),
      ),
    );
  }

  Widget buildElevatedButton(String text, int index) {
    return ElevatedButton(
      onPressed: () {
        setNominalAndColor(text, index);
      },
      style: ElevatedButton.styleFrom(
        primary: selectedButtonIndex == index
            ? Color(0xFFB4D429)
            : Color(0xFFB1B1B1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Container(
        width: 110,
        height: 71,
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF363538),
            fontSize: 18,
            fontFamily: 'Encode Sans Condensed',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void showMinimumTopUpWarning() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Minimum Top Up Amount is Rp10.000',
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }

  void showEmptyTextFieldWarning() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Please Enter the Top Up Amount',
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }

  void setNominalAndColor(String text, int index) {
    setState(() {
      selectedButtonIndex = index;
      _NominalController.text = text.split('\n')[
          1]; // Mengambil nilai dari baris kedua (setelah '\n') di dalam teks tombol
    });
  }
}
