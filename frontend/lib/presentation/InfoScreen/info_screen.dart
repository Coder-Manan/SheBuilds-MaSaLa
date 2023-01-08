import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/app_theme.dart';
import 'package:frontend/presentation/InfoScreen/info_screen_bloc.dart';
import 'package:frontend/presentation/components/appbar.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final Map<String, dynamic> _formData = {
  "name": Null,
  "address": Null,
  "contact": Null,
  "password": Null,
  "cpassword": Null
};

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  static const id = 'registration';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoScreenBloc, InfoScreenState>(
      builder: ((context, state) {
        return Scaffold(
          appBar: ourAppBar('MedCord', context),
          body: state is LoadingState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(33, 13, 28, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Complete Profile',
                            style: Theme.of(context).textTheme.headline1),
                        Text(
                            'Buy all you want and explore our wide range of products and consultancies',
                            style: Theme.of(context).textTheme.bodyText1),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.copyWith(fontSize: 24),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  constraints:
                                      const BoxConstraints(maxHeight: 33),
                                  labelText: 'Name',
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          fontSize: 15,
                                          fontFamily: 'Montserrat Italic'),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                                onChanged: (value) => _formData['name'] = value,
                              ),
                              Text(
                                'Address',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.copyWith(fontSize: 24),
                              ),
                              TextFormField(
                                  expands: true,
                                  maxLines: null,
                                  minLines: null,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    constraints:
                                        const BoxConstraints(maxHeight: 33),
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                            fontSize: 15,
                                            fontFamily: 'Montserrat Italic'),
                                    labelText: 'Address',
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                  ),
                                  onChanged: (value) =>
                                      _formData['address'] = value),
                              Text(
                                'Contact',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.copyWith(fontSize: 24),
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    constraints:
                                        const BoxConstraints(maxHeight: 33),
                                    labelText: 'Contact',
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                            fontSize: 15,
                                            fontFamily: 'Montserrat Italic'),
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                  ),
                                  onChanged: (value) =>
                                      _formData['contact'] = value),
                              Text(
                                'Password',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.copyWith(fontSize: 24),
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    constraints:
                                        const BoxConstraints(maxHeight: 33),
                                    labelText: 'Password',
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                            fontSize: 15,
                                            fontFamily: 'Montserrat Italic'),
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                  ),
                                  onChanged: (value) =>
                                      _formData['password'] = value),
                              Text(
                                'Confirm Password',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.copyWith(fontSize: 24),
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    constraints:
                                        const BoxConstraints(maxHeight: 33),
                                    labelText: 'Re-enter password',
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                            fontSize: 15,
                                            fontFamily: 'Montserrat Italic'),
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                  ),
                                  onChanged: (value) =>
                                      _formData['cpassword'] = value),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formData['password'] != _formData['cpassword']) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Passwords don't match")));
                          } else {
                            //register
                            BlocProvider.of<InfoScreenBloc>(context)
                                .add(RegistrationEvent(data: _formData));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        child: Text(
                          'Done',
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              ?.copyWith(
                                  color: AppTheme.scaffoldBackgroundColor),
                        )),
                  )
                ]),
        );
      }),
    );
  }
}
