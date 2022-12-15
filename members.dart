import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'member.dart';

class Members with ChangeNotifier {
  final List<Member> _items = [
    Member(
        name: "Abdel",
        secondName: "Abdiraev",
        cash: 6200,
        type: false,
        startData: '04-05-2022',
        endData: '04-08-2022',
        id: '1'),
    Member(
        name: "Akmal",
        secondName: "Abdiraev",
        cash: 6200,
        type: false,
        startData: '04-06-2022',
        endData: '04-08-2022',
        id: '2'),
    Member(
        name: "Dilshat",
        secondName: "kaparov",
        cash: 87900,
        type: false,
        startData: '04-06-2022',
        endData: '04-08-2022',
        id: '3'),
  ];

  List<Member> get items {
    return [..._items];
  }

  void addMember(Member member) {
    final newMember = Member(
      name: member.name,
      secondName: member.secondName,
      cash: member.cash,
      type: member.type,
      startData: member.startData,
      endData: member.endData,
      id: DateTime.now().toString(),
    );
    _items.add(newMember);

    notifyListeners();
  }

  void removeMember(String memberId) {
    _items.remove(memberId);
    notifyListeners();
  }
}
