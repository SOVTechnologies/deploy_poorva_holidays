class PoorvaUser{
  var _name;
  var _id;
  var _email;
  var _phone;
  var _age;
  var _city;
  var _dob;
  var _country;
  var _gender;
  var _profilePic;
  List<String> _myString =[];
  late GovermentDocument _govermentDocument;


  GovermentDocument get govermentDocument => _govermentDocument;

  set govermentDocument(GovermentDocument value) {
    _govermentDocument = value;
  }

  Map<String, dynamic> toJson() => {
    "user_name": name,
    "user_id": id,
    "user_email": email,
    "user_phone": phone,
    "user_age": age,
    "user_city": city,
    "user_dob": dob,
    "user_country": country,
    "user_gender": gender,
    "user_profile_pic_link": _profilePic,
    //"user_trips": myString,
    //"user_government_id" :govermentDocument.toJson()
  };
  get name => _name;

  set name(value) {
    _name = value;
  }

  get id => _id;
  //
  // GovermentDocument get govermentDocument => _govermentDocument;
  //
  // set govermentDocument(GovermentDocument value) {
  //   _govermentDocument = value;
  // }

  List<String> get myString => _myString;

  set myString(List<String> value) {
    _myString = value;
  }

  get profilePic => _profilePic;

  set profilePic(value) {
    _profilePic = value;
  }

  get gender => _gender;

  set gender(value) {
    _gender = value;
  }

  get country => _country;

  set country(value) {
    _country = value;
  }

  get dob => _dob;

  set dob(value) {
    _dob = value;
  }

  get city => _city;

  set city(value) {
    _city = value;
  }

  get age => _age;

  set age(value) {
    _age = value;
  }

  get phone => _phone;

  set phone(value) {
    _phone = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  set id(value) {
    _id = value;
  }


}

class GovermentDocument {
  var _aadhaar;
  var _pan_card;
  var _driving_license;
  var _passport;

  get aadhaar => _aadhaar;

  set aadhaar(value) {
    _aadhaar = value;
  }

  get pan_card => _pan_card;

  set pan_card(value) {
    _pan_card = value;
  }

  get driving_license => _driving_license;

  set driving_license(value) {
    _driving_license = value;
  }

  get passport => _passport;

  set passport(value) {
    _passport = value;
  }
  Map<String, dynamic> toJson() => {
    "aadhaar_card_number": _aadhaar,
    "pan_card_number": _pan_card,
    "driving_license_number": _driving_license,
    "passport_number": _passport,

  };
}
