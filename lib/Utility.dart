import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const IMAGE_KEY = 'IMAGE_KEY';

class Utility {

  Utility._privateConstructor();

  static final Utility instance =
  Utility._privateConstructor();

   static const String CleString = "STRING_KEY";
  static const String CleSInt = "INT_KEY";



  static Future<String> getImageFromPreferences(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? null;

  }

  static Future<bool> emptyPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.clear();
  }

  static Future<String> loadImageFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(IMAGE_KEY);
  }



  static Future<bool> saveImageToPrefs(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(IMAGE_KEY, value);
  }

  static Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.cover  ,
    );
  }


  static Uint8List dataFromBase64String(String base64String) {

    return base64Decode(base64String);
  }

  // encodes bytes list as string
  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  // decode bytes from a string
  static imageFrom64BaseString(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.fill,
    );
  }

  setStringValue(String key, String value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString(key, value);
  }



  setListData(String key, List<String> value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setStringList(key, value);
  }

  Future<List<String>> getListData(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getStringList(key);
  }


  Future<String> getStringValue(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getString(key) ?? "Entrez Votre Nom";
  }

  setIntegerValue(String key, int value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setInt(key, value);
  }

  Future<int> getIntegerValue(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getInt(key)  ?? 0;
  }

  setBooleanValue(String key, bool value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setBool(key, value);
  }

  Future<bool> getBooleanValue(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getBool(key) ?? false;
  }

  Future<bool> containsKey(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.containsKey(key);
  }

  removeValue(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.remove(key);
  }

  removeAll() async{
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.clear();
  }








}


//Incrementing counter after click
