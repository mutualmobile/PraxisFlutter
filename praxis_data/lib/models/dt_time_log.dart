import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:praxis_data/mapper/entity_mapper.dart';

class DTTimeLog {
  DateTime startTime;
  DateTime endTime;
  String projectId;
  String hours;
  DTTimeLog({required this.startTime,
    required this.endTime,
    required this.hours,
    required this.projectId});

  Map<String, dynamic> toJson() {
    return {"startTime": startTime, "endTime": endTime, "projectId": projectId,"hours":hours};
  }

  static DTTimeLog fromJson(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    return DTTimeLog(startTime: documentSnapshot['startTime'],
        endTime: documentSnapshot['endTime'],
        hours: documentSnapshot['hours'],
        projectId: documentSnapshot['projectId']);
  }
}