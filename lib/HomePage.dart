import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gre_vocab/screens/greLearn.dart';
import 'package:gre_vocab/screens/greQuiz.dart';
import 'package:gre_vocab/screens/reviseScreen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'login/Login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  bool isloggedin = false;
  late BannerAd _bannerAd;
  bool _isAdLoaded = false;


  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User? firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser!;
        this.isloggedin = true;
      });
    }
    
  }

  signOut() async {
    _auth.signOut();
    Login();
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
    _initBannerAd();
  }

  _initBannerAd() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: BannerAd.testAdUnitId,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            _isAdLoaded = true;
          },
          onAdFailedToLoad: (ad, error) {}
        ),
        request: AdRequest());
    _bannerAd.load();
  }



  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 1,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor:  Colors.deepOrange,
            title: Text('Gre Vocab'),
            actions: [
              IconButton(
                icon: const Icon(
                    Icons.search
                ), onPressed: () {
                showSearch(context: context, delegate: DataSeach());
              },
              ),
            ],
          ),
          drawer: Drawer(child: SingleChildScrollView(
            child: Container(
              color: Colors.deepOrange,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/appIcon.png'),
                      )
                    ),
                  ),
                  Text("${user?.displayName}", style: TextStyle(color: Colors.white, fontSize: 20),),
                  Text("${user?.email}", style: TextStyle(color: Colors.grey[200], fontSize: 14),),
                  SizedBox(height: 20,),
                  RaisedButton(
                    padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                    onPressed: signOut,
                    child: Text('Signout',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  SizedBox(height: 20,),
                  _isAdLoaded ? Container(
                    height: _bannerAd.size.height.toDouble(),
                    width: _bannerAd.size.width.toDouble(),
                    child: AdWidget(ad: _bannerAd),
                  )
                      : SizedBox(),
                ],
              ),
            ),
          ),),
          body: Container(
            color: Colors.orange[300],
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            padding: const EdgeInsets.symmetric(
                horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Image.asset("images/learnRevise.png",
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 10,right: 10),
                  child: InkWell(
                    child: Column(
                      children: [
                        Container(
                          width: 285,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 10.0,left: 10,bottom: 10),
                            child: Text('Remember GRE words using related images.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Colors.black87,),
                            ),
                          ),
                        ),
                        Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),)
                            ),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '  Begin Learn',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                    onTap: () {
                      WidgetBuilder builder = (_) => const greLearn();
                      Route route = MaterialPageRoute(builder: builder);
                      Navigator.push(context, route);
                    },
                  ),
                ),
                SizedBox(height: 30,),
                Padding(padding: EdgeInsets.only(left: 10,right: 10),
                  child: InkWell(
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            width: 285,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 10.0,left: 20,bottom: 10),
                              child: Text('Revise GRE words with flashcard and Quiz.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Colors.black87,),
                              ),
                            ),
                          ),
                          Container(
                              height: 50,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),)
                              ),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '  Start Revise',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  )
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      WidgetBuilder builder = (_) => const Revise();
                      Route route = MaterialPageRoute(builder: builder);
                      Navigator.push(context, route);
                    },
                  ),
                ),
                SizedBox(height: 30,),
                Padding(padding: EdgeInsets.only(left: 10,right: 10),
                  child: InkWell(
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            width: 285,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 10.0,left: 20,bottom: 10),
                              child: Text('GRE Questions Quiz.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Colors.black87,),
                              ),
                            ),
                          ),
                          Container(
                              height: 50,
                              width: 300,
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),)
                              ),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '  Take Test',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  )
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      WidgetBuilder builder = (_) => const Test();
                      Route route = MaterialPageRoute(builder: builder);
                      Navigator.push(context, route);
                    },
                  ),
                ),
              ],
            ),
          ),
      )
  );

}





void _greLearn(context) {
  WidgetBuilder builder = (_) => const greLearn();
  Route route = MaterialPageRoute(builder: builder);
  Navigator.push(context, route);
}

void _greRevise(context) {
  WidgetBuilder builder = (_) => const Revise();
  Route route = MaterialPageRoute(builder: builder);
  Navigator.push(context, route);
}

void _greQuiz(context) {
  WidgetBuilder builder = (_) => const Test();
  Route route = MaterialPageRoute(builder: builder);
  Navigator.push(context, route);
}


