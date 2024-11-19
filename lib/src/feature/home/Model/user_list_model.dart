class UserListModel {
  String? createdAt;
  String? name;
  String? avatar;
  String? email;
  String? mobileNumber;
  String? currency;
  bool? isActive;
  String? totalUnpaidBooking;
  int? availableLimit;
  String? id;
  String? companyId;

  UserListModel(
      {this.createdAt,
        this.name,
        this.avatar,
        this.email,
        this.mobileNumber,
        this.currency,
        this.isActive,
        this.totalUnpaidBooking,
        this.availableLimit,
        this.id,
        this.companyId});

  UserListModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    avatar = json['avatar'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    currency = json['currency'];
    isActive = json['isActive'];
    totalUnpaidBooking = json['totalUnpaidBooking'];
    availableLimit = json['availableLimit'];
    id = json['id'];
    companyId = json['companyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    data['currency'] = this.currency;
    data['isActive'] = this.isActive;
    data['totalUnpaidBooking'] = this.totalUnpaidBooking;
    data['availableLimit'] = this.availableLimit;
    data['id'] = this.id;
    data['companyId'] = this.companyId;
    return data;
  }
}