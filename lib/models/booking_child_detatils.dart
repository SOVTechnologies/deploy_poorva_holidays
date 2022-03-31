class BookingChildDetails {
  String _childName = '';
  String _childGender = '';
  String _childDOB = '';
  String _childPanCard = '';

  String get childName => _childName;

  set childName(String value) {
    _childName = value;
  }

  String get childGender => _childGender;

  String get childPanCard => _childPanCard;

  set childPanCard(String value) {
    _childPanCard = value;
  }

  String get childDOB => _childDOB;

  set childDOB(String value) {
    _childDOB = value;
  }

  set childGender(String value) {
    _childGender = value;
  }

  Map toJson() => {
        'childName': _childName,
        'childGender': _childGender,
        'childDOB': _childDOB,
        'childPanCard': _childPanCard,
      };
}
