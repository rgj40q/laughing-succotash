# §0 INTRODUCTION

Laughing Succotash, or *succotashe ridel*, is a conlang project made to look like Interlingua IALA, while having a working LALR-parser.

# §1 SPELLING AND PRONUNCIATION

// yet to be thought out...

# §2 MORPHOLOGY

## §2.1

A word belongs to one of the parts of speech. There are two types: open class and closed class. Open class are: verb, infinitive, gerund, noun, adverb type A, adverb type B, and appositive. Closed class are: articles, conjunctions, and numerals.

## §2.2

The open class parts of speech expect a word stem to be of one of four types: impersonal, intransitive, transitive, and transitive passive. The transitiveness is determined by the stem ending, no exceptions. All borrowed stems including proper names should be assimilated as one of types above. In most cases it just means to add 'e' to the last consonant, or to replace the last vowel with 'e'. A stem should not consist of sole ending. The endings are:
* -o      impersonal
    * *vento__t__* 'It is windy.'
* -e      intransitive
    * *platte* 'dish'
* -i      transitive
    * *cerci* 'one who looks for'
* -ia     transitive passive
    * *cercia* 'one that is looked for'

## §2.3

VERB is the only finite part of speech in a sentence. Verb has the following moods: indicative (present, past, and future), conditional, and imperative. The endings are:
-t      present
    *ventot* 'It is windy.'
    *ille dormet* 'He sleeps.'
    *one plattet* 'It is a dish.'
    *elle init francie* 'She is in France.'
    *me cercit le pome* 'I look for the apple.'
    *le pome cerciat me* 'The apple is looked for by me.'
-va     past
    *ventova* 'It was windy.'
    *ille dormeva* 'He sleeped.'
    *one platteva* 'It was a dish.'
    *elle iniva francie* 'She was in France.'
    *me cerciva le pome* 'I looked for the apple.'
    *le pome cerciava me* 'The apple was looked for by me.'
-ra     future
    *ventora* 'It will be windy.'
    *ille dormera* 'He will sleep.'
    *one plattera* 'It will be a dish.'
    *elle inira francie* 'She will be in France.'
    *me cercira le pome* 'I will look for the apple.'
    *le pome cerciara me* 'The apple will be looked for by me.'
-rea    conditional
    *ventorea* 'It would be windy.'
    *ille dormerea* 'He would sleep.'
    *one platterea* 'It would be a dish.'
    *elle inirea francie* 'She would be in France.'
    *me cercirea le pome* 'I would look for the apple.'
    *le pome cerciarea me* 'The apple would be looked for by me.'
-za     imperative
    *ventoza* 'Let it be windy!'
    *te dormeza* '\[You\] sleep!'
    *one platteza* 'May it be a dish!'
    *elle iniza francie* 'May she be is in France!'
    *nose cerciza le pome* 'Let us look for the apple!'
    *le pome cerciaza te* 'May the apple be looked for by you!'

## §2.4

INFINITIVE is derived from verb with meaning 'the act or process of <verb>ing'. The subject is dropped. Transitive infinitive should take a direct object. Impersonal infinitives are forbidden. The ending is -r.
    *dormer* 'to sleep'
    *platter* 'to be a dish.'
    *inir francie* 'to be in France'
    *cercir le pome* 'to look for the apple'
    *cerciar me* 'to be looked for by me'

## §2.5

Like infinitive, GERUND is derived from verb with meaning 'the act or process of <verb>ing'. Unlike infinitive, both the subject and object are dropped, if any, and impersonal gerunds are allowed. The endings are:
-nda    singular
    *ventonda* 'wind'
    *dormenda* 'the act of sleeping'
    *plattenda* 'the act of being a dish'
    *ininda* 'the act of being in something'
    *cercinda* 'the act of looking for'
    *cercianda* 'the act of being looked for'
-ndas   plural
    *ventondas* 'winds'
    *dormendas* 'the acts of sleeping'
    *plattendas* 'the acts of being a dish'
    *inindas* 'the acts of being in something'
    *cercindas* 'the acts of looking for'
    *cerciandas* 'the acts of being looked for'

## §2.6

