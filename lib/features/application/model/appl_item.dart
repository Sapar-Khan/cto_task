class Appl {
  int _page;
  int _pageSize;
  int _totalCount;
  List<Results> _results;

  Appl({int page, int pageSize, int totalCount, List<Results> results}) {
    this._page = page;
    this._pageSize = pageSize;
    this._totalCount = totalCount;
    this._results = results;
  }

  int get page => _page;
  set page(int page) => _page = page;
  int get pageSize => _pageSize;
  set pageSize(int pageSize) => _pageSize = pageSize;
  int get totalCount => _totalCount;
  set totalCount(int totalCount) => _totalCount = totalCount;
  List<Results> get results => _results;
  set results(List<Results> results) => _results = results;

  Appl.fromJson(Map<String, dynamic> json, Map<int, String> city) {
    _page = json['page'];
    _pageSize = json['page_size'];
    _totalCount = json['total_count'];
    if (json['results'] != null) {
      _results = new List<Results>();
      json['results'].forEach((v) {
        v['c_name'] = city[v['city_id']];
        _results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this._page;
    data['page_size'] = this._pageSize;
    data['total_count'] = this._totalCount;
    if (this._results != null) {
      data['results'] = this._results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int _id;
  String _createdAt;
  String _publishedAt;
  dynamic _deletedAt;
  int _platformId;
  int _kind;
  int _usrId;
  String _usrName;
  String _ava;
  int _countryId;
  int _cityId;
  int _adGroupId;
  List<int> _adCategoryIds;
  bool _isAdGroupAutopart;
  int _carId;
  List<dynamic> _carmakeIds;
  int _carmodelId;
  String _carAva;
  int _carYear;
  int _partType;
  String _address;
  String _note;
  Map<String, dynamic> _flexValues;
  int _visits;
  num _rate;
  int _ratersCount;
  int _popularity;
  String _pafTime;
  bool _isNew;
  int _closedByAdId;
  int _closedReasonId;
  int _closedAmount;
  String _closeNotifyAt;
  bool _isDealer;
  String _c_name;

  Results(
      {int id,
      String createdAt,
      String publishedAt,
      dynamic deletedAt,
      int platformId,
      int kind,
      int usrId,
      String usrName,
      String ava,
      int countryId,
      int cityId,
      int adGroupId,
      List<int> adCategoryIds,
      bool isAdGroupAutopart,
      int carId,
      List<dynamic> carmakeIds,
      int carmodelId,
      String carAva,
      int carYear,
      int partType,
      String address,
      String note,
      Map flexValues,
      int visits,
      num rate,
      int ratersCount,
      int popularity,
      String pafTime,
      bool isNew,
      int closedByAdId,
      int closedReasonId,
      int closedAmount,
      String closeNotifyAt,
      bool isDealer,
      String c_name}) {
    this._id = id;
    this._createdAt = createdAt;
    this._publishedAt = publishedAt;
    this._deletedAt = deletedAt;
    this._platformId = platformId;
    this._kind = kind;
    this._usrId = usrId;
    this._usrName = usrName;
    this._ava = ava;
    this._countryId = countryId;
    this._cityId = cityId;
    this._adGroupId = adGroupId;
    this._adCategoryIds = adCategoryIds;
    this._isAdGroupAutopart = isAdGroupAutopart;
    this._carId = carId;
    this._carmakeIds = carmakeIds;
    this._carmodelId = carmodelId;
    this._carAva = carAva;
    this._carYear = carYear;
    this._partType = partType;
    this._address = address;
    this._note = note;
    this._flexValues = flexValues;
    this._visits = visits;
    this._rate = rate;
    this._ratersCount = ratersCount;
    this._popularity = popularity;
    this._pafTime = pafTime;
    this._isNew = isNew;
    this._closedByAdId = closedByAdId;
    this._closedReasonId = closedReasonId;
    this._closedAmount = closedAmount;
    this._closeNotifyAt = closeNotifyAt;
    this._isDealer = isDealer;
    this._c_name = c_name;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get publishedAt => _publishedAt;
  set publishedAt(String publishedAt) => _publishedAt = publishedAt;
  dynamic get deletedAt => _deletedAt;
  set deletedAt(dynamic deletedAt) => _deletedAt = deletedAt;
  int get platformId => _platformId;
  set platformId(int platformId) => _platformId = platformId;
  int get kind => _kind;
  set kind(int kind) => _kind = kind;
  int get usrId => _usrId;
  set usrId(int usrId) => _usrId = usrId;
  String get usrName => _usrName;
  set usrName(String usrName) => _usrName = usrName;
  String get ava => _ava;
  set ava(String ava) => _ava = ava;
  int get countryId => _countryId;
  set countryId(int countryId) => _countryId = countryId;
  int get cityId => _cityId;
  set cityId(int cityId) => _cityId = cityId;
  int get adGroupId => _adGroupId;
  set adGroupId(int adGroupId) => _adGroupId = adGroupId;
  List<int> get adCategoryIds => _adCategoryIds;
  set adCategoryIds(List<int> adCategoryIds) => _adCategoryIds = adCategoryIds;
  bool get isAdGroupAutopart => _isAdGroupAutopart;
  set isAdGroupAutopart(bool isAdGroupAutopart) =>
      _isAdGroupAutopart = isAdGroupAutopart;
  int get carId => _carId;
  set carId(int carId) => _carId = carId;
  List<dynamic> get carmakeIds => _carmakeIds;
  set carmakeIds(List<dynamic> carmakeIds) => _carmakeIds = carmakeIds;
  int get carmodelId => _carmodelId;
  set carmodelId(int carmodelId) => _carmodelId = carmodelId;
  String get carAva => _carAva;
  set carAva(String carAva) => _carAva = carAva;
  int get carYear => _carYear;
  set carYear(int carYear) => _carYear = carYear;
  int get partType => _partType;
  set partType(int partType) => _partType = partType;
  String get address => _address;
  set address(String address) => _address = address;
  String get note => _note;
  set note(String note) => _note = note;
  Map get flexValues => _flexValues;
  set flexValues(Map flexValues) => _flexValues = flexValues;
  int get visits => _visits;
  set visits(int visits) => _visits = visits;
  num get rate => _rate;
  set rate(num rate) => _rate = rate;
  int get ratersCount => _ratersCount;
  set ratersCount(int ratersCount) => _ratersCount = ratersCount;
  int get popularity => _popularity;
  set popularity(int popularity) => _popularity = popularity;
  String get pafTime => _pafTime;
  set pafTime(String pafTime) => _pafTime = pafTime;
  bool get isNew => _isNew;
  set isNew(bool isNew) => _isNew = isNew;
  int get closedByAdId => _closedByAdId;
  set closedByAdId(int closedByAdId) => _closedByAdId = closedByAdId;
  int get closedReasonId => _closedReasonId;
  set closedReasonId(int closedReasonId) => _closedReasonId = closedReasonId;
  int get closedAmount => _closedAmount;
  set closedAmount(int closedAmount) => _closedAmount = closedAmount;
  String get closeNotifyAt => _closeNotifyAt;
  set closeNotifyAt(String closeNotifyAt) => _closeNotifyAt = closeNotifyAt;
  bool get isDealer => _isDealer;
  set isDealer(bool isDealer) => _isDealer = isDealer;
  String get c_name => _c_name;
  set c_name(String c_name) => _c_name = c_name;

  Results.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _createdAt = json['created_at'];
    _publishedAt = json['published_at'];
    _deletedAt = json['deleted_at'];
    _platformId = json['platform_id'];
    _kind = json['kind'];
    _usrId = json['usr_id'];
    _usrName = json['usr_name'];
    _ava = json['ava'];
    _countryId = json['country_id'];
    _cityId = json['city_id'];
    _adGroupId = json['ad_group_id'];
    _adCategoryIds = json['ad_category_ids'].cast<int>();
    _isAdGroupAutopart = json['is_ad_group_autopart'];
    _carId = json['car_id'];
    _carmakeIds = json['carmake_ids'];
    _carmodelId = json['carmodel_id'];
    _carAva = json['car_ava'];
    _carYear = json['car_year'];
    _partType = json['part_type'];
    _address = json['address'];
    _note = json['note'];
    _flexValues = json['flex_values'];
    _visits = json['visits'];
    _rate = json['rate'];
    _ratersCount = json['raters_count'];
    _popularity = json['popularity'];
    _pafTime = json['paf_time'];
    _isNew = json['is_new'];
    _closedByAdId = json['closed_by_ad_id'];
    _closedReasonId = json['closed_reason_id'];
    _closedAmount = json['closed_amount'];
    _closeNotifyAt = json['close_notify_at'];
    _isDealer = json['is_dealer'];
    _c_name = json['c_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['created_at'] = this._createdAt;
    data['published_at'] = this._publishedAt;
    data['deleted_at'] = this._deletedAt;
    data['platform_id'] = this._platformId;
    data['kind'] = this._kind;
    data['usr_id'] = this._usrId;
    data['usr_name'] = this._usrName;
    data['ava'] = this._ava;
    data['country_id'] = this._countryId;
    data['city_id'] = this._cityId;
    data['ad_group_id'] = this._adGroupId;
    data['ad_category_ids'] = this._adCategoryIds;
    data['is_ad_group_autopart'] = this._isAdGroupAutopart;
    data['car_id'] = this._carId;
    data['carmake_ids'] = this._carmakeIds;
    data['carmodel_id'] = this._carmodelId;
    data['car_ava'] = this._carAva;
    data['car_year'] = this._carYear;
    data['part_type'] = this._partType;
    data['address'] = this._address;
    data['note'] = this._note;
    data['flex_values'] = this._flexValues;
    data['visits'] = this._visits;
    data['rate'] = this._rate;
    data['raters_count'] = this._ratersCount;
    data['popularity'] = this._popularity;
    data['paf_time'] = this._pafTime;
    data['is_new'] = this._isNew;
    data['closed_by_ad_id'] = this._closedByAdId;
    data['closed_reason_id'] = this._closedReasonId;
    data['closed_amount'] = this._closedAmount;
    data['close_notify_at'] = this._closeNotifyAt;
    data['is_dealer'] = this._isDealer;
    return data;
  }
}
