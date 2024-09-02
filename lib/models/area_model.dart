import 'package:interview_test/models/client_model.dart';

class AreaModel {
  String areaID = "";
  String areaName = "";
  List<ClientModel> clients = [];
  AreaModel(
    this.areaID,
    this.areaName,
    this.clients,
  );

  AreaModel clone() {
    // Deep copy the clients list
    List<ClientModel> clonedClients =
        clients.map((client) => client.clone()).toList();

    // Return a new instance of AreaModel with cloned data
    return AreaModel(this.areaID, this.areaName, clonedClients);
  }
}
