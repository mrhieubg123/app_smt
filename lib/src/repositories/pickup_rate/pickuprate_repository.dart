abstract class  PickupRateRepository {
  Future getPickupRateStatus();
  Future getDataPickupRateAbnormalHandle();
  Future getDataPickupRateAnalysisByDay();
  Future getDataErrorCauseSolutionPickup();
  Future updateConfirmErrorPickup({required body});
}