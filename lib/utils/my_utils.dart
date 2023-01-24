hexColor(String colorHexCode) {
  String colorNew = '0xff$colorHexCode';
  colorNew = colorNew.replaceAll("#", "");
  int colorInt = int.parse(colorNew);
  return colorInt;
}

hexCardNumber(String colorHexCode) {
  String colorNew = colorHexCode;
  colorNew = colorNew.replaceAll(" ", "  ");
  return colorNew;
}