// To parse this JSON data, do
//
//     final packagesListResponse = packagesListResponseFromJson(jsonString);

import 'dart:convert';

List<PackagesListResponse> packagesListResponseFromJson(String str) =>
    List<PackagesListResponse>.from(
        json.decode(str).map((x) => PackagesListResponse.fromJson(x)));

String packagesListResponseToJson(List<PackagesListResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PackagesListResponse {
  PackagesListResponse({
    required this.packageId,
    required this.packageTitle,
    required this.packageCity,
    required this.packageInfo,
    required this.packageCancellationPolicy,
    required this.packageLister,
    required this.packageCountry,
    required this.packageTotalDays,
    required this.packageTotalNight,
    required this.packageStartDate,
    required this.packageEndDate,
    required this.packageOffers,
    required this.packageTheme,
    required this.packageSeason,
    required this.packageThumbailLink,
    required this.packageAverageRating,
    required this.packageRatePerPerson,
    required this.packageItenary,
    required this.packageGalleryLink,
    required this.packageLocation,
    required this.packageHotel,
    required this.packageFlight,
    required this.packageCruise,
    required this.packageActivities,
    required this.packageAvailability,
    required this.packageCost,
    required this.packageStatus,
    required this.itenaryId,
    required this.dayActivites,
    required this.itenaryInclusion,
    required this.itenaryExclusion,
  });

  String packageId;
  String packageTitle;
  String packageCity;
  String packageInfo;
  List<String> packageCancellationPolicy;
  String packageLister;
  String packageCountry;
  int packageTotalDays;
  int packageTotalNight;
  String packageStartDate;
  String packageEndDate;
  List<String> packageOffers;
  List<String> packageTheme;
  String packageSeason;
  String packageThumbailLink;
  int packageAverageRating;
  int packageRatePerPerson;
  String packageItenary;
  List<String> packageGalleryLink;
  String packageLocation;
  List<String> packageHotel;
  dynamic packageFlight;
  dynamic packageCruise;
  List<String> packageActivities;
  List<String> packageAvailability;
  String packageCost;
  String packageStatus;
  String itenaryId;
  List<String> dayActivites;
  List<String> itenaryInclusion;
  List<String> itenaryExclusion;

  factory PackagesListResponse.fromJson(Map<String, dynamic> json) =>
      PackagesListResponse(
        packageId: json["package_id"],
        packageTitle: json["package_title"],
        packageCity: json["package_city"],
        packageInfo: json["package_info"],
        packageCancellationPolicy: List<String>.from(
            json["package_cancellation_policy"].map((x) => x)),
        packageLister: json["package_lister"],
        packageCountry: json["package_country"],
        packageTotalDays: json["package_total_days"],
        packageTotalNight: json["package_total_night"],
        packageStartDate: json["package_start_date"],
        packageEndDate: json["package_end_date"],
        packageOffers: List<String>.from(json["package_offers"].map((x) => x)),
        packageTheme: List<String>.from(json["package_theme"].map((x) => x)),
        packageSeason: json["package_season"],
        packageThumbailLink: json["package_thumbail_link"],
        packageAverageRating: json["package_average_rating"],
        packageRatePerPerson: json["package_rate_per_person"],
        packageItenary: json["package_itenary"],
        packageGalleryLink:
            List<String>.from(json["package_gallery_link"].map((x) => x)),
        packageLocation: json["package_location"],
        packageHotel: List<String>.from(json["package_hotel"].map((x) => x)),
        packageFlight: json["package_flight"],
        packageCruise: json["package_cruise"],
        packageActivities:
            List<String>.from(json["package_activities"].map((x) => x)),
        packageAvailability:
            List<String>.from(json["package_availability"].map((x) => x)),
        packageCost: json["package_cost"],
        packageStatus: json["package_status"],
        itenaryId: json["itenary_id"],
        dayActivites: List<String>.from(json["day_activites"].map((x) => x)),
        itenaryInclusion:
            List<String>.from(json["itenary_inclusion"].map((x) => x)),
        itenaryExclusion:
            List<String>.from(json["itenary_exclusion"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "package_id": packageId,
        "package_title": packageTitle,
        "package_city": packageCity,
        "package_info": packageInfo,
        "package_cancellation_policy":
            List<dynamic>.from(packageCancellationPolicy.map((x) => x)),
        "package_lister": packageLister,
        "package_country": packageCountry,
        "package_total_days": packageTotalDays,
        "package_total_night": packageTotalNight,
        "package_start_date":packageStartDate,
        "package_end_date":packageEndDate,
        "package_offers": List<dynamic>.from(packageOffers.map((x) => x)),
        "package_theme": List<dynamic>.from(packageTheme.map((x) => x)),
        "package_season": packageSeason,
        "package_thumbail_link": packageThumbailLink,
        "package_average_rating": packageAverageRating,
        "package_rate_per_person": packageRatePerPerson,
        "package_itenary": packageItenary,
        "package_gallery_link":
            List<dynamic>.from(packageGalleryLink.map((x) => x)),
        "package_location": packageLocation,
        "package_hotel": List<dynamic>.from(packageHotel.map((x) => x)),
        "package_flight": packageFlight,
        "package_cruise": packageCruise,
        "package_activities":
            List<dynamic>.from(packageActivities.map((x) => x)),
        "package_availability":
            List<dynamic>.from(packageAvailability.map((x) => x)),
        "package_cost": packageCost,
        "package_status": packageStatus,
        "itenary_id": itenaryId,
        "day_activites": List<dynamic>.from(dayActivites.map((x) => x)),
        "itenary_inclusion": List<dynamic>.from(itenaryInclusion.map((x) => x)),
        "itenary_exclusion": List<dynamic>.from(itenaryExclusion.map((x) => x)),
      };
}
