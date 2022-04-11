List<QuestionModelBest> ques1 = [
  
  QuestionModelBest(
      "The huge football player had a (voracious, replete) appetite.", {
    "voracious": true,
    "replete": false,
  }),
  QuestionModelBest(
      "After a seemingly (interminable, indiscriminate) wait, the surgeon came to give us the news.", {
    "interminable": true,
    "indiscriminate": false,
  }),
  QuestionModelBest(
      "Without a (paradox, tinge) of evidence, the coroner could not solve the murder.", {
    "paradox": false,
    "tinge": true,
  }),
  QuestionModelBest(
      "In the (realm, annals) of the blind, the one-eyed man is king.", {
    "realm": true,
    "annals": false,
  }),
  QuestionModelBest(
      "We invited the (eminent, steeped) engineer to address our club.", {
    "eminent": true,
    "steeped": false,
  }),
  QuestionModelBest(
      "In the Catskill Mountains, the woods (abound, implore) with deer.", {
    "abound": true,
    "implore": false,
  }),
  QuestionModelBest(
      "I cannot (perceive, prognosticate) why people voted for the corrupt senator.", {
    "perceive": true,
    "prognosticate": false,
  }),
  QuestionModelBest(
      "Night and day my kid brother (badgers, compounds) me for money.", {
    "badgers": true,
    "compounds": false,
  }),
  QuestionModelBest(
      "Science fiction movies usually feature (annals, automatons).", {
    "annals": false,
    "automatons": true,
  }),
  QuestionModelBest(
      "With his expertise in (drudgery, technology), my uncle is able to earn a good salary.", {
    "drudgery": false,
    "technology": true,
  }),
];

List<QuestionModelBest> ques2 = [
  QuestionModelBest(
      "We were impressed with the new maid because she cleaned the house with (alacrity, solace).", {
    "alacrity": true,
    "solace": false,
  }),
  QuestionModelBest(
      "All (aspirants, lacerations) for the basketball team must come to practice today.", {
    "aspirants": true,
    "lacerations": false,
  }),
  QuestionModelBest(
      "Once he was a millionaire, but today he can be found among the (dregs, octogenarians) of society.", {
    "dregs": true,
    "octogenarians": false,
  }),
  QuestionModelBest(
      "The newspaper specialized in printing the (sordid, brash) details of crime in the city.", {
    "sordid": true,
    "brash": false,
  }),
  QuestionModelBest(
      "After finding the (pugnacious, tangible) evidence in his drawer, Roger took it to the police.", {
    "pugnacious": true,
    "tangible": false,
  }),
  QuestionModelBest(
      "The normally (scurrilous, belligerent) police dog was unusually quiet this morning.", {
    "scurrilous": false,
    "belligerent": true,
  }),
  QuestionModelBest(
      "Bobby, who was extremely modest, always (belittled, castigated) his own achievements.", {
    "belittled": true,
    "castigated": false,
  }),
  QuestionModelBest(
      "Treated with (frenzy, disdain) by his stepfather, Artie grew closer to his natural father.", {
    "frenzy": false,
    "disdain": true,
  }),
  QuestionModelBest(
      "When the results of the bar exam were (intimidated, promulgated) Adele saw that she had passed handsomely.", {
    "intimidated": false,
    "promulgated": true,
  }),
  QuestionModelBest(
      "I used to (scoff, feint) at Hank's stories of the fish he had caught, but he made a believer out of me.", {
    "scoff": true,
    "feint": false,
  }),
];


List<QuestionModelBest> ques3 = [
  QuestionModelBest(
      "During my first weeks at the new school I observed that cheating was (rampant, ethics)", {
    "rampant": true,
    "ethics": false,
  }),
  QuestionModelBest(
      "I had always considered it rather (concur, inane) to cheat on a test because so much was at stake. ", {
    "concur": false,
    "inane": true,
  }),
  QuestionModelBest(
      "A caustic editorial referred to the school\'s decision as (arbitrary, monolithic) and inane.", {
    "arbitrary": true,
    "monolithic": false,
  }),
  QuestionModelBest(
      "The Civil Liberties Union jumped into the (indigent, fray) with a court order stipulating* that the principal be required to show cause why the boys should not be allowed to return to class", {
    "indigent": false,
    "fray": true,
  }),
  QuestionModelBest(
      "The school would reprimand the boys for their (reprehensible, implacable) appearance and order them to cut their hair or be suspended.", {
    "reprehensible": true,
    "implacable": false,
  }),
  QuestionModelBest(
      "What had started as a local (skirmish, paroxysm) now began to take on the appearance of a full-scale war.", {
    "skirmish": true,
    "paroxysm": false,
  }),
  QuestionModelBest(
      "What had started as a local (skirmish, paroxysm) now began to take on the appearance of a full-scale war.", {
    "skirmish": true,
    "paroxysm": false,
  }),
  QuestionModelBest(
      "A (confidant, voluble) economist informed me that such products will never be marketed.", {
    "confidant": false,
    "voluble": true,
  }),
  QuestionModelBest(
      " I am (dubious, quell) about the existence of those perfect products, but then I'm from Missouri.", {
    "dubious": true,
    "quell": false,
  }),
  QuestionModelBest(
      "To the (consternation, sally) of the umbrella manufacturers, it has been enjoying a brisk sale, especially among commuters.", {
    "consternation": true,
    "sally": false,
  }),


];



class QuestionModelBest {
  String? question;
  Map<String, bool>? answers;
  QuestionModelBest(this.question, this.answers);
}