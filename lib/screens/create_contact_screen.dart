import 'package:flutter/material.dart';
import 'package:sqlite_database_provider/widgets/app_text_field.dart';

class CreateContactScreen extends StatefulWidget {
  const CreateContactScreen({Key? key}) : super(key: key);

  @override
  State<CreateContactScreen> createState() => _CreateContactScreenState();
}

class _CreateContactScreenState extends State<CreateContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create contact'),
        centerTitle: true,
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const Text(
            'Enter new contact details',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15,),
          const AppTextField(
            hint: 'Name',
            prefixIcon: Icons.person,
            textInputType: TextInputType.name,
          ),
          const SizedBox(height: 10,),
          const AppTextField(
            hint: 'Number',
            prefixIcon: Icons.call,
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 10,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(0, 50)
            ),
            onPressed: () {},
            child: const Text('SAVE'),
          )

        ],
      ),
    );
  }
}
