class CityDetailsModel {
  City? city;
  List<Providers>? providers;
  List<CityOpinions>? cityOpinions;
  Country? country;

  CityDetailsModel({this.city, this.country});

  CityDetailsModel.fromJson(Map<String, dynamic> json) {
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    if (json['providers'] != null) {
      providers = <Providers>[];
      json['providers'].forEach((v) {
        providers!.add(new Providers.fromJson(v));
      });
    }
    if (json['cityOpinions'] != null) {
      cityOpinions = <CityOpinions>[];
      json['cityOpinions'].forEach((v) {
        cityOpinions!.add(new CityOpinions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.providers != null) {
      data['providers'] = this.providers!.map((v) => v.toJson()).toList();
    }
    if (this.cityOpinions != null) {
      data['cityOpinions'] = this.cityOpinions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  int? id;
  String? name;
  String? slug;
  String? latitude;
  String? longitude;
  List<CityAlternativeNames>? cityAlternativeNames;
  List<CityProviders>? cityProviders;
  Country? country;
  List<CityOpinions>? cityOpinions;

  City(
      {this.id,
      this.name,
      this.slug,
      this.latitude,
      this.longitude,
      this.cityAlternativeNames,
      this.cityProviders,
      this.country,
      this.cityOpinions});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    if (json['city_alternative_names'] != null) {
      cityAlternativeNames = <CityAlternativeNames>[];
      json['city_alternative_names'].forEach((v) {
        cityAlternativeNames!.add(new CityAlternativeNames.fromJson(v));
      });
    }
    if (json['cityProviders'] != null) {
      cityProviders = <CityProviders>[];
      json['cityProviders'].forEach((v) {
        cityProviders!.add(new CityProviders.fromJson(v));
      });
    }
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    if (json['cityOpinions'] != null) {
      cityOpinions = <CityOpinions>[];
      json['cityOpinions'].forEach((v) {
        cityOpinions!.add(new CityOpinions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    if (this.cityAlternativeNames != null) {
      data['city_alternative_names'] =
          this.cityAlternativeNames!.map((v) => v.toJson()).toList();
    }
    if (this.cityProviders != null) {
      data['cityProviders'] =
          this.cityProviders!.map((v) => v.toJson()).toList();
    }
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.cityOpinions != null) {
      data['cityOpinions'] = this.cityOpinions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityAlternativeNames {
  int? id;
  String? name;
  int? cityId;
  String? createdAt;
  String? updatedAt;

  CityAlternativeNames(
      {this.id, this.name, this.cityId, this.createdAt, this.updatedAt});

  CityAlternativeNames.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['city_id'] = this.cityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CityProviders {
  int? id;
  String? providerName;
  int? cityId;
  String? createdBy;
  String? createdAt;
  String? updatedAt;

  CityProviders(
      {this.id,
      this.providerName,
      this.cityId,
      this.createdBy,
      this.createdAt,
      this.updatedAt});

  CityProviders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    providerName = json['provider_name'];
    cityId = json['city_id'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['provider_name'] = this.providerName;
    data['city_id'] = this.cityId;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Country {
  int? id;
  String? name;
  String? slug;
  String? alternativeName;
  String? latitude;
  String? longitude;
  String? iso;
  String? createdAt;
  String? updatedAt;

  Country(
      {this.id,
      this.name,
      this.slug,
      this.alternativeName,
      this.latitude,
      this.longitude,
      this.iso,
      this.createdAt,
      this.updatedAt});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    alternativeName = json['alternative_name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    iso = json['iso'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['alternative_name'] = this.alternativeName;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['iso'] = this.iso;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CityOpinions {
  int? id;
  String? content;
  int? rating;
  int? cityId;
  int? userId;
  String? createdAt;
  String? updatedAt;

  CityOpinions(
      {this.id,
      this.content,
      this.rating,
      this.cityId,
      this.userId,
      this.createdAt,
      this.updatedAt});

  CityOpinions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    rating = json['rating'];
    cityId = json['city_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['rating'] = this.rating;
    data['city_id'] = this.cityId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Providers {
  String? name;
  String? url;
  String? androidUrl;
  String? iosUrl;
  String? color;

  Providers({this.name, this.url, this.androidUrl, this.iosUrl, this.color});

  Providers.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    androidUrl = json['android_url'];
    iosUrl = json['ios_url'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['android_url'] = this.androidUrl;
    data['ios_url'] = this.iosUrl;
    data['color'] = this.color;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
