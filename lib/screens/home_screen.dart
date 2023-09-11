import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home_screen'),
        centerTitle: true,
        actions: [
          IconButton(icon:const Icon(Icons.add),
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/create_contact_screen');
          },),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        itemCount: 10,
          itemBuilder: (context,index){
            return ListTile(
              onTap: (){},
              leading: const Icon(Icons.contact_mail_sharp, color: Colors.blue,),
              title: const Text('title'),
              subtitle: const Text('subtitle'),
              trailing: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.delete,color: Colors.red,),),
            );
          }),
    );
  }
}
