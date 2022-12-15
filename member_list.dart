import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/members.dart';

class MemberList extends StatelessWidget {
  final List<int> pos = List<int>.generate(10000, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    final membersData = Provider.of<Members>(context);
    final members = membersData.items;

    return Container(
      child: ListView.builder(
        itemBuilder: (cxt, index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              Provider.of<Members>(context, listen: false)
                  .removeMember((members[index].id));
            },
            background: Container(
              child: const Icon(
                Icons.delete,
                color: Colors.black87,
              ),
              color: Colors.amber[800],
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
            ),
            child: Card(
              elevation: 5,
              child: Container(
                color: members[index].type == false
                    ? Theme.of(context).canvasColor
                    : Theme.of(context).accentColor,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: CircleAvatar(
                                radius: 16,
                                child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      pos[index].toString(),
                                      style: TextStyle(fontSize: 15),
                                    ))),
                          ),
                          Container(
                            margin: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromARGB(255, 74, 113, 144),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.5),
                              child: Column(children: [
                                Text(
                                  members[index].name,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                Text(
                                  members[index].secondName,
                                  style: Theme.of(context).textTheme.labelSmall,
                                )
                              ]),
                            ),
                          ),
                          Column(
                            children: [
                              Text(members[index].startData == null
                                  ? ''
                                  : members[index].startData.toString()),
                              SizedBox(
                                height: 5,
                              ),
                              Text(members[index].endData == null
                                  ? ''
                                  : members[index].endData.toString())
                            ],
                          ),
                          // Container(
                          //   child: Text(
                          //     members[index].type == false ? 'P' : 'S',
                          //     style: TextStyle(fontSize: 20),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            members[index].cash.toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.wallet),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: members.length,
      ),
    );
  }
}