class DataSeach extends SearchDelegate<String> {

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: (){
            query = "";
          },
          icon: Icon(Icons.clear),)
    ];

  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, '');
      },
    );
  }
  @override
  Widget buildResults(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 100),
                child: Column(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        width: 380,
                        height: 200,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10.0,
                                offset: Offset(0.0,10.0),
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                sele = "$selectedWord".toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.black
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:170,bottom: 10),
                                  child: Text(
                                    "$_pron",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 10,top: 5),
                                    child: Text(
                                      "Meaning:",
                                      style: TextStyle(
                                          fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                    width: 250,
                                    padding: const EdgeInsets.only(left: 10,bottom: 10,top: 5),
                                    child: RichText(text: TextSpan(text: '$_mean',style: TextStyle(color: Colors.teal,fontSize: 16,overflow: TextOverflow.fade)
                                    ),
                                    )
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 80.0),
                                  child: Container(
                                      height: 200,
                                      width: 200,
                                      child: FadeInImage.assetNetwork(
                                          placeholder: 'images/loading.gif',
                                          image: '$_imgUrl',
                                          imageErrorBuilder: (context, error, stackTrace) {
                                            return Image.asset(
                                              'images/errorImg.png',
                                            );
                                          }
                                      )
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 10,bottom: 10),
                                    child: Text(
                                      "Sentence:",
                                      style: TextStyle(
                                          fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                    width: 250,
                                    padding: const EdgeInsets.only(left: 10,bottom: 20),
                                    child: RichText(text: TextSpan(text: '$_sen',style: TextStyle(color: Colors.teal,fontSize: 16,overflow: TextOverflow.fade)
                                    ),
                                    )
                                ),
                              ],
                            ),
                          ],
                        ),
                      ), //Container
                    ), //Flexible
                  ], //<Widget>[]
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ), //Column
              ) //Padding
          ), //Container
        )
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? suggestedWords
        : wordList.where((p) => p.toLowerCase().startsWith(query.toLowerCase())).toList();

    return buildSuggestionsSuccess(suggestions);
  }

  Widget buildSuggestionsSuccess(List<String> suggestions) => ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index){
        final suggestion = suggestions[index];

        return ListTile(

          onTap: (){
            query = suggestion;
            selectedWord = query;
            Details();
            showResults(context);
          },
          leading: Icon(Icons.book),
          title: RichText(text: TextSpan(
              text: suggestions[index].substring(0,query.length),
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestions[index].substring(query.length),
                    style: TextStyle(color: Colors.grey)
                )
              ]
          ),
          ),
        );
      }

  );


  late List<String> wordList = list1 + list2 + list3 + list4 + list5 + list6 + list7 + list8 + list9 + list10 + list11 + list12 + list13;


  final suggestedWords = ['admonish', 'pugnacious', 'quell', 'reprehensible', 'masticate', 'inane'];

  List<String> lists = ['List 1', 'List 2','List 3','List 4', 'List 5','List 6','List 7', 'List 8','List 9', 'List 10'];
  List<String> list1 = ['voracious', 'indiscriminate', 'eminent', 'steeped', 'replete','abound','technology','prognosticate','automaton','matron'];
  List<String> list2 = ['paradox','realm','annals','compound','tinge', 'badger','implore','drudgery','interminable','perceive'];
  List<String> list3 = ['laconic', 'throng', 'intrepid', 'accost', 'reticent','furtive','felon','plethora','hapless','irate'];
  List<String> list4 = ['pretext','fabricate','adroit','gesticulate','vigilant','avid','cajole','rudimentary','enhance','nuance'];
  List<String> list5 = ['loathe', 'reprimand', 'lackluster', 'caustic', 'wrest','infamous', 'jostle', 'dupe', 'incipient', 'inadvertent'];
  List<String> list6 = ['ominous','tremulous', 'repudiate', 'cessation', 'bristle','euphemism', 'mundane', 'incongruous', 'condolence', 'stipulate'];
  List<String> list7 = ['alacrity', 'disdain', 'belligerent', 'intimidate', 'feint','pugnacious','promulgate','brash','scoff','belittle'];
  List<String> list8 = ['tangible','laceration','castigate','sordid','octogenarian','solace','aspirant','dregs','frenzy','scurrilous'];
  List<String> list9 = ['rampant', 'inane', 'ethics', 'concur', 'clandestine','flagrant', 'admonish', 'duress', 'culprit', 'inexorable'];
  List<String> list10 = ['egregious', 'distraught', 'duplicity', 'acrimonious', 'paucity','elicit', 'pernicious', 'tolerate', 'construe', 'impunity'];
  List<String> list11 = ['affluent', 'feasible', 'discern', 'sally', 'consternation', 'precocious', 'perfunctory', 'chagrin', 'perverse', 'deride'];
  List<String> list12 = ['disparage', 'laudable', 'fiasco', 'masticate', 'eschew', 'quell', 'voluble', 'confidant(e)', 'obsolescence', 'dubious'];
  List<String> list13 = ['implacable', 'paroxysm', 'reprehensible', 'jurisdiction', 'skirmish', 'harass', 'monolithic', 'arbitrary', 'indigent', 'fray'];

  String? selectedWord;
  String? sele;
  String? _pron;
  String? _mean;
  String? _sen;
  String? _imgUrl;


  void Details() {
    String wordy;
    String meaning;
    String sentence;
    String imageUrl;
    if(selectedWord == "voracious"){                          //week1
      wordy = "vuh·ray·shuhs";
      meaning = "desiring or consuming great quantities.";
      sentence = "she's a voracious reader.";
      imageUrl = "https://i.ytimg.com/vi/KZys-b__5mw/maxresdefault.jpg";
    } else if(selectedWord == "indiscriminate"){
      wordy = "in·duh·skri·muh·nuht";
      meaning = "choosing at random without careful selection";
      sentence = "The indiscriminate use of antibiotics can cause problems.";
      imageUrl = "https://www.fortishealthcare.com/blog/wp-content/uploads/2017/03/antibiotics_765x460-600x361.png";
    }else if(selectedWord == "eminent"){
      wordy = "eh·muh·nuhnt";
      meaning = "of high reputation, outstanding";
      sentence = "one of the world's most eminent musician";
      imageUrl = "https://pbs.twimg.com/profile_images/1291476569/Copy__2__of_Eminem_Not_Afraid_Recovery_Wallpaper_55489.jpg";
    }else if(selectedWord == "steeped"){
      wordy = "stiːp";
      meaning = "soaked, drenched, saturated";
      sentence = "My cousin is so steeped in schoolwork that his friends call him a bookworm.";
      imageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg2iMgVh9yd5-ip3fagyVmWW9OAiasJrSAfSApUGdulSe9daESl-VMgVPad6w2UpwWbkM&usqp=CAU";
    } else if(selectedWord == "replete"){
      wordy = "ruh·pleet";
      meaning = "completely filled or supplied with";
      sentence = "The football game was replete with excitement and great plays.";
      imageUrl = "https://o.quizlet.com/AolrLc7b.Vpdy4szfDg3.Q.jpg";
    }else if(selectedWord == "abound"){
      wordy = "uh·bownd";
      meaning = "to exist in great numbers";
      sentence = "The worlds of science-fiction abound with wonders.";
      imageUrl = "https://dxuoddg10rgxw.cloudfront.net/wp-content/uploads/2012/01/17023524/abound.gif";
    }else if(selectedWord == "technology"){
      wordy = "tek·naa·luh·jee";
      meaning = "branch of knowledge dealing with engineering, applied science, etc.";
      sentence = "It will reduce the industry's ability to spend money on new technology.";
      imageUrl = "https://techfitae.com/wp-content/uploads/2021/09/homepage_cloud_416x224.png";
    }else if(selectedWord == "prognosticate"){
      wordy = "prog·no·stuh·kayt";
      meaning = "to predict or foretell a future event";
      sentence = "The mayor refused to prognosticate as to his margin of victory in the election.";
      imageUrl = "https://static9.depositphotos.com/1667027/1145/v/600/depositphotos_11459154-stock-illustration-fortune-teller.jpg";
    }else if(selectedWord == "automaton"){
      wordy = "aw·to·muh·tn";
      meaning = "a robot; a mechanical person";
      sentence = "like an automaton, she walked to the door";
      imageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPbiX-uMxoa9Aq7ZKbiIN6PM5YrNhyMDscRAzoxhD1XdnEWJAVkR_g6Lsc1Uhpyiksx48&usqp=CAU";
    }else if(selectedWord == "matron"){
      wordy = "may·truhn";
      meaning = "an older married woman";
      sentence = "she initiated training for matrons of residential homes";
      imageUrl = "http://3.bp.blogspot.com/-pPy_l3IA3HU/V_30G4n8IxI/AAAAAAAAJ1w/ACBgCGuO0ygkQcMEfYeU5Li2PRdAxMk4QCK4B/s1600/jacques_468x454.jpg";
    }else if(selectedWord == "paradox"){
      wordy = "pa·ruh·doks";
      meaning = "a statement that at first seems to be absurd or self-contradictory but which may in fact turn out to be true";
      sentence = "Herein lies the paradox which is also the deepest truth of our spiritual life.";
      imageUrl = "https://marketing.prowritingaid.com/This-is-a-paradox.png";
    }else if(selectedWord == "realm"){
      wordy = "relm";
      meaning = "special field of something or someone; kingdom";
      sentence = "the realm of applied chemistry";
      imageUrl = "https://i.pinimg.com/564x/16/2b/e4/162be49db7c65bdedec44701cfd0d9a2.jpg";
    }else if(selectedWord == "annals"){
      wordy = "a·nuhlz";
      meaning = "historical records";
      sentence = "the annals of the police courts";
      imageUrl = "https://www.nybooks.com/wp-content/uploads/1983/07/adolf-hitler_1983-07-21.gif";
    }else if(selectedWord == "compound"){
      wordy = "kampaund";
      meaning = "to increase or add to ";
      sentence = "the air smelled like a compound of diesel and petrol fumes";
      imageUrl = "https://img.favpng.com/11/4/18/chemistry-chemical-bond-chemical-substance-chemical-compound-atom-png-favpng-jSh2tVYRKnKB0YzMdZZcmmYPG.jpg";
    }else if(selectedWord == "tinge"){
      wordy = "tinj";
      meaning = "a trace, smattering, or slight degree";
      sentence = "The tinge of blue at the bottom of this dress is so pretty.";
      imageUrl = "https://qph.fs.quoracdn.net/main-qimg-e3f93e48c988ecfad64c808d8cba04e6.webp";
    }
    else if(selectedWord == "badger"){
      wordy = "ba·juh";
      meaning = "to pester, nag, annoy persistently";
      sentence = "Tom had finally badgered her into going";
      imageUrl = "https://dailyvocab.com/wp-content/uploads/2021/05/Badger-1.gif";
    }
    else if(selectedWord == "implore"){
      wordy = "uhm·plaw";
      meaning = "to plead urgently for aid or mercy";
      sentence = "he implored her to change her mind";
      imageUrl = "https://i.pinimg.com/originals/72/56/54/7256541d913c2bfd0d812d9684a65dcb.gif";
    }
    else if(selectedWord == "drudgery"){
      wordy = "druh·juh·ree";
      meaning = "unpleasant, dull, or hard work";
      sentence = "This can make the task seem less like drudgery and is perfect for busy people.";
      imageUrl = "https://i.pinimg.com/originals/51/33/78/5133788e80c189aa816b165aee602994.gif";
    }
    else if(selectedWord == "interminable"){
      wordy = "uhn·tuh·muh·nuh·bl";
      meaning = "unending";
      sentence = "we got bogged down in interminable discussions";
      imageUrl = "https://i.pinimg.com/474x/43/26/61/4326616b99e50074adc8109b48c46c83.jpg";
    }
    else if(selectedWord == "perceive"){
      wordy = "puh·seev";
      meaning = "to understand, know, become aware of";
      sentence = "his mouth fell open as he perceived the truth";
      imageUrl = "https://www.braingymmer.com/img/uploads/perception.png";
    }
    else if(selectedWord == "laconic"){                                              //week2
      wordy = "luh·ko·nuhk";
      meaning = "expressing much in few words";
      sentence = "His laconic reply suggested a lack of interest in the topic";
      imageUrl = "https://wordinfo.info/words/images/laconic-1.jpg";
    }else if(selectedWord == "throng"){
      wordy = "throng";
      meaning = "crowd";
      sentence = "he pushed his way through the throng";
      imageUrl = "https://www.dictionary.com/e/wp-content/uploads/2019/12/Slew_1000x700.jpg";
    }else if(selectedWord == "intrepid"){
      wordy = "in·treh·puhd";
      meaning = "brave,fearless; adventurous";
      sentence = "our intrepid reporter";
      imageUrl = "http://www.wordinfo.info/words/images/intrepid-1.jpg";
    }else if(selectedWord == "accost"){
      wordy = "uh·kost";
      meaning = "to approach and speak to";
      sentence = "reporters accosted him in the street";
      imageUrl = "https://dailyvocab.com/wp-content/uploads/2016/03/Accost.jpg";
    }else if(selectedWord == "reticent"){
      wordy = "reh·tuh·snt";
      meaning = "silent";
      sentence = "she was extremely reticent about her personal affairs";
      imageUrl = "https://www.vocabularytoday.com/wp-content/uploads/2020/08/Reticent.jpg";
    }else if(selectedWord == "furtive"){
      wordy = "fuh·tuhv";
      meaning = "secret, stealthy";
      sentence = "they spent a furtive day together";
      imageUrl = "https://www.vocabularytoday.com/wp-content/uploads/2020/09/Furtive-300x300.jpg";
    }else if(selectedWord == "felon"){
      wordy = "feh·luhn";
      meaning = "a person guilty of a major crime";
      sentence = "the felon undermining hand of dark corruption";
      imageUrl = "https://dailyvocab.com/wp-content/uploads/2020/12/Felon-1.jpg";
    }else if(selectedWord == "plethora"){
      wordy = "pleh·thuh·ruh";
      meaning = "a large or excessive amount of something.";
      sentence = "a plethora of committees and subcommittees";
      imageUrl = "https://pbs.twimg.com/media/EYFjBFjWAAUW79n.jpg";
    }else if(selectedWord == "hapless"){
      wordy = "ha·pluhs";
      meaning = "unfortunate";
      sentence = "the hapless victims of the disaster";
      imageUrl = "https://thumbs.dreamstime.com/b/cartoon-hapless-man-parachute-burning-plane-to-ocean-shark-83521596.jpg";
    }else if(selectedWord == "irate"){
      wordy = "ai·rayt";
      meaning = "angry, incensed";
      sentence = "a barrage of irate letters";
      imageUrl = "https://m-cdn.phonearena.com/images/article/44857-1200/Classic-Angry-Birds-for-iPhone-and-Android-gets-new-episode.jpg";
    }
    else if(selectedWord == "pretext"){
      wordy = "pree·tekst";
      meaning = "an excuse";
      sentence = "The rebels had the perfect pretext for making their move";
      imageUrl = "https://image.shutterstock.com/image-illustration/man-late-appointment-flat-style-260nw-468267893.jpg";
    }else if(selectedWord == "fabricate"){
      wordy = "fa·bruh·kayt";
      meaning = "to lie; to construct";
      sentence = "Officers fabricated evidence.";
      imageUrl = "https://learnbookme.files.wordpress.com/2020/04/fabricate.gif";
    }else if(selectedWord == "adroit"){
      wordy = "uh·droyt";
      meaning = "clever or skilful.";
      sentence = "He was adroit at tax avoidance.";
      imageUrl = "https://assets.wordgenius.com/wordgenius/Word+of+The+Day+Images/Adroit.jpg";
    }else if(selectedWord == "gesticulate"){
      wordy = "jeh·sti·kyuh·layt";
      meaning = "move the arms energetically";
      sentence = "They were shouting and gesticulating frantically at drivers who did not slow down.";
      imageUrl = "https://as1.ftcdn.net/jpg/01/02/14/06/500_F_102140620_6DzTl1avUyWEZrVK7mPMwJOnAMGTGmoC.jpg";
    }else if(selectedWord == "vigilant"){
      wordy = "vi·juh·luhnt";
      meaning = "watchful";
      sentence = "You will have to be vigilant in your work in order to earn an A in this class.";
      imageUrl = "https://us.123rf.com/450wm/vector2011/vector20111704/vector2011170400022/75642503-buen-guardia-de-seguridad-est%C3%A1-vestido-con-uniforme.jpg?ver=6";
    }else if(selectedWord == "avid"){
      wordy = "a·vuhd";
      meaning = "eager,keen, enthusiastic, passionate";
      sentence = "an avid reader of science fiction";
      imageUrl = "https://www.wikihow.com/images/9/9f/Become-an-Avid-Reader-Step-20.jpg";
    }else if(selectedWord == "cajole"){
      wordy = "kuh·jowl";
      meaning = "coax, persuade";
      sentence = "He hoped to cajole her into selling the house";
      imageUrl = "https://phocab-photos.s3.amazonaws.com/httpraytownonlinecomwp-contentuploads201012cajolejpg.jpg";
    }else if(selectedWord == "rudimentary"){
      wordy = "roo·duh·men·tuh·ree";
      meaning = "elementary, basic, early";
      sentence = "He received a rudimentary education";
      imageUrl = "https://s3.amazonaws.com/lowres.cartoonstock.com/technology-generation_gap-cavemen-abstract_thought-evolves-evolutions-kmhn756_low.jpg";
    }else if(selectedWord == "enhance"){
      wordy = "uhn·haans";
      meaning = "intensify, heighten,";
      sentence = "His refusal does nothing to enhance his reputation";
      imageUrl = "https://dxuoddg10rgxw.cloudfront.net/wp-content/uploads/2012/02/17023504/enhance.jpg";
    }else if(selectedWord == "nuance"){
      wordy = "nyoo·aans";
      meaning = "slight variation in meaning, tone, etc.";
      sentence = "The effect of the music is nuanced by the social situation of listeners";
      imageUrl = "https://slidetodoc.com/presentation_image_h/29b4765e36d7722ce80b68cb4cc07b4a/image-19.jpg";
    }else if(selectedWord == "loathe"){                                                                           //week3
      wordy = "lowth";
      meaning = "to hate";
      sentence = "If there's one thing I loathe,the coach said, it's a quitter.";
      imageUrl = "https://www.grammar-monster.com/easily_confused/pics/loath_or_loathe.png";
    }else if(selectedWord == "reprimand"){
      wordy = "reh·pruh·maand";
      meaning = "to show sharp disapproval";
      sentence = "He had good reason to reprimand us at half-time,because the scoreboard revealed that we were losing.";
      imageUrl = "https://thumbs.dreamstime.com/b/reprimanded-boss-25265430.jpg";
    }else if(selectedWord == "lackluster"){
      wordy = "lak·luh·stuh";
      meaning = "dull, uninspired, colourless, humdrum";
      sentence = "Our lackluster performance indicated to him that we had forgotten the rudimentary* aspects of basketball.";
      imageUrl = "https://english-grammar.biz/dictionary/img/wlibrary/l/6020680fbc44c1.77273668.jpg";
    }else if(selectedWord == "caustic"){
      wordy = "kaw·stuhk";
      meaning = "sarcastic, biting";
      sentence = "The players were making caustic comments about the refereeing";
      imageUrl = "https://www.nealumphred.com/wp-content/uploads/Sarcasm_BigBangTheory_caricature_1500.jpg";
    }else if(selectedWord == "wrest"){
      wordy = "rest";
      meaning = "take by force, grab";
      sentence = "We dashed out,determined to wrest control of the game from our rivals";
      imageUrl = "https://learnodo-newtonic.com/wp-content/uploads/2013/01/Wrest.jpg";
    }else if(selectedWord == "infamous"){
      wordy = "in·fuh·muhs";
      meaning = "having a bad reputation";
      sentence = "The infamous pickpocket, was back at work, and every detective had to be especially vigilant.";
      imageUrl = "https://wl-brightside.cf.tsp.li/resize/728x/jpg/16b/75a/6910b2570dbe2ff966fb9b7297.jpg";
    }else if(selectedWord == "jostle"){
      wordy = "jo·sl";
      meaning = "to shove hard, push";
      sentence = "He was jostled by passengers rushing for the gates";
      imageUrl = "https://i.ytimg.com/vi/cekY9yvdBxU/maxresdefault.jpg";
    }else if(selectedWord == "dupe"){
      wordy = "joop";
      meaning = "a person easily tricked";
      sentence = "The newspaper was duped into publishing an untrue story";
      imageUrl = "https://st3.depositphotos.com/1636517/14529/i/600/depositphotos_145293661-stock-photo-feedback-from-disloyal-coworker.jpg";
    }else if(selectedWord == "incipient"){
      wordy = "uhn·si·pee·uhnt";
      meaning = "just beginning to exist";
      sentence = "We seemed more like friends than incipient lovers";
      imageUrl = "http://www.wordinfo.info/words/images/incipient-1.jpg";
    }else if(selectedWord == "inadvertent"){
      wordy = "in·uhd·vuh·tnt";
      meaning = "heedless, not attentive,unintentional, unintended, accidental";
      sentence = "An inadvertent administrative error occurred that resulted in an overpayment.";
      imageUrl = "https://st.depositphotos.com/1056223/2674/v/600/depositphotos_26748209-stock-illustration-hit-a-rock.jpg";
    }else if(selectedWord == "ominous"){
      wordy = "o·muh·nuhs";
      meaning = "threatening, sinister";
      sentence = "There was an ominous silence when the jittery defendant rose in court.";
      imageUrl = "https://mammothmemory.net/images/user/base/English/vocab/remember-ominous-in-english-vocab.34c4e4b.jpg";
    }else if(selectedWord == "tremulous"){
      wordy = "treh·myuh·luhs";
      meaning = "quivering";
      sentence = "He gave a tremulous smile";
      imageUrl = "https://images.gr-assets.com/hostedimages/1380222758ra/280549.gif";
    }else if(selectedWord == "repudiate"){
      wordy = "ruh·pyoo·dee·ayt";
      meaning = "to reject, decline";
      sentence = "The minister repudiated allegations of human rights abuses";
      imageUrl = "https://i.ytimg.com/vi/9U04z2RD6tk/maxresdefault.jpg";
    }else if(selectedWord == "cessation"){
      wordy = "seh·say·shn";
      meaning = "a stopping, ending, termination";
      sentence = "The audience began to buzz excitedly until the judge demanded a cessation of the noise.";
      imageUrl = "https://image.shutterstock.com/image-vector/vector-cartoon-illustration-stop-smoking-260nw-343858082.jpg";
    }else if(selectedWord == "bristle"){
      wordy = "bri·sl";
      meaning = "stiffen with fear or anger";
      sentence = "The hair on the back of his neck bristled";
      imageUrl = "https://thumbs.dreamstime.com/b/bristle-cat-sketch-vector-illustration-reared-scared-engraving-t-shirt-apparel-print-design-scratch-board-imitation-black-228046017.jpg";
    }else if(selectedWord == "euphemism"){
      wordy = "yoo·fuh·mi·zm";
      meaning = "a less offensive term";
      sentence = "My cousin refers to himself as a ''sanitary engineera'' euphemism for garbage collector.";
      imageUrl = "https://unravellingmag.com/wp-content/uploads/2015/11/03-Catherine.jpg";
    }else if(selectedWord == "mundane"){
      wordy = "muhn·dayn";
      meaning = "worldly, humdrum, dull";
      sentence = "There are any number of people who try to find more respectable or glamorous titles for the mundane jobs they hold.";
      imageUrl = "https://thumbs.dreamstime.com/b/cartoon-tired-man-businessman-holding-sign-boring-text-stick-drawing-conceptual-illustration-exhausted-113133568.jpg";
    }else if(selectedWord == "incongruous"){
      wordy = "uhn·kong·groo·uhs";
      meaning = "inappropriate, unsuited";
      sentence = "The duffel coat looked incongruous with the black dress she wore underneath";
      imageUrl = "https://mammothmemory.net/images/user/base/English/71%20-%20incongruous.jpg";
    }else if(selectedWord == "condolence"){
      wordy = "kuhn·dow·luhns";
      meaning = "pity, sympathy";
      sentence = "We offer our sincere condolences to his widow";
      imageUrl = "https://s3.amazonaws.com/lowres.cartoonstock.com/business-commerce-condolence_card-greeting_card-hostile_takeover-merger-corporate_culture-dcrn1215_low.jpg";
    }else if(selectedWord == "stipulate"){
      wordy = "Stip·yuh·layt";
      meaning = "to specify a condition,demand";
      sentence = "He stipulated certain conditions before their marriage";
      imageUrl = "http://www.wordinfo.info/words/images/stipulation-1.jpg";
    }else if(selectedWord == "alacrity"){             //week4
      wordy = "uh·la·kruh·tee";
      meaning = " briskness, lively action";
      sentence = "she accepted the invitation with alacrity";
      imageUrl = "https://wordinfo.info/words/images/Alacrity-color-1.jpg";
    }else if(selectedWord == "disdain"){
      wordy = "duhs·dayn";
      meaning = "contempt";
      sentence = "Her upper lip curled in disdain";
      imageUrl = "https://image.shutterstock.com/image-photo/young-beautiful-arrogant-moody-mexican-260nw-574519462.jpg";
    }else if(selectedWord == "belligerent"){
      wordy = "buh·li·jr·uhnt";
      meaning = "warlike";
      sentence = "The mood at the meeting was belligerent";
      imageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXWcbCe8If1jLgSocYZP3EafklYAWZWzRF4nWHUVPzt8oBYUhqXmchHLxRb6wGctqBKQY&usqp=CAU";
    }else if(selectedWord == "intimidate"){
      wordy = "uhn·ti·muh·dayt";
      meaning = "to overawe, harass";
      sentence = "The forts are designed to intimidate the population";
      imageUrl = "https://ulmhawkeyeonline.com/wp-content/uploads/2019/04/harrass-2-707x900.png";
    }else if(selectedWord == "feint"){
      wordy = "faynt";
      meaning = "a false attack";
      sentence = "a brief feint at the opponent's face";
      imageUrl = "https://www.rookieroad.com/img/basketball/basketball-feint.png";
    }else if(selectedWord == "pugnacious"){
      wordy = "puhg·nay·shuhs";
      meaning = "quarrelsome";
      sentence = "The pugnacious K.O. Mullins demanded a rematch";
      imageUrl = "https://www.holy-mackerel.co.uk/wp-content/uploads/2017/08/HI-res-files-5.jpg";
    }else if(selectedWord == "promulgate"){
      wordy = "praa·muhl·gayt";
      meaning = "to make known officially";
      sentence = "These objectives have to be promulgated within the organization.";
      imageUrl = "https://st2.depositphotos.com/20582790/50969/v/600/depositphotos_509696092-stock-illustration-young-man-handsome-shouting-using.jpg";
    }else if(selectedWord == "brash"){
      wordy = "brash";
      meaning = "impudent, self-confident";
      sentence = "he was brash, cocky, and arrogant";
      imageUrl = "https://assets.realclear.com/images/44/447661_5_.jpg";
    }else if(selectedWord == "scoff"){
      wordy = "skaaf";
      meaning = "to sneer at";
      sentence = "Patrick professed to scoff at soppy love scenes in films";
      imageUrl = "https://image.shutterstock.com/image-vector/children-laugh-redhaired-boy-who-260nw-1525727813.jpg";
    }else if(selectedWord == "belittle"){
      wordy = "bi·li·tl";
      meaning = "to make seem less important";
      sentence = "She belittled Amy's riding skills whenever she could.";
      imageUrl = "https://image.shutterstock.com/image-vector/vector-illustration-business-professional-kneeling-260nw-411060025.jpg";
    }else if(selectedWord == "tangible"){
      wordy = "tan·juh·bl";
      meaning = "having actual form";
      sentence = "Some people enjoy tangible gifts, while others would rather time spent with friends or a phone call.";
      imageUrl = "https://i.ytimg.com/vi/QkKvH2qhRWA/maxresdefault.jpg";
    }else if(selectedWord == "laceration"){
      wordy = "la·sr·ay·shn";
      meaning = "jagged wound";
      sentence = "He suffered lacerations to his head and face.";
      imageUrl = "https://d1avenlh0i1xmr.cloudfront.net/f9941a49-5d6e-4926-8557-ad70f9af8cb2/laceration----teachoo.png";
    }else if(selectedWord == "castigate"){
      wordy = "ka·stuh·gayt";
      meaning = "to correct by punishing";
      sentence = "He was castigated for not setting a good example.";
      imageUrl = "https://i.ytimg.com/vi/HOMML7IwdK4/maxresdefault.jpg";
    }else if(selectedWord == "sordid"){
      wordy = "sor·duhd";
      meaning = "dirty, base";
      sentence = "the overcrowded housing conditions were sordid and degrading.";
      imageUrl = "https://i.ytimg.com/vi/6fLGjruOmys/maxresdefault.jpg";
    }else if(selectedWord == "octogenarian"){
      wordy = "aak·tuh·juh·neh·ree·uhn";
      meaning = "person in his or her eighties";
      sentence = "She is very active for an octogenarian.";
      imageUrl = "https://images-na.ssl-images-amazon.com/images/I/41wYa1sYSrL._SX321_BO1,204,203,200_.jpg";
    }else if(selectedWord == "solace"){
      wordy = "saa·luhs";
      meaning = "easing of grief";
      sentence = "The soundlessness of nature impressed and solaced her.";
      imageUrl = "https://anglicanjournal.com/wp-content/uploads/sites/3/2015/12/mkb_mentalhealthpeople.jpg";
    }else if(selectedWord == "aspirant"){
      wordy = "a·spr·uhnt";
      meaning = "candidate for high position";
      sentence = "an aspirant to the throne";
      imageUrl = "https://www.ssbcrack.com/wp-content/uploads/2017/08/DEFENCE-ASPIRANTS.jpg";
    }else if(selectedWord == "dregs"){
      wordy = "dregz";
      meaning = "most worthless part";
      sentence = "He will consume the cup to the bitter dregs .";
      imageUrl = "https://i0.wp.com/farm4.static.flickr.com/3012/2977408126_ebe9367483.jpg";
    }else if(selectedWord == "frenzy"){
      wordy = "fren·zee";
      meaning = "wild fit";
      sentence = "He would work himself into an alcoholic frenzy";
      imageUrl = "https://www.toonpool.com/user/589/files/feeding_frenzy_3465265.jpg";
    }else if(selectedWord == "scurrilous"){
      wordy = "skur·uh·luhs";
      meaning = "coarse, abusive";
      sentence = "A scurrilous attack on his integrity.";
      imageUrl = "https://img.tfd.com/wn/73/17F05D-scurrilous.jpg";
    }else if(selectedWord == "rampant"){                //week5
      wordy = "ram·pnt";
      meaning = "going unchecked, widespread";
      sentence = "Cholera was rampant in the district.";
      imageUrl = "https://i.ytimg.com/vi/p4GvVPMvSok/movieposter.jpg";
    }else if(selectedWord == "inane"){
      wordy = "uh·nayn";
      meaning = "foolish";
      sentence = "The little boy always got in trouble for acting inane in class instead of staying on topic.";
      imageUrl = "https://st.depositphotos.com/1994497/3687/v/600/depositphotos_36878485-stock-illustration-dangerous-drugs.jpg";
    }else if(selectedWord == "ethics"){
      wordy = "eh·thuhks";
      meaning = "code of principles";
      sentence = "The ethics of journalism are much debated.";
      imageUrl = "https://www.michiganstateuniversityonline.com/wp-content/uploads/sites/3/2018/12/common-ethical-issues-in-the-workplace.jpg?w=715&h=375&crop=1";
    }else if(selectedWord == "concur"){
      wordy = "kuhng·kuh";
      meaning = "agree";
      sentence = "The authors concurred with the majority";
      imageUrl = "https://image1.slideserve.com/2126487/concur-n.jpg";
    }else if(selectedWord == "clandestine"){
      wordy = "klan·deh·stn";
      meaning = "secret, undercover";
      sentence = "Far from being a clandestine activity, the cheating was open and obvious.";
      imageUrl = "https://dailyvocab.com/wp-content/uploads/2013/07/clandestine.jpg";
    }else if(selectedWord == "flagrant"){
      wordy = "flay·gruhnt";
      meaning = "outrageous, glaringly bad";
      sentence = "Our new principal, determined to do something about the flagrant cheating at our high school.";
      imageUrl = "http://www.wordinfo.info/words/images/flagrant-1.jpg";
    }else if(selectedWord == "admonish"){
      wordy = "uhd·mo·nuhsh";
      meaning = "to warn, to reprove";
      sentence = "He issued bulletins and began to admonish those teachers who did not proctor alertly.";
      imageUrl = "https://image.shutterstock.com/image-photo/business-man-boss-raised-index-260nw-1828826702.jpg";
    }else if(selectedWord == "duress"){
      wordy = "dyuor·res";
      meaning = "compulsion, force";
      sentence = "Confessions extracted under duress";
      imageUrl = "https://study.com/cimages/videopreview/videopreview-full/bfqy0fxzv1.jpg";
    }else if(selectedWord == "culprit"){
      wordy = "kuhl·pruht";
      meaning = "the guilty person";
      sentence = "Low-level ozone pollution is the real culprit.";
      imageUrl = "https://us.123rf.com/450wm/unitonevector/unitonevector1904/unitonevector190403153/123089256-prisoner-behind-metal-bars-vector-illustration-handcuffed-jailed-man-standing-in-cell-cage-cartoon-c.jpg?ver=6";
    }else if(selectedWord == "inexorable"){
      wordy = "uhn·ek·suh·ruh·bl";
      meaning = "impossible to stop or prevent";
      sentence = "Mr.Dorsey's inexorable campaign against the wrong-doers seemed to be paying off.";
      imageUrl = "https://dailyvocab.com/wp-content/uploads/2013/10/inexorable-implacable.jpg";
    }else if(selectedWord == "egregious"){
      wordy = "uh·gree·juhs";
      meaning = "remarkably bad";
      sentence = "He made the egregious mistake of getting caught cheating on a midterm exam.";
      imageUrl = "https://dailyvocab.com/wp-content/uploads/2013/11/EGREGIOUSS.jpg";
    }else if(selectedWord == "distraught"){
      wordy = "duh·strawt";
      meaning = "mentally confused, crazed";
      sentence = "Distraught parents looking for a runaway teenager.";
      imageUrl = "https://thumbs.dreamstime.com/z/english-opposite-word-ecstatic-distraught-illustration-130452621.jpg";
    }else if(selectedWord == "duplicity"){
      wordy = "dyoo·pli·suh·tee";
      meaning = "cunning, trickery";
      sentence = "He was accused of duplicity and branded a traitor.";
      imageUrl = "https://st3.depositphotos.com/1796560/14356/v/600/depositphotos_143567053-stock-illustration-icon-duplicity-hiding-their-emotions.jpg";
    }else if(selectedWord == "acrimonious"){
      wordy = "a·kruh·mow·nee·uhs";
      meaning = "bitter";
      sentence = "An acrimonious dispute about wages.";
      imageUrl = "https://slideplayer.com/slide/13139791/79/images/3/acrimonious%3A+adj.+definition%3A+caustic%2C+stinging%2C+or+bitter+in.jpg";
    }else if(selectedWord == "paucity"){
      wordy = "paw·suh·tee";
      meaning = "the presence of something in only small or insufficient quantities or amounts,scarcity,shortage";
      sentence = "A paucity of information.";
      imageUrl = "https://slideplayer.com/slide/16268462/95/images/9/paucity+Having+the+wrong+tools+hinders+a+job+as+much+as+having+a+paucity+of+tools..jpg";
    }else if(selectedWord == "elicit"){
      wordy = "uh·li·suht";
      meaning = "evoke or draw out (a reaction, answer, or fact) from someone.";
      sentence = "I tried to elicit a smile from Joanna.";
      imageUrl = "https://149455152.v2.pressablecdn.com/wp-content/uploads/2015/02/elicit-298x300.jpg";
    }else if(selectedWord == "pernicious"){
      wordy = "puh·ni·shuhs";
      meaning = "harmful, causing injury";
      sentence = "The pernicious influences of the mass media.";
      imageUrl = "https://dailyvocab.com/wp-content/uploads/2016/08/Pernicious.jpg";
    }else if(selectedWord == "tolerate"){
      wordy = "to·luh·rayt";
      meaning = "to put up with, to bear";
      sentence = "A regime unwilling to tolerate dissent.";
      imageUrl = "https://cdn.christianpost.com/files/original/thumbnail/12/39/123909.jpg";
    }else if(selectedWord == "construe"){
      wordy = "kuhn·stroo";
      meaning = "to make a deduction, to infer,understand,analyse,explain";
      sentence = "Both verbs can be construed with either infinitive";
      imageUrl = "https://lh3.googleusercontent.com/proxy/SkM2-jgfj-aG9DHhMyQ7Cdo_-dWetdeWnB6YhO6Qrz1xQafpYjy0IgKKJ37vJ8QiCmzFo-dxAJXbjq6SlNgYhai61GuLS819jjc";
    }else if(selectedWord == "impunity"){
      wordy = "uhm·pyoo·nuh·tee";
      meaning = "freedom from punishment";
      sentence = "The impunity enjoyed by military officers implicated in civilian killings.";
      imageUrl = "https://www.sunstar.com.ph/uploads/imported_images/files/field/image/article/editorial_1263.jpg";
    }else if(selectedWord == "affluent"){                                       //week6
      wordy = "a·floo·uhnt";
      meaning = "rich";
      sentence = "The affluent societies of the western world.";
      imageUrl = "https://www.bragitoff.com/wp-content/uploads/2015/06/affluent.jpg";
    }else if(selectedWord == "feasible"){
      wordy = "fee·zuh·bl";
      meaning = "possible";
      sentence = "The most feasible explanation.";
      imageUrl = "https://thumbs.dreamstime.com/b/conceptual-hand-writing-showing-everything-possible-business-photo-text-any-outcome-could-occur-anything-can-happen-crumbling-160891027.jpg";
    }else if(selectedWord == "discern"){
      wordy = "duh·suhn";
      meaning = "perceive,recognize or find out.";
      sentence = "I can discern no difference between the two policies.";
      imageUrl = "https://mammothmemory.net/images/user/base/English/106.%20Discern.jpg";
    }else if(selectedWord == "sally"){
      wordy = "sa·lee";
      meaning = "suddenly rush forth, charge";
      sentence = "The garrison there made a sally against us.";
      imageUrl = "https://c.tenor.com/-1l5Enh7QZAAAAAC/sword-attack.gif";
    }else if(selectedWord == "consternation"){
      wordy = "kon·stuh·nay·shn";
      meaning = "a feeling of anxiety or dismay";
      sentence = "To the consternation of the umbrella manufacturers, it has been enjoying a brisk sale.";
      imageUrl = "https://pearlsofprofundity.files.wordpress.com/2014/05/fear-4a.jpg";
    }else if(selectedWord == "precocious"){
      wordy = "pruh·kow·shuhs";
      meaning = "reaching maturity early";
      sentence = "A precocious talent for computing.";
      imageUrl = "https://mammothmemory.net/images/user/base/English/111%20-%20Precocious.jpg";
    }else if(selectedWord == "perfunctory"){
      wordy = "puh·fuhngk·tuh·ree";
      meaning = "done without care, superficial";
      sentence = "He gave a perfunctory nod.";
      imageUrl = "https://mammothmemory.net/images/user/base/English/167-perfunctory.jpg";
    }else if(selectedWord == "chagrin"){
      wordy = "sha·gruhn";
      meaning = "feeling of disappointment, humiliation";
      sentence = "He was chagrined when his friend poured scorn on him.";
      imageUrl = "https://www.bragitoff.com/wp-content/uploads/2015/06/chagrin.jpg";
    }else if(selectedWord == "perverse"){
      wordy = "puh·vuhs";
      meaning = "contrary, persisting in error";
      sentence = "Kate's perverse decision not to cooperate held good.";
      imageUrl = "https://mammothmemory.net/images/user/base/English/vocab/remember-perverse-in-a-sentence.87d7737.jpg";
    }else if(selectedWord == "deride"){
      wordy = "duh·ride";
      meaning = " to ridicule, scoff at";
      sentence = "The decision was derided by environmentalists.";
      imageUrl = "https://www.tekportal.net/wp-content/uploads/2019/02/deride-0403.jpg";
    }else if(selectedWord == "disparage"){
      wordy = "duh·spae·ruhj";
      meaning = "to discredit, belittle";
      sentence = "He never missed an opportunity to disparage his competitors.";
      imageUrl = "https://dailyvocab.com/wp-content/uploads/2020/03/disparage.jpg";
    }else if(selectedWord == "laudable"){
      wordy = "law·duh·bl";
      meaning = "praiseworthy,deserving";
      sentence = "Laudable though the aim might be, the results have been criticized.";
      imageUrl = "http://www.clipartoday.com/_thumbs/005/001/Business_Occupations/Military/Officers/military_soldier_92462_tnb.png";
    }else if(selectedWord == "fiasco"){
      wordy = "fee·ask·oh";
      meaning = "complete failure";
      sentence = "His plans turned into a fiasco.";
      imageUrl = "https://i.pinimg.com/originals/e5/ca/14/e5ca14af5f2db3cd7a6fa121fa1206d3.jpg";
    }else if(selectedWord == "masticate"){
      wordy = "ma·stuh·kayt";
      meaning = "to chew up";
      sentence = "Dentition affects how well food is masticated and absorbed.";
      imageUrl = "https://lh3.googleusercontent.com/proxy/IM9Iq3GRIzbKUGgPIpEhBd_mXJDVeHwKUznqndOUPzYEdeaSJnqS4boLIPeooAgpsEWrT8iRQaJmMFd1HZyBEssb-7L3fJ0OKNxgcopdQOJA";
    }else if(selectedWord == "eschew"){
      wordy = "uhs·choo";
      meaning = "avoid";
      sentence = "He appealed to the crowd to eschew violence.";
      imageUrl = "https://img.youtube.com/vi/rMc0aYV91wg/hqdefault.jpg";
    }else if(selectedWord == "quell"){
      wordy = "kwel";
      meaning = "put an end to";
      sentence = "Extra police were called to quell the disturbance.";
      imageUrl = "http://www.wordinfo.info/words/images/quell-1.jpg";
    }else if(selectedWord == "voluble"){
      wordy = "vo·lyoo·bl";
      meaning = "talkative";
      sentence = "A voluble game-show host.";
      imageUrl = "https://i.ytimg.com/vi/Hk59jFeaW-o/maxresdefault.jpg";
    }else if(selectedWord == "confidant(e)"){
      wordy = "kon·fuh·dant";
      meaning = "one to whom you confide your secrets";
      sentence = "A close confidante of the princess.";
      imageUrl = "https://www.grammar-monster.com/easily_confused/pics/confidant_confidante_or_confident.png";
    }else if(selectedWord == "obsolescence"){
      wordy = "ob·suh·leh·sns";
      meaning = "process of wearing out";
      sentence = "Computers are infamous for their rapid obsolescence.";
      imageUrl = "https://dxuoddg10rgxw.cloudfront.net/wp-content/uploads/2013/01/17022800/Obsolescence.jpg";
    }else if(selectedWord == "dubious"){
      wordy = "joo·bee·uhs";
      meaning = "doubtful";
      sentence = "I was rather dubious about the whole idea.";
      imageUrl = "https://i.ytimg.com/vi/ilALXdSrMv0/maxresdefault.jpg";
    }else if(selectedWord == "implacable"){                                                 //week7
      wordy = "uhm·pla·kuh·bl";
      meaning = "cannot be pacified, inexorable, unforgiving";
      sentence = "He was an implacable enemy of Ted's.";
      imageUrl = "https://avatars.mds.yandex.net/get-zen_doc/1362956/pub_5ae36e273dceb76be76eb99a_5ae38070f03173ba38d055a9/scale_1200";
    }else if(selectedWord == "paroxysm"){
      wordy = "pa·ruhk·si·zm";
      meaning = "a fit, sudden outburst or attack";
      sentence = "He exploded in a paroxysm of rage.";
      imageUrl = "https://slideplayer.com/slide/9284906/28/images/12/PAROXYSM+Definition%3A+%28n.%29+a+sudden+outburst%3B+a+spasm%2C+convulsion.jpg";
    }else if(selectedWord == "reprehensible"){
      wordy = "reh·pruh·hen·suh·bl";
      meaning = "worthy of blame";
      sentence = "Mr. Cramer said the violence by anti-government protestors was reprehensible.";
      imageUrl = "https://i.pinimg.com/originals/63/fd/cc/63fdccd0fbb7adf6f28cb62daca5d28b.jpg";
    }else if(selectedWord == "jurisdiction"){
      wordy = "juor·ruhs·dik·shn";
      meaning = "power, range of authority";
      sentence = "The British police have no jurisdiction over foreign bank accounts. ";
      imageUrl = "https://dxuoddg10rgxw.cloudfront.net/wp-content/uploads/2012/05/17023328/jurisdiction.jpg";
    }else if(selectedWord == "skirmish"){
      wordy = "skuh·muhsh";
      meaning = "small fight, brief encounter";
      sentence = "Border skirmishes between India and Pakistan were common.";
      imageUrl = "https://slideplayer.com/slide/15034633/91/images/8/Skirmish.jpg";
    }else if(selectedWord == "harass"){
      wordy = "huh·ras";
      meaning = "to trouble, torment, badger";
      sentence = "A celebrity routinely harassed by the paparazzi.";
      imageUrl = "http://www.duhaime.org/Portals/duhaime/images/Workplace-Harrassment.jpg";
    }else if(selectedWord == "monolithic"){
      wordy = "mo·nuh·li·thuhk";
      meaning = "massively solid";
      sentence = "A monolithic concrete building.";
      imageUrl = "https://dxuoddg10rgxw.cloudfront.net/wp-content/uploads/2012/05/17023322/monolithic.jpg";
    }else if(selectedWord == "arbitrary"){
      wordy = "aa·buh·truh·ree";
      meaning = "based on whim, dictatorial,random";
      sentence = "Arbitrary arrests were common.";
      imageUrl = "https://dxuoddg10rgxw.cloudfront.net/wp-content/uploads/2012/05/17023344/arbitrary.jpg";
    }else if(selectedWord == "indigent"){
      wordy = "in·duh·jnt";
      meaning = "poor, needy";
      sentence = "Medical professionals should be permitted to provide free healthcare to indigent people.";
      imageUrl = "https://phocab-photos.s3.amazonaws.com/httpwwwyourdictionarycomimagesdefinitionslgindigentjpg.jpg";
    }else if(selectedWord == "fray"){
      wordy = "fray";
      meaning = "a fight";
      sentence = "Today he entered the fray on the side of the moderates.";
      imageUrl = "https://dxuoddg10rgxw.cloudfront.net/wp-content/uploads/2012/05/17023333/fray.jpg";
    }
    else{
      wordy = "";
      meaning = "";
      sentence = "";
      imageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG3oOlEfMU-u0OxQ-5H6TyRoQy8JfkMN2U3Q&usqp=CAU";
    }

      _pron = wordy;
      _mean = meaning;
      _sen = sentence;
      _imgUrl = imageUrl;



  }


}




