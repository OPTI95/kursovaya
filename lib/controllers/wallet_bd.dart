import 'dart:typed_data';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:wallet/controllers/encryption.dart';

class CardData {
  int? id;
  String name;
  String barcode;
  String? cvcCode;
  String? cardNumber;

  CardData({
    this.id,
    required this.name,
    required this.barcode,
    this.cvcCode,
    this.cardNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'barcode': barcode,
      'cvcCode': cvcCode,
      'cardNumber': cardNumber,
    };
  }
}

class ContactData {
  final int? id;
  final String lastName;
  final String firstName;
  final String position;
  final String companyName;
  final String phoneNumber;
  final String email;
  final String website;

  ContactData({
    required this.id,
    required this.lastName,
    required this.firstName,
    required this.position,
    required this.companyName,
    required this.phoneNumber,
    required this.email,
    required this.website,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lastName': lastName,
      'firstName': firstName,
      'position': position,
      'companyName': companyName,
      'phoneNumber': phoneNumber,
      'email': email,
      'website': website,
    };
  }
}

class PersonData {
  final int? id;
  final String secondName;
  final String firstName;
  final String thirdName;
  final String snils;
  final String inn;
  final String polisOMS;
  final String numberPassport;
  final String seriaPassport;
  final String snilsPassport;
  final String fromIssues;
  final String codePassport;
  final String placeBorn;
  final String gender;
  final DateTime dateBorn;
  final DateTime dateExit;

  PersonData({
    required this.id,
    required this.secondName,
    required this.firstName,
    required this.thirdName,
    required this.snils,
    required this.inn,
    required this.polisOMS,
    required this.numberPassport,
    required this.seriaPassport,
    required this.snilsPassport,
    required this.fromIssues,
    required this.codePassport,
    required this.placeBorn,
    required this.gender,
    required this.dateBorn,
    required this.dateExit,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'secondName': secondName,
      'firstName': firstName,
      'thirdName': thirdName,
      'snils': snils,
      'inn': inn,
      'polisOMS': polisOMS,
      'numberPassport': numberPassport,
      'seriaPassport': seriaPassport,
      'snilsPassport': snilsPassport,
      'fromIssues': fromIssues,
      'codePassport': codePassport,
      'placeBorn': placeBorn,
      'gender': gender,
      'dateBorn': dateBorn.millisecondsSinceEpoch,
      'dateExit': dateExit.millisecondsSinceEpoch,
    };
  }
}

