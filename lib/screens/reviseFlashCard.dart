import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:gre_vocab/model/Flashcard.dart';
import 'package:gre_vocab/model/FlashcardBackView.dart';
import 'package:gre_vocab/model/FlashcardView.dart';


class reviseFlashcard extends StatefulWidget {
  const reviseFlashcard({Key? key}) : super(key: key);


  @override
  _reviseFlashcardState createState() => _reviseFlashcardState();
}

class _reviseFlashcardState extends State<reviseFlashcard> {

  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('FlashCard'),
          backgroundColor: Colors.orange,),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 350,
                    height: 450,
                    child: FlipCard(
                      key: cardKey,
                      front: FlashcardView(text: _flashcards[_currIndex].question),
                      back: FlashcardBackView(
                        meaning: _flashcards[_currIndex].meaning,
                        sentence: _flashcards[_currIndex].sentence, imgUrl: _flashcards[_currIndex].imgUrl,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlineButton.icon(
                      onPressed: previousCard,
                      icon: Icon(Icons.chevron_left),
                      label: Text('Prev')),
                  OutlineButton.icon(
                      onPressed: nextCard,
                      icon: Icon(Icons.chevron_right),
                      label: Text('Next')),
                ],
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.orange,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  contentPadding: EdgeInsets.all(10),
                ),
                dropdownColor: Colors.orange,
                iconEnabledColor: Colors.white,
                isExpanded: true,
                hint: Text("Click to change list",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                value: selectedList,
                items: lists.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),),
                  );
                }).toList(),
                onChanged: (list) {
                  Random rnd = Random();
                  int min = 0;
                  int max = 2;

                  if (!cardKey.currentState!.isFront) {
                    cardKey.currentState!.toggleCard();
                  }

                  if (list == 'List 1') {
                    words = _flashcards1;
                    _currIndex = rnd.nextInt(max - min);
                  } else if (list == 'List 2') {
                    words = _flashcards2;
                    _currIndex = rnd.nextInt(max - min);
                  }else if (list == 'List 3') {
                    words = _flashcards3;
                    _currIndex = rnd.nextInt(max - min);

                  }else if (list == 'List 4') {
                    words = _flashcards4;
                    _currIndex = rnd.nextInt(max - min);

                  }else if (list == 'List 5') {
                    words = _flashcards5;
                    _currIndex = rnd.nextInt(max - min);

                  }else if (list == 'List 6') {
                    words = _flashcards6;
                    _currIndex = rnd.nextInt(max - min);

                  }else if (list == 'List 7') {
                    words = _flashcards7;
                    _currIndex = rnd.nextInt(max - min);

                  }else if (list == 'List 8') {
                    words = _flashcards8;
                    _currIndex = rnd.nextInt(max - min);

                  }else if (list == 'List 9') {
                    words = _flashcards9;
                    _currIndex = rnd.nextInt(max - min);

                  }else if (list == 'List 10') {
                    words = _flashcards10;
                    _currIndex = rnd.nextInt(max - min);

                  }else if (list == 'List 11') {
                    words = _flashcards11;
                    _currIndex = rnd.nextInt(max - min);

                  }else if (list == 'List 12') {
                    words = _flashcards12;
                    _currIndex = rnd.nextInt(max - min);

                  }else if (list == 'List 13') {
                    words = _flashcards13;
                    _currIndex = rnd.nextInt(max - min);

                  } else {
                    words= [];
                  }
                  setState(() {
                    selectedList = list;
                    _flashcards = words;
                  });
                },
              ),
            ),
          ),
        );
  }

  String? selectedList;
  String? selectedWord;
  List<Flashcard> words = [];
  List<String> lists = ['List 1', 'List 2','List 3','List 4', 'List 5','List 6','List 7', 'List 8','List 9', 'List 10', 'List 11', 'List 12', 'List 13'];

  List<Flashcard> _flashcards = [];
  @override
  void initState() {
    _flashcards = _flashcards1;
    super.initState();
  }


  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  void nextCard() {
    setState(() {
      if(cardKey.currentState != null) {
        if (!cardKey.currentState!.isFront) {
          cardKey.currentState!.toggleCard();
        }else{
          _currIndex = (_currIndex + 1 < _flashcards.length) ? _currIndex + 1 : 0;
        }
      }
    });
  }

  void previousCard() {
    setState(() {
      if(cardKey.currentState != null) {
        if (!cardKey.currentState!.isFront) {
          cardKey.currentState!.toggleCard();
        }else{
          _currIndex = (_currIndex -1 >= 0) ? _currIndex - 1 : _flashcards.length - 1;
        }
      }
    });

  }







