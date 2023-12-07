/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/manage_bloc.dart';
import '../bloc/monitor_user_bloc.dart';
import '../model/user.dart';
import '../model/users.dart';

class DynamicListView extends StatefulWidget {
  const DynamicListView({super.key});

  @override
  State<DynamicListView> createState() => _DynamicListViewState();
}

class _DynamicListViewState extends State<DynamicListView> {
  String title = "";

  String description = "";

  final GlobalKey<FormState> formKeySubmit = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageBloc, ManageState>(
        builder: (BuildContext context, ManageState state) {
      if (state is UpdateState) {
        name = state.previousUser.name;
        description = state.previousUser.description;
        return Form(
          key: formKeySubmit,
          child: Column(
            children: [
              titleFormField(),
              descriptionFormField(),
              ElevatedButton(
                onPressed: () {
                  if (formKeySubmit.currentState!.validate()) {
                    formKeySubmit.currentState!.save();
                    BlocProvider.of<ManageBloc>(context).add(SubmitEvent(
                        note: Usuario.withData(
                      title: title,
                      description: description,
                    )));
                  }
                },
                child: const Text("Submit"),
              ),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<ManageBloc>(context).add(UpdateCancel());
                  },
                  child: const Text("Cancel Update")),
            ],
          ),
        );
      } else {
        return BlocBuilder<MonitorBloc, MonitorState>(
          builder: (BuildContext context, MonitorState state) {
            return getUserListView(state.userCollection);
          },
        );
      }
    });
  }

  ListView getUserListView(UserCollection userCollection) {
    return ListView.builder(
        itemCount: userCollection.length(),
        itemBuilder: (context, position) => ListTile(
              onTap: () {
                //print(userCollection.getIdAtIndex(position));
                BlocProvider.of<ManageBloc>(context).add(UpdateRequest(
                  userId: userCollection.getIdAtIndex(position),
                  previousUser: userCollection.getUserAtIndex(position),
                ));
              },
              leading: SizedBox(
                height: 40,
                width: 40,
                child:
                    Image.network(userCollection.getUsuarioAtIndex(position).path),
              ),
              trailing: GestureDetector(
                  onTap: () {
                    BlocProvider.of<ManageBloc>(context).add(DeleteEvent(
                        noteId: userCollection.getIdAtIndex(position)));
                  },
                  child: const Icon(Icons.delete)),
              title: Text(userCollection.getUsuarioAtIndex(position).title),
              subtitle:
                  Text(userCollection.getUsuarioAtIndex(position).description),
            ));
  }

  Widget titleFormField() {
    return TextFormField(
      initialValue: title,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.isEmpty) {
            return "Insira um title";
          }
        }
        return null;
      },
      onSaved: (String? inValue) {
        title = inValue ?? "";
      },
      decoration: const InputDecoration(
        hintText: "Meu Título",
        labelText: "Título",
      ),
    );
  }

  Widget descriptionFormField() {
    return TextFormField(
      initialValue: description,
      keyboardType: TextInputType.emailAddress,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.isEmpty) {
            return "Insira uma descrição";
          }
        }
        return null;
      },
      onSaved: (String? inValue) {
        description = inValue ?? "";
      },
      decoration: const InputDecoration(
        hintText: "Meu Description",
        labelText: "Description",
      ),
    );
  }
}*/