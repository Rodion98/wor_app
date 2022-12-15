import 'package:flutter/material.dart';
import 'package:work_app/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

import '../widgets/member_list.dart';
import '../widgets/edit_new_member.dart';
import '../providers/members.dart';

class AllMembersScreen extends StatefulWidget {
  static const routeName = '/All-members-Screen';

  @override
  State<AllMembersScreen> createState() => _AllMembersScreenState();
}

class _AllMembersScreenState extends State<AllMembersScreen> {
  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return EditNewMember();
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All members'),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            onPressed: () => startAddNewTransaction(context)),
        drawer: MainDrawer(),
        body: MemberList());
  }
}
