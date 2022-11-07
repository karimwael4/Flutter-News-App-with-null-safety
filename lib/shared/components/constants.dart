//post
//update
//delete
//get

//base url: https://newsapi.org/

//method(url) :v2/top-headlines?

//queries:country=us&category=business&apiKey=60e05259eb3c4d18b5909df4360c5c51

//search url https://newsapi.org/v2/everything?q=tesla&t&apiKey=60e05259eb3c4d18b5909df4360c5c51






  void printFullText(dynamic text)
  {
    final pattern = RegExp('.{1,800}');//800 size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));

  }
  String ? token = '';
String ? uId = '';
int cartLength = 0;
int favLength = 0;
dynamic discountLen = 0;






