# §0 INTRODUCTION

Laughing Succotash, or *succotashe ridel*, is a conlang project made to look like Interlingua IALA, while having a working LALR parser. The parser does not translate at the moment, but it shows the full text structure as a tree.

# §1 SPELLING AND PRONUNCIATION

The LETTERS used are the conventional twenty-six letters of the Roman alphabet. There are no extra signs and symbols to indicate stress and pronunciation and no punctuation.

// to do: pronunciation

# §2 MORPHOLOGY

## §2.1

A word belongs to one of the parts of speech. There are two types: open class and closed class. Open class are: verb, infinitive, gerund, noun, adverb type A, adverb type B, and appositive. Closed class are: articles, conjunctions, and numerals.

## §2.2

The open class parts of speech expect a word stem to be of one of four types: impersonal, intransitive, transitive, or transitive passive. The transitiveness is determined by the stem ending, no exceptions. All borrowed stems including proper names should be assimilated as one of types above. In most cases it just means to add *e* after the final consonant, or to replace the final vowel with *e*. A stem should not consist of sole ending. The endings are:
* *-o*, impersonal
    * *vento-* 'wind'
* *-e*, intransitive
    * *platte-* 'dish'
* *-i*, transitive
    * *cerci-* 'look for'
* *-ia*, transitive passive
    * *cercia-* 'be looked for'

## §2.3

VERB is the only finite part of speech in a sentence. Verb has the following moods: indicative (present, past, and future), conditional, and imperative. The endings are:
* *-t*, present
    * *ventot* 'It is windy.'
    * *ille dormet* 'He sleeps.'
    * *one plattet* 'It is a dish.'
    * *elle init francie* 'She is in France.'
    * *me cercit le pome* 'I look for the apple.'
    * *le pome cerciat me* 'The apple is looked for by me.'
* *-va*, past
    * *ventova* 'It was windy.'
    * *ille dormeva* 'He sleeped.'
    * *one platteva* 'It was a dish.'
    * *elle iniva francie* 'She was in France.'
    * *me cerciva le pome* 'I looked for the apple.'
    * *le pome cerciava me* 'The apple was looked for by me.'
* *-ra*, future
    * *ventora* 'It will be windy.'
    * *ille dormera* 'He will sleep.'
    * *one plattera* 'It will be a dish.'
    * *elle inira francie* 'She will be in France.'
    * *me cercira le pome* 'I will look for the apple.'
    * *le pome cerciara me* 'The apple will be looked for by me.'
* *-rea*, conditional
    * *ventorea* 'It would be windy.'
    * *ille dormerea* 'He would sleep.'
    * *one platterea* 'It would be a dish.'
    * *elle inirea francie* 'She would be in France.'
    * *me cercirea le pome* 'I would look for the apple.'
    * *le pome cerciarea me* 'The apple would be looked for by me.'
* *-za*, imperative
    * *ventoza* 'Let it be windy!'
    * *te dormeza* '\[You\] sleep!'
    * *one platteza* 'May it be a dish!'
    * *elle iniza francie* 'May she be is in France!'
    * *nose cerciza le pome* 'Let us look for the apple!'
    * *le pome cerciaza te* 'May the apple be looked for by you!'

## §2.4

INFINITIVE is derived from verb with meaning 'the act or process of \[verb\]ing'. The subject is dropped. Transitive infinitive should take a direct object. Impersonal infinitives are forbidden. The ending is -r.
* *dormer* 'to sleep'
* *platter* 'to be a dish'
* *inir francie* 'to be in France'
* *cercir le pome* 'to look for the apple'
* *cerciar me* 'to be looked for by me'

## §2.5

Like infinitive, GERUND is derived from verb with meaning 'the act or process of \[verb\]ing'. Unlike infinitive, both the subject and object are dropped, if any, and impersonal gerunds are allowed. The endings are:
* *-nda*, singular
    * *ventonda* 'wind'
    * *dormenda* 'the act of sleeping'
    * *plattenda* 'the act of being a dish'
    * *ininda* 'the act of being in something'
    * *cercinda* 'the act of looking for'
    * *cercianda* 'the act of being looked for'
* *-ndas*, plural
    * *ventondas* 'winds'
    * *dormendas* 'the acts of sleeping'
    * *plattendas* 'the acts of being a dish'
    * *inindas* 'the acts of being in something'
    * *cercindas* 'the acts of looking for'
    * *cerciandas* 'the acts of being looked for'

## §2.6

