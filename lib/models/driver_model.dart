class DriverModel {
  bool chose = false;
  String driverName = "";
  String image = "";
  DriverModel(this.chose, this.driverName, this.image);

  DriverModel clone() {
    return DriverModel(
      this.chose,
      this.driverName,
      this.image,
    );
  }
}
