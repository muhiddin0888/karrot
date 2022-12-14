import 'package:phone_otp_ui/data/models/korea_model/korea_model.dart';

class KoreaData {
  static List<KoreaModel> getKoreaData() {
    List<KoreaModel> data = [];

    data.add(KoreaModel(cityName: "North Chungcheong", id: 1));
    data.add(KoreaModel(cityName: "South Chungcheong", id: 2));
    data.add(KoreaModel(cityName: "Gangwon", id: 3));
    data.add(KoreaModel(cityName: "Gyeonggi", id: 4));
    data.add(KoreaModel(cityName: "North Gyeongsang", id: 5));
    data.add(KoreaModel(cityName: "South Gyeongsang", id: 6));
    data.add(KoreaModel(cityName: "North Jeolla	", id: 7));
    data.add(KoreaModel(cityName: "South Jeolla", id: 8));
    data.add(KoreaModel(cityName: "Jeju", id: 9));
    return data;
  }
}
