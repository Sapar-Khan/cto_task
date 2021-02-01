class Dict {
  String _hs;
  Data _data;

  Dict({String hs, Data data}) {
    this._hs = hs;
    this._data = data;
  }

  String get hs => _hs;
  set hs(String hs) => _hs = hs;
  Data get data => _data;
  set data(Data data) => _data = data;

  Dict.fromJson(Map<String, dynamic> json) {
    _hs = json['hs'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hs'] = this._hs;
    if (this._data != null) {
      data['data'] = this._data.toJson();
    }
    return data;
  }
}

class Data {
  List<Platforms> _platforms;
  List<UsrTypes> _usrTypes;
  List<AdKinds> _adKinds;
  List<BankTrTypes> _bankTrTypes;
  List<BankRefillSystems> _bankRefillSystems;
  List<BankPurchaseTypes> _bankPurchaseTypes;
  List<Countries> _countries;
  List<Cities> _cities;
  List<AdGroups> _adGroups;
  List<AdCategories> _adCategories;
  List<Carmakes> _carmakes;
  List<Carmodels> _carmodels;
  List<AdCloseReasons> _adCloseReasons;
  List<ProAdPrices> _proAdPrices;
  List<OrderRejectReasons> _orderRejectReasons;
  Config _config;

  Data(
      {List<Platforms> platforms,
      List<UsrTypes> usrTypes,
      List<AdKinds> adKinds,
      List<BankTrTypes> bankTrTypes,
      List<BankRefillSystems> bankRefillSystems,
      List<BankPurchaseTypes> bankPurchaseTypes,
      List<Countries> countries,
      List<Cities> cities,
      List<AdGroups> adGroups,
      List<AdCategories> adCategories,
      List<Carmakes> carmakes,
      List<Carmodels> carmodels,
      List<AdCloseReasons> adCloseReasons,
      List<ProAdPrices> proAdPrices,
      List<OrderRejectReasons> orderRejectReasons,
      Config config}) {
    this._platforms = platforms;
    this._usrTypes = usrTypes;
    this._adKinds = adKinds;
    this._bankTrTypes = bankTrTypes;
    this._bankRefillSystems = bankRefillSystems;
    this._bankPurchaseTypes = bankPurchaseTypes;
    this._countries = countries;
    this._cities = cities;
    this._adGroups = adGroups;
    this._adCategories = adCategories;
    this._carmakes = carmakes;
    this._carmodels = carmodels;
    this._adCloseReasons = adCloseReasons;
    this._proAdPrices = proAdPrices;
    this._orderRejectReasons = orderRejectReasons;
    this._config = config;
  }

  List<Platforms> get platforms => _platforms;
  set platforms(List<Platforms> platforms) => _platforms = platforms;
  List<UsrTypes> get usrTypes => _usrTypes;
  set usrTypes(List<UsrTypes> usrTypes) => _usrTypes = usrTypes;
  List<AdKinds> get adKinds => _adKinds;
  set adKinds(List<AdKinds> adKinds) => _adKinds = adKinds;
  List<BankTrTypes> get bankTrTypes => _bankTrTypes;
  set bankTrTypes(List<BankTrTypes> bankTrTypes) => _bankTrTypes = bankTrTypes;
  List<BankRefillSystems> get bankRefillSystems => _bankRefillSystems;
  set bankRefillSystems(List<BankRefillSystems> bankRefillSystems) =>
      _bankRefillSystems = bankRefillSystems;
  List<BankPurchaseTypes> get bankPurchaseTypes => _bankPurchaseTypes;
  set bankPurchaseTypes(List<BankPurchaseTypes> bankPurchaseTypes) =>
      _bankPurchaseTypes = bankPurchaseTypes;
  List<Countries> get countries => _countries;
  set countries(List<Countries> countries) => _countries = countries;
  List<Cities> get cities => _cities;
  set cities(List<Cities> cities) => _cities = cities;
  List<AdGroups> get adGroups => _adGroups;
  set adGroups(List<AdGroups> adGroups) => _adGroups = adGroups;
  List<AdCategories> get adCategories => _adCategories;
  set adCategories(List<AdCategories> adCategories) =>
      _adCategories = adCategories;
  List<Carmakes> get carmakes => _carmakes;
  set carmakes(List<Carmakes> carmakes) => _carmakes = carmakes;
  List<Carmodels> get carmodels => _carmodels;
  set carmodels(List<Carmodels> carmodels) => _carmodels = carmodels;
  List<AdCloseReasons> get adCloseReasons => _adCloseReasons;
  set adCloseReasons(List<AdCloseReasons> adCloseReasons) =>
      _adCloseReasons = adCloseReasons;
  List<ProAdPrices> get proAdPrices => _proAdPrices;
  set proAdPrices(List<ProAdPrices> proAdPrices) => _proAdPrices = proAdPrices;
  List<OrderRejectReasons> get orderRejectReasons => _orderRejectReasons;
  set orderRejectReasons(List<OrderRejectReasons> orderRejectReasons) =>
      _orderRejectReasons = orderRejectReasons;
  Config get config => _config;
  set config(Config config) => _config = config;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['platforms'] != null) {
      _platforms = new List<Platforms>();
      json['platforms'].forEach((v) {
        _platforms.add(new Platforms.fromJson(v));
      });
    }
    if (json['usr_types'] != null) {
      _usrTypes = new List<UsrTypes>();
      json['usr_types'].forEach((v) {
        _usrTypes.add(new UsrTypes.fromJson(v));
      });
    }
    if (json['ad_kinds'] != null) {
      _adKinds = new List<AdKinds>();
      json['ad_kinds'].forEach((v) {
        _adKinds.add(new AdKinds.fromJson(v));
      });
    }
    if (json['bank_tr_types'] != null) {
      _bankTrTypes = new List<BankTrTypes>();
      json['bank_tr_types'].forEach((v) {
        _bankTrTypes.add(new BankTrTypes.fromJson(v));
      });
    }
    if (json['bank_refill_systems'] != null) {
      _bankRefillSystems = new List<BankRefillSystems>();
      json['bank_refill_systems'].forEach((v) {
        _bankRefillSystems.add(new BankRefillSystems.fromJson(v));
      });
    }
    if (json['bank_purchase_types'] != null) {
      _bankPurchaseTypes = new List<BankPurchaseTypes>();
      json['bank_purchase_types'].forEach((v) {
        _bankPurchaseTypes.add(new BankPurchaseTypes.fromJson(v));
      });
    }
    if (json['countries'] != null) {
      _countries = new List<Countries>();
      json['countries'].forEach((v) {
        _countries.add(new Countries.fromJson(v));
      });
    }
    if (json['cities'] != null) {
      _cities = new List<Cities>();
      json['cities'].forEach((v) {
        _cities.add(new Cities.fromJson(v));
      });
    }
    if (json['ad_groups'] != null) {
      _adGroups = new List<AdGroups>();
      json['ad_groups'].forEach((v) {
        _adGroups.add(new AdGroups.fromJson(v));
      });
    }
    if (json['ad_categories'] != null) {
      _adCategories = new List<AdCategories>();
      json['ad_categories'].forEach((v) {
        _adCategories.add(new AdCategories.fromJson(v));
      });
    }
    if (json['carmakes'] != null) {
      _carmakes = new List<Carmakes>();
      json['carmakes'].forEach((v) {
        _carmakes.add(new Carmakes.fromJson(v));
      });
    }
    if (json['carmodels'] != null) {
      _carmodels = new List<Carmodels>();
      json['carmodels'].forEach((v) {
        _carmodels.add(new Carmodels.fromJson(v));
      });
    }
    if (json['ad_close_reasons'] != null) {
      _adCloseReasons = new List<AdCloseReasons>();
      json['ad_close_reasons'].forEach((v) {
        _adCloseReasons.add(new AdCloseReasons.fromJson(v));
      });
    }
    if (json['pro_ad_prices'] != null) {
      _proAdPrices = new List<ProAdPrices>();
      json['pro_ad_prices'].forEach((v) {
        _proAdPrices.add(new ProAdPrices.fromJson(v));
      });
    }
    if (json['order_reject_reasons'] != null) {
      _orderRejectReasons = new List<OrderRejectReasons>();
      json['order_reject_reasons'].forEach((v) {
        _orderRejectReasons.add(new OrderRejectReasons.fromJson(v));
      });
    }
    _config =
        json['config'] != null ? new Config.fromJson(json['config']) : null;
  }

  Map<int, String> getCityes(){
    Map<int, String> c = new Map<int, String>();
    List<Cities> cl = this._cities;
    for(int i = 0, l = cl.length; i < l; i++){
      c[cl[i].id] = cl[i].name;
    }
    return c;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._platforms != null) {
      data['platforms'] = this._platforms.map((v) => v.toJson()).toList();
    }
    if (this._usrTypes != null) {
      data['usr_types'] = this._usrTypes.map((v) => v.toJson()).toList();
    }
    if (this._adKinds != null) {
      data['ad_kinds'] = this._adKinds.map((v) => v.toJson()).toList();
    }
    if (this._bankTrTypes != null) {
      data['bank_tr_types'] = this._bankTrTypes.map((v) => v.toJson()).toList();
    }
    if (this._bankRefillSystems != null) {
      data['bank_refill_systems'] =
          this._bankRefillSystems.map((v) => v.toJson()).toList();
    }
    if (this._bankPurchaseTypes != null) {
      data['bank_purchase_types'] =
          this._bankPurchaseTypes.map((v) => v.toJson()).toList();
    }
    if (this._countries != null) {
      data['countries'] = this._countries.map((v) => v.toJson()).toList();
    }
    if (this._cities != null) {
      data['cities'] = this._cities.map((v) => v.toJson()).toList();
    }
    if (this._adGroups != null) {
      data['ad_groups'] = this._adGroups.map((v) => v.toJson()).toList();
    }
    if (this._adCategories != null) {
      data['ad_categories'] =
          this._adCategories.map((v) => v.toJson()).toList();
    }
    if (this._carmakes != null) {
      data['carmakes'] = this._carmakes.map((v) => v.toJson()).toList();
    }
    if (this._carmodels != null) {
      data['carmodels'] = this._carmodels.map((v) => v.toJson()).toList();
    }
    if (this._adCloseReasons != null) {
      data['ad_close_reasons'] =
          this._adCloseReasons.map((v) => v.toJson()).toList();
    }
    if (this._proAdPrices != null) {
      data['pro_ad_prices'] = this._proAdPrices.map((v) => v.toJson()).toList();
    }
    if (this._orderRejectReasons != null) {
      data['order_reject_reasons'] =
          this._orderRejectReasons.map((v) => v.toJson()).toList();
    }
    if (this._config != null) {
      data['config'] = this._config.toJson();
    }
    return data;
  }
}

