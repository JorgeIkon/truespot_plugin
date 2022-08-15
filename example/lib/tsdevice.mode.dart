// To parse this JSON data, do
//
//     final tsDevice = tsDeviceFromJson(jsonString);

import 'dart:convert';

List<TsDevice> tsDeviceFromJson(String str) => List<TsDevice>.from(json.decode(str).map((x) => TsDevice.fromJson(x)));

String tsDeviceToJson(List<TsDevice> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TsDevice {
    TsDevice({
        required this.minor,
        required this.pairedByUsername,
        required this.latitude,
        required this.assetType,
        required this.accuracy,
        required this.zoneName,
        required this.localeId,
        required this.subGeoZone,
        required this.level,
        required this.placeId,
        required this.assetIdentifier,
        required this.longitude,
        required this.pairedOnTimestamp,
        required this.placeName,
        required this.batteryLevel,
        required this.tagIdentifier,
        required this.placeCategoryId,
        required this.sourceDeviceNames,
        required this.assetIdentifierB,
        required this.locationUpdateTimestamp,
    });

    String minor;
    String pairedByUsername;
    double latitude;
    String assetType;
    double accuracy;
    String zoneName;
    String localeId;
    String subGeoZone;
    int level;
    String placeId;
    String assetIdentifier;
    double longitude;
    DateTime? pairedOnTimestamp;
    String placeName;
    int batteryLevel;
    String tagIdentifier;
    String placeCategoryId;
    List<String> sourceDeviceNames;
    String assetIdentifierB;
    DateTime? locationUpdateTimestamp;

    factory TsDevice.fromJson(Map<String, dynamic> json) => TsDevice(
        minor: json["minor"] ?? "",
        pairedByUsername: json["pairedByUsername"] ?? "",
        latitude: json["latitude"] != null ? json["latitude"].toDouble() : 0.0 ,
        assetType: json["assetType"] ?? "",
        accuracy: json["accuracy"] != null ? json["accuracy"].toDouble() : 0.0,
        zoneName: json["zoneName"] ?? "",
        localeId: json["localeId"] ?? "",
        subGeoZone: json["subGeoZone"] ?? "",
        level: json["level"] ?? 0,
        placeId: json["placeId"]  ?? "",
        assetIdentifier: json["assetIdentifier"] ?? "",
        longitude: json["longitude"] != null ? json["longitude"].toDouble() : 0.0,
        pairedOnTimestamp: json["pairedOnTimestamp"] !=  null ? DateTime.parse(json["pairedOnTimestamp"]) : null,
        placeName: json["placeName"]  ?? "",
        batteryLevel: json["batteryLevel"]  ?? "",
        tagIdentifier: json["tagIdentifier"]  ?? "",
        placeCategoryId: json["placeCategoryId"]  ?? "",
        sourceDeviceNames: json["sourceDeviceNames"]!=null ? List<String>.from(json["sourceDeviceNames"].map((x) => x)): [],
        assetIdentifierB: json["assetIdentifierB"] ?? "",
        locationUpdateTimestamp: json["locationUpdateTimestamp"] !=  null ? DateTime.parse(json["locationUpdateTimestamp"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "minor": minor,
        "pairedByUsername": pairedByUsername,
        "latitude": latitude,
        "assetType": assetType,
        "accuracy": accuracy,
        "zoneName": zoneName,
        "localeId": localeId,
        "subGeoZone": subGeoZone,
        "level": level,
        "placeId": placeId,
        "assetIdentifier": assetIdentifier,
        "longitude": longitude,
        "pairedOnTimestamp": pairedOnTimestamp?.toIso8601String(),
        "placeName": placeName,
        "batteryLevel": batteryLevel,
        "tagIdentifier": tagIdentifier,
        "placeCategoryId": placeCategoryId,
        "sourceDeviceNames": List<dynamic>.from(sourceDeviceNames.map((x) => x)),
        "assetIdentifierB": assetIdentifierB,
        "locationUpdateTimestamp": locationUpdateTimestamp?.toIso8601String(),
    };
}
