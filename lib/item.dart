class Item {
  String path;
  String text;
  int price;
  static final List<Item> itemList = [
    Item(
        'assets/pics/televizyon.jpg',
        'Vestel 43U9500 43" 108 Ekran Uydu Alıcılı 4K Ultra HD Smart LED TV',
        13499),
    Item(
        'assets/pics/tabak.jpg',
        'Karaca Saba 24 Parça 6 Kişilik Porselen Yemek Takımı',
        3999),
    Item(
        'assets/pics/canta.jpg',
        'Hummel Hmldarrel Bag Pack',
        400),
    Item(
        'assets/pics/kalem.jpg',
        'Faber-Castell Eğlenceli Keçeli Kartlı, 30\'lu Set',
        30),
    Item(
        'assets/pics/tost.jpg',
        'Korkmaz A328-05 Tostkolik Tost Makinesi İnox',
        1345),
    Item(
        'assets/pics/kupon.jpg',
        'Google Play Hediye Kodu',
        50),
    Item(
        'assets/pics/tel.jpg',
        'Samsung Galaxy S21 FE 5G 256 GB (Samsung Türkiye Garantili)',
        5089),
  ];

  Item(this.path, this.text, this.price);
}