class OrderRejectReasons {
  int _id;
  String _name;
  int _ord;

  OrderRejectReasons({int id, String name, int ord}) {
    this._id = id;
    this._name = name;
    this._ord = ord;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  int get ord => _ord;
  set ord(int ord) => _id = ord;

  OrderRejectReasons.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _ord = json['ord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['ord'] = this._ord;
    return data;
  }
}

class AdCloseReasons {
  int _id;
  String _name;
  int _ord;

  AdCloseReasons({int id, String name, int ord}) {
    this._id = id;
    this._name = name;
    this._ord = ord;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  int get ord => _ord;
  set ord(int ord) => _id = ord;

  AdCloseReasons.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _ord = json['ord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['ord'] = this._ord;
    return data;
  }
}

class BankPurchaseTypes {
  int _id;
  String _name;
  int _tr_type_id;

  BankPurchaseTypes({int id, String name, int tr_type_id}) {
    this._id = id;
    this._name = name;
    this._tr_type_id = tr_type_id;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  int get tr_type_id => _id;
  set tr_type_id(int tr_type_id) => _id = tr_type_id;

  BankPurchaseTypes.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _tr_type_id = json['tr_type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['tr_type_id'] = this._tr_type_id;
    return data;
  }
}

class BankTrTypes {
  int _id;
  String _name;

