class Coin {
  Coin(
      {this.coinAdi,
      this.sembol,
      this.resimUrl,
      this.fiyat,
      this.degisim24s,
      this.yuzdeDegisim24s,
      this.marketSiralama,
      this.marketDegeri,
      this.enYuksekDeger,
      this.enDusukDeger,
      this.maxArz,
      this.toplamHacim});

  String coinAdi;
  String sembol;
  String resimUrl;
  num fiyat;
  num degisim24s;
  num yuzdeDegisim24s;
  num marketSiralama;
  num marketDegeri;
  num enYuksekDeger;
  num enDusukDeger;
  num maxArz;
  num toplamHacim;

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
        coinAdi: json['name'],
        sembol: json['symbol'],
        resimUrl: json['image'],
        fiyat: json['current_price'],
        degisim24s: json['price_change_24h'],
        yuzdeDegisim24s: json['price_change_percentage_24h'],
        marketSiralama: json['market_cap_rank'],
        marketDegeri: json['market_cap'],
        enYuksekDeger: json['ath'],
        enDusukDeger: json['atl'],
        maxArz: json['max_supply'],
        toplamHacim: json['total_volume']);
  }
}

List<Coin> coinList = [];
