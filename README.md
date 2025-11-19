
<details>
<summary>Tugas 7</summary>

1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

Widget tree adalah struktur hierarki yang menggambarkan bagaimana widget disusun dan saling berhubungan. Setiap widget dapat berperan menjadi child atau parent. Parent widget adalah widget yang mengandung atau membungkus widget yang lain sedangkan child widget merupakan widget di dalam parent dan mewarisi konteks atau aturan tata letak dari parent.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

- MaterialApp</br>
widget root yang menyediakan tema, judul, dan navigasi
- ThemeData dan ColorScheme</br>
Mengatur warna dan gaya tampilan aplikasi
- MyHomePage</br>
Halaman utama dari aplikasi dan menampilkan data serta tombol-tombol
- Scaffold</br>
Menyediakan struktur dasar layout halaman
- AppBar</br>
Menampilkan header di bagian atas layar
- Text</br>
Menampilkan teks pada layar.
- Padding</br>
Memberikan jarak di sekitar widget internal.
- Column, Row</br>
Menyusun widget secara vertikal/horizontal
- Center</br>
Menempatkan child di tengah area yang tersedia.
- Container</br>
Wrapper untuk styling

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

MaterialApp memiliki fungsi untuk mengatur tema, homepage, navigation, bahasa, dan routing. Widget ini sering digunakan sebagai widget root karena fungsionalitas dari widget ini merupakan fungsionalitas yang harus konsisten di seluruh aplikasi, contohnya jika bahasa yang digunakan adalah bahasa inggris maka semua bagian aplikasi sebaiknya menggunakan bahasa inggris juka.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

StatelessWidget tidak dapat menyimpan data yang berubah-berubah alias statik sedangkan stateful dapat menyimpan data yang berubah-berubah. StatelessWidget digunakan jika kita ingin membuat UI atau komponen yang bersifat statis dan stateful digunakan untuk UI atau komponen yang bersifat dinamis atau tergantung aksi/input pengguna

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

BuildContext adalah objek yang merepresentasikan posisi suatu widget di dalam widget tree. BuildContext digunakan untuk mengambil data dari parent (misalnya tema, ukuran layar, atau navigator) dan Menentukan bagaimana widget dibangun di dalam metode build().

