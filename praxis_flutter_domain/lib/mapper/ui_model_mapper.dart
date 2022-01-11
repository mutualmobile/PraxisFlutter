class DomainModel {}

abstract class UiModelMapper<DomainModel, UIModel> {
  UIModel mapToPresentation(DomainModel model);
  DomainModel mapToDomain(UIModel modelItem);
}
