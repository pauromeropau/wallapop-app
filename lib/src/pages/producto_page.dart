import 'package:flutter/material.dart';
import 'package:form_validation_app/src/models/producto_model.dart';
import 'package:form_validation_app/src/providers/productos_provider.dart';
import 'package:form_validation_app/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();
  final productoProvider = new ProductosProvider();

  ProductoModel producto = new ProductoModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('producto'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_large),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  _crearNombre(),
                  SizedBox(
                    height: 30.0,
                  ),
                  _crearPrecio(),
                  SizedBox(
                    height: 50.0,
                  ),
                  _crearBoton(context),
                  _crearDisponible(),
                ],
              )),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: producto.titulo,
      onSaved: (value) => producto.titulo = value,
      validator: (value) {
        if (value.length < 3) {
          Text('insert product name');
        }
        return null;
      },
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Product name'),
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      onSaved: (value) => producto.valor = double.parse(value),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'just numbers';
        }
      },
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: 'Product price [€]'),
    );
  }

  Widget _crearBoton(BuildContext context) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Theme.of(context).accentColor,
      textColor: Colors.white,
      label: Text('save'),
      icon: Icon(Icons.save),
      onPressed: _submit,
    );
  }

  Widget _crearDisponible() {
    return SwitchListTile(
      value: producto.disponible,
      onChanged: (value) => setState(() {
        producto.disponible = value;
      }),
      title: Text('available'),
      activeColor: Theme.of(context).accentColor,
    );
  }

  void _submit() {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    print(producto.titulo);
    print(producto.valor);
    print(producto.disponible);

    productoProvider.crearProducto(producto);
  }
}
