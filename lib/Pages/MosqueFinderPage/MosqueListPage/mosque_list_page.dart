import 'package:ajo_online/Pages/MosqueFinderPage/MosqueListPage/mosque_list_provider.dart';
import 'package:ajo_online/Pages/MosqueFinderPage/ViewMosquePage/view_mosque_page.dart';
import 'package:ajo_online/utils/action_message_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MosqueListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 120,
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 30),
          child: Consumer<MosqueListProvider>(
            builder: (context, value, child) {
              return Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Mosques', style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w900
                        ),),
                        IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: () => value.initialize()
                        )
                      ],
                    ),
                    Container(
                      child: TextFormField(
                        onChanged: (String searchParam) {
                          print(searchParam);
                          value.searchMosque(searchParam: searchParam);
                        },
                        decoration: InputDecoration(
                          hintText: 'Search mosque here',
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<MosqueListProvider>(
          builder: (context, value, child) {
            return Column(
              children: [


                ActionMessagePage(actionState: value.getActionState,),
                if (value.mosqueListToDsplay.length == 0 && !value.isLoading())
                  ...[
                    Text('No mosque to display')
                  ],
                ...value.mosqueListToDsplay.take(20).map((e) {
                  return Container(
                    child: ListTile(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled:true,
                          builder: (context) {
                            return Container(
                              child: ViewMosquePage(mosque: e),
                            );
                          },
                        );
                      },
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          '${e.mosqueImage}'
                        ),
                      ),
                      title: Text('${e.mosqueName}'),
                      subtitle: Text('${e.mosqueAddress}'),
                      trailing: Icon(Icons.view_list),
                    )
                  );
                })

              ],
            );
          },
        ),
      ),
    );
  }
}