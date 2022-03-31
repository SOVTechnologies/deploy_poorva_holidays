class BookingTravellerDetails{

   String _travellerName ='';
   String _travellerGender='';
   String _travellerDOB='';
  String _travellerPanCard='';

  String get travellerName => _travellerName;
  String get travellerGender => _travellerGender;
  String get travellerPanCard => _travellerPanCard;
  String get travellerDOB => _travellerDOB;

  set travellerName(String value) {
    _travellerName = value;
  }
  set travellerPanCard(String value) {
    _travellerPanCard = value;
  }

  set travellerDOB(String value) {
    _travellerDOB = value;
  }

  set travellerGender(String value) {
    _travellerGender = value;
  }



  Map toJson() => {
    'travellerName': travellerName,
    'travellerGender': travellerGender,
    'travellerDOB': travellerDOB,
    'travellerPanCard': travellerPanCard,
  };
}