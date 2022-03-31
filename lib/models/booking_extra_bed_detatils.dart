class BookingExtraBedDetails {
  String _extraBedName = '';
  String _extraBedGender = '';
  String _extraBedDOB = '';
  String _extraBedPanCard = '';

  String get extraBedName => _extraBedName;

  set extraBedName(String value) {
    _extraBedName = value;
  }

  String get extraBedGender => _extraBedGender;

  String get extraBedPanCard => _extraBedPanCard;

  set extraBedPanCard(String value) {
    _extraBedPanCard = value;
  }

  String get extraBedDOB => _extraBedDOB;

  set extraBedDOB(String value) {
    _extraBedDOB = value;
  }

  set extraBedGender(String value) {
    _extraBedGender = value;
  }

  Map toJson() => {
        'extraBedName': _extraBedName,
        'extraBedGender': _extraBedGender,
        'extraBedDOB': _extraBedDOB,
        'extraBedPanCard': _extraBedPanCard,
      };
}
