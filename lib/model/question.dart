class Question {
  final String id;
  final String question;
  final List<String> answers;
  final String correctAnswer;

  Question({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  Question copyWith({
    String? id,
    String? question,
    List<String>? answers,
    String? correctAnswer,
  }) {
    return Question(
      id: id ?? this.id,
      question: question ?? this.question,
      answers: answers ?? this.answers,
      correctAnswer: correctAnswer ?? this.correctAnswer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'answers': answers,
      'correctAnswer': correctAnswer,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      question: map['question'],
      answers: List<String>.from(map['answers']),
      correctAnswer: map['correctAnswer'],
    );
  }
}

List<Question> question1 = [
  Question(
    id: '1',
    question: 'The football game was __________ with excitement and great plays.',
    answers: ['voracious', 'indiscriminate', 'eminent', 'steeped', 'replete'],
    correctAnswer: 'replete',
  ),
  Question(
    id: '2',
    question: 'The mayor refused to __________ as to his margin of victory in the election.',
    answers: ['abound', 'technology', 'prognosticate', 'automaton', 'matron'],
    correctAnswer: 'prognosticate',
  ),
  Question(
    id: '3',
    question: 'The __________ author received the Nobel Prize for literature.',
    answers: ['voracious', 'indiscriminate', 'eminent', 'steeped', 'replete'],
    correctAnswer: 'eminent',
  ),
  Question(
    id: '4',
    question: ' The time is approaching when human workers may be replaced by __________.',
    answers: ['abound', 'technology', 'prognosticate', 'automaton', 'matron'],
    correctAnswer: 'automaton',
  ),
  Question(
    id: '5',
    question: 'My cousin is so __________ in schoolwork that his friends call him a bookworm.',
    answers: ['voracious', 'indiscriminate', 'eminent', 'steeped', 'replete'],
    correctAnswer: 'steeped',
  ),
  Question(
    id: '6',
    question: 'A clever salesman will always ask a __________ if her mother is at home.',
    answers: ['abound', 'technology', 'prognosticate', 'automaton', 'matron'],
    correctAnswer: 'matron',
  ),
  Question(
    id: '7',
    question: 'After skiing, I find that I have a __________ appetite.',
    answers: ['voracious', 'indiscriminate', 'eminent', 'steeped', 'replete'],
    correctAnswer: 'voracious',
  ),
  Question(
    id: '8',
    question: 'The western plains used to __________ with bison before those animals were slaughtered by settlers.',
    answers: ['abound', 'technology', 'prognosticate', 'automaton', 'matron'],
    correctAnswer: 'abound',
  ),
  Question(
    id: '9',
    question: 'Modern warfare often results in the __________ killing of combatants and innocent civilians alike.',
    answers: ['voracious', 'indiscriminate', 'eminent', 'steeped', 'replete'],
    correctAnswer: 'indiscriminate',
  ),
  Question(
    id: '10',
    question: 'Man may be freed from backbreaking labor by the products of scientific __________.',
    answers: ['abound', 'technology', 'prognosticate', 'automaton', 'matron'],
    correctAnswer: 'technology',
  ),
];



List<Question> question2 = [
  Question(
    id: '1',
    question: 'His gloom was now __________ by the failing mark on his geometry test.',
    answers: ['paradox', 'realm', 'annals', 'compound', 'tinge'],
    correctAnswer: 'compound',
  ),
  Question(
    id: '2',
    question: 'She does her homework on Fridays to save herself from the __________ of having to do it during the weekend.',
    answers: ['badger', 'implore', 'drudgery', 'interminable', 'perceive'],
    correctAnswer: 'drudgery',
  ),
  Question(
    id: '3',
    question: 'The __________ of sports are replete* with the names of great black athletes.',
    answers: ['paradox', 'realm', 'annals', 'compound', 'tinge'],
    correctAnswer: 'annals',
  ),
  Question(
    id: '4',
    question: 'The teacher continually __________ the pupil for the missing assignments.',
    answers: ['badger', 'implore', 'drudgery', 'interminable', 'perceive'],
    correctAnswer: 'badger',
  ),
  Question(
    id: '5',
    question: 'One of the great __________ of American life is that though minority groups have suffered injustices, nowhere in the world have so many varied groups lived together so harmoniously.',
    answers: ['paradox', 'realm', 'annals', 'compound', 'tinge'],
    correctAnswer: 'paradoxes',
  ),
  Question(
    id: '6',
    question: 'The eminent scientist __________ difficulties in putting the invention into practice.',
    answers: ['badger', 'implore', 'drudgery', 'interminable', 'perceive'],
    correctAnswer: 'perceive',
  ),
  Question(
    id: '7',
    question: 'A __________ of garlic is all that\'s necessary in most recipes.',
    answers: ['paradox', 'realm', 'annals', 'compound', 'tinge'],
    correctAnswer: 'tinge',
  ),
  Question(
    id: '8',
    question: 'The sick child\'s mother __________ the doctor to come immediately.',
    answers: ['badger', 'implore', 'drudgery', 'interminable', 'perceive'],
    correctAnswer: 'implore',
  ),
  Question(
    id: '9',
    question: 'The cruel king would not allow the prince to enter his __________, restricting him to the forest, which abounded with wild animals.',
    answers: ['paradox', 'realm', 'annals', 'compound', 'tinge'],
    correctAnswer: 'realm',
  ),
  Question(
    id: '10',
    question: 'I listened to the boring lecture for what seemed an __________ fifty minutes.',
    answers: ['badger', 'implore', 'drudgery', 'interminable', 'perceive'],
    correctAnswer: 'interminable',
  ),
];
List<Question> question3 = [
  Question(
    id: '1',
    question: 'His speech was usually rambling, but this time I found it brief and __________.',
    answers: ['laconic', 'throng', 'intrepid', 'accost', 'reticent'],
    correctAnswer: 'laconic',
  ),
  Question(
    id: '2',
    question: 'The __________ contest winner was unable to locate the lucky ticket.',
    answers: ['furtive', 'felon', 'plethora', 'hapless', 'irate'],
    correctAnswer: 'hapless',
  ),
  Question(
    id: '3',
    question: 'If a surly panhandler should __________ you, keep on walking.',
    answers: ['laconic', 'throng', 'intrepid', 'accost', 'reticent'],
    correctAnswer: 'accost',
  ),
  Question(
    id: '4',
    question: 'My uncle was __________ when the drunken driver swerved in front of us.',
    answers: ['furtive', 'felon', 'plethora', 'hapless', 'irate'],
    correctAnswer: 'irate',
  ),
  Question(
    id: '5',
    question: 'Even under repeated questioning, the witness remained __________.',
    answers: ['laconic', 'throng', 'intrepid', 'accost', 'reticent'],
    correctAnswer: 'reticent',
  ),
  Question(
    id: '6',
    question: 'In a __________ manner she removed her shoes and tiptoed up to her room.',
    answers: ['furtive', 'felon', 'plethora', 'hapless', 'irate'],
    correctAnswer: 'furtive',
  ),
  Question(
    id: '7',
    question: 'A howling __________ of teenage girls surrounded the rap artists.',
    answers: ['laconic', 'throng', 'intrepid', 'accost', 'reticent'],
    correctAnswer: 'throng',
  ),
  Question(
    id: '8',
    question: 'When the teacher asked why the homework had not been done, he was greeted by a __________ of incredible alibis.',
    answers: ['furtive', 'felon', 'plethora', 'hapless', 'irate'],
    correctAnswer: 'plethora',
  ),
  Question(
    id: '9',
    question: 'The corporal received the Silver Star for his __________ deeds in combat.',
    answers: ['laconic', 'throng', 'intrepid', 'accost', 'reticent'],
    correctAnswer: 'intrepid',
  ),
  Question(
    id: '10',
    question: 'Since the boss learned that Bob associated with a known __________, he fired him.',
    answers: ['furtive', 'felon', 'plethora', 'hapless', 'irate'],
    correctAnswer: 'felon',
  ),
];


List<Question> question4 = [
  Question(
    id: '1',
    question: 'The shootings at Columbine High School made educators much more __________.',
    answers: ['pretext', 'fabricate', 'adroit', 'gesticulate', 'vigilant'],
    correctAnswer: 'vigilant',
  ),
  Question(
    id: '2',
    question: 'Since my grasp of algebra is __________, I cannot solve the problem.',
    answers: ['avid', 'cajole', 'rudimentary', 'enhance', 'nuance'],
    correctAnswer: 'rudimentary',
  ),
  Question(
    id: '3',
    question: 'My nephew is quite __________ at making model airplanes.',
    answers: ['pretext', 'fabricate', 'adroit', 'gesticulate', 'vigilant'],
    correctAnswer: 'adroit',
  ),
  Question(
    id: '4',
    question: 'The parakeet refused to be __________ into entering her cage.',
    answers: ['avid', 'cajole', 'rudimentary', 'enhance', 'nuance'],
    correctAnswer: 'cajole',
  ),

  Question(
    id: '5',
    question: 'Most fisherman can __________ a story about the size of the one that got away.',
    answers: ['pretext', 'fabricate', 'adroit', 'gesticulate', 'vigilant'],
    correctAnswer: 'fabricate',
  ),
  Question(
    id: '6',
    question: 'It will __________ your enjoyment of an opera if you know what the plot is about in advance.',
    answers: ['avid', 'cajole', 'rudimentary', 'enhance', 'nuance'],
    correctAnswer: 'enhance',
  ),
  Question(
    id: '7',
    question: 'Her __________ of being tired did not fool us for an instant.',
    answers: ['pretext', 'fabricate', 'adroit', 'gesticulate', 'vigilant'],
    correctAnswer: 'pretext',
  ),
  Question(
    id: '8',
    question: 'In reading the satires of Jonathan Swift, one must be vigilant in order to catch each __________.',
    answers: ['avid', 'cajole', 'rudimentary', 'enhance', 'nuance'],
    correctAnswer: 'nuance',
  ),
  Question(
    id: '9',
    question: 'I often marvel as I watch the traffic officer __________ at the onrushing cars.',
    answers: ['pretext', 'fabricate', 'adroit', 'gesticulate', 'vigilant'],
    correctAnswer: 'gesticulate',
  ),
  Question(
    id: '10',
    question: 'Bill Clinton is an __________ reader of mystery stories.',
    answers: ['avid', 'cajole', 'rudimentary', 'enhance', 'nuance'],
    correctAnswer: 'avid',
  ),
];


List<Question> question5 = [
  Question(
    id: '1',
    question: 'With the help of his brothers he was able to __________ the leadership of the company from his partner.',
    answers: ['loathe', 'reprimand', 'lackluster', 'caustic', 'wrest'],
    correctAnswer: 'wrest',
  ),
  Question(
    id: '2',
    question: 'By telling the truth, we stopped the __________ rumor from spreading.',
    answers: ['infamous', 'jostle', 'dupe', 'incipient', 'inadvertent'],
    correctAnswer: 'incipient',
  ),
  Question(
    id: '3',
    question: 'Speaking in a monotone, the politician was booed for his __________ address.',
    answers: ['loathe', 'reprimand', 'lackluster', 'caustic', 'wrest'],
    correctAnswer: 'lackluster',
  ),Question(
    id: '4',
    question: 'The bombing of Pearl Harbor was referred to as an __________ deed.',
    answers: ['infamous', 'jostle', 'dupe', 'incipient', 'inadvertent'],
    correctAnswer: 'infamous',
  ),
  Question(
    id: '5',
    question: 'In a __________ article, the drama critic slaughtered the hapless actors.',
    answers: ['loathe', 'reprimand', 'lackluster', 'caustic', 'wrest'],
    correctAnswer: 'caustic',
  ),Question(
    id: '6',
    question: 'The wealthy __________ consented to buy the often-sold Brooklyn Bridge.',
    answers: ['infamous', 'jostle', 'dupe', 'incipient', 'inadvertent'],
    correctAnswer: 'dupe',
  ),
  Question(
    id: '7',
    question: 'I __________ spinach but I love other green vegetables.',
    answers: ['loathe', 'reprimand', 'lackluster', 'caustic', 'wrest'],
    correctAnswer: 'loathe',
  ),Question(
    id: '8',
    question: 'When he attempted to __________ the old lady, she struck him with her umbrella.',
    answers: ['infamous', 'jostle', 'dupe', 'incipient', 'inadvertent'],
    correctAnswer: 'jostle',
  ),
  Question(
    id: '9',
    question: 'When Ed arrived late, he knew that the grocer would __________ him.',
    answers: ['loathe', 'reprimand', 'lackluster', 'caustic', 'wrest'],
    correctAnswer: 'reprimand',
  ),Question(
    id: '10',
    question: 'Through an __________ error, the guided missile sped out of control.',
    answers: ['infamous', 'jostle', 'dupe', 'incipient', 'inadvertent'],
    correctAnswer: 'inadvertent',
  ),
];

List<Question> question6 = [
  Question(
    id: '1',
    question: 'After the weatherman had seen the __________ clouds, he prognosticated rain.',
    answers: ['ominous', 'tremulous', 'repudiate', 'cessation', 'bristle'],
    correctAnswer: 'ominous',
  ),
  Question(
    id: '2',
    question: 'We repudiated* the contract because it did not __________ a cost of living bonus.',
    answers: ['euphemism', 'mundane', 'incongruous', 'condolence', 'stipulate'],
    correctAnswer: 'stipulate',
  ),
  Question(
    id: '3',
    question: 'The general attempted to __________ the testimony of the lieutenant, claiming that the young officer was not an authority on low level bombing.',
    answers: ['ominous', 'tremulous', 'repudiate', 'cessation', 'bristle'],
    correctAnswer: 'repudiate',
  ),
  Question(
    id: '4',
    question: 'The word "expired" is a __________ for "died."',
    answers: ['euphemism', 'mundane', 'incongruous', 'condolence', 'stipulate'],
    correctAnswer: 'euphemism',
  ),
  Question(
    id: '5',
    question: 'Upon seeing the snake, the cat began to __________ with fear.',
    answers: ['ominous', 'tremulous', 'repudiate', 'cessation', 'bristle'],
    correctAnswer: 'bristle',
  ),
  Question(
    id: '6',
    question: 'When my neighbor\'s dog was run over, we sent a __________ card.',
    answers: ['euphemism', 'mundane', 'incongruous', 'condolence', 'stipulate'],
    correctAnswer: 'condolence',
  ),
  Question(
    id: '7',
    question: 'The widow\'s __________ hands revealed her nervousness.',
    answers: ['ominous', 'tremulous', 'repudiate', 'cessation', 'bristle'],
    correctAnswer: 'tremulous',
  ),
  Question(
    id: '8',
    question: 'The philosopher dealt with spiritual things, ignorning the __________ ones.',
    answers: ['euphemism', 'mundane', 'incongruous', 'condolence', 'stipulate'],
    correctAnswer: 'mundane',
  ),
  Question(
    id: '9',
    question: 'The __________ of the bombing in Yugoslavia was urged by the Pope.',
    answers: ['ominous', 'tremulous', 'repudiate', 'cessation', 'bristle'],
    correctAnswer: 'cessation',
  ),
  Question(
    id: '10',
    question: 'The play was so __________ that it seemed to be the work of several authors.',
    answers: ['euphemism', 'mundane', 'incongruous', 'condolence', 'stipulate'],
    correctAnswer: 'incongruous',
  ),
];

List<Question> question7 = [
  Question(
    id: '1',
    question: 'Y2K concerns of the January 1, 2000 problems with computers failed to __________ our company.',
    answers: ['alacrity', 'disdain', 'belligerent', 'intimidate', 'feint'],
    correctAnswer: 'intimidate',
  ),
  Question(
    id: '2',
    question: 'We implored* the faculty advisor to __________ the requirements for the presidency of the club.',
    answers: ['pugnacious', 'promulgate', 'brash', 'scoff', 'belittle'],
    correctAnswer: 'promulgate',
  ),
  Question(
    id: '3',
    question: 'The Germans were duped* by the Allies\' __________ toward the south, leaving the way open for the Normandy invasion.',
    answers: ['alacrity', 'disdain', 'belligerent', 'intimidate', 'feint'],
    correctAnswer: 'feint',
  ),
  Question(
    id: '4',
    question: 'My mother liked the salesman\'s __________ personality, but he irritated most people.',
    answers: ['pugnacious', 'promulgate', 'brash', 'scoff', 'belittle'],
    correctAnswer: 'brash',
  ),
  Question(
    id: '5',
    question: 'The waiter moved with __________ because he perceived* they were big tippers.',
    answers: ['alacrity', 'disdain', 'belligerent', 'intimidate', 'feint'],
    correctAnswer: 'alacrity',
  ),
  Question(
    id: '6',
    question: 'I don\'t understand modern art, but I neither loathe* nor __________ at it.',
    answers: ['pugnacious', 'promulgate', 'brash', 'scoff', 'belittle'],
    correctAnswer: 'scoff',
  ),
  Question(
    id: '7',
    question: 'His __________ manner caused him to lose one friend after another.',
    answers: ['alacrity', 'disdain', 'belligerent', 'intimidate', 'feint'],
    correctAnswer: 'belligerent',
  ),
  Question(
    id: '8',
    question: 'Since everyone can outpunch my cousin, he cannot afford to be __________.',
    answers: ['pugnacious', 'promulgate', 'brash', 'scoff', 'belittle'],
    correctAnswer: 'pugnacious',
  ),
  Question(
    id: '9',
    question: 'When the curtain came down, the critic\'s face registered the __________ she felt for the lackluster* play.',
    answers: ['alacrity', 'disdain', 'belligerent', 'intimidate', 'feint'],
    correctAnswer: 'disdain',
  ),
  Question(
    id: '10',
    question: 'Although Ralph can\'t play, he doesn\'t hesitate to __________ the efforts of our football team.',
    answers: ['pugnacious', 'promulgate', 'brash', 'scoff', 'belittle'],
    correctAnswer: 'belittle',
  ),
];

List<Question> question8 = [
  Question(
    id: '1',
    question: 'The medic reached into his kit to find a bandage for the ugly __________.',
    answers: ['tangible', 'laceration', 'castigate', 'sordid', 'octogenarian'],
    correctAnswer: 'laceration',
  ),
  Question(
    id: '2',
    question: 'Vigilant* censors protect the public from listening to __________ language on television.',
    answers: ['solace', 'aspirant', 'dregs', 'frenzy', 'scurrilous'],
    correctAnswer: 'scurrilous',
  ),
  Question(
    id: '3',
    question: 'Mr. Dixon belittled our request for __________ proof of his loyalty.',
    answers: ['tangible', 'laceration', 'castigate', 'sordid', 'octogenarian'],
    correctAnswer: 'tangible',
  ),
  Question(
    id: '4',
    question: 'The publisher scoffed at the reports that he was an __________ for the job of Secretary of State.',
    answers: ['solace', 'aspirant', 'dregs', 'frenzy', 'scurrilous'],
    correctAnswer: 'aspirant',
  ),
  Question(
    id: '5',
    question: 'The kindly foreman was too reticent* to openly __________ the clumsy new worker.',
    answers: ['tangible', 'laceration', 'castigate', 'sordid', 'octogenarian'],
    correctAnswer: 'castigate',
  ),
  Question(
    id: '6',
    question: 'In a __________, the teenager overturned every drawer while searching for the car keys.',
    answers: ['solace', 'aspirant', 'dregs', 'frenzy', 'scurrilous'],
    correctAnswer: 'frenzy',
  ),
  Question(
    id: '7',
    question: 'When the teenager announced her engagement to the __________, the public suspected it to be a publicity stunt.',
    answers: ['tangible', 'laceration', 'castigate', 'sordid', 'octogenarian'],
    correctAnswer: 'octogenarian',
  ),
  Question(
    id: '8',
    question: 'At the bottom of the beautiful wine bottle, only the __________ remained.',
    answers: ['solace', 'aspirant', 'dregs', 'frenzy', 'scurrilous'],
    correctAnswer: 'dregs',
  ),
  Question(
    id: '9',
    question: 'Stories of their __________ youth poured forth from the unhappy felons.',
    answers: ['tangible', 'laceration', 'castigate', 'sordid', 'octogenarian'],
    correctAnswer: 'sordid',
  ),
  Question(
    id: '10',
    question: 'In trying to offer __________ to the pilot\'s wife, the reporter inadvertently* made the situation worse.',
    answers: ['solace', 'aspirant', 'dregs', 'frenzy', 'scurrilous'],
    correctAnswer: 'solace',
  ),
];

List<Question> question9 = [
  Question(
    id: '1',
    question: 'When the plague was __________ on the island, Dr. Arrowsmith\'s wife died.',
    answers: ['rampant', 'inane', 'ethics', 'concur', 'clandestine'],
    correctAnswer: 'rampant',
  ),
  Question(
    id: '2',
    question: 'The __________ was caught with his fingers in the cookie jar.',
    answers: ['flagrant', 'admonish', 'duress', 'culprit', 'inexorable'],
    correctAnswer: 'culprit',
  ),
  Question(
    id: '3',
    question: 'The spies thought their meeting was a __________ one, but a throng of F.B.I. agents gathered outside thebuilding.',
    answers: ['rampant', 'inane', 'ethics', 'concur', 'clandestine'],
    correctAnswer: 'clandestine',
  ),
  Question(
    id: '4',
    question: 'Television sleuths are __________ in their pursuit of lawbreakers.',
    answers: ['flagrant', 'admonish', 'duress', 'culprit', 'inexorable'],
    correctAnswer: 'inexorable',
  ),
  Question(
    id: '5',
    question: 'A special management committee was asked to investigate business __________.',
    answers: ['rampant', 'inane', 'ethics', 'concur', 'clandestine'],
    correctAnswer: 'ethics',
  ),
  Question(
    id: '6',
    question: 'The confession was signed under __________, the attorney claimed.',
    answers: ['flagrant', 'admonish', 'duress', 'culprit', 'inexorable'],
    correctAnswer: 'duress',
  ),
  Question(
    id: '7',
    question: 'Orville Wright was criticized for his __________ desire to fly.',
    answers: ['rampant', 'inane', 'ethics', 'concur', 'clandestine'],
    correctAnswer: 'inane',
  ),
  Question(
    id: '8',
    question: 'I suspect that my father will __________ me for coming home late.',
    answers: ['flagrant', 'admonish', 'duress', 'culprit', 'inexorable'],
    correctAnswer: 'admonish',
  ),
  Question(
    id: '9',
    question: 'If I can get my parents to __________, I\'ll join the Peace Corps.',
    answers: ['rampant', 'inane', 'ethics', 'concur', 'clandestine'],
    correctAnswer: 'concur',
  ),
  Question(
    id: '10',
    question: 'Parking in front of a hydrant is a __________ violation of the city\'s law.',
    answers: ['flagrant', 'admonish', 'duress', 'culprit', 'inexorable'],
    correctAnswer: 'flagrant',
  ),
];


List<Question> question10 = [
  Question(
    id: '1',
    question: ' The bank teller\'s __________ error was difficult to correct.',
    answers: ['egregious', 'distraught', 'duplicity', 'acrimonious', 'paucity'],
    correctAnswer: 'egregious',
  ),
  Question(
    id: '2',
    question: 'The border guards allowed the doctor to cross the frontier with __________.',
    answers: ['elicit', 'pernicious', 'tolerate', 'construe', 'impunity'],
    correctAnswer: 'impunity',
  ),
  Question(
    id: '3',
    question: 'We tried to ignore her __________ comments, but that took considerable restraint.',
    answers: ['egregious', 'distraught', 'duplicity', 'acrimonious', 'paucity'],
    correctAnswer: 'acrimonious',
  ),
  Question(
    id: '4',
    question: 'It isn\'t easy to __________ answers from a sleepy class on Monday morning.',
    answers: ['elicit', 'pernicious', 'tolerate', 'construe', 'impunity'],
    correctAnswer: 'elicit',
  ),
  Question(
    id: '5',
    question: '__________ is the stock in trade of all adroit* counterspies.',
    answers: ['egregious', 'distraught', 'duplicity', 'acrimonious', 'paucity'],
    correctAnswer: 'duplicity',
  ),
  Question(
    id: '6',
    question: 'Dentists appreciate patients who can __________ pain.',
    answers: ['elicit', 'pernicious', 'tolerate', 'construe', 'impunity'],
    correctAnswer: 'tolerate',
  ),
  Question(
    id: '7',
    question: 'Although it was a creative writing class, the teacher complained about the __________ of talent there.',
    answers: ['egregious', 'distraught', 'duplicity', 'acrimonious', 'paucity'],
    correctAnswer: 'paucity',
  ),
  Question(
    id: '8',
    question: 'She hoped that we would not __________ her decision to run for office as a thirst for power.',
    answers: ['elicit', 'pernicious', 'tolerate', 'construe', 'impunity'],
    correctAnswer: 'construe',
  ),
  Question(
    id: '9',
    question: 'The soldiers were __________ to learn that their furloughs had been canceled.',
    answers: ['egregious', 'distraught', 'duplicity', 'acrimonious', 'paucity'],
    correctAnswer: 'distraught',
  ),
  Question(
    id: '10',
    question: 'The dictator\'s __________ rules failed to intimidate* the leaders of the underground.',
    answers: ['elicit', 'pernicious', 'tolerate', 'construe', 'impunity'],
    correctAnswer: 'pernicious',
  ),
];

List<Question> question11 = [
  Question(
    id: '1',
    question: 'Some prisoners planned a disturbance while others would __________ toward the gate.',
    answers: ['affluent', 'feasible', 'discern', 'sally', 'consternation'],
    correctAnswer: 'sally',
  ),
  Question(
    id: '2',
    question: 'The children in Shakespeare\'s plays are so __________ that they all sound like grandparents.',
    answers: ['precocious', 'perfunctory', 'chagrin', 'perverse', 'deride'],
    correctAnswer: 'precocious',
  ),
  Question(
    id: '3',
    question: 'Under duress* from the tax officer, the beggar admitted that he was truly __________.',
    answers: ['affluent', 'feasible', 'discern', 'sally', 'consternation'],
    correctAnswer: 'affluent',
  ),
  Question(
    id: '4',
    question: 'Edith gave only __________ attention to the new millennium, skipping our New Year\'s Eve party.',
    answers: ['precocious', 'perfunctory', 'chagrin', 'perverse', 'deride'],
    correctAnswer: 'perfunctory',
  ),
  Question(
    id: '5',
    question: 'To the __________ of the sergeant, there was a paucity* of volunteers for the dangerous mission.',
    answers: ['affluent', 'feasible', 'discern', 'sally', 'consternation'],
    correctAnswer: 'consternation',
  ),
  Question(
    id: '6',
    question: 'The Wright brothers didn\'t become distraught* when a skeptic would __________ their work.',
    answers: ['precocious', 'perfunctory', 'chagrin', 'perverse', 'deride'],
    correctAnswer: 'deride',
  ),
  Question(
    id: '7',
    question: 'It\'s __________ to build an electric auto, but wouldn\'t you need a terribly long extension cord?',
    answers: ['affluent', 'feasible', 'discern', 'sally', 'consternation'],
    correctAnswer: 'feasible',
  ),
  Question(
    id: '8',
    question: 'When I correct my kid brother\'s math errors, he is __________ enough to insist that he is right.',
    answers: ['precocious', 'perfunctory', 'chagrin', 'perverse', 'deride'],
    correctAnswer: 'perverse',
  ),
  Question(
    id: '9',
    question: 'When we could __________ the city lights, we knew we were safe at last.',
    answers: ['affluent', 'feasible', 'discern', 'sally', 'consternation'],
    correctAnswer: 'discern',
  ),
  Question(
    id: '10',
    question: 'To the __________ of many taxpayers, some citizens seem to cheat the government with impunity.',
    answers: ['precocious', 'perfunctory', 'chagrin', 'perverse', 'deride'],
    correctAnswer: 'chagrin',
  ),
];

List<Question> question12 = [
  Question(
    id: '1',
    question: 'The paradox* is that Javert\'s inexorable pursuit of Jean Valjean was both __________ and despicable.',
    answers: ['disparage', 'laudable', 'fiasco', 'masticate', 'eschew'],
    correctAnswer: 'laudable',
  ),
  Question(
    id: '2',
    question: 'When the duplicity was revealed, the jury became __________ about Ed\'s innocence.',
    answers: ['quell', 'voluble', 'confidant', 'obsolescence', 'dubious'],
    correctAnswer: 'dubious',
  ),
  Question(
    id: '3',
    question: 'The affluent* storeowner __________ the efforts of his small competitor, saying that he could always tolerate* that kind of rivalry.',
    answers: ['disparage', 'laudable', 'fiasco', 'masticate', 'eschew'],
    correctAnswer: 'disparage',
  ),
  Question(
    id: '4',
    question: 'In order to __________ the riot, the police sallied forth with tear gas.',
    answers: ['quell', 'voluble', 'confidant', 'obsolescence', 'dubious'],
    correctAnswer: 'quell',
  ),
  Question(
    id: '5',
    question: 'To aid in digestion, you must __________ each piece of meat one dozen times.',
    answers: ['disparage', 'laudable', 'fiasco', 'masticate', 'eschew'],
    correctAnswer: 'masticate',
  ),
  Question(
    id: '6',
    question: 'A teenage boy\'s father should be his true __________.',
    answers: ['quell', 'voluble', 'confidant', 'obsolescence', 'dubious'],
    correctAnswer: 'confidant',
  ),
  Question(
    id: '7',
    question: 'In an acrimonious letter, her father described the project as a complete __________.',
    answers: ['disparage', 'laudable', 'fiasco', 'masticate', 'eschew'],
    correctAnswer: 'fiasco',
  ),
  Question(
    id: '8',
    question: 'The __________ built into many products could be regarded as a flagrant* insult toward the duped* consumer.',
    answers: ['quell', 'voluble', 'confidant', 'obsolescence', 'dubious'],
    correctAnswer: 'obsolescence',
  ),
  Question(
    id: '9',
    question: 'Once he sought the limelight, but now he __________ all interviews.',
    answers: ['disparage', 'laudable', 'fiasco', 'masticate', 'eschew'],
    correctAnswer: 'eschew',
  ),
  Question(
    id: '10',
    question: ' I could not doze in the chair because of the __________ barber.',
    answers: ['quell', 'voluble', 'confidant', 'obsolescence', 'dubious'],
    correctAnswer: 'voluble',
  ),
];

List<Question> question13 = [
  Question(
    id: '1',
    question: 'The detective was __________ in his search for the murder weapon.',
    answers: ['implacable', 'paroxysm', 'reprehensible', 'jurisdiction', 'skirmish'],
    correctAnswer: 'implacable',
  ),
  Question(
    id: '2',
    question: 'After the __________, the feuding families agreed to patch up their differences.',
    answers: ['harass', 'monolithic', 'arbitrary', 'indigent', 'fray'],
    correctAnswer: 'fray',
  ),
  Question(
    id: '3',
    question: 'Saying that it was beyond his __________, Judge Klein refused to rule on the case.',
    answers: ['implacable', 'paroxysm', 'reprehensible', 'jurisdiction', 'skirmish'],
    correctAnswer: 'jurisdiction',
  ),
  Question(
    id: '4',
    question: 'The __________ client was surprised when she was accosted* by her social worker in the elegant restaurant.',
    answers: ['harass', 'monolithic', 'arbitrary', 'indigent', 'fray'],
    correctAnswer: 'indigent',
  ),
  Question(
    id: '5',
    question: 'In a __________ of rage, the tenant stormed out of the landlord\'s office.',
    answers: ['implacable', 'paroxysm', 'reprehensible', 'jurisdiction', 'skirmish'],
    correctAnswer: 'paroxysm',
  ),
  Question(
    id: '6',
    question: 'To my mind the decision was unreasonable and __________.',
    answers: ['harass', 'monolithic', 'arbitrary', 'indigent', 'fray'],
    correctAnswer: 'arbitrary',
  ),
  Question(
    id: '7',
    question: 'The precocious boy enjoyed an intellectual __________ with his elders.',
    answers: ['implacable', 'paroxysm', 'reprehensible', 'jurisdiction', 'skirmish'],
    correctAnswer: 'skirmish',
  ),
  Question(
    id: '8',
    question: 'George Orwell\'s 1984 depicts a frightening, __________ government.',
    answers: ['harass', 'monolithic', 'arbitrary', 'indigent', 'fray'],
    correctAnswer: 'monolithic',
  ),
  Question(
    id: '9',
    question: 'The brash student was forced to apologize for her __________ conduct.',
    answers: ['implacable', 'paroxysm', 'reprehensible', 'jurisdiction', 'skirmish'],
    correctAnswer: 'reprehensible',
  ),
  Question(
    id: '10',
    question: ' If anonymous telephone callers __________ you, the phone company will give you an unlisted number.',
    answers: ['harass', 'monolithic', 'arbitrary', 'indigent', 'fray'],
    correctAnswer: 'harass',
  ),
];