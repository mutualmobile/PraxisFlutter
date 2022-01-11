import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:praxis_data/mapper/entity_mapper.dart';
import 'package:praxis_data/models/dt_time_log.dart';
import 'package:praxis_flutter_domain/entities/time_loggin/dm_time_log.dart';
import 'package:praxis_flutter_domain/repositories/time_logger/project_time_logger_repo.dart';

const collectionTimeLogs = "timeLogs";

class FirebaseProjectTimeLogger extends ProjectTimeLoggerRepo {
  CollectionReference firebaseCollection;
  EntityMapper<DMTimeLog, DTTimeLog> entityMapper;

  FirebaseProjectTimeLogger(this.firebaseCollection,this.entityMapper);

  @override
  Future<DMTimeLog> logTime(DMTimeLog timeLog) async {
    await firebaseCollection
        .doc(timeLog.projectId)
        .collection(collectionTimeLogs)
        .add(entityMapper.mapToData(timeLog).toJson());
    return timeLog;
  }
}
