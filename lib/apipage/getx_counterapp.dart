import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class GetxCounterapp extends StatefulWidget {
  const GetxCounterapp({super.key});

  @override
  State<GetxCounterapp> createState() => _GetxCounterappState();
}

class _GetxCounterappState extends State<GetxCounterapp> {
  final RxInt counter = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Getx Counter App",
          style: TextStyle(color: Colors.amber, fontSize: 20),
        ),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text("Counter :${counter.value}")),
          TextButton(
              onPressed: () {
                counter.value++;
              },
              child: const Text("Increment"))
        ],
      ),
    );
  }
}

// chnage notifier use pannaum provider ku

// ignore: camel_case_types
class providercounterapp extends StatefulWidget {
  const providercounterapp({super.key});

  @override
  State<providercounterapp> createState() => _providercounterappState();
}

// ignore: camel_case_types
class _providercounterappState extends State<providercounterapp> {
  @override
  Widget build(BuildContext context) {
    final Counter = Provider.of<CounterProvider>(context);
    final count = Counter.count;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Counter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Counter  : $count"),
          TextButton(
              onPressed: Counter.increment,
              //  () {
              //   log(count.toString());
              //   Counter.increment();
              // },
              child: const Text("Increment"))
        ],
      ),
    );
  }
}

class CounterProvider extends ChangeNotifier {
  int count = 0;
  //int get count => _count;
  void increment() {
    count = count + 1;
    notifyListeners();
  }
}

class BlocCounterapp extends StatefulWidget {
  const BlocCounterapp({super.key});

  @override
  State<BlocCounterapp> createState() => _BlocCounterappState();
}

class _BlocCounterappState extends State<BlocCounterapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Counter App"),
      ),
      body: BlocBuilder<CounterBloc, int>(
        builder: (BuildContext context, state) {
          return Column(
            children: [
              Text("Counter  : $state"),
              TextButton(
                  onPressed: () {
                    context.read<CounterBloc>().increment();
                  },
                  child: const Text("Increment"))
            ],
          );
        },
      ),
    );
  }
}

class CounterBloc extends Cubit<int> {
  CounterBloc() : super(0);

  void increment() {
    final updatevalue = state + 1;
    emit(updatevalue);
  }
}

class LazyLoadingview extends StatefulWidget {
  const LazyLoadingview({super.key});

  @override
  State<LazyLoadingview> createState() => _LazyLoadingviewState();
}

class _LazyLoadingviewState extends State<LazyLoadingview> {
  List _item = [];
  int page = 1;
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  Future _fetchData() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));

    List newindex = List.generate(20, (index) => (_item.length + index) + 1);
    setState(() {
      _item.addAll(newindex);
      _isLoading = false;
    });
  }

  void scrollController() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      _fetchData();
    }
  }

  @override
  void initState() {
    _fetchData();
    _scrollController.addListener(scrollController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lazy Loading View"),
      ),
      body: ListView.builder(
          controller: _scrollController,
          itemCount: _item.length + (_isLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == _item.length) {
              return const CircularProgressIndicator();
            }
            return ListTile(
              title: Text(" Index :${index + 1}"),
            );
          }),
    );
  }
}

// ignore: camel_case_types
class validationformview extends StatefulWidget {
  const validationformview({super.key});

  @override
  State<validationformview> createState() => _validationformviewState();
}

// ignore: camel_case_types
class _validationformviewState extends State<validationformview> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _submit() {
    if (_formkey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Submitted SuccessFully")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Validation"),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return "Please enter the Name";
                }
              },
              decoration: const InputDecoration(
                hintText: "Name",
              ),
            ),
            TextFormField(
              controller: _phoneController,
              validator: (value) {
                if (value == null || value.isEmpty || value.length != 10) {
                  return "Please enter the Phone number";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: "phone number"),
            ),
            TextFormField(
              controller: _emailController,
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return "Please enter the Field";
                }
                String pattern =
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                RegExp regex = RegExp(pattern);
                if (!regex.hasMatch(value)) {
                  return "Enter a valid email";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: "Email"),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return "Password must be at least 6 characters";
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            TextButton(
                onPressed: () {
                  _submit();
                },
                child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}

class ImageFileView extends StatefulWidget {
  const ImageFileView({super.key});

  @override
  State<ImageFileView> createState() => _ImageFileViewState();
}

class _ImageFileViewState extends State<ImageFileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ImageFileView",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
