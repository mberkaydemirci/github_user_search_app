import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_user_search_app/core/viewmodel/usersearchviewmodel.dart';
import 'package:provider/provider.dart';

class UserSearchPage extends StatefulWidget {
  const UserSearchPage({Key? key}) : super(key: key);

  @override
  _UserSearchPageState createState() => _UserSearchPageState();
}

class _UserSearchPageState extends State<UserSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            children: [
         Padding(
           padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05, right: MediaQuery.of(context).size.width*0.05),
           child: TextField(
            controller: context.watch<UserSearchViewModel>().controller,
            onChanged: (text){
              print('CONTROLLER ${context.read<UserSearchViewModel>().controller.text}');
              context.read<UserSearchViewModel>().getUser(context.read<UserSearchViewModel>().controller.text);
              print('${context.read<UserSearchViewModel>().userModel.toString()}');
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Enter Username',
                // hintText: 'Enter Your Name'
            ),
        ),
         ),
              context.watch<UserSearchViewModel>().userModel.totalCount != null ?
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  // itemCount: context.watch<UserSearchViewModel>().userModel.totalCount,
                  //The reason why I entered the number 30, the information count came in 30
                  itemCount: context.watch<UserSearchViewModel>().userModel.totalCount! > 30 ? 30 : context.watch<UserSearchViewModel>().userModel.totalCount,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print('ON TAP');
                      },
                      // child: Text('${context.watch<UserSearchViewModel>().userModel.toString()}'),
                      child: Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05, right: MediaQuery.of(context).size.width*0.05),
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                            leading: Image.network('${context.watch<UserSearchViewModel>().userModel.items![index].avatarUrl}'),
                            title: Text('${context.watch<UserSearchViewModel>().userModel.items![index].login}'),
                            // subtitle: Text('${context.watch<UserSearchViewModel>().userModel.items![index].reposUrl}'),
                            subtitle: Text('${context.watch<UserSearchViewModel>().userModel.items![index].reposUrl}'),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ): Text('')
        ],
    ),
      ),);
  }
}
