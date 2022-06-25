part of swagger.api;

class User {
  
  int id = null;

  String userName = null;

  String normalizedUserName = null;

  String email = null;

  String normalizedEmail = null;

  bool emailConfirmed = null;

  String passwordHash = null;

  String securityStamp = null;

  String concurrencyStamp = null;

  String phoneNumber = null;

  bool phoneNumberConfirmed = null;

  bool twoFactorEnabled = null;

  DateTime lockoutEnd = null;

  bool lockoutEnabled = null;

  int accessFailedCount = null;

  String firstName = null;

  String lastName = null;

  String password = null;

  String token = null;

  DateTime dateCreated = null;

  DateTime dateModified = null;

  List<Code> codes = [];

  String middleName = null;

  String address = null;

  bool isAdmin = null;

  List<Card> cards = [];

  List<Transaction> transactions = [];

  Wallet wallet = null;

  User();

  @override
  String toString() {
    return 'User[id=$id, userName=$userName, normalizedUserName=$normalizedUserName, email=$email, normalizedEmail=$normalizedEmail, emailConfirmed=$emailConfirmed, passwordHash=$passwordHash, securityStamp=$securityStamp, concurrencyStamp=$concurrencyStamp, phoneNumber=$phoneNumber, phoneNumberConfirmed=$phoneNumberConfirmed, twoFactorEnabled=$twoFactorEnabled, lockoutEnd=$lockoutEnd, lockoutEnabled=$lockoutEnabled, accessFailedCount=$accessFailedCount, firstName=$firstName, lastName=$lastName, password=$password, token=$token, dateCreated=$dateCreated, dateModified=$dateModified, codes=$codes, middleName=$middleName, address=$address, isAdmin=$isAdmin, cards=$cards, transactions=$transactions, wallet=$wallet, ]';
  }

  User.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    userName = json['userName'];
    normalizedUserName = json['normalizedUserName'];
    email = json['email'];
    normalizedEmail = json['normalizedEmail'];
    emailConfirmed = json['emailConfirmed'];
    passwordHash = json['passwordHash'];
    securityStamp = json['securityStamp'];
    concurrencyStamp = json['concurrencyStamp'];
    phoneNumber = json['phoneNumber'];
    phoneNumberConfirmed = json['phoneNumberConfirmed'];
    twoFactorEnabled = json['twoFactorEnabled'];
    lockoutEnd = json['lockoutEnd'] == null ? null : DateTime.parse(json['lockoutEnd']);
    lockoutEnabled = json['lockoutEnabled'];
    accessFailedCount = json['accessFailedCount'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    password = json['password'];
    token = json['token'];
    dateCreated = json['dateCreated'] == null ? null : DateTime.parse(json['dateCreated']);
    dateModified = json['dateModified'] == null ? null : DateTime.parse(json['dateModified']);
    codes = Code.listFromJson(json['codes']);
    middleName = json['middleName'];
    address = json['address'];
    isAdmin = json['isAdmin'];
    cards = Card.listFromJson(json['cards']);
    transactions = Transaction.listFromJson(json['transactions']);
    wallet = new Wallet.fromJson(json['wallet']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'normalizedUserName': normalizedUserName,
      'email': email,
      'normalizedEmail': normalizedEmail,
      'emailConfirmed': emailConfirmed,
      'passwordHash': passwordHash,
      'securityStamp': securityStamp,
      'concurrencyStamp': concurrencyStamp,
      'phoneNumber': phoneNumber,
      'phoneNumberConfirmed': phoneNumberConfirmed,
      'twoFactorEnabled': twoFactorEnabled,
      'lockoutEnd': lockoutEnd == null ? '' : lockoutEnd.toUtc().toIso8601String(),
      'lockoutEnabled': lockoutEnabled,
      'accessFailedCount': accessFailedCount,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'token': token,
      'dateCreated': dateCreated == null ? '' : dateCreated.toUtc().toIso8601String(),
      'dateModified': dateModified == null ? '' : dateModified.toUtc().toIso8601String(),
      'codes': codes,
      'middleName': middleName,
      'address': address,
      'isAdmin': isAdmin,
      'cards': cards,
      'transactions': transactions,
      'wallet': wallet
     };
  }

  static List<User> listFromJson(List<dynamic> json) {
    return json == null ? new List<User>() : json.map((value) => new User.fromJson(value)).toList();
  }

  static Map<String, User> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, User>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new User.fromJson(value));
    }
    return map;
  }
}
