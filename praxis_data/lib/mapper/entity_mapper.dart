abstract class EntityMapper<DomainModel, DataModel> {
  DomainModel mapToDomain(DataModel entity);
  DataModel mapToData(DomainModel model);
}

class DataModel {}