  BankTrTypes({int id, String name}) {
    this._id = id;
    this._name = name;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;

  BankTrTypes.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    return data;
  }
}

class Platforms {
  int _id;
  String _name;

  Platforms({int id, String name}) {
    this._id = id;
    this._name = name;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;

  Platforms.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    return data;
  }
}

class UsrTypes {
  int _id;
  String _name;
  String _code;

  UsrTypes({int id, String name, String code}) {
    this._id = id;
    this._name = name;
    this._code = code;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get code => _code;
  set code(String code) => _code = code;

  UsrTypes.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['code'] = this._code;
    return data;
  }
}

class AdKinds {
  int _id;
  String _name;
  String _code;
  int _crmId;

  AdKinds({int id, String name, String code, int crmId}) {
    this._id = id;
    this._name = name;
    this._code = code;
    this._crmId = crmId;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get code => _code;
  set code(String code) => _code = code;
  int get crmId => _crmId;
  set crmId(int crmId) => _crmId = crmId;

  AdKinds.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _crmId = json['crm_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['code'] = this._code;
    data['crm_id'] = this._crmId;
    return data;
  }
}

class BankRefillSystems {
  int _id;
  String _name;
  int _trTypeId;

  BankRefillSystems({int id, String name, int trTypeId}) {
    this._id = id;
    this._name = name;
    this._trTypeId = trTypeId;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  int get trTypeId => _trTypeId;
  set trTypeId(int trTypeId) => _trTypeId = trTypeId;

  BankRefillSystems.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _trTypeId = json['tr_type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['tr_type_id'] = this._trTypeId;
    return data;
  }
}

class Countries {
  int _id;
  String _name;
  int _ord;

