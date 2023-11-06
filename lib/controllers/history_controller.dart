import 'dart:convert';
import 'dart:developer' as developer;
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  var isLoading = false.obs;
  var currentIndex = 0.obs;
  var selectedDate = "".obs;
  var allNotes = <DocumentSnapshot>[].obs;
  var allDates = <List<DocumentSnapshot>>[].obs;
  var historyFilterNotes = <DocumentSnapshot>[].obs;

  //FIRESTORE DECLARED
  FirebaseFirestore? firestore;

  @override
  void onInit() {
    firestore = FirebaseFirestore.instance;
    super.onInit();
    //GET ALL NOTES
    getAllNotes();
    //GET ONLY DATES
    groupDocumentsByDate();

  }

  void getAllNotes() async {
    Query query = firestore!
        .collection("Notes")
        .orderBy('created', descending: false)
        .limit(10);

    QuerySnapshot snapshot = await query.get();
    allNotes.value = snapshot.docs.toSet().toList();
    update();
  }


  void groupDocumentsByDate() async {
    final firestore = FirebaseFirestore.instance;
    final collectionReference = firestore.collection("Notes");

    final querySnapshot = await collectionReference.get();

    final groupedDocuments = <DateTime, List<DocumentSnapshot>>{};

    for (final doc in querySnapshot.docs) {
      final createdTimestamp = doc["created"] as Timestamp;
      final date = DateTime(
        createdTimestamp.toDate().year,
        createdTimestamp.toDate().month,
        createdTimestamp.toDate().day,
      );

      if (!groupedDocuments.containsKey(date)) {
        groupedDocuments[date] = [doc];
      } else {
        groupedDocuments[date]!.add(doc);
      }
    }
    // Convert the values (lists of documents) to a list
    allDates.value = groupedDocuments.values.toList();

    //GET HISTORY
    historyFilterNotes.value=allNotes.where((p0) =>DateFormat.yMd().format(p0.get("created").toDate())==DateFormat.yMd().format(allDates[0].first.get("created").toDate())).toList();
    selectedDate.value=DateFormat.yMd().format(allDates[0].first.get("created").toDate());
    update();

  }

  //SET SELECTED DATE
  void setSelectedDate(String historyDate,int index) {
    currentIndex.value = index;
    selectedDate.value=historyDate;
    historyFilterNotes.value=allNotes.where((p0) =>DateFormat.yMd().format(p0.get("created").toDate())==historyDate).toList();
    update();
  }
}
