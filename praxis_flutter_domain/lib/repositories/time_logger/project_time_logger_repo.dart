import 'package:praxis_flutter_domain/entities/time_loggin/dm_time_log.dart';

abstract class ProjectTimeLoggerRepo {
  Future<DMTimeLog> logTime(DMTimeLog timeLog);
}
