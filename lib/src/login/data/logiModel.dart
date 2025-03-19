class ApiResponse {
  final JwtUser jwtUser;
  final String accessToken;

  ApiResponse({required this.jwtUser, required this.accessToken});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      jwtUser: JwtUser.fromJson(json['jwtUser']),
      accessToken: json['accesstoken'],
    );
  }
}

class JwtUser {
  final int companyId;
  final int branchId;
  final int locationId;
  final String? createdBy;
  final String? updatedBy;
  final int authUserId;
  final String authUserName;
  final String authUserEmail;
  final int authUserVariant;
  final int authUserRole;
  final String authUserType;
  final int companyCurrency;
  final String compOpeningDate;
  final int isPoEnabled;
  final String companyName;
  final String companyCode;
  final String companyPAN;
  final String companyCOB;
  final String branchName;
  final String branchCode;
  final String branchGstin;
  final String locationName;
  final String locationCode;
  final String locationCity;
  final int decimalPlaces;

  JwtUser({
    required this.companyId,
    required this.branchId,
    required this.locationId,
    this.createdBy,
    this.updatedBy,
    required this.authUserId,
    required this.authUserName,
    required this.authUserEmail,
    required this.authUserVariant,
    required this.authUserRole,
    required this.authUserType,
    required this.companyCurrency,
    required this.compOpeningDate,
    required this.isPoEnabled,
    required this.companyName,
    required this.companyCode,
    required this.companyPAN,
    required this.companyCOB,
    required this.branchName,
    required this.branchCode,
    required this.branchGstin,
    required this.locationName,
    required this.locationCode,
    required this.locationCity,
    required this.decimalPlaces,
  });

  factory JwtUser.fromJson(Map<String, dynamic> json) {
    return JwtUser(
      companyId: json['company_id'],
      branchId: json['branch_id'],
      locationId: json['location_id'],
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
      authUserId: json['authUserId'],
      authUserName: json['authUserName'],
      authUserEmail: json['authUserEmail'],
      authUserVariant: json['authUserVariant'],
      authUserRole: json['authUserRole'],
      authUserType: json['authUserType'],
      companyCurrency: json['companyCurrency'],
      compOpeningDate: json['compOpeningDate'],
      isPoEnabled: json['isPoEnabled'],
      companyName: json['companyName'],
      companyCode: json['companyCode'],
      companyPAN: json['companyPAN'],
      companyCOB: json['companyCOB'],
      branchName: json['branchName'],
      branchCode: json['branchCode'],
      branchGstin: json['branchGstin'],
      locationName: json['locationName'],
      locationCode: json['locationCode'],
      locationCity: json['locationCity'],
      decimalPlaces: json['decimalPlaces'],
    );
  }
}
