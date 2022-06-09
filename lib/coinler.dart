import 'package:flutter/material.dart';
import 'coin_detay.dart';
import 'coin_model.dart';

class Coinler extends StatefulWidget {
  const Coinler({Key key}) : super(key: key);

  @override
  State<Coinler> createState() => _CoinlerState();
}

class _CoinlerState extends State<Coinler> {
  final controller = TextEditingController();
  List<Coin> coinler = coinList;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: coinArama,
          controller: controller,
          decoration: const InputDecoration(
            labelText: "Arama",
            hintText: "Arama",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: coinler.length,
          itemBuilder: (context, index) {
            final coin = coinler[index];
            return InkWell(
              borderRadius: BorderRadius.circular(25),
              splashColor: Colors.blue,
              onTap: () {
                setState(
                  () {
                    FocusManager.instance.primaryFocus?.unfocus();

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CoinDetay(coin)),
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          offset: const Offset(0, 0),
                          blurRadius: 10,
                          spreadRadius: -5)
                    ],
                  ),
                  height: 85,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 40,
                          width: 40,
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Image.network(coin.resimUrl),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                coin.coinAdi.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                coin.sembol.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          coin.fiyat.toDouble().toStringAsFixed(3),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ]);
  }

  void coinArama(String query) {
    final coinOneri = coinList.where((coin) {
      final coinBaslik = coin.coinAdi.toLowerCase();
      final input = query.toLowerCase();
      return coinBaslik.contains(input);
    }).toList();
    setState(() {
      coinler = coinOneri;
    });
  }
}
