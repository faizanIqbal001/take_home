extension StringExtension on String {
  String getNameCharacter({
    required String firstName,
    required String lastName,
  }) {
    String finalName = '';
    if (firstName != '') {
      finalName = firstName.split('')[0];
    }
    if (lastName != '') {
      finalName = finalName + lastName.split('')[0];
    }
    return finalName.toUpperCase();
  }

  bool validateEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z]+\.[a-zA-Z]+")
        .hasMatch(
      this,
    );
  }

  bool validateName() {
    return RegExp(r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$")
        .hasMatch(
      this,
    );
  }

  String getAsteriskPhoneNumber({
    required String phoneNumber,
    required String countryCode,
  }) {
    phoneNumber = phoneNumber.replaceAll(countryCode, '');
    var temp = phoneNumber.split('');
    for (var i = 0; i < temp.length; i++) {
      if (i <= temp.length - 3) {
        temp[i] = '*';
      }
    }

    return '$countryCode${temp.join('')}';
  }
}
