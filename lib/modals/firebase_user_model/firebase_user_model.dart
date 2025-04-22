import 'dart:convert';

// Define model classes
FirebaseUserModel firebaseUserModelFromJson(String str) =>
    FirebaseUserModel.fromJson(json.decode(str));
String firebaseUserModelToJson(FirebaseUserModel data) =>
    json.encode(data.toJson());

class FirebaseUserModel {
  FirebaseUserModel({UserData? userdata}) {
    _userdata = userdata;
  }

  FirebaseUserModel.fromJson(dynamic json) {
    _userdata = json['user-data'] != null ? UserData.fromJson(json['user-data']) : null;
  }

  UserData? _userdata;

  FirebaseUserModel copyWith({UserData? userdata}) =>
      FirebaseUserModel(userdata: userdata ?? _userdata);

  UserData? get userdata => _userdata;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_userdata != null) {
      map['user-data'] = _userdata?.toJson();
    }
    return map;
  }
}

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));
String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({UserDetails? userDetails}) {
    _userDetails = userDetails;
  }

  UserData.fromJson(dynamic json) {
    _userDetails = json['35202-3099223-9'] != null
        ? UserDetails.fromJson(json['35202-3099223-9'])
        : null;
  }

  UserDetails? _userDetails;

  UserData copyWith({UserDetails? userDetails}) =>
      UserData(userDetails: userDetails ?? _userDetails);

  UserDetails? get userDetails => _userDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_userDetails != null) {
      map['35202-3099223-9'] = _userDetails?.toJson();
    }
    return map;
  }
}

UserDetails userDetailsFromJson(String str) =>
    UserDetails.fromJson(json.decode(str));
String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
  UserDetails({PatientRecord? patientRecord}) {
    _patientRecord = patientRecord;
  }

  UserDetails.fromJson(dynamic json) {
    _patientRecord = json['-OOF6fVSyGr4a8qWFk4a'] != null
        ? PatientRecord.fromJson(json['-OOF6fVSyGr4a8qWFk4a'])
        : null;
  }

  PatientRecord? _patientRecord;

  UserDetails copyWith({PatientRecord? patientRecord}) =>
      UserDetails(patientRecord: patientRecord ?? _patientRecord);

  PatientRecord? get patientRecord => _patientRecord;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_patientRecord != null) {
      map['-OOF6fVSyGr4a8qWFk4a'] = _patientRecord?.toJson();
    }
    return map;
  }
}

PatientRecord patientRecordFromJson(String str) =>
    PatientRecord.fromJson(json.decode(str));
String patientRecordToJson(PatientRecord data) => json.encode(data.toJson());

class PatientRecord {
  PatientRecord({FormData? formData, String? predictionResult}) {
    _formData = formData;
    _predictionResult = predictionResult;
  }

  PatientRecord.fromJson(dynamic json) {
    _formData = json['formData'] != null ? FormData.fromJson(json['formData']) : null;
    _predictionResult = json['predictionResult'];
  }

  FormData? _formData;
  String? _predictionResult;

  PatientRecord copyWith({FormData? formData, String? predictionResult}) =>
      PatientRecord(formData: formData ?? _formData, predictionResult: predictionResult ?? _predictionResult);

  FormData? get formData => _formData;
  String? get predictionResult => _predictionResult;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_formData != null) {
      map['formData'] = _formData?.toJson();
    }
    map['predictionResult'] = _predictionResult;
    return map;
  }
}

FormData formDataFromJson(String str) => FormData.fromJson(json.decode(str));
String formDataToJson(FormData data) => json.encode(data.toJson());

class FormData {
  FormData({
    String? age,
    String? angina,
    String? bloodPressure,
    String? cnic,
    String? chestPain,
    String? cholesterol,
    String? ecg,
    String? fastingSugar,
    String? heartRate,
    String? majorLargeVessels,
    String? patientName,
    String? sex,
    String? slop,
    String? thalassemiaType,
    String? patientDepression,
  }) {
    _age = age;
    _angina = angina;
    _bloodPressure = bloodPressure;
    _cnic = cnic;
    _chestPain = chestPain;
    _cholesterol = cholesterol;
    _ecg = ecg;
    _fastingSugar = fastingSugar;
    _heartRate = heartRate;
    _majorLargeVessels = majorLargeVessels;
    _patientName = patientName;
    _sex = sex;
    _slop = slop;
    _thalassemiaType = thalassemiaType;
    _patientDepression = patientDepression;
  }

  FormData.fromJson(dynamic json) {
    _age = json['Age'];
    _angina = json['Angina'];
    _bloodPressure = json['Blood Pressure'];
    _cnic = json['CNIC'];
    _chestPain = json['Chest Pain'];
    _cholesterol = json['Cholesterol'];
    _ecg = json['ECG'];
    _fastingSugar = json['Fasting Sugar'];
    _heartRate = json['Heart Rate'];
    _majorLargeVessels = json['Major Large Vessels'];
    _patientName = json['Patient Name'];
    _sex = json['Sex'];
    _slop = json['Slop'];
    _thalassemiaType = json['Thalassemia Type'];
    _patientDepression = json['patient Depression'];
  }

  String? _age;
  String? _angina;
  String? _bloodPressure;
  String? _cnic;
  String? _chestPain;
  String? _cholesterol;
  String? _ecg;
  String? _fastingSugar;
  String? _heartRate;
  String? _majorLargeVessels;
  String? _patientName;
  String? _sex;
  String? _slop;
  String? _thalassemiaType;
  String? _patientDepression;

  FormData copyWith({
    String? age,
    String? angina,
    String? bloodPressure,
    String? cnic,
    String? chestPain,
    String? cholesterol,
    String? ecg,
    String? fastingSugar,
    String? heartRate,
    String? majorLargeVessels,
    String? patientName,
    String? sex,
    String? slop,
    String? thalassemiaType,
    String? patientDepression,
  }) =>
      FormData(
        age: age ?? _age,
        angina: angina ?? _angina,
        bloodPressure: bloodPressure ?? _bloodPressure,
        cnic: cnic ?? _cnic,
        chestPain: chestPain ?? _chestPain,
        cholesterol: cholesterol ?? _cholesterol,
        ecg: ecg ?? _ecg,
        fastingSugar: fastingSugar ?? _fastingSugar,
        heartRate: heartRate ?? _heartRate,
        majorLargeVessels: majorLargeVessels ?? _majorLargeVessels,
        patientName: patientName ?? _patientName,
        sex: sex ?? _sex,
        slop: slop ?? _slop,
        thalassemiaType: thalassemiaType ?? _thalassemiaType,
        patientDepression: patientDepression ?? _patientDepression,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Age'] = _age;
    map['Angina'] = _angina;
    map['Blood Pressure'] = _bloodPressure;
    map['CNIC'] = _cnic;
    map['Chest Pain'] = _chestPain;
    map['Cholesterol'] = _cholesterol;
    map['ECG'] = _ecg;
    map['Fasting Sugar'] = _fastingSugar;
    map['Heart Rate'] = _heartRate;
    map['Major Large Vessels'] = _majorLargeVessels;
    map['Patient Name'] = _patientName;
    map['Sex'] = _sex;
    map['Slop'] = _slop;
    map['Thalassemia Type'] = _thalassemiaType;
    map['patient Depression'] = _patientDepression;
    return map;
  }
}