NOUN is derived from verb with meaning 'the one who \[verb\]s'. Both the subject and object are dropped, if any. Impersonal nouns are forbidden. The endings are:
* *-∅*, singular
    * *dorme* 'one who sleeps'
    * *platte* 'dish'
    * *ini* 'one inside'
    * *cerci* 'one who looks for'
    * *cercia* 'one that is looked for'
* *-s*, plural
    * *dormes* 'those who sleep'
    * *plattes* 'dishes'
    * *inis* 'those inside'
    * *cercis* 'those who look for'
    * *cercias* 'those that are looked for'

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

ADVERB TYPE A is derived from verb with meaning 'in a way/manner of \[verb\]ing, \[verb\]ingly'. It modifies verbs only. It has pretty free position in a sentence. Impersonal adverbs are forbidden. The ending is -n.
* *me __dormen__ promenet* 'I wander sleepily.' 
* *ille perdiva un die __cercin__ le pome* 'He lost a day in searches for the apple.'
* *__inin__ francie elle vivet* 'She lives in France.'

## §2.8

Like adverb type A, ADVERB TYPE B is derived from verb with meaning 'in a way/manner of \[verb\]ing, \[verb\]ingly'. Unlike adverb type A, it modifies infinitives, gerunds, nouns, adverbs, and appositives, and its position is strictly after the main word. There are two additional flavours of it: subadverb type B, and subsubadverb type B, which are used on lower levels of sentence. Levels are discussed in §3 "Syntax". The endings are:
* *-m*, adverb type B
    * *un homine __verem__ odoret comin roses* 'A true man smells like roses.'
    * *le vivenda __inim__ francie laborioset* 'The life in France is hard-working.'
* *-f*, subadverb type B
    * *le homine essir bone multem __assef__* 'The man is so very good.'
    * *elle volit tentir le vivenda __inif__ francie* 'She wants to try the life in France.'
* *-p*, subsubadverb type B
    * *le homine essit bone rarem multef __assatisep__* 'The man is pretty much exceptionally good.'

## §2.9

APPOSITIVE is a secondary noun, which describes the same thing as a main noun. It is derived from verb with meaning 'also/while being the one who \[verb\]s'. It is often translated as adjective in English. There are two additional flavours of it: subappositive and subsubappositive, which are used on lower levels of sentence.
* *-l*, appositive
    * *me incontrit un homine __bonel__* 'I meet a good man.'
    * *me incontrit un homine __exil__ francie* 'I meet a man from France.'
* *-h*, subappositive
    * *me volit incontrir un homine __boneh__* 'I'd like to meet a good man.'
    * *me volit incontrir un homine __exih__ francie* 'I'd like to meet a man from France.'
* *-c*, subsubappositive
    * *me volit incontrir un amici dih un homine __bonec__* 'I'd like to meet a friend of a good man.'

## §2.10

ARTICLES are *le* and *un*.
* *le*, definite
    * *le patri* 'the father'
    * *le matri* 'the mother'
    * *le patris* 'the fathers'
    * *le matris* 'the mothers'
* *un*, indefinite
    * *un patri* 'a father'
    * *un matri* 'a mother'

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

For exmaple:
* *ventot __e__ ille dormet* 'It is windy. He sleeps.'
* *un catte __er__ un cane dormet* 'A cat and a dog sleep.'
* *le catte dormet surin le chaise __eri__ le sofe* 'The cat sleeps on the chair and on the sofa.'
* *me volit incontrir un homine exih francie __oru__ germanie* 'I'd like to meet a man from France or Germany.'
* *le catte dormet surin le chaise __en__ subin le sofe* 'The cat sleeps on the chair and under the sofa.
* *me incontrit un homine bonel __el__ sagel* 'I meet a kind and wise man.'

Full list of conjunctions:

        an              whether
        annon           or not
        atque           and, and also, and even
        aut             or
        comocunque      however, in whatever manner
        donec           1. while, as long as; 2. until, up to the time that
        dum             1. while, as long as; 2. until; 3. provided that, if only
        dunque          therefore
        e               and
        et              1. and; 2. also
        etsi            1. even if; 2. and yet; 3. though, although
        igitur          then, therefore, thereupon
        itaque          and so, therefore
        ma              but
        mais            but
        malgrado        in spite of
        nam             for
        ne              lest
        nec             neither, nor, also not
        neque           = nec
        ni              1. that not; 2. neither, nor, also not
        nisi            if not, unless
        o               or;
        perque          1. why (= for what reason); 2. because
        pois            for;
        porque          1. why (= for what reason); 2. because
        postquam        after, as soon as
        proque          1. why (= for what reason); 2. because
        quam            as, than
        quando          when
        quandocunque    whenever
        que             1. that; 2. than
        quia            because
        quo             so that, in
        quod            that, because, why
        sed             but
        si              if (1. supposing that; 2. whether)
        sinon           otherwise, else; except, save, if not, unless
        sive            or if, or
        ubi             where; when, as
        ubicunque       wherever
        utrum           whether
        vel             or, or rather

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
        di              divided by      e.g. 2/3
        plus            and             e.g. 5 2/3
        comma           decimal point   e.g. 3,14
        lu              introductory article for numerals