BuildContext dapat digunakan dengan mempassingnya sebagai parameter dari widget build

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'Halo',
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      ),
    ),
  );
}
```

5. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Hot reload adalah fitur Flutter yang memperbarui kode aplikasi secara langsung tanpa kehilangan state sehingga hanya bagian yang diubah yang berubah. Contohnya adalah ketika kita mengupdate teks atau tampilan. Hot restart memulai ulang seluruh aplikasi dari awal, termasuk menghapus semua state yang tersimpan di memori. Oleh sebab itu, hot reload akan lebih cepat dibanding hot restart
</details>


<details>
<summary> Tugas 8 </summary>

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Navigator.push() akan menambah page baru diatas page sekarang sehingga page lama masih ada di stack dan dapat kita gunakan back untuk balik ke page tersebut. Navigator.pushReplacement() mengganti halaman saat ini dengan halaman baru sehingga halaman lama dihapus dari stack dan tidak dapat kembali ke halaman sebelumnya. Navigator.push() cocok digunakan saat navigasi antara fitur" di aplikasi sedangkan pushReplacement lebih cocok digunakan pada saat log in dan logout, contohnya ketika user sudah logout seharusnya ia tidak dapat balik ke halaman sebelumnya

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Scaffold bertindak sebagai kerangka dasar halaman yang menyediakan struktur tata letak utama, seperti area untuk konten, AppBar, Drawer, Floating Action Button, dan sebagainya. Dengan menggunakan AppBar pada setiap halaman, aplikasi memiliki identitas visual yang konsisten, misalnya dengan menampilkan judul aplikasi dan warna tema yang sama pada bagian atas layar. Sementara itu, Drawer digunakan sebagai navigasi samping yang memuat menu utama, memungkinkan pengguna untuk berpindah antar halaman dengan mudah. 

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu. 

Padding berfungsi untuk memberikan ruang di sekitar elemen-elemen input, sehingga tampilan tidak terlihat terlalu padat dan lebih mudah dibaca. SingleChildScrollView berguna ketika form memiliki banyak field; widget ini memungkinkan seluruh halaman dapat di-scroll sehingga elemen tidak terpotong jika layar perangkat kecil atau keyboard sedang terbuka. Sementara itu, ListView mempermudah penataan elemen form dalam sebuah list yang otomatis dapat di-scroll dan mengatur ruang antar widget tanpa harus menambahkan Column dan SingleChildScrollView secara manual.

Ketika membuat halaman Create Product, saya menggunakan Padding di sekitar TextField seperti Padding(padding: EdgeInsets.all(8.0), child: TextField(...)) agar input terlihat lebih rapi dan tidak menempel ke tepi layar. Kemudian, seluruh form tersebut ditempatkan dalam SingleChildScrollView agar ketika pengguna mengetik dan keyboard muncul, halaman tetap dapat di-scroll tanpa terjadi overflow.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Pertama saya mengubah app bar menjadi warna putih dan tulisan Fulltime menjadi hijau dan Gear menjadi hitam agar sama dengan website. Setelah itu saya ubah tombol-tombol agar sama juga dengan webstie seperti all products memiliki background putih, text hitam, dan border hitam, add product dan my products memiliki background hijau

</details>

<details>
<summary> Tugas 9 </summary>

1. Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.
Untuk ini cukup cek di pwsny aja

2. Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.

Kita pake library pbp. Pertama bikin screens/register.dart

```dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:football_shop/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password1 = _passwordController.text;
                      String password2 = _confirmPasswordController.text;

                      // Check credentials
                      // TODO: Change the URL and don't forget to add trailing slash (/) at the end of URL!
                      // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
                      // If you using chrome,  use URL http://localhost:8000       
                      final response = await request.postJson(
                          "http://localhost:8000/auth/register/",
                          jsonEncode({
                            "username": username,
                            "password1": password1,
                            "password2": password2,
                          }));
                      if (context.mounted) {
                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Successfully registered!'),
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to register!'),
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

lalu untuk djangonya kita bikin apps baru namanya authentication dan tambain kode views berikut

```python
@csrf_exempt
def register(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data['username']
        password1 = data['password1']
        password2 = data['password2']

        # Check if the passwords match
        if password1 != password2:
            return JsonResponse({
                "status": False,
                "message": "Passwords do not match."
            }, status=400)
        
        # Check if the username is already taken
        if User.objects.filter(username=username).exists():
            return JsonResponse({
                "status": False,
                "message": "Username already exists."
            }, status=400)
        
        # Create the new user
        user = User.objects.create_user(username=username, password=password1)
        user.save()
        
        return JsonResponse({
            "username": user.username,
            "status": 'success',
            "message": "User created successfully!"
        }, status=200)
    
    else:
        return JsonResponse({
            "status": False,
            "message": "Invalid request method."
        }, status=400)
```

3. Membuat halaman login pada proyek tugas Flutter.

bikin screens/login.dart

```dart
import 'package:football_shop/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:football_shop/screens/register.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
          .copyWith(secondary: Colors.blueAccent[400]),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
        appBar: AppBar(
            title: const Text('Login'),
        ),
        body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password = _passwordController.text;

                      // Check credentials
                      // TODO: Change the URL and don't forget to add trailing slash (/) at the end of URL!
                      // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
                      // If you using chrome,  use URL http://localhost:8000
                      final response = await request
                          .login("http://localhost:8000/auth/login/", {
                        'username': username,
                        'password': password,
                      });

                      if (request.loggedIn) {
                        String message = response['message'];
                        String uname = response['username'];
                        if (context.mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                  content:
                                      Text("$message Welcome, $uname.")),
                            );
                        }
                      } else {
                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Login Failed'),
                              content: Text(response['message']),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 36.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Don\'t have an account? Register',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

4. Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.

di views.py applikasi authentication tambahkan fungsi-fungsi ini

```python
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login, logout as auth_logout
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json
from django.contrib.auth.models import User

# Create your views here.

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Login status successful.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login successful!"
                # Add other data if you want to send data to Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login failed, account is disabled."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login failed, please check your username or password."
        }, status=401)
    
@csrf_exempt
def register(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data['username']
        password1 = data['password1']
        password2 = data['password2']

        # Check if the passwords match
        if password1 != password2:
            return JsonResponse({
                "status": False,
                "message": "Passwords do not match."
            }, status=400)
        
        # Check if the username is already taken
        if User.objects.filter(username=username).exists():
            return JsonResponse({
                "status": False,
                "message": "Username already exists."
            }, status=400)
        
        # Create the new user
        user = User.objects.create_user(username=username, password=password1)
        user.save()
        
        return JsonResponse({
            "username": user.username,
            "status": 'success',
            "message": "User created successfully!"
        }, status=200)
    
    else:
        return JsonResponse({
            "status": False,
            "message": "Invalid request method."
        }, status=400)

@csrf_exempt
def logout(request):
    username = request.user.username
    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logged out successfully!"
        }, status=200)
    except:
        return JsonResponse({
            "status": False,
            "message": "Logout failed."
        }, status=401)
