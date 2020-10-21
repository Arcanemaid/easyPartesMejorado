import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name;
  String _lastNames;
  String _email;
  String _email2;
  String _password;
  String _password2;
  String _adress;
  String _phoneNumber;
  String _id;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Apellidos'),
      maxLength: 15,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Apellidos es requerido';
        }

        return null;
      },
      onSaved: (String value) {
        _lastNames = value;
      },
    );
  }

  Widget _buildID() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'C.C'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'La cedula es requerida';
        }

        return null;
      },
      onSaved: (String value) {
        _id = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email es requerido';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Porfavor pon una direccion de correo valida';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildVeriFicationEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Verificacion Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Porfavor verifica tu Email';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Los correos no coinciden';
        }

        return null;
      },
      onSaved: (String value) {
        _email2 = value;
        if (_email2 != _email) {
          return 'los Emails no coinciden';
        }
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Contraseña'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Una contraseña es requerida';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _buildVerificationPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Verificacion Contraseña'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'las Contraseñas no coinciden';
        }

        return null;
      },
      onSaved: (String value) {
        _password2 = value;
        if (_password2 != _password) {
          return 'las Contraseñas no coinciden';
        }
      },
    );
  }

  Widget _builAdress() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Direccion'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Una direccion es requerida';
        }

        return null;
      },
      onSaved: (String value) {
        _adress = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Numero de Celular o Fijo'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Se requiere un numero de';
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("!Crea tu Usuario!")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              _buildLastName(),
              _buildID(),
              _buildEmail(),
              _buildVeriFicationEmail(),
              _buildPassword(),
              _buildVerificationPassword(),
              _builAdress(),
              _buildPhoneNumber(),
              SizedBox(height: 200),
              RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();

                  print(_name);
                  print(_lastNames);
                  print(_email);
                  print(_id);
                  print(_phoneNumber);
                  print(_adress);
                  print(_password);

                  //Send to API
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
