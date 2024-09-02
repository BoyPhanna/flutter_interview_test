class ClientModel {
  late String clientID = "";
  late String clientName = "";
  late String code = "";

  late String area = "";
  late String market = "";
  late String store = "";
  late bool chose = false;

  late double amount;
  late int newCans = 1;
  late int oldCans = 0;
  late String cansType = "កំប៉ុងថ្មី";

  ClientModel({
    this.clientID = "000",
    this.clientName = "Noname",
    this.code = "000",
    this.amount = 21.0,
    this.area = "បឹងកក់",
    this.market = "00",
    this.store = "00",
    this.chose = false,
    this.newCans = 1,
    this.oldCans = 0,
    this.cansType = "កំប៉ុងថ្មី",
  });

  // Method to clone the object
  ClientModel clone() {
    return ClientModel(
      clientID: this.clientID,
      clientName: this.clientName,
      code: this.code,
      amount: this.amount,
      area: this.area,
      market: this.market,
      store: this.store,
      chose: this.chose,
      newCans: this.newCans,
      oldCans: this.oldCans,
      cansType: this.cansType,
    );
  }
}
