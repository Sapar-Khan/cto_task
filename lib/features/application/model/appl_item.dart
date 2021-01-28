class Appl {
  int id;
  String createdAt;
  String publishedAt;
  Null deletedAt;
  int platformId;
  int kind;
  int usrId;
  String usrName;
  String ava;
  int countryId;
  int cityId;
  int adGroupId;
  List<int> adCategoryIds;
  bool isAdGroupAutopart;
  int carId;
  List<dynamic> carmakeIds;
  int carmodelId;
  String carAva;
  int carYear;
  int partType;
  String address;
  String note;
  Map flexValues;
  int visits;
  int rate;
  int ratersCount;
  int popularity;
  String pafTime;
  bool isNew;
  int closedByAdId;
  int closedReasonId;
  int closedAmount;
  String closeNotifyAt;
  bool isDealer;

  Appl(
      {this.id,
      this.createdAt,
      this.publishedAt,
      this.deletedAt,
      this.platformId,
      this.kind,
      this.usrId,
      this.usrName,
      this.ava,
      this.countryId,
      this.cityId,
      this.adGroupId,
      this.adCategoryIds,
      this.isAdGroupAutopart,
      this.carId,
      this.carmakeIds,
      this.carmodelId,
      this.carAva,
      this.carYear,
      this.partType,
      this.address,
      this.note,
      this.flexValues,
      this.visits,
      this.rate,
      this.ratersCount,
      this.popularity,
      this.pafTime,
      this.isNew,
      this.closedByAdId,
      this.closedReasonId,
      this.closedAmount,
      this.closeNotifyAt,
      this.isDealer});

  Appl.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    publishedAt = json['published_at'];
    deletedAt = json['deleted_at'];
    platformId = json['platform_id'];
    kind = json['kind'];
    usrId = json['usr_id'];
    usrName = json['usr_name'];
    ava = json['ava'];
    countryId = json['country_id'];
    cityId = json['city_id'];
    adGroupId = json['ad_group_id'];
    adCategoryIds = json['ad_category_ids'].cast<int>();
    isAdGroupAutopart = json['is_ad_group_autopart'];
    carId = json['car_id'];
    carmakeIds = json['carmake_ids'];
    carmodelId = json['carmodel_id'];
    carAva = json['car_ava'];
    carYear = json['car_year'];
    partType = json['part_type'];
    address = json['address'];
    note = json['note'];
    flexValues = json['flex_values'];
    visits = json['visits'];
    rate = json['rate'];
    ratersCount = json['raters_count'];
    popularity = json['popularity'];
    pafTime = json['paf_time'];
    isNew = json['is_new'];
    closedByAdId = json['closed_by_ad_id'];
    closedReasonId = json['closed_reason_id'];
    closedAmount = json['closed_amount'];
    closeNotifyAt = json['close_notify_at'];
    isDealer = json['is_dealer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['published_at'] = this.publishedAt;
    data['deleted_at'] = this.deletedAt;
    data['platform_id'] = this.platformId;
    data['kind'] = this.kind;
    data['usr_id'] = this.usrId;
    data['usr_name'] = this.usrName;
    data['ava'] = this.ava;
    data['country_id'] = this.countryId;
    data['city_id'] = this.cityId;
    data['ad_group_id'] = this.adGroupId;
    data['ad_category_ids'] = this.adCategoryIds;
    data['is_ad_group_autopart'] = this.isAdGroupAutopart;
    data['car_id'] = this.carId;
    data['carmake_ids'] = this.carmakeIds;
    data['carmodel_id'] = this.carmodelId;
    data['car_ava'] = this.carAva;
    data['car_year'] = this.carYear;
    data['part_type'] = this.partType;
    data['address'] = this.address;
    data['note'] = this.note;
    data['flex_values'] = this.flexValues;
    data['visits'] = this.visits;
    data['rate'] = this.rate;
    data['raters_count'] = this.ratersCount;
    data['popularity'] = this.popularity;
    data['paf_time'] = this.pafTime;
    data['is_new'] = this.isNew;
    data['closed_by_ad_id'] = this.closedByAdId;
    data['closed_reason_id'] = this.closedReasonId;
    data['closed_amount'] = this.closedAmount;
    data['close_notify_at'] = this.closeNotifyAt;
    data['is_dealer'] = this.isDealer;
    return data;
  }
}
