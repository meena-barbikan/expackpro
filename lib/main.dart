import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:expackpro/audio.dart';
import 'package:expackpro/mulitplefile.dart';
import 'package:expackpro/picturenetwork.dart';
import 'package:expackpro/exflchart.dart';
import 'package:expackpro/plan.dart';
import 'package:expackpro/smoothpage_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';

import 'package:url_launcher/url_launcher.dart';

import 'memegenerate/memegenerate.dart';
import 'multilanguage/deign_view.dart';
import 'calendar.dart';
import 'passdata/passdata.dart';
import 'video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'voicerecord.dart';
// hive example

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   Hive.registerAdapter(HiveModelAdapter());
//   await Hive.openBox<HiveModel>("users");
//   runApp(const MyApp());
// }

// flutter localization

// langugae
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await EasyLocalization.ensureInitialized();
//   runApp(
//     EasyLocalization(
//     fallbackLocale: const Locale("en", "US"),
//     supportedLocales: const [
//       Locale("en", "US"),
//       Locale("es", "ES"),
//       Locale("ur", "PK"),
//       Locale('ta', 'IN'),
//     ],
//     path: 'assets/language',
//     child: const MyApp(),
//   ));
// }

void main() async {
  // notification ka off pani vachi iruken... ithu splash screen ka use panurom
  // WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await initializeApp();

// notification
  // await AwesomeNotifications().initialize(null, [
  //   NotificationChannel(
  //     channelGroupKey: "Basic_channel_group",
  //     channelKey: "Basic_channel",
  //     channelName: "Basic_Notification",
  //     channelDescription: "Test Notification",
  //   )
  // ], channelGroups: [
  //   NotificationChannelGroup(
  //     channelGroupKey: "Basic_channel_group",
  //     channelGroupName: "Basic Group",
  //   )
  // ]);
  // bool isAllowednotification =
  //     await AwesomeNotifications().isNotificationAllowed();
  // if (!isAllowednotification) {
  //   AwesomeNotifications().requestPermissionToSendNotifications();
  // }

  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

// // Example initialization function
// Future<void> initializeApp() async {
//   // Simulate some initialization tasks
//   await Future.delayed(const Duration(seconds: 3));

//   // After initialization, remove the splash screen
//   FlutterNativeSplash.remove();
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     AwesomeNotifications().setListeners(
//       onActionReceivedMethod: NotificationController.onActionReceivedMethod,
//       onNotificationCreatedMethod:
//           NotificationController.onNotificationCreatedMethod,
//       onNotificationDisplayedMethod:
//           NotificationController.onNotificationDisplayedMethod,
//       onDismissActionReceivedMethod:
//           NotificationController.onDismissActionReceivedMethod,
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: NotificationView(),
//     );
//   }
// }

// localize multipart language

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       localizationsDelegates: context.localizationDelegates,
//       supportedLocales: context.supportedLocales,
//       locale: context.locale,
//       debugShowCheckedModeBanner: false,
//       home: designview(),
//     );
//   }
// }
// other package design

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        //  ChangeNotifierProvider(
        //   create: (context) => CounterProvider(),
        //   child:
        //  GetMaterialApp(
        MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // themeMode: ThemeMode.system,
      // theme: MyTheme.lightTheme,
      // darkTheme: MyTheme.darkTheme,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // voice record
      home: Voicerecord(),
      // home: MyHomePage(
      //   title: "Image Picker",
      // ),
      // language
      //home: designview(),
      // home: MyAppDeisgnview(),
      // plan
      //  home: ColorSwitcherScreen(),
      //  home: SubscriptionView(),
      // home: MemeGenerate(),
      //pass data
      //home: Passdata(),
      // slivers
      //  home: SliverappBardesign(),
      // custom clippath
      //home: homepageclippath(),
      //home: CustomeclippathView(),
      //home: Simpledesign(),
      //  home: HomeScreen(),
      //  home: Audio(),
      // home: Animationview(),

      //home: const Authenticationview(),
      //home: Connectionview(),
      //home: Onboardingview(),
      //  home: dashboardview(),
      // home: DashboardScreenpicture(),

      // home: const MyHomePage(title: 'Flutter Url Launcher'),
      //home: ScrollListanimation(),
      //home: animatedview(),
      //// home: panitview(),
      //home: exampleappbar(),
      //home: shimmerloader(),
      //home: swiablebuttonview(),
      //home: SwiperAnimation(),
      //  home: ProviderScreen(),
      //  home: CounterPage(),
      // Riverpod
      //  home: Screendesign(),
      // home :CounterPage(),
      //home: MyAppView(),
      //home: MyAppSizedbox(),
      // home: MyAppSizeTransition()
      //home: exampleappbar(),
      //home: Wrapper(),
      //home: MultiColorBarChart(),
      //home: Loginpagedesign(),
      //home: IndexedStackExample(),
      //home: IndexsatckFadeinimage(),
      //home: Zoomdrawerview(),
      //home: ClipPathExample()
      //home: BarChartSample(),
      //home: SmsAutoread(),
      //home: Designview(),
      //home: Curvednavigationbarviewexample(),
      //    home: Resigster(),
      //home: UserView(),
      //  home: UserListView(),
      //  home: HomeScreenView(), // image file
      //  home: DesignView(),  // design
      //home: countpage(),  // design
      // home: cookiedeign(), // design
      //  home: cokkiedashboarddesign(), // design
      // home: Barchat(),
      //home: ColumView(),
      //home: FlexView(),
      //  home: jsonplaceholderexample(), // pagination view page
      // home: MyWidget(),
      // home: PaginationExample(), // paginationan
      //        home: UserListView()
      //home: commnetsview(),
      //home: MyAppText(),
      //home: BottomAppBarExample(),
      //home: Bottomappbarview(),
      // home: Drawerview(),
      //  home: Bottomnavigationview(),
      //home: MyAppLandsscape(),
      //home: HomePageGridVIEW(),
      //  home: MasonryGridViewExample(),
      // home: GridExampleHome(),
      //home: SingleChildScrollViewExample(),
      //home: UserlistPlace(),
      //home: AlertboxView(),
      // home: orientationbuilderview(),
      //  home: SpeedDialmenu(),
      //   home: OpenDialog(),
      //  ),
      //home: Listviewexample(),
      // home: GridViewBuilder(),
      //  home: Stackexample(),
      //home: VideocallScreen());
      // home: ConstraniedBoxView(),
      //   home: DateTimePickerExample()
      //home: Homepage(), // responsive design

      //  home: ecommerceview(),
      //  home: ProductDetailsScreen(),

      // Sqlite example
      // home: UserListViewSqlite(),

      // hive
      //home: HiveListView(),

// color
      //home: Colorchange(),
      //   home: ImageColorChange(),
      // home: ImageDesignPage(),

      // change notifier  setstate
      // home: MyCounter(),

      // custom painter
      // home: LargeHalfCirclePage(),

      // home: SemiCircleScreen(),
      // home: customappview(),
      //  home: loginusecustom(),
      //home: LoginScreen(),
      // animation
      //  home: staggeredanimation(),
    );
  }
}

