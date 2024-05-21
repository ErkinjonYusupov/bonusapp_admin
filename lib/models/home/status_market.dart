class StatusMarket {
  String marketName, openMarket, closeMarket, phone;
  int active;
  StatusMarket(
      {required this.closeMarket,
      required this.marketName,
      required this.openMarket,
      required this.active,
      required this.phone});
  factory StatusMarket.fromJson(Map<String, dynamic> json) {
    return StatusMarket(
        closeMarket: json['closeMarket'],
        marketName: json['marketName'],
        openMarket: json['openMarket'],
        active: json['active'],
        phone: json['phone']);
  }
}
