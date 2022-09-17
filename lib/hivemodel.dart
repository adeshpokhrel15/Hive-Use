// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:hive/hive.dart';

part 'hivemodel.g.dart';

@HiveType(typeId: 1)
class HiveModel extends HiveObject {
  @HiveField(0)
  String? personalName;

  @HiveField(1)
  int? personalAge;

  @HiveField(2)
  String? personalEmail;

  @HiveField(3)
  int? mobileNumber;
  HiveModel({
    this.personalName,
    this.personalAge,
    this.personalEmail,
    this.mobileNumber,
  });

  HiveModel copyWith({
    String? personalName,
    int? personalAge,
    String? personalEmail,
    int? mobileNumber,
  }) {
    return HiveModel(
      personalName: personalName ?? this.personalName,
      personalAge: personalAge ?? this.personalAge,
      personalEmail: personalEmail ?? this.personalEmail,
      mobileNumber: mobileNumber ?? this.mobileNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'personalName': personalName,
      'personalAge': personalAge,
      'personalEmail': personalEmail,
      'mobileNumber': mobileNumber,
    };
  }

  factory HiveModel.fromMap(Map<String, dynamic> map) {
    return HiveModel(
      personalName:
          map['personalName'] != null ? map['personalName'] as String : null,
      personalAge:
          map['personalAge'] != null ? map['personalAge'] as int : null,
      personalEmail:
          map['personalEmail'] != null ? map['personalEmail'] as String : null,
      mobileNumber:
          map['mobileNumber'] != null ? map['mobileNumber'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HiveModel.fromJson(String source) =>
      HiveModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HiveModel(personalName: $personalName, personalAge: $personalAge, personalEmail: $personalEmail, mobileNumber: $mobileNumber)';
  }

  @override
  bool operator ==(covariant HiveModel other) {
    if (identical(this, other)) return true;

    return other.personalName == personalName &&
        other.personalAge == personalAge &&
        other.personalEmail == personalEmail &&
        other.mobileNumber == mobileNumber;
  }

  @override
  int get hashCode {
    return personalName.hashCode ^
        personalAge.hashCode ^
        personalEmail.hashCode ^
        mobileNumber.hashCode;
  }
}