# §3 SYNTAX

## §3.1

A TEXT may consist of one or more sentences. Sentences are obligatorily separated by sentence conjunction, e.g. *e*, *et*.
* *ventot* 'It is windy.'
* *ventot e ille dormet* 'It is windy. He sleeps.'
A sentence conjunction may optionally go in the beginning of text.
* *ma ventot e ille dormet* 'But it is windy. And he sleeps.'

## §3.2

SENTENCE phrase order is limited to the point that subject precedes object. Otherwise it's free:
* impersonal: V
    * *ventot* 'It is windy.'
* intransitive: SV, VS
    * *ille dormet* 'He sleeps.'
    * *dormet ille* 'He sleeps.'
* transitive: SVO, SOV, VSO
    * *me amit te* 'I love you.'
    * *me te amit* 'I love you.'
    * *amit me te* 'I love you.'
    
where V is verb, S is subject, or the first argument, and O is object, or the second argument. One may drop neither subject, nor object, which are all obligatory. One may use dummy noun 'une' instead to leave an argument unspecified.
* *te une amiza e te une amiaza* 'Love and be loved!'

The sentence may be extended with adverb type A phrase in any place before, after, and between arguments and verb, e.g.:
* *maximen me te amit* 'I love you very much.'
* *me maximen te amit* 'I love you very much.'
* *me te maximen amit* 'I love you very much.'
* *me te amit maximen* 'I love you very much.'
* *amit me maximen te* 'I love you very much.'
* etc.

## §3.3

ARGUMENT is either single noun/infinitive/gerund phrase, or multiple with parts separated by argument conjunction *er*, *or*. Each may begin with an article (*le* or *un*).
* *patri* 'father'
* *un patrir* 'to be father'
* *le patrinda* 'the process of being a father'
* *patri er matri* 'father and mother'
* *un patri er le matri* 'a father and the mother'
* *le patri er matri* 'the father and mother'
* *un homine er patri or un matri er le platte* 'a man, and father, or a mother, and a dish'

Similarly, SUBARGUMENTS are separated by subargument conjunction *eri*, *ori*.
* *patri*
* *un patrir*
* *le patrinda*
* *patri eri matri*
* *un patri eri le matri*
* *le patri eri matri*
* *un homine eri patri ori un matri eri le platte*

Similarly, SUBSUBARGUMENTS are separated by subsubargument conjunction *eru*, *oru*.
* *patri*
* *un patrir*
* *le patrinda*
* *patri eru matri*
* *un patri eru le matri*
* *le patri eru matri*
* *un homine eru patri oru un matri eru le platte*

## §3.4

NOUN PHRASE consists of a main phrase, then optional adverb type B phrase, and then optional appositive phrase. Main phrase is either a noun (one word), or a numeral (one or many words).
* *amici* 'friend'
* *amici bellel* 'beautiful friend'
* *amici bonem* 'good friend' i.e. good at being friend
* *amici bonem bellel* 'beautiful good friend
* *lu zero exactem* 'number zero exactly'

Similarly, NOUN SUBPHRASE consists of a main phrase, then optional adverb type B subphrase, and then optional appositive subphrase.
* *amici*
* *amici belleh*
* *amici bonef*
* *amici bonef belleh*
* *lu zero exactef*

Similarly, NOUN SUBSUBPHRASE consists of a main phrase, then optional adverb type B subsubphrase, and then optional appositive subsubphrase.
* *amici*
* *amici bellec*
* *amici bonep*
* *amici bonep bellec*
* *lu zero exactep*

Main phrase is either a noun, or a gerund, or a numeral phrase. Syntactically gerunds are equal to nouns. If one needs to specify arguments of the source verb in the gerund, there are prepositional adverbs 'peri-' for subject and 'di-' for object:
* *me te amit* 'I love you.'
* *aminda dim te perim me* 'my love to you', literally 'love of you by me'

Other prepositionals may be retained:
* *me ain te dait libre* 'I give you a book.'
* *dainda dim libre ain te perim me* 'my giving of a book to you', literally 'giving of book to you by me'

