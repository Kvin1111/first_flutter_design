


import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'isloading_auth.dart';

void main()async{
  await GetStorage.init();
  runApp(const Main());
}
class Main extends StatelessWidget {
const Main({ super.key });

  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      home: IsloadingAuth (),
      debugShowCheckedModeBanner: false,
      //theme: ThemeData.dark(),
    );
  }
}