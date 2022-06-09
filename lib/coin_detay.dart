import 'coin_model.dart';
import 'package:flutter/material.dart';

class CoinDetay extends StatelessWidget {
  const CoinDetay(
    this.coin, {
    Key key,
  }) : super(key: key);
  final Coin coin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF0F8FE),
        appBar: AppBar(
          title: Text(coin.coinAdi),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  color: const Color(0xFFFFFFFF),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 60,
                              width: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: Image.network(coin.resimUrl),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: Text(
                              coin.sembol.toUpperCase(),
                              style: const TextStyle(fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                        child: Text(
                          "${coin.fiyat.toString()} \$",
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Güncel Fiyat: ${coin.fiyat.toString()} \$",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "24S Değişim:  ${coin.degisim24s.toDouble() < 0 ? coin.degisim24s.toDouble().toStringAsFixed(3) : '+${coin.degisim24s.toDouble().toStringAsFixed(3)}'}",
                            style: TextStyle(
                              color: coin.degisim24s.toDouble() < 0
                                  ? Colors.red
                                  : Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "24S Değişim Yüzdesi:  ${coin.yuzdeDegisim24s.toDouble() < 0 ? '${coin.yuzdeDegisim24s.toDouble().toStringAsFixed(3)}%' : '+${coin.yuzdeDegisim24s.toDouble().toStringAsFixed(3)}%'}",
                            style: TextStyle(
                              color: coin.yuzdeDegisim24s.toDouble() < 0
                                  ? Colors.red
                                  : Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Hacim:  ${coin.toplamHacim.toString()}",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "En Yüksek Fiyat:  ${coin.enYuksekDeger.toString()} \$",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "En Düşük Fiyat:  ${coin.enDusukDeger.toString()} \$ ",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Max Arz:   ${coin.maxArz == null ? "Arz Sınırı Yok" : coin.maxArz.toString()} ",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Market Değeri:  ${coin.marketDegeri.toString()} \$",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Market Sıra:  ${coin.marketSiralama.toString()}",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
