import 'package:flutter/material.dart';
import 'package:football_shop/widgets/left_drawer.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  int _price = 0;
  String _description = "";
  String _thumbnail = "";
  String _category = "topwear";
  bool _isFeatured = false;
  String _brand = "";
  int _stock = 0;

  final List<String> _categories = [
    'topwear',
    'bottomwear',
    'shoes',
    'gloves',
    'accessories',
    'socks',
    'trainingequipment',
    'ball',
    'bag',
  ];

  bool isValidUrl(String value) {
    final uri = Uri.tryParse(value);
    return uri != null && uri.hasScheme && uri.hasAuthority;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [


              TextFormField(
                decoration: const InputDecoration(labelText: "Nama Produk"),
                onChanged: (value) => _name = value,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Nama tidak boleh kosong!";
                  if (value.length > 30) return "Nama maksimal 30 karakter!";
                  return null;
                },
              ),

              const SizedBox(height: 12),


              TextFormField(
                decoration: const InputDecoration(labelText: "Harga"),
                keyboardType: TextInputType.number,
                onChanged: (value) => _price = int.tryParse(value) ?? -1,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Harga tidak boleh kosong!";
                  if (int.tryParse(value) == null) return "Harga harus berupa angka!";
                  if (int.parse(value) < 0) return "Harga tidak boleh negatif!";
                  return null;
                },
              ),

              const SizedBox(height: 12),


              TextFormField(
                minLines: 3,
                maxLines: 6,
                decoration: const InputDecoration(labelText: "Deskripsi"),
                onChanged: (value) => _description = value,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Deskripsi tidak boleh kosong!";
                  if (value.length < 10) return "Deskripsi minimal 10 karakter!";
                  return null;
                },
              ),

              const SizedBox(height: 12),


              TextFormField(
                decoration: const InputDecoration(labelText: "URL Thumbnail"),
                onChanged: (value) => _thumbnail = value,
                validator: (value) {
                  if (value == null || value.isEmpty) return "URL tidak boleh kosong!";
                  if (!isValidUrl(value)) return "URL tidak valid!";
                  return null;
                },
              ),

              const SizedBox(height: 12),

              TextFormField(
                decoration: const InputDecoration(labelText: "Brand Produk"),
                onChanged: (value) => _brand = value,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Brand tidak boleh kosong!";
                  if (value.length > 10) return "Brand maksimal 10 karakter!";
                  return null;
                },
              ),

              const SizedBox(height: 12),

              TextFormField(
                decoration: const InputDecoration(labelText: "Stok Produk"),
                keyboardType: TextInputType.number,
                onChanged: (value) => _stock = int.tryParse(value) ?? -1,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Stok tidak boleh kosong!";
                  if (int.tryParse(value) == null) return "Stok harus berupa angka!";
                  if (int.parse(value) < 0) return "Stok tidak boleh negatif!";
                  return null;
                },
              ),

              const SizedBox(height: 12),


              DropdownButtonFormField(
                value: _category,
                items: _categories.map((cat) => DropdownMenuItem(
                  value: cat,
                  child: Text(cat[0].toUpperCase() + cat.substring(1)),
                )).toList(),
                onChanged: (value) => setState(() => _category = value!),
                decoration: const InputDecoration(labelText: "Kategori"),
              ),

              const SizedBox(height: 12),

              SwitchListTile(
                title: const Text("Tandai sebagai Produk Unggulan"),
                value: _isFeatured,
                onChanged: (value) => setState(() => _isFeatured = value),
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("Produk Tersimpan"),
                        content: Text(
                          "Nama: $_name\n"
                          "Harga: $_price\n"
                          "Deskripsi: $_description\n"
                          "Thumbnail: $_thumbnail\n"
                          "Brand: $_brand\n"
                          "Stok: $_stock\n"
                          "Kategori: $_category\n"
                          "Unggulan: ${_isFeatured ? "Ya" : "Tidak"}"
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text("Save"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
