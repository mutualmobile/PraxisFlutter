import 'package:praxis_flutter_domain/mapper/ui_model_mapper.dart';

class DMTimeLog extends DomainModel {
  DateTime startTime;
  DateTime endTime;
  String projectId;
  String hours;

  DMTimeLog(
      {required this.startTime,
      required this.endTime,
      required this.hours,
      required this.projectId});
}