class WalletDatabase {
  late Database _database;
  final Key = Uint8List.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]); 
  final iv = Uint8List.fromList([65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80]); 
  Future<void> open() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'wallet_database.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE cards(id INTEGER PRIMARY KEY, name TEXT, barcode TEXT, cvcCode TEXT, cardNumber TEXT)',
        );
        await db.execute(
          '''
        CREATE TABLE persons(
          id INTEGER PRIMARY KEY,
          secondName TEXT,
          firstName TEXT,
          thirdName TEXT,
          snils TEXT,
          inn TEXT,
          polisOMS TEXT,
          numberPassport TEXT,
          seriaPassport TEXT,
          snilsPassport TEXT,
          fromIssues TEXT,
          codePassport TEXT,
          placeBorn TEXT,
          gender TEXT,
          dateBorn INTEGER,
          dateExit INTEGER
        )
        ''',
        );
        await db.execute(
          '''
          CREATE TABLE contacts(
            id INTEGER PRIMARY KEY,
            lastName TEXT,
            firstName TEXT,
            position TEXT,
            companyName TEXT,
            phoneNumber TEXT,
            email TEXT,
            website TEXT
          )
          ''',
        );
      },
    );
  }


  Future<int> insertContact(ContactData contact) async {
    final Database db = await openDatabase('wallet_database.db');
    return await db.insert('contacts', contact.toMap());
  }

  Future<List<ContactData>> getContacts() async {
    final Database db = await openDatabase('wallet_database.db');
    final List<Map<String, dynamic>> maps = await db.query('contacts');

    return List.generate(maps.length, (i) {
      return ContactData(
        id: maps[i]['id'],
        lastName: maps[i]['lastName'],
        firstName: maps[i]['firstName'],
        position: maps[i]['position'],
        companyName: maps[i]['companyName'],
        phoneNumber: maps[i]['phoneNumber'],
        email: maps[i]['email'],
        website: maps[i]['website'],
      );
    });
  }

  Future<void> deleteContact(int id) async {
    final Database db = await openDatabase('wallet_database.db');
    await db.delete('contacts', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateContact(ContactData contact) async {
    final Database db = await openDatabase('wallet_database.db');
    await db.update('contacts', contact.toMap(),
        where: 'id = ?', whereArgs: [contact.id]);
  }

  // ContactData _decryptContactData(Map<String, dynamic> encryptedMap) {
  //   EncryptionHelper encryptionHelper = EncryptionHelper();
  //   final decryptedMap =
  //       Map<String, dynamic>.from(encryptedMap); 
  //   decryptedMap.forEach((key, value) {
  //     if (value != null && value is String) {
  //       decryptedMap[key] =
  //           encryptionHelper.decryptAES(value, Key, iv);
  //     }
  //   });
  //   return ContactData(
  //     id: decryptedMap['id'],
  //     lastName: decryptedMap['lastName'],
  //     firstName: decryptedMap['firstName'],
  //     position: decryptedMap['position'],
  //     companyName: decryptedMap['companyName'],
  //     phoneNumber: decryptedMap['phoneNumber'],
  //     email: decryptedMap['email'],
  //     website: decryptedMap['website'],
  //   );
  // }

  // Future<List<ContactData>> getAllContacts() async {
  //   await open();
  //   final List<Map<String, dynamic>> maps = await _database.query('contacts');
  //   return List.generate(maps.length, (index) {
  //     return _decryptContactData(maps[index]);
  //   });
  // }

  // Map<String, dynamic> _encryptContactData(ContactData contact) {
  //       EncryptionHelper encryptionHelper = EncryptionHelper();

  //   final encryptedMap = contact.toMap(); 
  //   encryptedMap.remove('id');
  //   encryptedMap.forEach((key, value) {
  //     if (value != null && value is String) {
  //       encryptedMap[key] = encryptionHelper.encryptAES(
  //           value, Key, iv); 
  //     }
  //   });
  //   return encryptedMap;
  // }


  // Future<int> insertContact(ContactData contact) async {
  //   await open();
  //   final encryptedContact =
  //       _encryptContactData(contact);
  //   return await _database.insert(
  //       'contacts', encryptedContact); 
  // }


  // Future<int> updateContact(ContactData contact) async {
  //   await open();
  //   final encryptedContact =
  //       _encryptContactData(contact); 
  //   return await _database.update(
  //     'contacts',
  //     encryptedContact,
  //     where: 'id = ?',
  //     whereArgs: [contact.id],
  //   );
  // }
  // // Обновленный метод insertContact для шифрования данных перед сохранением в базу данных
  // Future<int> insertContact(ContactData contact) async {
  //   await open();
  //   await createContactsTable();
  //   final encryptedContact = _encryptContactData(contact); // шифруем контактные данные
  //   return await _database.insert('contacts', encryptedContact);
  // }

  // // Обновленный метод updateContact для шифрования данных перед обновлением в базе данных
  // Future<int> updateContact(ContactData contact) async {
  //   await open();
  //   final encryptedContact = _encryptContactData(contact); // шифруем контактные данные
  //   return await _database.update(
  //     'contacts',
  //     encryptedContact,
  //     where: 'id = ?',
  //     whereArgs: [contact.id],
  //   );
  // }



  Future<int> insertPerson(PersonData person) async {
    await open();
    return await _database.insert('persons', person.toMap());
  }

  Future<List<PersonData>> getPersons() async {
    await open();
    final List<Map<String, dynamic>> maps = await _database.query('persons');

    return List.generate(maps.length, (i) {
      return PersonData(
        id: maps[i]['id'],
        secondName: maps[i]['secondName'],
        firstName: maps[i]['firstName'],
        thirdName: maps[i]['thirdName'],
        snils: maps[i]['snils'],
        inn: maps[i]['inn'],
        polisOMS: maps[i]['polisOMS'],
        numberPassport: maps[i]['numberPassport'],
        seriaPassport: maps[i]['seriaPassport'],
        snilsPassport: maps[i]['snilsPassport'],
        fromIssues: maps[i]['fromIssues'],
        codePassport: maps[i]['codePassport'],
        placeBorn: maps[i]['placeBorn'],
        gender: maps[i]['gender'],
        dateBorn: DateTime.fromMillisecondsSinceEpoch(maps[i]['dateBorn']),
        dateExit: DateTime.fromMillisecondsSinceEpoch(maps[i]['dateExit']),
      );
    });
  }

  Future<void> deletePerson(int id) async {
    await open();
    await _database.delete('persons', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updatePerson(PersonData person) async {
    await open();
    await _database.update('persons', person.toMap(),
        where: 'id = ?', whereArgs: [person.id]);
  }

  Future<int> insertCard(CardData card) async {
    await open();
    return await _database.insert('cards', card.toMap());
  }

  Future<List<CardData>> getCards() async {
    await open();
    final List<Map<String, dynamic>> maps = await _database.query('cards');

    return List.generate(maps.length, (i) {
      return CardData(
        id: maps[i]['id'],
        name: maps[i]['name'],
        barcode: maps[i]['barcode'],
        cvcCode: maps[i]['cvcCode'],
        cardNumber: maps[i]['cardNumber'],
      );
    });
  }

  Future<void> deleteCard(int id) async {
    await open();
    await _database.delete('cards', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateCard(CardData card) async {
    await open();
    await _database
        .update('cards', card.toMap(), where: 'id = ?', whereArgs: [card.id]);
  }

  Future<void> close() async {
    await _database.close();
  }
}
