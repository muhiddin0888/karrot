import 'package:phone_otp_ui/data/models/uzb_model/uzb_model.dart';

class UzbData {
  static List<UzbModel> getUzbData() {
    List<UzbModel> data = [];
    data.add(UzbModel(cityName: "Andijan", id: 1));
    data.add(UzbModel(cityName: "Bukhara", id: 2));
    data.add(UzbModel(cityName: "Jizzakh", id: 3));
    data.add(UzbModel(cityName: "Kashkadarya", id: 4));
    data.add(UzbModel(cityName: "Navoi", id: 5));
    data.add(UzbModel(cityName: "Namangan", id: 6));
    data.add(UzbModel(cityName: "Samarkand", id: 7));
    data.add(UzbModel(cityName: "Sirdarya", id: 8));
    data.add(UzbModel(cityName: "Surkhandarya", id: 9));
    data.add(UzbModel(cityName: "Tashkent", id: 10));
    data.add(UzbModel(cityName: "Fergana", id: 11));
    data.add(UzbModel(cityName: "Khorezm", id: 12));
    data.add(UzbModel(cityName: "Republic of Karakalpakstan", id: 13));
    return data;
  }
}
