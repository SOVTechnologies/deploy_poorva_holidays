class BookingPersonalDetails{

   String _personalName ="";
  String _personalGender ="";
  String _personalDOB ="";
  String _personalPanCard ="";
  String _personalEmail ="";
   String _personalMobileNumber ="";
   String _personalSuggestion ="";


   String get personalName => _personalName;

  set personalName(String value) {
    _personalName = value;
  }

  Map toJson() => {
    'personalFirstName': personalName,
    'personalMobileNumber': personalMobileNumber,
    'personalEmail': personalEmail,
    'personalPanCard': personalPanCard,
    'personalDOB': personalDOB,
    'personalGender': personalGender,
    'personalSuggestion': personalSuggestion,
  };

  String get personalGender => _personalGender;

  set personalGender(String value) {
    _personalGender = value;
  }

  String get personalDOB => _personalDOB;

  set personalDOB(String value) {
    _personalDOB = value;
  }

  String get personalPanCard => _personalPanCard;

  set personalPanCard(String value) {
    _personalPanCard = value;
  }

  String get personalEmail => _personalEmail;

  set personalEmail(String value) {
    _personalEmail = value;
  }

  String get personalMobileNumber => _personalMobileNumber;

  set personalMobileNumber(String value) {
    _personalMobileNumber = value;
  }

  String get personalSuggestion => _personalSuggestion;

  set personalSuggestion(String value) {
    _personalSuggestion = value;
  }
}