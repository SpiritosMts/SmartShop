import 'dart:convert';

import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartshop/bindings.dart';
import 'package:smartshop/product_widgets/product_screens.dart';
import 'package:uuid/uuid.dart';

import 'models/cloth.dart';
import 'screeens/main_screen.dart';

void printFormattedJson(String jsonString, {int indentation = 2}) {
  // Parse the JSON string into a Map
  Map<String, dynamic> jsonMap = jsonDecode(jsonString);

  // Print the formatted JSON string
  debugPrint(JsonEncoder.withIndent(' ' * indentation).convert(jsonMap));
}
const List<String> categs = ['jackets', 'puffers', 'pants', 'jeans', 'sweaters', 'cardigans', 'hoodies', 't-shirts', 'overshirts', 'linen', 'shorts', 'suits', 'cargo', 'shoes', 'bags', 'backpack', 'dresses', 'skirts', 'tops', 'knitwear'];

const List<Color> mostCommonColors = [
  Colors.black,
  Colors.white,
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
  Colors.pink,
  Colors.teal,
  Colors.brown,
  Colors.grey,
  Colors.indigo,
  Colors.amber,
  Colors.cyan,
];

List<String> colorsToHex(List<Color> colors) {
  return colors.map((color) => color.value.toRadixString(16)).toList();
}
List<Color> hexToColors(List<String> hexColors) {
  return hexColors.map((hex) => Color(int.parse(hex, radix: 16))).toList();
}
List<String> extractTerms(List<Cloth> cloths) {
  Set<String> termSet = {}; // Using a set to automatically remove duplicates
  for (Cloth cloth in cloths) {
    termSet.add(cloth.term);
  }
  print(termSet.toList());
  return termSet.toList(); // Convert set to list
}
Cloth findFirstItem(String term) {
  return homeCtr.allClothes.firstWhere((cloth) => cloth.term == term);
}
int getRandomNumber(int min, int max) {
  Random random = Random();
  return min + random.nextInt(max - min + 1);
}
double generateRandomDouble(double min, double max) {
  Random random = Random();
  double randomNumber = 1.0 + random.nextDouble() * (max - min);
  return double.parse(randomNumber.toStringAsFixed(1));
}
List<Color> getRandomColors() {
  List<Color> randomColors = [];
  Random random = Random();

// Shuffle the list to ensure randomness
  List<Color> shuffledList = List.from(mostCommonColors)..shuffle(random);
  int randomNumber = getRandomNumber(1, 3);

// Get 3 different random colors
  for (int i = 0; i < randomNumber; i++) {
    Color randomColor = shuffledList[i];

// Check if the randomColor is already in the randomColors list
    if (!randomColors.contains(randomColor)) {
      randomColors.add(randomColor);
    }
  }

  return randomColors;
}



Future<List<Cloth>> parseCsvData() async {
  List<Map<String, dynamic>> data = [];
  List<Cloth> clothesData = [];
  String csvFilePath = 'assets/files/store_mango.csv';
  String csvString = await rootBundle.loadString(csvFilePath);
  // Attempt to parse CSV string into a list of lists
  List<List<dynamic>> csvTable = [];
  try {
    csvTable = CsvToListConverter().convert(csvString, eol: '\n');
    //print('## csvTable length: ${csvTable.length}');
    //print('## $csvTable');
  } catch (e) {
    print('## Error parsing CSV: $e');
  }
  //List<String> headers = ['brand','url','sku','name','description','price','currency','category','images','scraped_at','terms','section','image_downloads'];
  //List<String> categs = ['jackets', 'puffers', 'pants', 'jeans', 'sweaters', 'cardigans', 'hoodies', 't-shirts', 'overshirts', 'linen', 'shorts', 'suits', 'cargo', 'shoes', 'bags', 'backpack', 'dresses', 'skirts', 'tops', 'knitwear'];

  List<String> headers = csvTable[0].map((e) => e.toString()).toList();
  //int csvItemsToLoad = 500;//csvTable.length
  int csvItemsToLoad = csvTable.length;
  for (int i = 1; i < csvItemsToLoad; i++) {
    Map<String, dynamic> rowData = {};
    for (int j = 0; j < headers.length; j++) {
      rowData[headers[j]] = csvTable[i][j];
    }
    data.add(rowData);
  }

  /// print first 3
  // List<Map<String, dynamic>> firstThreeItems = data.take(3).toList();
  // String jsonFormatted = JsonEncoder.withIndent('  ').convert(firstThreeItems);
  // debugPrint('##'+jsonFormatted);

  clothesData = data.map((e) {
    String randomID = Uuid().v4();
    String urlListString=e['images'];
    List<String> urlList = urlListString
        .substring(1, urlListString.length - 1) // Remove brackets
        .split(', ')
        .map((e) => e.replaceAll("'", '')) // Remove single quotes
        .toList();
    return Cloth(
      seller: e['brand'],
        name: e['name'],
        description: e['description'],
        price: e['price'],
        term: e['terms'],
      category: e['category'],
        reviews: getRandomNumber(20,800),
        rating: generateRandomDouble(1.0,5.0),
        images: urlList,
        quantity: getRandomNumber(5,150),
        id: randomID,
        colors: getRandomColors(),

    );
  }).toList();

  homeCtr.update();
  print('## clothes length: ${clothesData.length}');

  //homeCtr.extractTerms(clothesData);
  return clothesData;
}

List<Cloth> getRandomClothes(List<Cloth> clothList) {
  List<Cloth> randomClothes = [];
  Random random = Random();

  // Shuffle the clothList to ensure randomness
  List<Cloth> shuffledList = List.from(clothList)..shuffle(random);

  // Ensure we have at least 4 items in the list
  int itemCount = min(4, shuffledList.length);

  // Get 4 different random items
  for (int i = 0; i < itemCount; i++) {
    Cloth randomCloth = shuffledList[i];

    // Check if the randomCloth is already in the randomClothes list
    if (!randomClothes.contains(randomCloth)) {
      randomClothes.add(randomCloth);
    }
  }

  return randomClothes;
}
