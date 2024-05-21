class TariffModel {
  int id;
  int summa;
  int percent;
  int active;

  TariffModel(
      {required this.id,
      required this.active,
      required this.percent,
      required this.summa});
  factory TariffModel.fromJson(Map<String, dynamic> json) {
    return TariffModel(
        id: json['id'],
        active: json['active'],
        percent: json['percent'],
        summa: json['summa']);
  }
}


List<TariffModel> tariffsListFromModel(List list){
  return List<TariffModel>.from(list.map((e) => TariffModel.fromJson(e)));
}