## §3.5

There are two types of INFINITIVE PHRASES. The first consists of an intransitive infinitive, optionally followed by an adverb type B phrase.
* *dormer* 'to sleep'
* *dormer longem* 'to sleep for a long time'

The second type consists of transitive infinitive, optionally followed by an adverb type B phrase, and then (obligatory) subargument phrase.
* *amir te* 'to love you'
* *amir maximem te* 'to love you much'

Note the level shift, this is to distinguish adverb phrase for the main word and adverb phrase for the dependent words.
* *amir maximem (↓) un amici boneh* 'to love a good friend much'
* *amir maximem bonem (↓) un amici* 'to love a friend much and well'

Similarly, INFINITIVE SUBPHRASE is one of two types. The first consists of an intransitive infinitive, optionally followed by an adverb type B subphrase.
* *dormer* 'to sleep'
* *dormer longef* 'to sleep for a long time'

The second type consists of transitive infinitive, optionally followed by an adverb type B subphrase, and then (obligatory) subsubargument phrase.
* *amir te* 'to love you'
* *amir maximef te* 'to love you much'

Note however that INFINITIVE SUBSUBPHRASE may only consist of intransitive infinitive, optionally followed by an adverb type B subsubphrase. The limitation is there because a phrase may not extend anymore through arguments.
* *dormer* 'to sleep'
* *dormer longep* 'to sleep for a long time'

## §3.6

APPOSITIVE PHRASE may be single or multiple. If multiple, parts may be separated with appositive conjunction *el*, *ol*, and if they are, there may be an appositive conjunction in the beginning.
* *bonel* 'good'
* *bonel bellel* 'beautiful good'
* *bonel el bellel* 'good and beautiful'
* *el bonel el bellel* 'both good and beautiful'
* *bonel bellel ol malel el fedel* 'beautiful good or bad and ugly'

Each single is of two types. The first consists of intransitive appositive, optionally followed by an adverb type B phrase.
* *bellel* 'beautiful'
* *bellel multem* 'very beautiful'

The second consists of transitive appositive, then optional adverb type B phrase, then obligatory subargument (note the level shift). This may be translated as a phrase with preposition or as a participle phrase in English.
* *exil (↓) francie* 'from France'
* *exil exactem (↓) francie* 'exactly from France'

Similarly, APPOSITIVE SUBPHRASE may be separated with subappositive conjunction *eh*, *oh*, and each single is of two types. The first consists of intransitive subappositive, optionally followed by an adverb type B subphrase. The second consists of transitive subappositive, then optional adverb type B subphrase, then obligatory subsubargument (note the level shift).
* *boneh* 'good'
* *boneh belleh* 'beautiful good'
* *boneh eh belleh* 'good and beautiful'
* *eh boneh eh belleh* 'both good and beautiful'
* *boneh belleh oh maleh eh fedeh* 'beautiful good or bad and ugly'
* *belleh* 'beautiful'
* *belleh multef* 'very beautiful'
* *exih (↓) francie* 'from France'
* *exih exactef (↓) francie* 'exactly from France'

Like infinitive subsubphrase, there is only one single APPOSITIVE SUBSUBPHRASE, which consists of intransitive subsubappositive, optionally followed by an adverb type B subsubphrase. The limitation is there because a phrase may not extend anymore through arguments. Multiple has parts separated with subsubappositive conjunction *ec*, *oc*.
* *bonec* 'good'
* *bonec bellec* 'beautiful good'
* *bonec ec bellec* 'good and beautiful'
* *ec bonec ec bellec* 'both good and beautiful'
* *bonec bellec oc malec ec fedec* 'beautiful good or bad and ugly'
* *bellec* 'beautiful'
* *bellec multep* 'very beautiful'

## §3.7

Like appositive, ADVERB A PHRASE may be single or multiple. Unlike appositive, it modifies the main word. In case of type A the word modified is verb. If multiple, parts may be separated with adverb A conjunction *en*, *on*, and if they are, there may be an adverb A conjunction in the beginning.
* *me dormeva bonen* 'I slept well.'
* *me dormeva bonen longen* 'I slept long and well.'
* *me dormeva bonen en longen* 'I slept long and well.'
* *me dormeva en bonen en longen* 'I slept both long and well.'

Each single is of two types. The first consists of intransitive adverb type A, optionally followed by an adverb type B phrase.
* *elle bellet multen* 'She is very beautiful.'
* *elle bellet raren multem* 'She is very rarely beautiful.'

