

class BlogModel{
  String content;
  String url;

  BlogModel({required this.content, required this.url});

  BlogModel.fromJson(Map<String,dynamic> parsedJson) :
        content = parsedJson['Content'],
        url = parsedJson['Image'];
}