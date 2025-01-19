import 'dart:developer';

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
  var filterByDay=<String>[];

  @override
  void onInit() {
    firestore = FirebaseFirestore.instance;
    super.onInit();
    //GET ALL NOTES
    getAllNotes();
    //GET ONLY DATES
    // groupDocumentsByDate();
    //GET ALL TAGS
    filterByDay=[
      "Today",
      "Yesterday",
      "1 Week Ago",
      "1 Month Ago",
      "3 Months Ago",
      "6 Month Ago",
      "1 Year Ago"
    ];
    selectedDate.value=filterByDay.first;
    update();
  }

  @override
  void onReady() {
    super.onReady();

  }

  void getAllNotes() async {
    Query query = firestore!
        .collection("Notes")
        .orderBy('created', descending: true)
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
    allDates.value = groupedDocuments.values.toList().reversed.toList();

    update();

  }

  //SET SELECTED DATE
  void setSelectedDate(DateTime selectedDate) {
    // currentIndex.value = index;
    DateTime endDate = DateTime.now(); // Current time
    log("START DATE:$selectedDate");
    log("END DATE:$endDate");
    historyFilterNotes.value=allNotes
        .where((note) {
      DateTime createdDate = note.get('created').toDate();
      return createdDate.isAfter(selectedDate) && createdDate.isBefore(endDate);
    })
        .toList();
    log("HISTORY LIST:${historyFilterNotes.length}");
    // historyFilterNotes.value=allNotes.where((p0) =>DateFormat.yMd().format(p0.get("created").toDate())==historyDate).toList();
    update();
  }
  void setFilterDate(String selected) {
    selectedDate.value=selected;
    log("SELECTED DATE:${selectedDate.value}");
    // historyFilterNotes.value=allNotes.where((p0) =>DateFormat.yMd().format(p0.get("created").toDate())==historyDate).toList();
    var dateRange=getDateRangeStart(selectedDate.value);
    setSelectedDate(dateRange);
    update();
  }

  DateTime getDateRangeStart(String filter) {
    DateTime today = DateTime.now();
    switch (filter) {
      case "Today":
        return DateTime(today.year, today.month, today.day).toUtc().toLocal();
      case "Yesterday":
        return today.subtract(const Duration(days: 1));
      case "1 Week Ago":
        return today.subtract(const Duration(days: 7));
      case "1 Month Ago":
        return today.subtract(const Duration(days: 30));
      case "3 Months Ago":
        return today.subtract(const Duration(days: 90));
      case "6 Months Ago":
        return today.subtract(const Duration(days: 180));
      case "1 Year Ago":
        return today.subtract(const Duration(days: 365));
      default:
        return today; // Return today's date as a default
    }
  }

  void resetFilter() {
    historyFilterNotes.clear();
    update();
  }

  void deletePost(String noteId) async {
    log("ID FOR DELETE POST:$noteId");
    final noteRef = firestore?.collection("Notes").doc(noteId);

    try {
      await noteRef?.delete();
      log("Note deleted successfully: ${noteRef?.path}");
      getAllNotes();
    } catch (error) {
      log("Error deleting note: $error");
    }
  }
}
