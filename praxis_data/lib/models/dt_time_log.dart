import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class DTTimeLog extends Equatable{
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

  factory DTTimeLog.fromJson(DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    return DTTimeLog(startTime: documentSnapshot['startTime'],
        endTime: documentSnapshot['endTime'],
        hours: documentSnapshot['hours'],
        projectId: documentSnapshot['projectId']);
  }

  @override
  List<Object> get props => [DTTimeLog(startTime: startTime,
      endTime: endTime,
      hours: hours,
      projectId: projectId)];
}