// change notifier
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) =>
//           CounterNotifier(), // Provide the CounterNotifier here
//       child: MaterialApp(
//         home: MyCounterView(),
//       ),
//     );
//   }
// }
// void main() {
//   runApp(const MyApp());
// }

// // flutter localization
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Locale _locale = Locale("en", ""); // Default locale

//   void _changeLanguage(String languageCode) {
//     setState(() {
//       _locale = Locale(languageCode);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Localizations Sample App',
//       localizationsDelegates: AppLocalizations.localizationsDelegates,
//       supportedLocales: AppLocalizations.supportedLocales,
//       locale: _locale,
//       home: SubscriptionView(
//         changeLanguage: _changeLanguage,
//       ),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final url = "https://google.com";
  Future OpenBrowseUlr({required String url, bool inApp = false}) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      // ignore: deprecated_member_use
      await launchUrl(
        Uri.parse(url),
        mode: inApp
            ? LaunchMode.inAppWebView // Opens the URL within the app
            : LaunchMode
                .externalApplication, // Opens the URL in an external browser
      );
      // await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  // String _filePath = ''; // Store file path for display
  // String _fileContents = ''; // Store contents read from the file

  // // Function to get the path for the application documents directory
  // Future<String> _getFilePath() async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final path = directory.path;
  //   return '$path/example.txt'; // We will store the file in the documents directory with a name 'example.txt'
  // }

  // // Function to write to a file
  // Future<void> _writeToFile() async {
  //   final path = await _getFilePath();
  //   final file = File(path);

  //   // Write some text to the file
  //   await file.writeAsString('Hello, Flutter!');
  //   setState(() {
  //     _filePath = path;
  //   });
  // }

  // // Function to read from the file
  // Future<void> _readFromFile() async {
  //   try {
  //     final path = await _getFilePath();
  //     final file = File(path);

  //     // Read the file's contents
  //     String contents = await file.readAsString();
  //     setState(() {
  //       _fileContents = contents;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _fileContents = 'Error reading file!';
  //     });
  //   }
  // }
  FilePickerResult? result;
  PlatformFile? file;
  File? _image;
  ImagePicker _imagePicker = ImagePicker();

  void pickimageformgallery() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void pickimageformcamera() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          //  FaIcon(FontAwesomeIcons.link),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Tooltip(
                message: "Pie Chart",
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Exflchart()));
                    },
                    child: const FaIcon(FontAwesomeIcons.pieChart))),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Tooltip(
                message: "Line Chart",
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const lineChart()));
                    },
                    child: const FaIcon(FontAwesomeIcons.pieChart))),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Tooltip(
                message: "Bar Chart",
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Barchat()));
                    },
                    child: const FaIcon(FontAwesomeIcons.pieChart))),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Audio()));
                        },
                        child: const FaIcon(FontAwesomeIcons.audible)),
                    const SizedBox(
                      width: 05,
                    ),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const RadialGradient(
                          colors: [Colors.orangeAccent, Colors.redAccent],
                          radius: 4,
                          tileMode: TileMode.mirror,
                        ).createShader(bounds);
                      },
                      child: Text(
                        "This is Shader Mask example code ",
                        style: GoogleFonts.eduNswActFoundation(fontSize: 20),
                      ),
                    ),
                    // const Text(
                    //   'Welcome to Url Launcher',
                    // ),
                    const SizedBox(
                      width: 05,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const VideoPlayerView()));
                        },
                        child: const FaIcon(FontAwesomeIcons.faceSmileBeam))
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      const url = "https://google.com";
                      OpenBrowseUlr(url: url, inApp: true);
                    },
                    child: const Text("Open Url in Browser")),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final phonenumber = "+916382723030";
                      final urlphonenumber = "tel:$phonenumber";
                      if (await canLaunchUrl(Uri.parse(urlphonenumber))) {
                        await launchUrl(Uri.parse(urlphonenumber));
                      }
                      // Openphonenumber(url: urlphonenumber, inApp: true);
                    },
                    child: const Text("Open Url in Phonenumber")),
                const Gap(20),
                ElevatedButton(
                    onPressed: () async {
                      final sms = "+916382723030";
                      final urlsms = "sms:$sms";
                      if (await canLaunchUrl(Uri.parse(urlsms))) {
                        await launchUrl(Uri.parse(urlsms));
                      }
                      // Openphonenumber(url: urlphonenumber, inApp: true);
                    },
                    child: Text(
                      "Open Url in SMS",
                      style:
                          GoogleFonts.abel(fontSize: 19, color: Colors.amber),
                    )),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      String? encodeQueryParameters(
                          Map<String, String> params) {
                        return params.entries
                            .map((MapEntry<String, String> e) =>
                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                            .join('&');
                      }

                      // ···
                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'selvameena1282003@gmail.com',
                        query: encodeQueryParameters(<String, String>{
                          'subject': 'Example Subject & Symbols are allowed!',
                        }),
                      );

                      launchUrl(emailLaunchUri);
                    },
                    //   final toEmail = "selvameena12082003@gmail.com";
                    //   final subiect = "Exampleproject - package";
                    //   final message = "----";
                    //   final urlemail =
                    //       "mailto:${toEmail}?subject=${subiect}&body=${message}";
                    //   if (await canLaunchUrl(Uri.parse(urlemail))) {
                    //     await launchUrl(Uri.parse(urlemail));
                    //   }
                    //   // Openphonenumber(url: urlphonenumber, inApp: true);
                    // },
                    child: const Text("Open Url in Email")),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SmoothpageView()));
                  },
                  child: Text(
                    "Smooth page Indicator",
                    style: GoogleFonts.atomicAge(
                        fontSize: 19, color: Colors.redAccent),
                  ),
                ),

                Center(
                  child: Semantics(
                    label: 'Increment Counter Button',
                    hint: 'Double-tap to increase the counter',
                    button: true,
                    child: ElevatedButton(
                      onPressed: () {
                        print('Counter incremented');
                      },
                      child: const Text('Increment'),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Picturenetwork()));
                        },
                        child: const Text("Cached NetWork Image")),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Calendar()));
                        },
                        child: const Text("syncfusion_flutter_calendar")),
                  ],
                ),

                // ElevatedButton(
                //   onPressed: _writeToFile,
                //   child: Text('Write to File'),
                // ),
                // ElevatedButton(
                //   onPressed: _readFromFile,
                //   child: Text('Read from File'),
                // ),
                // SizedBox(height: 20),
                // Text('File Path: $_filePath'),
                // SizedBox(height: 20),
                // Text('File Contents: $_fileContents'),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        pickFiles();
                      },
                      child: const Text('Pick File'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        pickedFiles();
                      },
                      child: const Text('Multiple File Picker'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                (file == null)
                    ? Container()
                    : Image.file(
                        File(file!.path.toString()),
                        height: 150,
                        width: 160,
                      ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        pickimageformgallery();
                      },
                      child: const Text('Pick image from gallery'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        pickimageformcamera();
                      },
                      child: const Text('Pick image form Camera'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                (file == null)
                    ? Container()
                    : Image.file(
                        _image!,
                        height: 150,
                        width: 160,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<File> SaveFilePremanetly(PlatformFile file) async {
  //   final appstorage = await getApplicationDocumentsDirectory();
  //   final newfile = File("${appstorage.path} / ${file.name}");
  //   return File(file.path!).copy(newfile.path);
  // }

  void pickFiles() async {
    result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) {
      return;
    }
    file = result!.files.first;

    // openFile(file);

    setState(() {});
  }

  void pickedFiles() async {
    result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) {
      return;
    }
    file = result!.files.first;

    loadmulitpleFiles(result!.files);
  }

  void loadmulitpleFiles(List<PlatformFile> file) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Mulitplefile(
                  files: file,
                  onopendedFile: openFile,
                )));
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
// import 'package:expackpro/barchart.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Shape Morph Animation',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: BarChartSample());
//   }
// }
