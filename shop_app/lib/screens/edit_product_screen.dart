import 'package:flutter/material.dart';
import 'package:shop_app/providers/product.dart';

class EditProductScreen extends StatefulWidget {
  static const routeNane = '/edit-product';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descripcionFocusNode = FocusNode();
  final _imagUrlControl = TextEditingController();
  final _imagFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct =
      Product(id: null, title: '', price: 0, description: '', imageUrl: '');

  @override
  void initState() {
    _imagFocusNode.addListener(_updateImageUrl);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _imagFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descripcionFocusNode.dispose();
    _imagUrlControl.dispose();
    _imagFocusNode.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imagFocusNode.hasFocus) {
      if ((!_imagUrlControl.text.startsWith('http') &&
              !_imagUrlControl.text.startsWith('hhtps')) ||
          (!_imagUrlControl.text.endsWith('.png') &&
              !_imagUrlControl.text.endsWith('.jpg') &&
              !_imagUrlControl.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  void _saveForm() {
    var isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _form,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    hintText: 'Title',
                    labelText: 'Title',
                    suffixIcon: Icon(Icons.title),
                  ),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                  onSaved: (value) {
                    _editedProduct = Product(
                        title: value,
                        price: _editedProduct.price,
                        description: _editedProduct.description,
                        imageUrl: _editedProduct.imageUrl,
                        id: null);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a value!.';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    hintText: 'Price',
                    labelText: 'Price',
                    suffixIcon: Icon(Icons.attach_money),
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _priceFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descripcionFocusNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a price!.';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number!.';
                    }
                    if (double.parse(value) <= 0) {
                      return 'Please enter a number greater than 0';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editedProduct = Product(
                        title: _editedProduct.title,
                        price: double.parse(value),
                        description: _editedProduct.description,
                        imageUrl: _editedProduct.imageUrl,
                        id: null);
                  },
                ),
                TextFormField(
                    decoration: InputDecoration(labelText: 'Description'),
                    maxLines: 3,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.multiline,
                    focusNode: _descripcionFocusNode,
                    onSaved: (value) {
                      _editedProduct = Product(
                          title: _editedProduct.title,
                          price: _editedProduct.price,
                          description: value,
                          imageUrl: _editedProduct.imageUrl,
                          id: null);
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide a description!.';
                      }
                      if (value.length < 10) {
                        return 'Should be at least 10 characters long!.';
                      }
                      return null;
                    }),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(
                        top: 8,
                        right: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      child: _imagUrlControl.text.isEmpty
                          ? Text('Enter a URL')
                          : FittedBox(
                              child: Image.network(
                                _imagUrlControl.text,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Image URL'),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imagUrlControl,
                        focusNode: _imagFocusNode,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter image url!.';
                          }
                          if (!value.startsWith('http') ||
                              !value.startsWith('hhtps')) {
                            return 'Please enter a valid url.';
                          }
                          if (!value.endsWith('.png') ||
                              !value.endsWith('.jpg') ||
                              !value.endsWith('.jpeg')) {
                            return 'Please enter a valid url';
                          }
                          return null;
                        },
                        onFieldSubmitted: (_) {
                          _saveForm();
                        },
                        onSaved: (value) {
                          _editedProduct = Product(
                              title: _editedProduct.title,
                              price: _editedProduct.price,
                              description: _editedProduct.description,
                              imageUrl: value,
                              id: null);
                        },
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
