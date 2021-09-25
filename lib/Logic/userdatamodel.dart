

class UserModel{
  String Email;
  String Feedback;
  String Name;

  UserModel({required this.Email, required this.Feedback, required this.Name});

  UserModel.fromJson(Map<String,dynamic> parsedJson) :
      Email = parsedJson['Email'],
      Feedback = parsedJson['Feedback'] ?? "No Feedback",
      Name = parsedJson['Name'];
}