  Countries({int id, String name, int ord}) {
    this._id = id;
    this._name = name;
    this._ord = ord;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  int get ord => _ord;
  set ord(int ord) => _ord = ord;

  Countries.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _ord = json['ord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['ord'] = this._ord;
    return data;
  }
}

class Cities {
  int _id;
  int _countryId;
  String _name;
  String _nameEn;
  int _ord;
  List<double> _location;
  int _radius;

  Cities(
      {int id,
      int countryId,
      String name,
      String nameEn,
      int ord,
      List<double> location,
      int radius}) {
    this._id = id;
    this._countryId = countryId;
    this._name = name;
    this._nameEn = nameEn;
    this._ord = ord;
    this._location = location;
    this._radius = radius;
  }

  int get id => _id;
  set id(int id) => _id = id;
  int get countryId => _countryId;
  set countryId(int countryId) => _countryId = countryId;
  String get name => _name;
  set name(String name) => _name = name;
  String get nameEn => _nameEn;
  set nameEn(String nameEn) => _nameEn = nameEn;
  int get ord => _ord;
  set ord(int ord) => _ord = ord;
  List<double> get location => _location;
  set location(List<double> location) => _location = location;
  int get radius => _radius;
  set radius(int radius) => _radius = radius;

  Cities.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _countryId = json['country_id'];
    _name = json['name'];
    _nameEn = json['name_en'];
    _ord = json['ord'];
    _location = json['location'].cast<double>();
    _radius = json['radius'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['country_id'] = this._countryId;
    data['name'] = this._name;
    data['name_en'] = this._nameEn;
    data['ord'] = this._ord;
    data['location'] = this._location;
    data['radius'] = this._radius;
    return data;
  }
}

class AdGroups {
  int _id;
  String _name;
  int _ord;
  String _icon;
  bool _isAutopart;

