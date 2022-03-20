 class StringHelper
{

  static final StringHelper _singleton = StringHelper._internal();

  factory StringHelper() {
    return _singleton;
  }

  StringHelper._internal();

  String replaceCharacter(String string, String character, String replaceCharacter)
  {
    String newString = "";
    for (int i = 0; i < string.length; i++)
    {
      if (string[i] == character)
      {
        newString += replaceCharacter;
      }
      else
      {
        newString += string[i];
      }
    }
    return newString;
  }


}

// create a static class named String Helper
// Language: dart

