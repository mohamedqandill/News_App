

abstract class HomeState {}

class HomeinitState extends HomeState{}

class getSourcesLoadingState extends HomeState{}
class getSourcesSuccesState extends HomeState{}
class getSourcesErrorState extends HomeState{

  String error;
  getSourcesErrorState(this.error);

}


class getNewsLoadingState extends HomeState{}
class getNewsSuccesState extends HomeState{}
class getNewsErrorState extends HomeState{
  String error;
  getNewsErrorState(this.error);
}

class HomeTapClickedState extends HomeState{}

class HomeSelectedCategoriesState extends HomeState{}
class HomeresetDataState extends HomeState{}