NOUN is derived from verb with meaning 'the one who <verb>s'. Both the subject and object are dropped, if any. Impersonal nouns are forbidden. The endings are:
-       singular
    *dorme* 'one who sleeps'
    *platte* 'dish'
    *ini* 'one inside'
    *cerci* 'one who looks for'
    *cercia* 'one that is looked for'
-s      plural
    *dormes* 'those who sleep'
    *plattes* 'dishes'
    *inis* 'those inside'
    *cercis* 'those who look for'
    *cercias* 'those that are looked for'

Pronouns are equal to intransitive nouns, and are productive in the same way. They are:

                subj./obj.  reflex.     possess.
I               me          me          mie
you (sg.)       te          te          tue
we              nose        nose        nostre
you (pl.)       vose        vose        vostre
he              ille        se          sue
she             elle        se          sue
it, he, she     one         se          sue
they (masc.)    illes       se          lore
they (fem.)     elles       se          lore
they (neut.)    ones        se          lore

## §2.7

ADVERB TYPE A is derived from verb with meaning 'in a way/manner of <verb>ing, <verb>ingly'. It modifies verbs only. It has pretty free position in a sentence. Impersonal adverbs are forbidden. The ending is -n.
    *me __dormen__ promenet* 'I wander sleepily.' 
    *ille perdiva un die __cercin__ [color=#880000]le pome[/color]* 'He lost a day in searches for the apple.'
    *__inin__ [color=#880000]francie[/color] elle vivet* 'She lives in France.'

## §2.8

Like adverb type A, ADVERB TYPE B is derived from verb with meaning 'in a way/manner of <verb>ing, <verb>ingly'. Unlike adverb type A, it modifies infinitives, gerunds, nouns, adverbs, and appositives, and its position is strictly after the main word. There are two additional flavours of it: subadverb type B, and subsubadverb type B, which are used on lower levels of sentence. The levels will be discussed later. The endings are:
-m      adverb type B
    *un homine __verem__ odoret comin roses* 'A true man smells like roses.'
    *le vivenda __inim__ [color=#880000]francie[/color] laborioset* 'The life in France is hard-working.'
-f      subadverb type B
    *le homine essir bone multem [color=#880000]__assef__[/color]* 'The man is so very good.'
    *elle volit tentir [color=#880000]le vivenda __inif__[/color] [color=#FF0000]francie[/color]* 'She wants to try the life in France.'
-p      subsubadverb type B
    *le homine essir bone rarem [color=#880000]multef[/color] [color=#FF0000]__assatisep__[/color]* 'The man is pretty much exceptionally good.'

## §2.9

APPOSITIVE is a secondary noun, which describes the same thing as a main noun. It is derived from verb with meaning 'also/while being the one who <verb>s'. It is often translated as adjective in English. There are two additional flavours of it: subappositive and subsubappositive, which are used on lower levels of sentence.
-l      appositive
    *me incontrit un homine __bonel__* 'I meet a good man.'
    *me incontrit un homine __exil__ [color=#880000]francie[/color]* 'I meet a man from France.'
-h      subappositive
    *me volit incontrir [color=#880000]un homine __boneh__[/color]* 'I'd like to meet a good man.'
    *me volit incontrir [color=#880000]un homine __exih__[/color] [color=#FF0000]francie[/color]* 'I'd like to meet a man from France.'
-c      subsubappositive
    *me volit incontrir [color=#880000]un amice dih[/color] [color=#FF0000]un homine __bonec__[/color]* 'I'd like to meet a friend of a good man.'

## §2.10

ARTICLES are 'le' and 'un'.
le      definite
    *le patri*     the father
    *le matri*     the mother
    *le patris*    the fathers
    *le matris*    the mothers
un      indefinite
    *un patri*     a father
    *un matri*     a mother

## §2.11

CONJUNCTIONS are classified by the phrases they enumerate. There are just two core conjunctions *e* 'and' and *o* 'or', which may connect sentences and any of its parts, so they have many forms. All other conjunctions may only connect sentences and have one form. The endings are similar to the corresponding part of speech:

                            'and'   'or'    'but'   'so'    'for'
sentence                    e       o       ma      itaque  nam
argument                    er      or      -       -       -
subargument                 eri     ori     -       -       -
subsubargument              eru     oru     -       -       -
adverb type A phrase        en      on      -       -       -
adverb type B phrase        em      om      -       -       -
subadverb type B phrase     ef      of      -       -       -
subsubadverb type B phrase  ep      op      -       -       -
appositive phrase           el      ol      -       -       -
subappositive phrase        eh      oh      -       -       -
subsubappositive phrase     ec      oc      -       -       -

*ventot __e__ ille dormet* 'It is windy. He sleeps.'
*un catte __er__ un cane dormet* 'A cat and a dog sleep.'
*le catte dormet surin [color=#880000]le chaise __eri__ le sofe[/color]* 'The cat sleeps on the chair and on the sofa.'
*me volit incontrir [color=#880000]un homine exih[/color] [color=#FF0000]francie __oru__ germanie[/color]* 'I'd like to meet a man from France or Germany.'
*le catte dormet surin le chaise __en__ subin le sofe* 'The cat sleeps on the chair and under the sofa.
*me incontrit un homine bonel __el__ sagel* 'I meet a kind and wise man.'

*an*              whether
*annon*           or not
*atque*           and, and also, and even
*aut*             or
*comocunque*      however, in whatever manner
*donec*           1. while, as long as; 2. until, up to the time that
*dum*             1. while, as long as; 2. until; 3. provided that, if only
*dunque*          therefore
*e*               and
*et*              1. and; 2. also
*etsi*            1. even if; 2. and yet; 3. though, although
*igitur*          then, therefore, thereupon
*itaque*          and so, therefore
*ma*              but
*mais*            but
*malgrado*        in spite of
*nam*             for
*ne*              lest
*nec*             neither, nor, also not
*neque*           = nec
*ni*              1. that not; 2. neither, nor, also not
*nisi*            if not, unless
*o*               or;
*perque*          1. why (= for what reason); 2. because
*pois*            for;
*porque*          1. why (= for what reason); 2. because
*postquam*        after, as soon as
*proque*          1. why (= for what reason); 2. because
*quam*            as, than
*quando*          when
*quandocunque*    whenever
*que*             1. that; 2. than
*quia*            because
*quo*             so that, in
*quod*            that, because, why
*sed*             but
*si*              if (1. supposing that; 2. whether)
*sinon*           otherwise, else; except, save, if not, unless
*sive*            or if, or
*ubi*             where; when, as
*ubicunque*       wherever
*utrum*           whether
*vel*             or, or rather

## §2.12

NUMERALS are:
    zero            0
    uni             1
    duo             2
    tres            3
    quatro          4
    cinque          5
    sex             6
    septe           7
    octo            8
    nove            9
    dece            10
    vinti           20
    trenta          30
    quaranta        40
    cinquanta       50
    sexanta         60
    septanta        70
    octanta         80
    novanta         90
    cento           100
    mille           1000
    million         1E6
    milliardo       1E9
    billion         1E12
    billiardo       1E15
    trillion        1E18
    trilliardo      1E21
    quatrillion     1E24
    quatrilliardo   1E27
    quintillion     1E30
    quintilliardo   1E33
    di              divided by (e.g. '2/3')
    plus            and (e.g. '5 2/3')
    comma           decimal point (e.g. '3,14')
    lu              introductory article for numerals

# §3 SYNTAX

## §3.1

A TEXT may consist of one or more sentences. Sentences are obligatorily separated by sentence conjunction 'et'.
    *ventot* 'It is windy.'
    *ventot e ille dormet* 'It is windy. He sleeps.'
A sentence conjunction may optionally go in the beginning of text.
    *ma ventot e ille dormet* 'But it is windy. And he sleeps.'

## §3.2

SENTENCE phrase order is limited to the point that subject precedes object. Otherwise it's free:
    impersonal: V
        *ventot* 'It is windy.'
    intransitive: SV, VS
        *ille dormet* 'He sleeps.'
        *dormet ille* 'He sleeps.'
    transitive: SVO, SOV, VSO
        *me amit te* 'I love you.'
        *me te amit* 'I love you.'
        *amit me te* 'I love you.'
where V is verb, S is subject, or the first argument, and O is object, or the second argument. One may drop neither subject, nor object, which are all obligatory. One may use dummy noun 'une' instead to leave an argument unspecified.
    *te une amiza e te une amiaza* 'Love and be loved!'
The sentence may be extended with adverb type A phrases in any place before, after, and between arguments and verb, e.g.:
    *maximen me te amit* 'I love you very much.'
    *me maximen te amit* 'I love you very much.'
    *me te maximen amit* 'I love you very much.'
    *me te amit maximen* 'I love you very much.'
    *amit me maximen te* 'I love you very much.'
    etc.
where A is adverb-type-A phrase.

## §3.3

ARGUMENT is either single noun/infinitive/gerund phrase, or multiple with parts separated by argument conjunction 'er'. Each may begin with an article ('le' or 'un').
    // to do: examples
Similarly, SUBARGUMENTS are separated by subargument conjunction 'eri'.
    // to do: examples
Similarly, SUBSUBARGUMENTS are separated by subsubargument conjunction 'eru'.
    // to do: examples

## §3.4

NOUN PHRASE consists of a main phrase, then optional adverb type B phrase, and then optional appositive phrase. Main phrase is either a noun (one word), or a numeral (one or many words).
    // to do: examples
Similarly, NOUN SUBPHRASE consists of a main phrase, then optional adverb type B subphrase, and then optional appositive subphrase.
    // to do: examples
Similarly, NOUN SUBSUBPHRASE consists of a main phrase, then optional adverb type B subsubphrase, and then optional appositive subsubphrase.
    // to do: examples
Main phrase is either a noun, or a gerund, or a numeral phrase. Syntactically gerunds are equal to nouns. If one needs to specify arguments of the source verb in the gerund, there are prepositional adverbs 'perim' for subject and 'dim' for object:
    // to do: examples
Other prepositionals may be retained:
// to do: examples I give a book to you, my giving of a book to you

## §3.5

There are two types of INFINITIVE PHRASES. The first consists of an intransitive infinitive, optionally followed by an adverb type B phrase.
    // to do: examples
The second type consists of transitive infinitive, optionally followed by an adverb type B phrase, and then (obligatory) subargument phrase.
    // to do: examples
Note the level shift, this is being done to distinguish adverb phrase for the main word and adverb phrase for the dependent words.
    // to do: examples
Similarly, INFINITIVE SUBPHRASE is one of two types. The first consists of an intransitive infinitive, optionally followed by an adverb type B subphrase.
    // to do: examples
The second type consists of transitive infinitive, optionally followed by an adverb type B subphrase, and then (obligatory) subsubargument phrase.
    // to do: examples
Note however that INFINITIVE SUBSUBPHRASE may only consist of intransitive infinitive, optionally followed by an adverb type B subsubphrase. The limitation is there because a phrase may not extend anymore through arguments.
    // to do: examples

## §3.6

APPOSITIVE PHRASE may be single or multiple. If multiple, parts may be separated with appositive conjunction 'el', and if they are, there may be an appositive conjunction in the beginning.
    // to do: examples
Each single is of two types. The first consists of intransitive appositive, optionally followed by an adverb type B phrase.
    // to do: examples
The second consists of transitive appositive, then optional adverb type B phrase, then obligatory subargument (note the level shift). This may be translated as a phrase with preposition or as a participle phrase in English.
    // to do: examples
Similarly, APPOSITIVE SUBPHRASE may be separated with subappositive conjunction 'eh', and each single is of two types. The first consists of intransitive subappositive, optionally followed by an adverb type B subphrase. The second consists of transitive subappositive, then optional adverb type B subphrase, then obligatory subsubargument (note the level shift).
    // to do: examples
Like infinitive subsubphrase, there is only one single APPOSITIVE SUBSUBPHRASE, which consists of intransitive subsubappositive, optionally followed by an adverb type B subsubphrase. The limitation is there because a phrase may not extend anymore through arguments. Multiple has parts separated with subsubappositive conjunction 'ec'.
    // to do: examples

## §3.7

Like appositive, ADVERB A PHRASE may be single or multiple. Unlike appositive, it modifies the word itself, while appositive additionally describes the thing described by the word.
    // to do: examples
If multiple, parts may be separated with adverb A conjunction 'en', and if they are, there may be an adverb A conjunction in the beginning.
    // to do: examples
Each single is of two types. The first consists of intransitive adverb type A, optionally followed by an adverb type B phrase.
    // to do: examples
The second consists of transitive adverb type A, then optional adverb type B phrase, then obligatory subargument (note the level shift).
    // to do: examples

## §3.8

Like adverb A, ADVERB B PHRASE may be single or multiple. If multiple, parts may be separated with adverb B conjunction 'em', and if they are, there may be an adverb B conjunction in the beginning.
    // to do: examples
Each single is of two types. The first consists of intransitive adverb type B, optionally followed by an adverb type B subphrase.
    // to do: examples
The second consists of transitive adverb type B, then optional adverb type B phrase, then obligatory subargument (note the level shift).
    // to do: examples
Similarly, ADVERB B SUBPHRASE may be single or multiple. If multiple, parts may be separated with subadverb B conjunction 'ef', and if they are, there may be an subadverb B conjunction in the beginning.
    // to do: examples
Each single is of two types. The first consists of intransitive subadverb type B, optionally followed by an adverb type B subsubphrase.
    // to do: examples
The second consists of transitive subadverb type A, then optional adverb type B subsubphrase, then obligatory subsubargument (note the level shift).
    // to do: examples
Like infinitive subsubphrase, there is only one single ADVERB TYPE B SUBSUBPHRASE, which consists of intransitive subsubadverb type B. Multiple has parts separated with subsubadverb type B conjunction 'ep'.
    // to do: examples

## §3.9

NUMERAL behaves very much like in european languages except that is should start with article 'lu'.
    lu zero                     number 0
    lu uni                      number 1
    lu duo                      number 2
    lu tres                     number 3
    lu quatro                   number 4
    lu vinti cinque             number 25
    // to do: longer numerals, quintilliards...
    lu sex di nove              number 6/9
    lu cinque plus duo di septe number 5 2/7
    lu sex comma tres cinque    number 6.35

Syntactically a numeral is a noun, and in order to use it in sentence a few auxilliary words exist:
    uplil       N times multiplied
    enin        in a group of N
    mentin      as a matter number N
    dim         N of X, e.g. million [of] apples
    esimil      X number N, e.g. apple number two

Cardinal:
    lu uni dim cose             one thing
    lu duo dim coses            two things
    lu tres dim coses           three things
    lu quatro dim coses         four things
    lu vinti cinque dim coses   twenty five things

Decimal:
    lu sex comma tres cinque dim dollares     6.35 dollars

Ordinal:
    cose esimil lu uni          the first thing
    cose esimil lu duo          the second thing
    cose esimil lu tres         the third thing

Fractional:
    lu uni di uni dim cose                  whole thing
    lu uni di duo dim cose                  half of a thing
    lu uni di tres dim cose                 one third of a thing
    lu uni di quatro dim cose               quarter of a thing
    lu uni di vinti cinque dim cose         one twenty-fifth of a thing
    lu sex di nove dim cose                 six ninths of a thing
    lu cinque plu duo di septe dim coses    five and two seventh things

Multiplicative:
    platte uplil lu uni                 single dish
    platte uplil lu duo                 double dish
    platte uplil lu tres                triple dish
    platte uplil lu quatro              quadruple dish
    platte uplil lu vinti cinque        twenty-fivefold dish

Collective:
    illes arrivet enin lu uni             They arrive in one by one.
    illes arrivet enin lu duo             They arrive in pairs.
    illes arrivet enin lu tres            They arrive in triads.
    illes arrivet enin lu quatro          They arrive in groups of 4.
    illes arrivet enin lu vinti cinque    They arrive in groups of 25.

Adverbial:
    mentin lu uni               first(-ly)
    mentin lu duo               second
    mentin lu tres              third
    mentin lu vinti cinque      twenty fifth

# §4 EXAMPLES

to do: usage notes, questions, translate examples from IALA