  AdGroups({int id, String name, int ord, String icon, bool isAutopart}) {
    this._id = id;
    this._name = name;
    this._ord = ord;
    this._icon = icon;
    this._isAutopart = isAutopart;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  int get ord => _ord;
  set ord(int ord) => _ord = ord;
  String get icon => _icon;
  set icon(String icon) => _icon = icon;
  bool get isAutopart => _isAutopart;
  set isAutopart(bool isAutopart) => _isAutopart = isAutopart;

  AdGroups.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _ord = json['ord'];
    _icon = json['icon'];
    _isAutopart = json['is_autopart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['ord'] = this._ord;
    data['icon'] = this._icon;
    data['is_autopart'] = this._isAutopart;
    return data;
  }
}

class AdCategories {
  int _id;
  int _groupId;
  String _name;
  int _ord;
  List<FlexFields> _flexFields;
  String _note;
  String _hashtags;

  AdCategories(
      {int id,
      int groupId,
      String name,
      int ord,
      List<FlexFields> flexFields,
      String note,
      String hashtags}) {
    this._id = id;
    this._groupId = groupId;
    this._name = name;
    this._ord = ord;
    this._flexFields = flexFields;
    this._note = note;
    this._hashtags = hashtags;
  }

  int get id => _id;
  set id(int id) => _id = id;
  int get groupId => _groupId;
  set groupId(int groupId) => _groupId = groupId;
  String get name => _name;
  set name(String name) => _name = name;
  int get ord => _ord;
  set ord(int ord) => _ord = ord;
  List<FlexFields> get flexFields => _flexFields;
  set flexFields(List<FlexFields> flexFields) => _flexFields = flexFields;
  String get note => _note;
  set note(String note) => _note = note;
  String get hashtags => _hashtags;
  set hashtags(String hashtags) => _hashtags = hashtags;

  AdCategories.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _groupId = json['group_id'];
    _name = json['name'];
    _ord = json['ord'];
    if (json['flex_fields'] != null) {
      _flexFields = new List<FlexFields>();
      json['flex_fields'].forEach((v) {
        _flexFields.add(new FlexFields.fromJson(v));
      });
    }
    _note = json['note'];
    _hashtags = json['hashtags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['group_id'] = this._groupId;
    data['name'] = this._name;
    data['ord'] = this._ord;
    if (this._flexFields != null) {
      data['flex_fields'] = this._flexFields.map((v) => v.toJson()).toList();
    }
    data['note'] = this._note;
    data['hashtags'] = this._hashtags;
    return data;
  }
}

class FlexFields {
  String _name;
  String _type;
  String _label;
  int _adKind;
  List<Variants> _variants;

