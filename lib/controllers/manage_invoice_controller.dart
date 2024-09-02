import 'package:get/get.dart';
import 'package:interview_test/models/area_model.dart';
import 'package:interview_test/models/client_model.dart';
import 'package:interview_test/models/driver_model.dart';

class ManageInvoiceController extends GetxController {
  DateTime dateInvoice = DateTime.now();
  RxList<AreaModel> areas = [
    AreaModel("001", "ត្រឡោកបែក", [
      ClientModel(
          clientID: "001",
          clientName: "ជីវិត ឯកា",
          code: "HHK001",
          amount: 0.2,
          area: "ត្រឡោកបែក",
          market: "001",
          store: "001",
          chose: false),
      ClientModel(
          clientID: "002",
          clientName: "ជួប ស៊យ",
          code: "HHK002",
          amount: 0.2,
          area: "ត្រឡោកបែក",
          market: "002",
          store: "002",
          chose: false),
      ClientModel(
          clientID: "003",
          clientName: "ជីវិត កាកា",
          code: "HHK003",
          amount: 0.2,
          area: "ត្រឡោកបែក",
          market: "003",
          store: "003",
          chose: false),
    ]),
    AreaModel("002", "វេងស្រេង", [
      ClientModel(
          clientID: "001",
          clientName: "ជីវិត ឯកា",
          code: "HHK001",
          amount: 0.2,
          area: "ត្រឡោកបែក",
          market: "001",
          store: "001",
          chose: false),
      ClientModel(
          clientID: "002",
          clientName: "ជួប ស៊យ",
          code: "HHK002",
          amount: 0.2,
          area: "ត្រឡោកបែក",
          market: "002",
          store: "002",
          chose: false),
      ClientModel(
          clientID: "003",
          clientName: "ជីវិត កាកា",
          code: "HHK003",
          amount: 0.2,
          area: "ត្រឡោកបែក",
          market: "003",
          store: "003",
          chose: false),
    ]),
    AreaModel("003", "វត្ដភ្នំ", [
      ClientModel(
          clientID: "001",
          clientName: "ជីវិត ឯកា",
          code: "HHK001",
          amount: 0.2,
          area: "ត្រឡោកបែក",
          market: "001",
          store: "001",
          chose: false),
      ClientModel(
          clientID: "002",
          clientName: "ជួប ស៊យ",
          code: "HHK002",
          amount: 0.2,
          area: "ត្រឡោកបែក",
          market: "002",
          store: "002",
          chose: false),
      ClientModel(
          clientID: "003",
          clientName: "ជីវិត កាកា",
          code: "HHK003",
          amount: 0.2,
          area: "ត្រឡោកបែក",
          market: "003",
          store: "003",
          chose: false),
    ]),
  ].obs;
  RxList<DriverModel> drivers = [
    DriverModel(false, "គីម​ ផាន៉ណា", "phanna.jpg"),
    DriverModel(false, "នៅ​ គង់", "Tonaire Digital.png"),
    DriverModel(false, "ម៉ាត់ នៅ", "phanna.jpg"),
    DriverModel(false, "កកុ", "ronaldo.jpg"),
    DriverModel(false, "ដើរ​ លេង", "iron man.jpg"),
    DriverModel(false, "ក្មេង នូ", "Tonaire Digital.png"),
    DriverModel(false, "ចាក់ ណុក", "phanna.jpg"),
  ].obs;
  RxDouble totalAmountInArear = 0.0.obs;
  RxDouble totalAmountChoseMakeInvoice = 0.0.obs;
  RxInt totalNewCans = 0.obs;

  DriverModel choseDriverToprint = DriverModel(false, "driverName", "image");

  RxList<AreaModel> showAreas = [AreaModel("", "", [])].obs;
  RxList<ClientModel> choseAreas = [
    ClientModel(
        clientID: "003",
        clientName: "ជីវិត កាកា",
        code: "HHK003",
        amount: 21.0,
        area: "វត្ដភ្នំ",
        market: "003",
        store: "010",
        chose: false)
  ].obs;
  List<DriverModel> searchDrivers = [
    DriverModel(false, "ចាក់ ណុក", "phanna.jpg"),
  ].obs;
  int driverIndex = -1;
  void choseAreaToShowClient(int index) {
    double total = 0.0;
    showAreas.clear();
    showAreas = [areas[0].clone()].obs;
    print(showAreas[0].areaName);
    for (int i = 0; i < areas[0].clients.length; i++) {
      total += areas[0].clients[i].amount;
    }
    totalAmountInArear.value = total;
  }

  void choseDriver(int index2) {
    int index;
    index = -1;
    for (int i = 0; i < drivers.length; i++) {
      if (drivers[i].driverName == searchDrivers[index2].driverName &&
          drivers[i].image == searchDrivers[index2].image) {
        index = i;
        break;
      }
    }
    print("find index : ${index}");
    if (driverIndex >= 0) {
      drivers[driverIndex].chose = false;
      if (driverIndex < searchDrivers.length) {
        searchDrivers[driverIndex].chose = false;
      }
    }

    if (driverIndex != index) {
      drivers[index].chose = true;
      searchDrivers[index2].chose = true;
      driverIndex = index;
    } else {
      driverIndex = -1;
    }
  }

  DriverModel getDriver() {
    if (driverIndex >= 0 && driverIndex <= drivers.length) {
      DriverModel driverModel = drivers[driverIndex];
      return driverModel;
    }
    return DriverModel(false, "Not have", "image");
  }

  List<DriverModel> searchDriverByName(String name) {
    // Search for the first object where the name matches the regex
    // Define your search string
    String searchString = name; // Example: searching for names similar to 'Ali'
    RegExp regex = RegExp(searchString, caseSensitive: false);
    searchDrivers.clear();
    print(name);

    // Search for all objects where the name matches the regex
    searchDrivers = drivers
        .where(
          (driver) => regex.hasMatch(driver.driverName),
        )
        .toList();
    print(searchDrivers.length);

    return searchDrivers;
  }

  void init() {
    searchDrivers.clear();
    for (int i = 0; i < drivers.length; i++) {
      searchDrivers.add(drivers[i].clone());
    }
  }

  void removeChoseArea(int index) {
    totalNewCans -= choseAreas[index].newCans;
    totalAmountChoseMakeInvoice.value -= choseAreas[index].amount;
    choseAreas.removeAt(index);
  }

  void choseAreaToMakeInvoice(int index) {
    choseAreas.add(showAreas[0].clients[index].clone());
    totalAmountInArear.value -= showAreas[0].clients[index].amount;
    totalAmountChoseMakeInvoice.value += showAreas[0].clients[index].amount;
    totalNewCans += showAreas[0].clients[index].newCans;
    showAreas[0].clients.removeAt(index);
  }
}
