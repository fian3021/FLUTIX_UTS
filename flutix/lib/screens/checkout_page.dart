import 'package:flutix/model/wallet.dart';
import 'package:flutix/screens/success_checkout.dart';
import 'package:flutix/screens/wallet_topup.dart';
import 'package:flutter/material.dart';

import '../widgets/back.dart';

class Checkout_Page extends StatelessWidget {
  const Checkout_Page({super.key});
  final double saldo = 0;
  final double total = 100000;

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    final walletProvider = WalletProvider.of(context);

    bool saldoWallet = walletProvider.saldo >= total; //saldo cukup
    // bool saldoWallet = saldo <= total; //saldo tidak cukup

    return Scaffold(
        backgroundColor: Color.fromRGBO(52, 50, 56, 1),
        appBar: AppBar(
          leading: Arrow_Back(),
          title: Center(
            child: Text('Confirm Checkout',
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
          backgroundColor: Color.fromRGBO(54, 53, 56, 1),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: lebar,
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Text(
                "Details",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              width: lebar,
              padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 120,
                    height: 85,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/theNun.png"),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 30, 0),
                        child: Text(
                          "The NUN II",
                          textWidthBasis: TextWidthBasis.parent,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 21,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 30, 0),
                        child: Text(
                          "Horror - USA",
                          textWidthBasis: TextWidthBasis.parent,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 30, 0),
                        child: Text(
                          "⭐⭐⭐⭐⭐ 6/10",
                          textWidthBasis: TextWidthBasis.parent,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(180, 212, 41, 1),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Center(
              child: Container(
                width: lebar - 60,
                margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: saldoWallet
                          ? Color.fromRGBO(180, 212, 41, 1)
                          : Color.fromRGBO(237, 20, 20, 0.37),
                      width: 2.0, // Ketebalan garis
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: lebar,
              height: tinggi / 4,
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ID Order",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        "2208199612389",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cinema",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        "XXI Big Mall Samarinda",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date & Time",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        "Sep 3, 20:15",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Quantity",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        "2 Tickets",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Seat",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        "C4, C5",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fees",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        "Rp 50.000 X 2",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        "Rp $total",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                width: lebar - 60,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: saldoWallet
                          ? Color.fromRGBO(180, 212, 41, 1)
                          : Color.fromRGBO(237, 20, 20, 0.37),
                      width: 2.0, // Ketebalan garis
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: lebar,
              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: saldoWallet
                      ? Color.fromRGBO(52, 50, 56, 1)
                      : Color.fromRGBO(237, 20, 20, 0.37),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Saldo Wallet",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        "Rp.${walletProvider.saldo.toString()}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Container(
              width: lebar,
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      saldoWallet ? "Checkout Now" : "Top Up Now",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Container(
                        width: 58,
                        height: 58,
                        decoration: ShapeDecoration(
                          color: saldoWallet
                              ? Color.fromRGBO(180, 212, 41, 1)
                              : Color.fromRGBO(237, 20, 20, 0.37),
                          shape: OvalBorder(),
                        ),
                        child: IconButton(
                            onPressed: saldoWallet
                                ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Success_Checkout()),
                                    );
                                  }
                                : () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Wallet_Topup()),
                                    );
                                  },
                            icon: Icon(
                              Icons.keyboard_double_arrow_right_outlined,
                            )))
                  ]),
            )
          ],
        ));
  }
}
