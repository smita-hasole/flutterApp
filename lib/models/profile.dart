class Profile {
  final String displayName;
  final String givenName;
  final String id;
  final String jobTitle;
  final String mail;
  final String mobilePhone;
  final String officeLocation;
  final String preferredLanguage;
  final String surname;
  final String userPrincipalName;
  final String department;
  final String employeeId;
  final String accountEnabled;
  final String hireDate;

  Profile(
      {this.displayName,
      this.givenName,
      this.id,
      this.jobTitle,
      this.mail,
      this.mobilePhone,
      this.officeLocation,
      this.preferredLanguage,
      this.surname,
      this.userPrincipalName,
      this.department,
      this.employeeId,
      this.accountEnabled,
      this.hireDate});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        displayName: json['displayName'],
        givenName: json['givenName'],
        id: json['id'],
        jobTitle: json['jobTitle'],
        mail: json['mail'],
        mobilePhone: json['mobilePhone'],
        officeLocation: json['officeLocation'],
        preferredLanguage: json['preferredLanguage'],
        surname: json['surname'],
        userPrincipalName: json['userPrincipalName'],
        department: json['department'],
        employeeId: json['employeeId'],
        accountEnabled: json['accountEnabled'],
        hireDate: json['hireDate']);
  }
}