```

Lalu di settings.py tambahkan `10.0.2.2` ke allowed host agar emulator flutter bisa terhubung

5. Membuat model kustom sesuai dengan proyek aplikasi Django

Ambil data di endpoint /json lalu masukin ke web QuickType. Setelah itu bikin direktori baru bernama models yang mengantung file `product_entry.dart` dan paste kode dari quicktype ke situ

6. Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
Tampilkan name, price, description, thumbnail, category, dan is_featured dari masing-masing item pada halaman ini (Dapat disesuaikan dengan field yang kalian buat sebelumnya).

di flutter buat sebuah file `product_entry_list.dart` di screens 

```dart
import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/screens/product_entry_detail.dart';
import 'package:football_shop/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  const ProductEntryListPage({super.key});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  Future<List<ProductEntry>> fetchProductEntries(CookieRequest request) async {
    // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000
    
    final response = await request.get('http://localhost:8000/json/');
    
    // Decode response to json format
    var data = response;
    
    // Convert json data to ProductEntry objects
    List<ProductEntry> listProductEntries = [];
    for (var d in data) {
      if (d != null) {
        listProductEntries.add(ProductEntry.fromJson(d));
      }
    }
    return listProductEntries;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProductEntries(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'There are no products in football shop yet.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductEntryCard(
                  product: snapshot.data![index],
                  onTap: () {
                    // Navigate to product detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductEntryDetailPage(
                          product: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}
```

Kode ini akan mengambil data dari endpoint /json lalu menunjukkannya

kita juga perlu membuat product entry card di direktori widgets

```dart
import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';

class ProductEntryCard extends StatelessWidget {
  final ProductEntry product;
  final VoidCallback onTap;

  const ProductEntryCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 150,
                      color: Colors.grey[300],
                      child: const Center(child: Icon(Icons.broken_image)),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Title
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),

                // Category
                Text('Category: ${product.category}'),
                const SizedBox(height: 6),

                // Content preview
                Text(
                  product.description.length > 100
                      ? '${product.description.substring(0, 100)}...'
                      : product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 6),

                // Featured indicator
                if (product.isFeatured)
                  const Text(
                    'Featured',
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

7. Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
 Halaman ini dapat diakses dengan menekan salah satu card item pada halaman daftar Item.
 Tampilkan seluruh atribut pada model item kamu pada halaman ini.
 Tambahkan tombol untuk kembali ke halaman daftar item.

buat file product_entry_detail.dart di screens yang berisikan kode ini

```dart
import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';

class ProductEntryDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductEntryDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail image
            if (product.thumbnail.isNotEmpty)
              Image.network(
                'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 50),
                  ),
                ),
              ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Featured badge
                  if (product.isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 6.0),
                      margin: const EdgeInsets.only(bottom: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Text(
                        'Featured',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),

                  // Title
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Category and Date
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade100,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          product.category.toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Views count
                  Row(
                    children: [
                      Icon(Icons.visibility, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        '${product.sold} Sold',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Icon(Icons.visibility, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        '${product.stock} Stock',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  
                  const Divider(height: 32),

                  // Full content
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 16.0,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

Kode di atas akan menunjukkan semua detail dari produk tersebut. 

Lalu kita perlu buat views proxy-image di aplikasi main

```python
def proxy_image(request):
    image_url = request.GET.get('url')
    if not image_url:
        return HttpResponse('No URL provided', status=400)
    
    try:
        # Fetch image from external source
        response = requests.get(image_url, timeout=10)
        response.raise_for_status()
        
        # Return the image with proper content type
        return HttpResponse(
            response.content,
            content_type=response.headers.get('Content-Type', 'image/jpeg')
        )
    except requests.RequestException as e:
        return HttpResponse(f'Error fetching image: {str(e)}', status=500)
```

dan menambahkannya ke urls.py

8. Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.

Pertama kita buat method views di django untuk mengambil products yg dimiliki oleh user yg sedang logged in. Buat kodeny di aplikasi main

```python
@login_required
def flutter_list_user_products(request):
    # filter by logged-in user
    products = Products.objects.filter(user=request.user)

    data = [
        {
            'id': str(product.id),
            'name': product.name,
            'price': product.price,
            'description': product.description,
            'thumbnail': product.thumbnail,
            'category': product.category,
            'is_featured': product.is_featured,
            'brand': product.brand,
            'sold': product.sold,
            'stock': product.stock,
            'user': product.user.username if product.user else None,
        }
        for product in products
    ]

    return JsonResponse(data, safe=False)
```

Lalu buat sebuah file `my_products.dart` di library screens dan masukkan kode berikut

```dart
import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/screens/product_entry_detail.dart';
import 'package:football_shop/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class MyProductsPage extends StatefulWidget {
  const MyProductsPage({super.key});

  @override
  State<MyProductsPage> createState() => _MyProductsPageState();
}

class _MyProductsPageState extends State<MyProductsPage> {

  Future<List<ProductEntry>> fetchMyProducts(CookieRequest request) async {
    final response = await request.get(
      'http://localhost:8000/my-products-flutter/',
    );

    List<ProductEntry> listMyProducts = [];
    for (var d in response) {
      if (d != null) {
        listMyProducts.add(ProductEntry.fromJson(d));
      }
    }

    return listMyProducts;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchMyProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "You don't have any products yet.",
                style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) => ProductEntryCard(
              product: snapshot.data![index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductEntryDetailPage(
                      product: snapshot.data![index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

```

Basiclly sama kyk list smw product tapi beda endpoint doang

## Pertanyaan

1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan `Map<String, dynamic>` tanpa model (terkait validasi tipe, null-safety, maintainability)?

Kita perlu membuat model dart agar kita bisa melakukan validasi tipe atau null-saftey. Contohnya adalah jika kita memiliki sebuah atribut stok, kita dapat set atribut tersebut sebagai sebuah int data type. Jika ternyata id yang diterima adalah tipe data lain maka akan ada error. Model juga lebih mudah untuk maintain karena jika ada penambahan/perubahan atribut cukup diubah di modelsnya saja.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

fungsi dari package http adalah agar flutter dapat melakukan http request. Ini berguna karena kita akan perlu POST data ke aplikasi django kita contohnya adalah pada saat login/register dan get data ketika melihat produk. CookieRequest digunakan untuk handling state session dari user. Secara default http tidak memiliki kemampuan untuk menyimpan cookie sehingga digunakan library tersebut agar bisa mengirim dan menerima cookie untuk session handling, konsepny mirip kyk state handling di django

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

CookieRequest digunakan untuk menyimpan status login, cookies, dan header authentikasi. instance tersebut perlu dibagikan ke semua komponen agar semua komponen memiliki data tersebut. Contohnya adalah ketika kita ingin menambah sebuah produk. Ada atribut user yang terhubung dengan user saat ini dan informasi tersebut dihandle oleh CookieRequest

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

- 10.0.2.2 adalah alias untuk localhost di emulator sehingga kita perlu menambahkan ke allowed_hosts agar django mengenalinya

- CORS merupakan security measure agar resource kita tidak bisa di request oleh aplikasi lain, namun kita perlu mengambil resource untuk aplikasi flutter kita sehingga kita perlu set cors_allow_all_origins ke true 

- Samesite merupakan fitur dari django yang membuat cookie hanya bisa dikirim jika merupakan site aplikasi django itu sendiri namun kita perlu mengirim cookie ke dan dari aplikasi flutter kita maka kita perlu set `SESSION_COOKIE_SAMESITE = 'None'` dan `CSRF_COOKIE_SAMESITE = 'None'`

- Terakhir cukup jelas kita perlu nambahin internet ke di Android agar aplikasi kita bisa menggunakan internet

Jika ada yang salah dikonfigurasi maka flutter tidak bisa berkomunikasi dengan django, contohnya adalah jika kita lupa menambahkan internet ke android maka aplikasi tidak memiliki kemampuan untuk mengirim dan menerima data dari aplikasi django kita

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

Pengguna pertama memasukkan data melalui form pada aplikasi Flutter, kemudian data tersebut dikemas menjadi JSON dan dikirim ke backend Django. Django menerima request, memprosesnya (misalnya menyimpan data ke database atau menghasilkan respons), lalu mengembalikan JSON berisi hasil atau data terbaru. Flutter menerima JSON tersebut, mengubahnya menjadi model Dart, lalu state aplikasi diperbarui sehingga widget yang terkait melakukan rebuild dan menampilkan data baru ke layar pengguna.

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter

Pengguna pertama memasukkan data akun pada Flutter, lalu Flutter mengirimkan data tersebut ke endpoint Django menggunakan CookieRequest, yang secara otomatis menyertakan atau menerima cookie session. Untuk register, Django membuat akun baru dan mengembalikan respons sukses ke Flutter. Untuk login, Django memverifikasi username dan password, lalu jika valid, Django membuat cookie sessionid dan mengirimkannya kembali ke Flutter, yang kemudian disimpan oleh CookieRequest agar dapat digunakan pada request berikutnya sehingga pengguna tetap dianggap login. Setelah proses login berhasil, Flutter melakukan rebuild state dan menampilkan menu utama sesuai status autentikasi. Pada logout, Flutter mengirim request ke endpoint logout Django yang menghapus session, lalu CookieRequest menghapus cookie di sisi Flutter, menyebabkan status login menjadi false dan UI kembali menampilkan halaman login.

</details>

