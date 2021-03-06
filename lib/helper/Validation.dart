class Validation{
  String validatePassword(String value){
    if (value.length<4){
      return 'Password minimal 4 character';
    }
    return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }


  String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 character';
    else
      return null;
  }

  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }


  String validateReferral(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length > 3)
      return 'Enter valid referral code';
    else
      return null;
  }
}