List<Flashcard> _flashcards1 = [
    Flashcard(question: "Varocious",
        meaning: "desiring or consuming great quantities",
        sentence: "she's a voracious reader.",
        imgUrl: 'https://i.ytimg.com/vi/KZys-b__5mw/maxresdefault.jpg'),
    Flashcard(question: "indiscriminate",
        meaning: "choosing at random without careful selection",
        sentence: "the indiscriminate use of antibiotics can cause problems ",
        imgUrl: 'https://www.fortishealthcare.com/blog/wp-content/uploads/2017/03/antibiotics_765x460-600x361.png'),
    Flashcard(question: "eminent",
        meaning: "of high reputation, outstanding",
        sentence: "one of the world's most eminent musician",
        imgUrl: 'https://pbs.twimg.com/profile_images/1291476569/Copy__2__of_Eminem_Not_Afraid_Recovery_Wallpaper_55489.jpg'),
    Flashcard(question: "steeped",
        meaning: "soaked, drenched, saturated",
        sentence: "My cousin is so steeped in schoolwork that his friends call him a bookworm.",
        imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg2iMgVh9yd5-ip3fagyVmWW9OAiasJrSAfSApUGdulSe9daESl-VMgVPad6w2UpwWbkM&usqp=CAU'),
    Flashcard(question: "replete",
        meaning: "completely filled or supplied with",
        sentence: "The football game was replete with excitement and great plays.",
        imgUrl: "https://o.quizlet.com/AolrLc7b.Vpdy4szfDg3.Q.jpg"),
    Flashcard(question: "abound",
        meaning: "to exist in great numbers",
        sentence: "The worlds of science-fiction abound with wonders.",
        imgUrl: "https://dxuoddg10rgxw.cloudfront.net/wp-content/uploads/2012/01/17023524/abound.gif"),
  Flashcard(question: "technology",
      meaning: "branch of knowledge dealing with engineering, applied science, etc.",
      sentence: "It will reduce the industry's ability to spend money on new technology.",
      imgUrl: "https://techfitae.com/wp-content/uploads/2021/09/homepage_cloud_416x224.png"),
    Flashcard(question: "prognosticate",
        meaning: "to predict or foretell a future event",
        sentence: "The mayor refused to prognosticate as to his margin of victory in the election.",
        imgUrl: "https://static9.depositphotos.com/1667027/1145/v/600/depositphotos_11459154-stock-illustration-fortune-teller.jpg"),
    Flashcard(question: "automaton",
        meaning: "a robot; a mechanical person",
        sentence: "like an automaton, she walked to the door",
        imgUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPbiX-uMxoa9Aq7ZKbiIN6PM5YrNhyMDscRAzoxhD1XdnEWJAVkR_g6Lsc1Uhpyiksx48&usqp=CAU"),
    Flashcard(question: "matron",
        meaning: "an older married woman",
        sentence: "She initiated training for matrons of residential homes",
        imgUrl: "http://3.bp.blogspot.com/-pPy_l3IA3HU/V_30G4n8IxI/AAAAAAAAJ1w/ACBgCGuO0ygkQcMEfYeU5Li2PRdAxMk4QCK4B/s1600/jacques_468x454.jpg"),
  ];

  List<Flashcard> _flashcards2 = [
    Flashcard(question: "paradox",
        meaning: "a statement that at first seems to be absurd or self-contradictory but which may in fact turn out to be true",
        sentence: "Herein lies the paradox which is also the deepest truth of our spiritual life.",
        imgUrl: "https://marketing.prowritingaid.com/This-is-a-paradox.png"),
    Flashcard(question: "realm",
        meaning: "special field of something or someone; kingdom",
        sentence: "the realm of applied chemistry",
        imgUrl: "https://i.pinimg.com/564x/16/2b/e4/162be49db7c65bdedec44701cfd0d9a2.jpg"),
    Flashcard(question: "annals",
        meaning: "historical records",
        sentence: "the annals of the police courts",
        imgUrl: "https://www.nybooks.com/wp-content/uploads/1983/07/adolf-hitler_1983-07-21.gif"),
    Flashcard(question: "compound",
        meaning: "to increase or add to ",
        sentence: "the air smelled like a compound of diesel and petrol fumes",
        imgUrl: "https://img.favpng.com/11/4/18/chemistry-chemical-bond-chemical-substance-chemical-compound-atom-png-favpng-jSh2tVYRKnKB0YzMdZZcmmYPG.jpg"),
    Flashcard(question: "tinge",
        meaning: "a trace, smattering, or slight degree",
        sentence: "The tinge of blue at the bottom of this dress is so pretty.",
        imgUrl: "https://qph.fs.quoracdn.net/main-qimg-e3f93e48c988ecfad64c808d8cba04e6.webp"),
    Flashcard(question: "badger",
        meaning: "to pester, nag, annoy persistently",
        sentence: "Tom had finally badgered her into going",
        imgUrl: "https://dailyvocab.com/wp-content/uploads/2021/05/Badger-1.gif"),
    Flashcard(question: "implore",
        meaning: "to plead urgently for aid or mercy",
        sentence: "he implored her to change her mind",
        imgUrl: "https://i.pinimg.com/originals/72/56/54/7256541d913c2bfd0d812d9684a65dcb.gif"),
    Flashcard(question: "drudgery",
        meaning: "unpleasant, dull, or hard work",
        sentence: "This can make the task seem less like drudgery and is perfect for busy people.",
        imgUrl: "https://i.pinimg.com/originals/51/33/78/5133788e80c189aa816b165aee602994.gif"),
    Flashcard(question: "interminable",
        meaning: "unending",
        sentence: "we got bogged down in interminable discussions",
        imgUrl: "https://i.pinimg.com/474x/43/26/61/4326616b99e50074adc8109b48c46c83.jpg"),
    Flashcard(question: "perceive",
        meaning: "to understand, know, become aware of",
        sentence: "his mouth fell open as he perceived the truth",
        imgUrl: "https://www.braingymmer.com/img/uploads/perception.png"),
  ];
  List<Flashcard> _flashcards3 = [
    Flashcard(question: "laconic",
        meaning: "expressing much in few words",
        sentence: "His laconic reply suggested a lack of interest in the topic",
        imgUrl: "https://wordinfo.info/words/images/laconic-1.jpg"),
    Flashcard(question: "throng",
        meaning: "crowd",
        sentence: "he pushed his way through the throng",
        imgUrl: "https://www.dictionary.com/e/wp-content/uploads/2019/12/Slew_1000x700.jpg"),
    Flashcard(question: "intrepid",
        meaning: "brave,fearless; adventurous",
        sentence: "Our intrepid reporter",
        imgUrl: "http://www.wordinfo.info/words/images/intrepid-1.jpg"),
    Flashcard(question: "accost",
        meaning: "to approach and speak to",
        sentence: "reporters accosted him in the street",
        imgUrl: "https://dailyvocab.com/wp-content/uploads/2016/03/Accost.jpg"),
    Flashcard(question: "reticent",
        meaning: "silent",
        sentence: "she was extremely reticent about her personal affairs",
        imgUrl: "https://www.vocabularytoday.com/wp-content/uploads/2020/08/Reticent.jpg"),
    Flashcard(question: "furtive",
        meaning: "secret, stealthy",
        sentence: "they spent a furtive day together",
        imgUrl: "https://www.vocabularytoday.com/wp-content/uploads/2020/09/Furtive-300x300.jpg"),
    Flashcard(question: "felon",
        meaning: "a person guilty of a major crime",
        sentence: "the felon undermining hand of dark corruption",
        imgUrl: "https://dailyvocab.com/wp-content/uploads/2020/12/Felon-1.jpg"),
    Flashcard(question: "plethora",
        meaning: "a large or excessive amount of something.",
        sentence: "a plethora of committees and subcommittees",
        imgUrl: "https://pbs.twimg.com/media/EYFjBFjWAAUW79n.jpg"),
    Flashcard(question: "hapless",
        meaning: "unfortunate",
        sentence: "the hapless victims of the disaster",
        imgUrl: "https://thumbs.dreamstime.com/b/cartoon-hapless-man-parachute-burning-plane-to-ocean-shark-83521596.jpg"),
    Flashcard(question: "irate",
        meaning: "angry, incensed",
        sentence: "a barrage of irate letters",
        imgUrl: "https://m-cdn.phonearena.com/images/article/44857-1200/Classic-Angry-Birds-for-iPhone-and-Android-gets-new-episode.jpg"),
  ];

  List<Flashcard> _flashcards4 = [
    Flashcard(question: "pretext",
        meaning: "an excuse",
        sentence: "The rebels had the perfect pretext for making their move",
        imgUrl: "https://image.shutterstock.com/image-illustration/man-late-appointment-flat-style-260nw-468267893.jpg"),
    Flashcard(question: "fabricate",
        meaning: "to lie; to construct",
        sentence: "Officers fabricated evidence.",
        imgUrl: "https://learnbookme.files.wordpress.com/2020/04/fabricate.gif"),
    Flashcard(question: "adroit",
        meaning: "clever or skilful.",
        sentence: "He was adroit at tax avoidance.",
        imgUrl: "https://assets.wordgenius.com/wordgenius/Word+of+The+Day+Images/Adroit.jpg"),
    Flashcard(question: "gesticulate",
        meaning: "move the arms energetically",
        sentence: "They were shouting and gesticulating frantically at drivers who did not slow down.",
        imgUrl: "https://as1.ftcdn.net/jpg/01/02/14/06/500_F_102140620_6DzTl1avUyWEZrVK7mPMwJOnAMGTGmoC.jpg"),
    Flashcard(question: "vigilant",
        meaning: "watchful",
        sentence: "You will have to be vigilant in your work in order to earn an A in this class.",
        imgUrl: "https://us.123rf.com/450wm/vector2011/vector20111704/vector2011170400022/75642503-buen-guardia-de-seguridad-est%C3%A1-vestido-con-uniforme.jpg?ver=6"),
    Flashcard(question: "avid",
        meaning: "eager,keen, enthusiastic, passionate",
        sentence: "an avid reader of science fiction",
        imgUrl: "https://www.wikihow.com/images/9/9f/Become-an-Avid-Reader-Step-20.jpg"),
    Flashcard(question: "cajole",
        meaning: "coax, persuade",
        sentence: "He hoped to cajole her into selling the house",
        imgUrl: "https://phocab-photos.s3.amazonaws.com/httpraytownonlinecomwp-contentuploads201012cajolejpg.jpg"),
    Flashcard(question: "rudimentary",
        meaning: "elementary, basic, early",
        sentence: "He received a rudimentary education",
        imgUrl: "https://s3.amazonaws.com/lowres.cartoonstock.com/technology-generation_gap-cavemen-abstract_thought-evolves-evolutions-kmhn756_low.jpg"),
    Flashcard(question: "enhance",
        meaning: "intensify, heighten",
        sentence: "His refusal does nothing to enhance his reputation",
        imgUrl: "https://dxuoddg10rgxw.cloudfront.net/wp-content/uploads/2012/02/17023504/enhance.jpg"),
    Flashcard(question: "nuance",
        meaning: "slight variation in meaning, tone, etc.",
        sentence: "The effect of the music is nuanced by the social situation of listeners",
        imgUrl: "https://slidetodoc.com/presentation_image_h/29b4765e36d7722ce80b68cb4cc07b4a/image-19.jpg"),
  ];

  List<Flashcard> _flashcards5 = [
    Flashcard(question: "loathe",
        meaning: "to hate",
        sentence: "If there's one thing I loathe,the coach said, it's a quitter.",
        imgUrl: "https://www.grammar-monster.com/easily_confused/pics/loath_or_loathe.png"),
    Flashcard(question: "reprimand",
        meaning: "to show sharp disapproval",
        sentence: "He had good reason to reprimand us at half-time,because the scoreboard revealed that we were losing.",
        imgUrl: "https://thumbs.dreamstime.com/b/reprimanded-boss-25265430.jpg"),
    Flashcard(question: "lackluster",
        meaning: "dull, uninspired, colourless, humdrum",
        sentence: "Our lackluster performance indicated to him that we had forgotten the rudimentary* aspects of basketball.",
        imgUrl: "https://english-grammar.biz/dictionary/img/wlibrary/l/6020680fbc44c1.77273668.jpg"),
    Flashcard(question: "caustic",
        meaning: "sarcastic, biting",
        sentence: "The players were making caustic comments about the refereeing",
        imgUrl: "https://www.nealumphred.com/wp-content/uploads/Sarcasm_BigBangTheory_caricature_1500.jpg"),
    Flashcard(question: "wrest",
        meaning: "take by force, grab",
        sentence: "We dashed out,determined to wrest control of the game from our rivals",
        imgUrl: "https://learnodo-newtonic.com/wp-content/uploads/2013/01/Wrest.jpg"),
    Flashcard(question: "infamous",
        meaning: "having a bad reputation",
        sentence: "The infamous pickpocket, was back at work, and every detective had to be especially vigilant.",
        imgUrl: "https://wl-brightside.cf.tsp.li/resize/728x/jpg/16b/75a/6910b2570dbe2ff966fb9b7297.jpg"),
    Flashcard(question: "jostle",
        meaning: "to shove hard, push",
        sentence: "He was jostled by passengers rushing for the gates",
        imgUrl: "https://i.ytimg.com/vi/cekY9yvdBxU/maxresdefault.jpg"),
    Flashcard(question: "dupe",
        meaning: "a person easily tricked",
        sentence: "The newspaper was duped into publishing an untrue story",
        imgUrl: "https://st3.depositphotos.com/1636517/14529/i/600/depositphotos_145293661-stock-photo-feedback-from-disloyal-coworker.jpg"),
    Flashcard(question: "incipient",
        meaning: "just beginning to exist",
        sentence: "We seemed more like friends than incipient lovers",
        imgUrl: "http://www.wordinfo.info/words/images/incipient-1.jpg"),
    Flashcard(question: "inadvertent",
        meaning: "heedless, not attentive,unintentional, unintended, accidental",
        sentence: "An inadvertent administrative error occurred that resulted in an overpayment.",
        imgUrl: "https://st.depositphotos.com/1056223/2674/v/600/depositphotos_26748209-stock-illustration-hit-a-rock.jpg"),
  ];

  List<Flashcard> _flashcards6 = [
    Flashcard(question: "ominous",
        meaning: "threatening, sinister",
        sentence: "There was an ominous silence when the jittery defendant rose in court.",
        imgUrl: "https://mammothmemory.net/images/user/base/English/vocab/remember-ominous-in-english-vocab.34c4e4b.jpg"),
    Flashcard(question: "tremulous",
        meaning: "quivering",
        sentence: "He gave a tremulous smile",
        imgUrl: "https://images.gr-assets.com/hostedimages/1380222758ra/280549.gif"),
    Flashcard(question: "repudiate",
        meaning: "to reject, decline",
        sentence: "The minister repudiated allegations of human rights abuses",
        imgUrl: "https://i.ytimg.com/vi/9U04z2RD6tk/maxresdefault.jpg"),
    Flashcard(question: "cessation",
        meaning: "a stopping, ending, termination",
        sentence: "The audience began to buzz excitedly until the judge demanded a cessation of the noise.",
        imgUrl: "https://image.shutterstock.com/image-vector/vector-cartoon-illustration-stop-smoking-260nw-343858082.jpg"),
    Flashcard(question: "bristle",
        meaning: "stiffen with fear or anger",
        sentence: "The hair on the back of his neck bristled",
        imgUrl: "https://thumbs.dreamstime.com/b/bristle-cat-sketch-vector-illustration-reared-scared-engraving-t-shirt-apparel-print-design-scratch-board-imitation-black-228046017.jpg"),
    Flashcard(question: "euphemism",
        meaning: "a less offensive term",
        sentence: "My cousin refers to himself as a ''sanitary engineera'' euphemism for garbage collector.",
        imgUrl: "https://unravellingmag.com/wp-content/uploads/2015/11/03-Catherine.jpg"),
    Flashcard(question: "mundane",
        meaning: "worldly, humdrum, dull",
        sentence: "There are any number of people who try to find more respectable or glamorous titles for the mundane jobs they hold.",
        imgUrl: "https://thumbs.dreamstime.com/b/cartoon-tired-man-businessman-holding-sign-boring-text-stick-drawing-conceptual-illustration-exhausted-113133568.jpg"),
    Flashcard(question: "incongruous",
        meaning: "inappropriate, unsuited",
        sentence: "The duffel coat looked incongruous with the black dress she wore underneath",
        imgUrl: "https://mammothmemory.net/images/user/base/English/71%20-%20incongruous.jpg"),
    Flashcard(question: "condolence",
        meaning: "pity, sympathy",
        sentence: "We offer our sincere condolences to his widow",
        imgUrl: "https://s3.amazonaws.com/lowres.cartoonstock.com/business-commerce-condolence_card-greeting_card-hostile_takeover-merger-corporate_culture-dcrn1215_low.jpg"),
    Flashcard(question: "stipulate",
        meaning: "to specify a condition,demand",
        sentence: "He stipulated certain conditions before their marriage",
        imgUrl: "http://www.wordinfo.info/words/images/stipulation-1.jpg"),
  ];

  List<Flashcard> _flashcards7 = [
    Flashcard(question: "alacrity",
        meaning: "briskness, lively action",
        sentence: "When the bell sounded, K.O. Mullins responded with alacrity",
        imgUrl: "https://i.ytimg.com/vi/f8OQIQLPypI/maxresdefault.jpg"),
    Flashcard(question: "disdain",
        meaning: "contempt,disrespect",
        sentence: "He sprang from his stool and charged across the ring, showing disdain for the champion's strength.",
        imgUrl: "https://m.media-amazon.com/images/I/A13usaonutL._CLa%7C2140%2C2000%7C91uTlsUhi4L.png%7C0%2C0%2C2140%2C2000%2B0.0%2C0.0%2C2140.0%2C2000.0_AC_UX342_.png"),
    Flashcard(question: "belligerent",
        meaning: "warlike,hostile and aggressive.",
        sentence: "This belligerent attitude impressed the referee.",
        imgUrl: "https://qph.fs.quoracdn.net/main-qimg-fd7ef7b418e623020500e9dd90631694"),
    Flashcard(question: "intimidate",
        meaning: "to overawe(someone),especially in order to make them do what one wants.",
        sentence: "The forts are designed to intimidate the population",
        imgUrl: "https://wl-brightside.cf.tsp.li/resize/728x/jpg/be6/c22/09d6755de5bc6aefed8dbbcac5.jpg"),
    Flashcard(question: "feint",
        meaning: "a false attack",
        sentence: "That intrepid* battler laid the hapless* Mullins low with an adroit* feint and an uppercut.",
        imgUrl: "https://www.rookieroad.com/img/basketball/basketball-feint.png"),
    Flashcard(question: "pugnacious",
        meaning: "quarrelsome",
        sentence: "The pugnacious K.O. Mullins demanded a rematch.",
        imgUrl: "https://ih1.redbubble.net/image.895642251.6215/st,small,845x845-pad,1000x1000,f8f8f8.jpg"),
    Flashcard(question: "promulgate",
        meaning: "to make known officially",
        sentence: "He took a full-page newspaper advertisement to promulgatehis challenge.",
        imgUrl: "https://i.pinimg.com/originals/5b/1e/34/5b1e34ae6da6ce40e76dd1c2f38bd925.jpg"),
    Flashcard(question: "brash",
        meaning: "impudent(not showing due respect for another person)",
        sentence: "When the champ's manager saw the brash announcement, he accosted Mullins.",
        imgUrl: "https://slideplayer.com/10074173/32/images/slide_1.jpg"),
    Flashcard(question: "scoff",
        meaning: "to sneer at, mocking manner",
        sentence: "The manager openly scoffed at Mullins",
        imgUrl: "https://media.istockphoto.com/vectors/group-of-children-or-teenagers-scoff-show-fingers-and-bully-a-sad-vector-id1160400550?k=20&m=1160400550&s=612x612&w=0&h=Rd_vAZgHy8SI9ZWbAuOYJAMnFxS1hJm5yomUqHoH-3w="),
    Flashcard(question: "belittle",
        meaning: "to make seem less important",
        sentence: "She belittled Amy's riding skills whenever she could.",
        imgUrl: "https://static.toiimg.com/imagenext/toiblogs/photo/blogs/wp-content/uploads/2018/11/NoPoliticalCorrectness.jpg"),
  ];

  List<Flashcard> _flashcards8 = [
    Flashcard(question: "tangible",
        meaning: "having actual form",
        sentence: "The atmosphere of neglect and abandonment was almost tangible.",
        imgUrl: "https://diettogo.com/data/fe/image/TangibleThings_donatemoney.jpg"),
    Flashcard(question: "laceration",
        meaning: "jagged wound",
        sentence: "He pointed to a deep laceration over his eyebrow that had required ten stitches.",
        imgUrl: "https://medlineplus.gov/ency/images/ency/fullsize/19616.jpg"),
    Flashcard(question: "castigate",
        meaning: "to correct by punishing",
        sentence: "He was castigated for not setting a good example.",
        imgUrl: "https://i.ytimg.com/vi/HOMML7IwdK4/maxresdefault.jpg"),
    Flashcard(question: "sordid",
        meaning: "dirty, base",
        sentence: "The overcrowded housing conditions were sordid and degrading.",
        imgUrl: "https://i.ytimg.com/vi/6fLGjruOmys/maxresdefault.jpg"),
    Flashcard(question: "octogenarian",
        meaning: "person in his or her eighties",
        sentence: "Mullins was required to make a public apology to the octogenarian.",
        imgUrl: "https://us.123rf.com/450wm/nicoletaionescu/nicoletaionescu2002/nicoletaionescu200200032/141033648-old-bride-and-groom-getting-married-vector-illustration.jpg?ver=6"),
    Flashcard(question: "solace",
        meaning: "easing of grief,comfort,consolation",
        sentence: "Mullins sought solace in whiskey.",
        imgUrl: "https://d7hftxdivxxvm.cloudfront.net/?resize_to=fit&width=800&height=588&quality=80&src=https%3A%2F%2Fd32dm0rphc51dk.cloudfront.net%2FkQ62drRwMRxedSNRa4Kikg%2Fnormalized.jpg"),
    Flashcard(question: "aspirant",
        meaning: "candidate for high position",
        sentence: "An aspirant to the throne.",
        imgUrl: "https://www.ssbcrack.com/wp-content/uploads/2017/08/DEFENCE-ASPIRANTS.jpg"),
    Flashcard(question: "dregs",
        meaning: "most worthless part",
        sentence: "He found himself associating with the dregs of Skid Row.",
        imgUrl: "https://www.smartvocab.in/common-images/vpw6gqskrmnxqasa.jpg"),
    Flashcard(question: "frenzy",
        meaning: "wild fit",
        sentence: "Doreen worked herself into a frenzy of rage.",
        imgUrl: "https://pbs.twimg.com/media/CRsHE1iXIAAgUL_.jpg"),
    Flashcard(question: "scurrilous",
        meaning: "coarse,abusive,offensive",
        sentence: "A scurrilous attack on his integrity.",
        imgUrl: "https://image1.slideserve.com/2640271/scurrilous-n.jpg"),
  ];

  List<Flashcard> _flashcards9 = [
    Flashcard(question: "rampant",
        meaning: "going unchecked, widespread",
        sentence: "During my first weeks at the new school I observed that cheating was rampant.",
        imgUrl: "https://wordinfo.info/words/images/rampant-2.jpg"),
    Flashcard(question: "inane",
        meaning: "foolish",
        sentence: "I had always considered it ratherinane to cheat on a test.",
        imgUrl: "https://4.bp.blogspot.com/-a06NEib7M5Y/V0aLST1OO7I/AAAAAAAADow/RbJfu-ofT941z6oO08u_fz5TWP2OX2l7ACLcB/s1600/10.PNG"),
    Flashcard(question: "ethics",
        meaning: "code of principles",
        sentence: "Neither metaphysics nor ethics is the home of religion.",
        imgUrl: "https://image.shutterstock.com/image-illustration/we-only-have-few-rules-260nw-118019365.jpg"),
    Flashcard(question: "concur",
        meaning: "agree",
        sentence: "The authors concurred with the majority",
        imgUrl: "https://image1.slideserve.com/2126487/concur-n.jpg"),
    Flashcard(question: "clandestine",
        meaning: "secret, undercover",
        sentence: "Far from being a clandestine activity, the cheating was open and obvious.",
        imgUrl: "https://dailyvocab.com/wp-content/uploads/2013/07/clandestine.jpg"),
    Flashcard(question: "flagrant",
        meaning: "outrageous, glaringly bad",
        sentence: "Our new principal, determined to do something about the flagrant cheating at our high school.",
        imgUrl: "http://www.wordinfo.info/words/images/flagrant-1.jpg"),
    Flashcard(question: "admonish",
        meaning: "to warn, to reprove",
        sentence: "He issued bulletins and began to admonish those teachers who did not proctor alertly.",
        imgUrl: "https://image.shutterstock.com/image-photo/business-man-boss-raised-index-260nw-1828826702.jpg"),
    Flashcard(question: "duress",
        meaning: "compulsion, force",
        sentence: "Confessions extracted under duress",
        imgUrl: "https://study.com/cimages/videopreview/videopreview-full/bfqy0fxzv1.jpg"),
    Flashcard(question: "culprit",
        meaning: "the guilty person",
        sentence: "Low-level ozone pollution is the real culprit.",
        imgUrl: "https://us.123rf.com/450wm/unitonevector/unitonevector1904/unitonevector190403153/123089256-prisoner-behind-metal-bars-vector-illustration-handcuffed-jailed-man-standing-in-cell-cage-cartoon-c.jpg?ver=6"),
    Flashcard(question: "inexorable",
        meaning: "impossible to stop or prevent, inflexible, unrelenting",
        sentence: "Mr.Dorsey's inexorable campaign against the wrong-doers seemed to be paying off.",
        imgUrl: "https://dailyvocab.com/wp-content/uploads/2013/10/inexorable-implacable.jpg"),
  ];


  List<Flashcard> _flashcards10 = [
    Flashcard(question: "egregious",
        meaning: "remarkably bad",
        sentence: "He made the egregious mistake of getting caught cheating on a midterm exam.",
        imgUrl: "https://dailyvocab.com/wp-content/uploads/2013/11/EGREGIOUSS.jpg"),
    Flashcard(question: "distraught",
        meaning: "mentally confused, crazed",
        sentence: "Distraught parents looking for a runaway teenager.",
        imgUrl: "https://thumbs.dreamstime.com/z/english-opposite-word-ecstatic-distraught-illustration-130452621.jpg"),
    Flashcard(question: "duplicity",
        meaning: "cunning, trickery",
        sentence: "He was accused of duplicity and branded a traitor.",
        imgUrl: "https://st3.depositphotos.com/1796560/14356/v/600/depositphotos_143567053-stock-illustration-icon-duplicity-hiding-their-emotions.jpg"),
    Flashcard(question: "acrimonious",
        meaning: "bitter",
        sentence: "An acrimonious dispute about wages.",
        imgUrl: "https://slideplayer.com/slide/13139791/79/images/3/acrimonious%3A+adj.+definition%3A+caustic%2C+stinging%2C+or+bitter+in.jpg"),
    Flashcard(question: "paucity",
        meaning: "the presence of something in only small or insufficient quantities or amounts,scarcity,shortage",
        sentence: "A paucity of information.",
        imgUrl: "https://slideplayer.com/slide/16268462/95/images/9/paucity+Having+the+wrong+tools+hinders+a+job+as+much+as+having+a+paucity+of+tools..jpg"),
    Flashcard(question: "elicit",
        meaning: "evoke or draw out (a reaction, answer, or fact) from someone.",
        sentence: "I tried to elicit a smile from Joanna.",
        imgUrl: "https://149455152.v2.pressablecdn.com/wp-content/uploads/2015/02/elicit-298x300.jpg"),
    Flashcard(question: "pernicious",
        meaning: "harmful, causing injury",
        sentence: "The pernicious influences of the mass media.",
        imgUrl: "https://dailyvocab.com/wp-content/uploads/2016/08/Pernicious.jpg"),
    Flashcard(question: "tolerate",
        meaning: "to put up with, to bear",
        sentence: "A regime unwilling to tolerate dissent.",
        imgUrl: "https://cdn.christianpost.com/files/original/thumbnail/12/39/123909.jpg"),
    Flashcard(question: "construe",
        meaning: "to make a deduction, to infer,understand,analyse,explain",
        sentence: "Both verbs can be construed with either infinitive",
        imgUrl: "https://lh3.googleusercontent.com/proxy/SkM2-jgfj-aG9DHhMyQ7Cdo_-dWetdeWnB6YhO6Qrz1xQafpYjy0IgKKJ37vJ8QiCmzFo-dxAJXbjq6SlNgYhai61GuLS819jjc"),
    Flashcard(question: "impunity",
        meaning: "freedom from punishment",
        sentence: "The impunity enjoyed by military officers implicated in civilian killings.",
        imgUrl: "https://www.sunstar.com.ph/uploads/imported_images/files/field/image/article/editorial_1263.jpg"),
  ];

  List<Flashcard> _flashcards11 = [
    Flashcard(question: "affluent",
        meaning: "rich",
        sentence: "The affluent societies of the western world.",
        imgUrl: "https://www.bragitoff.com/wp-content/uploads/2015/06/affluent.jpg"),
    Flashcard(question: "feasible",
        meaning: "possible",
        sentence: "The most feasible explanation.",
        imgUrl: "https://thumbs.dreamstime.com/b/conceptual-hand-writing-showing-everything-possible-business-photo-text-any-outcome-could-occur-anything-can-happen-crumbling-160891027.jpg"),
    Flashcard(question: "discern",
        meaning: "perceive,recognize or find out.",
        sentence: "I can discern no difference between the two policies.",
        imgUrl: "https://mammothmemory.net/images/user/base/English/106.%20Discern.jpg"),
    Flashcard(question: "sally",
        meaning: "suddenly rush forth, charge",
        sentence: "The garrison there made a sally against us.",
        imgUrl: "https://c.tenor.com/-1l5Enh7QZAAAAAC/sword-attack.gif"),
    Flashcard(question: "consternation",
        meaning: "a feeling of anxiety or dismay",
        sentence: "To the consternation of the umbrella manufacturers, it has been enjoying a brisk sale.",
        imgUrl: "https://pearlsofprofundity.files.wordpress.com/2014/05/fear-4a.jpg"),
    Flashcard(question: "precocious",
        meaning: "reaching maturity early",
        sentence: "A precocious talent for computing.",
        imgUrl: "https://mammothmemory.net/images/user/base/English/111%20-%20Precocious.jpg"),
    Flashcard(question: "perfunctory",
        meaning: "done without care, superficial",
        sentence: "He gave a perfunctory nod.",
        imgUrl: "https://mammothmemory.net/images/user/base/English/167-perfunctory.jpg"),
    Flashcard(question: "chagrin",
        meaning: "feeling of disappointment, humiliation",
        sentence: "He was chagrined when his friend poured scorn on him.",
        imgUrl: "https://www.bragitoff.com/wp-content/uploads/2015/06/chagrin.jpg"),
    Flashcard(question: "perverse",
        meaning: "contrary, persisting in error",
        sentence: "Kate's perverse decision not to cooperate held good.",
        imgUrl: "https://mammothmemory.net/images/user/base/English/vocab/remember-perverse-in-a-sentence.87d7737.jpg"),
    Flashcard(question: "deride",
        meaning: "to ridicule, scoff at",
        sentence: "The decision was derided by environmentalists.",
        imgUrl: "https://www.tekportal.net/wp-content/uploads/2019/02/deride-0403.jpg"),
  ];

  List<Flashcard> _flashcards12 = [
    Flashcard(question: "disparage",
        meaning: "to discredit, belittle",
        sentence: "He never missed an opportunity to disparage his competitors.",
        imgUrl: "https://dailyvocab.com/wp-content/uploads/2020/03/disparage.jpg"),
    Flashcard(question: "laudable",
        meaning: "praiseworthy,deserving",
        sentence: "Laudable though the aim might be, the results have been criticized.",
        imgUrl: "http://www.clipartoday.com/_thumbs/005/001/Business_Occupations/Military/Officers/military_soldier_92462_tnb.png"),
    Flashcard(question: "fiasco",
        meaning: "complete failure",
        sentence: "His plans turned into a fiasco.",
        imgUrl: "https://i.pinimg.com/originals/e5/ca/14/e5ca14af5f2db3cd7a6fa121fa1206d3.jpg"),
    Flashcard(question: "masticate",
        meaning: "to chew up",
        sentence: "Dentition affects how well food is masticated and absorbed.",
        imgUrl: "https://lh3.googleusercontent.com/proxy/IM9Iq3GRIzbKUGgPIpEhBd_mXJDVeHwKUznqndOUPzYEdeaSJnqS4boLIPeooAgpsEWrT8iRQaJmMFd1HZyBEssb-7L3fJ0OKNxgcopdQOJA"),
    Flashcard(question: "eschew",
        meaning: "avoid",
        sentence: "He appealed to the crowd to eschew violence.",
        imgUrl: "https://img.youtube.com/vi/rMc0aYV91wg/hqdefault.jpg"),
    Flashcard(question: "quell",
        meaning: "put an end to",
        sentence: "Extra police were called to quell the disturbance.",
        imgUrl: "http://www.wordinfo.info/words/images/quell-1.jpg"),
    Flashcard(question: "voluble",
        meaning: "talkative",
        sentence: "A voluble game-show host.",
        imgUrl: "https://i.ytimg.com/vi/Hk59jFeaW-o/maxresdefault.jpg"),
    Flashcard(question: "confidant(e)",
        meaning: "one to whom you confide your secrets",
        sentence: "A close confidante of the princess.",
        imgUrl: "https://www.grammar-monster.com/easily_confused/pics/confidant_confidante_or_confident.png"),
    Flashcard(question: "obsolescence",
        meaning: "process of wearing out",
        sentence: "Computers are infamous for their rapid obsolescence.",
        imgUrl: "https://dxuoddg10rgxw.cloudfront.net/wp-content/uploads/2013/01/17022800/Obsolescence.jpg"),
    Flashcard(question: "dubious",
        meaning: "doubtful",
        sentence: "I was rather dubious about the whole idea.",
        imgUrl: "https://i.ytimg.com/vi/ilALXdSrMv0/maxresdefault.jpg"),
  ];

  List<Flashcard> _flashcards13 = [
    Flashcard(question: "implacable",
        meaning: "cannot be pacified, inexorable, unforgiving",
        sentence: "He was an implacable enemy of Ted's.",
        imgUrl: "https://avatars.mds.yandex.net/get-zen_doc/1362956/pub_5ae36e273dceb76be76eb99a_5ae38070f03173ba38d055a9/scale_1200"),
    Flashcard(question: "paroxysm",
        meaning: "a fit, sudden outburst or attack",
        sentence: "He exploded in a paroxysm of rage.",
        imgUrl: "https://slideplayer.com/slide/9284906/28/images/12/PAROXYSM+Definition%3A+%28n.%29+a+sudden+outburst%3B+a+spasm%2C+convulsion.jpg"),
    Flashcard(question: "reprehensible",
        meaning: "worthy of blame",
        sentence: "Mr. Cramer said the violence by anti-government protestors was reprehensible.",
        imgUrl: "https://i.pinimg.com/originals/63/fd/cc/63fdccd0fbb7adf6f28cb62daca5d28b.jpg"),
    Flashcard(question: "jurisdiction",
        meaning: "power, range of authority",
        sentence: "The British police have no jurisdiction over foreign bank accounts.",
        imgUrl: "https://dxuoddg10rgxw.cloudfront.net/wp-content/uploads/2012/05/17023328/jurisdiction.jpg"),
    Flashcard(question: "skirmish",
        meaning: "small fight, brief encounter",
        sentence: "Border skirmishes between India and Pakistan were common.",
        imgUrl: "https://slideplayer.com/slide/15034633/91/images/8/Skirmish.jpg"),
    Flashcard(question: "harass",
        meaning: "to trouble, torment, badger",
        sentence: "A celebrity routinely harassed by the paparazzi.",
        imgUrl: "http://www.duhaime.org/Portals/duhaime/images/Workplace-Harrassment.jpg"),
    Flashcard(question: "monolithic",
        meaning: "massively solid",
        sentence: "A monolithic concrete building.",
        imgUrl: "https://dxuoddg10rgxw.cloudfront.net/wp-content/uploads/2012/05/17023322/monolithic.jpg"),
    Flashcard(question: "arbitrary",
        meaning: "based on whim, dictatorial,random",
        sentence: "Arbitrary arrests were common.",
        imgUrl: "https://dxuoddg10rgxw.cloudfront.net/wp-content/uploads/2012/05/17023344/arbitrary.jpg"),
    Flashcard(question: "indigent",
        meaning: "poor, needy",
        sentence: "Medical professionals should be permitted to provide free healthcare to indigent people.",
        imgUrl: "https://phocab-photos.s3.amazonaws.com/httpwwwyourdictionarycomimagesdefinitionslgindigentjpg.jpg"),
    Flashcard(question: "fray",
        meaning: "a fight",
        sentence: "Today he entered the fray on the side of the moderates.",
        imgUrl: "https://dxuoddg10rgxw.cloudfront.net/wp-content/uploads/2012/05/17023333/fray.jpg"),
  ];


}