The second consists of transitive adverb type A, then optional adverb type B phrase, then obligatory subargument (note the level shift).
* *ille vivet inin francie* 'He lives in France.'
* *ille vivet inin exactem francie* 'He lives exactly in France.'

## §3.8

Like adverb A, ADVERB B PHRASE may be single or multiple. If multiple, parts may be separated with adverb B conjunction *em*, *om*, and if they are, there may be an adverb B conjunction in the beginning. Type B modifies all open-class parts of speech except verb. Each single is of two types. The first consists of intransitive adverb type B, optionally followed by an adverb type B subphrase.
* *bonem* 'well'
* *bonem multef* 'very well'
* *bonem em longem* 'well and long'
* *om bonem om longem* 'either well or long'

The second consists of transitive adverb type B, then optional adverb type B phrase, then obligatory subargument (note the level shift).
* *dim corde boneh* 'gladly'
* *dim totef corde boneh* 'absolutely gladly'

Similarly, ADVERB B SUBPHRASE may be single or multiple. If multiple, parts may be separated with subadverb B conjunction *ef*, *of*, and if they are, there may be an subadverb B conjunction in the beginning. Each single is of two types. The first consists of intransitive subadverb type B, optionally followed by an adverb type B subsubphrase.
* *bonef* 'well'
* *bonef multep* 'very well'
* *bonef ef longef* 'well and long'
* *of bonef of longef* 'either well or long'

The second consists of transitive subadverb type A, then optional adverb type B subsubphrase, then obligatory subsubargument (note the level shift).
* *dif corde bonec* 'gladly'
* *dif totep corde bonec* 'absolutely gladly'

Like infinitive subsubphrase, there is only one single ADVERB TYPE B SUBSUBPHRASE, which consists of intransitive subsubadverb type B. Multiple has parts separated with subsubadverb type B conjunction *ep*, *op*.
* *bonep* 'well'
* *bonep ep longep* 'well and long'
* *op bonep op longep* 'either well or long'

## §3.9

NUMERAL behaves very much like in european languages except that is should start with article *lu*.

* *lu zero* 'number 0'
* *lu uni* 'number 1'
* *lu duo* 'number 2'
* *lu tres* 'number 3'
* *lu quatro* 'number 4'
* *lu cinque* 'number 5'
* *lu sex* 'number 6'
* *lu septe* 'number 7'
* *lu octo* 'number 8'
* *lu nove* 'number 9'
* *lu dece* 'number 10'
* *lu vinti* 'number 20'
* *lu trenta* 'number 30'
* *lu quaranta* 'number 40'
* *lu cinquanta* 'number 50'
* *lu sexanta* 'number 60'
* *lu septanta* 'number 70'
* *lu octanta* 'number 80'
* *lu novanta* 'number 90'
* *lu cento* 'number 100'
* *lu mille* 'number 1 000'
* *lu million* 'number 1 000 000'
* *lu milliardo* 'number 1E9'
* *lu billion* 'number 1E12'
* *lu billiardo* 'number 1E15'
* *lu trilliono* 'number 1E18'
* *lu trilliardo* 'number 1E21'
* *lu quatrillion* 'number 1E24'
* *lu quatrilliardo* 'number 1E27'
* *lu quintillion* 'number 1E30'
* *lu quintilliardo* 'number 1E33'
* *lu dece tres* 'number 13'
* *lu uni mille uni cento vinti* 'number 1 120'
* *lu octo mille tres cento quaranta septe* 'number 8 347'
* *lu dece milliardo nove cento octanta septe million sex cento cinquanta quatro mille tres cento vinti uni* 'number 10 987 654 321'
* *lu trenta quatro comma septe nove octo* '34.798 (thirty-four point seven nine eight)'
* *lu sex di nove* 'number 6/9'
* *lu cinque plus duo di septe* 'number 5 2/7'

Syntactically a numeral is a noun, and in order to use it in sentence a few auxilliary words exist:

        upli-       N times multiplied
        eni-        in a group of N
        menti-      as a matter number N
        di-         N of X, e.g. million [of] apples
        esimi-      X number N, e.g. apple number two

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
        lu cinque plus duo di septe dim coses   five and two seventh things

Multiplicative:

        platte uplil lu uni                 single dish
        platte uplil lu duo                 double dish
        platte uplil lu tres                triple dish
        platte uplil lu quatro              quadruple dish
        platte uplil lu vinti cinque        twenty-fivefold dish

Collective:

        illes arrivet enin lu uni             They arrive one by one.
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

* // to do: usage notes, questions, translate examples from IALA