  FlexFields(
      {String name,
      String type,
      String label,
      int adKind,
      List<Variants> variants}) {
    this._name = name;
    this._type = type;
    this._label = label;
    this._adKind = adKind;
    this._variants = variants;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get type => _type;
  set type(String type) => _type = type;
  String get label => _label;
  set label(String label) => _label = label;
  int get adKind => _adKind;
  set adKind(int adKind) => _adKind = adKind;
  List<Variants> get variants => _variants;
  set variants(List<Variants> variants) => _variants = variants;

  FlexFields.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _type = json['type'];
    _label = json['label'];
    _adKind = json['ad_kind'];
    if (json['variants'] != null) {
      _variants = new List<Variants>();
      json['variants'].forEach((v) {
        _variants.add(new Variants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['type'] = this._type;
    data['label'] = this._label;
    data['ad_kind'] = this._adKind;
    if (this._variants != null) {
      data['variants'] = this._variants.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Variants {
  String _label;
  String _value;

  Variants({String label, String value}) {
    this._label = label;
    this._value = value;
  }

  String get label => _label;
  set label(String label) => _label = label;
  String get value => _value;
  set value(String value) => _value = value;

  Variants.fromJson(Map<String, dynamic> json) {
    _label = json['label'];
    _value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this._label;
    data['value'] = this._value;
    return data;
  }
}

class Carmakes {
  int _id;
  String _name;
  int _ord;
  String _img;
  bool _isPopular;

  Carmakes({int id, String name, int ord, String img, bool isPopular}) {
    this._id = id;
    this._name = name;
    this._ord = ord;
    this._img = img;
    this._isPopular = isPopular;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  int get ord => _ord;
  set ord(int ord) => _ord = ord;
  String get img => _img;
  set img(String img) => _img = img;
  bool get isPopular => _isPopular;
  set isPopular(bool isPopular) => _isPopular = isPopular;

  Carmakes.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _ord = json['ord'];
    _img = json['img'];
    _isPopular = json['is_popular'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['ord'] = this._ord;
    data['img'] = this._img;
    data['is_popular'] = this._isPopular;
    return data;
  }
}

class Carmodels {
  int _id;
  int _carmakeId;
  String _name;
  int _ord;

  Carmodels({int id, int carmakeId, String name, int ord}) {
    this._id = id;
    this._carmakeId = carmakeId;
    this._name = name;
    this._ord = ord;
  }

  int get id => _id;
  set id(int id) => _id = id;
  int get carmakeId => _carmakeId;
  set carmakeId(int carmakeId) => _carmakeId = carmakeId;
  String get name => _name;
  set name(String name) => _name = name;
  int get ord => _ord;
  set ord(int ord) => _ord = ord;

  Carmodels.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _carmakeId = json['carmake_id'];
    _name = json['name'];
    _ord = json['ord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['carmake_id'] = this._carmakeId;
    data['name'] = this._name;
    data['ord'] = this._ord;
    return data;
  }
}

class ProAdPrices {
  int _cityId;
  int _adGroupId;
  int _periodDays;
  int _commentCountMv;
  int _cost;

  ProAdPrices(
      {int cityId,
      int adGroupId,
      int periodDays,
      int commentCountMv,
      int cost}) {
    this._cityId = cityId;
    this._adGroupId = adGroupId;
    this._periodDays = periodDays;
    this._commentCountMv = commentCountMv;
    this._cost = cost;
  }

  int get cityId => _cityId;
  set cityId(int cityId) => _cityId = cityId;
  int get adGroupId => _adGroupId;
  set adGroupId(int adGroupId) => _adGroupId = adGroupId;
  int get periodDays => _periodDays;
  set periodDays(int periodDays) => _periodDays = periodDays;
  int get commentCountMv => _commentCountMv;
  set commentCountMv(int commentCountMv) => _commentCountMv = commentCountMv;
  int get cost => _cost;
  set cost(int cost) => _cost = cost;

  ProAdPrices.fromJson(Map<String, dynamic> json) {
    _cityId = json['city_id'];
    _adGroupId = json['ad_group_id'];
    _periodDays = json['period_days'];
    _commentCountMv = json['comment_count_mv'];
    _cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this._cityId;
    data['ad_group_id'] = this._adGroupId;
    data['period_days'] = this._periodDays;
    data['comment_count_mv'] = this._commentCountMv;
    data['cost'] = this._cost;
    return data;
  }
}

class Config {
  Contacts _contacts;

  Config({Contacts contacts}) {
    this._contacts = contacts;
  }

  Contacts get contacts => _contacts;
  set contacts(Contacts contacts) => _contacts = contacts;

  Config.fromJson(Map<String, dynamic> json) {
    _contacts = json['contacts'] != null
        ? new Contacts.fromJson(json['contacts'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._contacts != null) {
      data['contacts'] = this._contacts.toJson();
    }
    return data;
  }
}

class Contacts {
  String _site;
  String _phone;
  String _email;
  String _inst;

  Contacts({String site, String phone, String email, String inst}) {
    this._site = site;
    this._phone = phone;
    this._email = email;
    this._inst = inst;
  }

  String get site => _site;
  set site(String site) => _site = site;
  String get phone => _phone;
  set phone(String phone) => _phone = phone;
  String get email => _email;
  set email(String email) => _email = email;
  String get inst => _inst;
  set inst(String inst) => _inst = inst;

  Contacts.fromJson(Map<String, dynamic> json) {
    _site = json['site'];
    _phone = json['phone'];
    _email = json['email'];
    _inst = json['inst'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['site'] = this._site;
    data['phone'] = this._phone;
    data['email'] = this._email;
    data['inst'] = this._inst;
    return data;
  }
}
