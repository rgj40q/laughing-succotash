%{

#include <stdbool.h>
#include <stdio.h>
#include <unistd.h>

#define YYSTYPE struct node *

struct node {
    YYSTYPE left;
    YYSTYPE right;
    char *token;
};

#include "y.tab.h"

extern YYSTYPE mknode0(char *);
extern YYSTYPE yylval;

int yywrap();
int yyerror (char *);
void wrong_word();
int check_numeral();
char * strjoin(char *, char *);

%}

%%

(le|un) {
    yylval = mknode0(strjoin(yytext, ": article"));
    return ART;
}
(an|annon|atque|aut|comocunque|donec|dum|dunque|e|et|etsi|igitur|itaque|ma|mais|malgrado|nam|ne|nec|neque|ni|nisi|o|perque|pois|porque|postquam|quam|quando|quandocunque|que|quia|quo|quod|sed|si|sinon|sive|ubi|ubicunque|utrum|vel) {
    yylval = mknode0(strjoin(yytext, ": conjunction for sentence"));
    return CONJ_SENT;
}
(er|or) {
    yylval = mknode0(strjoin(yytext, ": conjunction for argument"));
    return CONJ_ARG;
}
(eri|ori) {
    yylval = mknode0(strjoin(yytext, ": conjunction for argument II"));
    return CONJ_ARG_L2;
}
(eru|oru) {
    yylval = mknode0(strjoin(yytext, ": conjunction for argument III"));
    return CONJ_ARG_L3;
}
(el|ol) {
    yylval = mknode0(strjoin(yytext, ": conjunction for appositive"));
    return CONJ_APP;
}
(eh|oh) {
    yylval = mknode0(strjoin(yytext, ": conjunction for appositive II"));
    return CONJ_APP_L2;
}
(ec|oc) {
    yylval = mknode0(strjoin(yytext, ": conjunction for appositive III"));
    return CONJ_APP_L3;
}
(en|on) {
    yylval = mknode0(strjoin(yytext, ": conjunction for adverb"));
    return CONJ_ADV;
}
(em|om) {
    yylval = mknode0(strjoin(yytext, ": conjunction for participle"));
    return CONJ_PTCP;
}
(ef|of) {
    yylval = mknode0(strjoin(yytext, ": conjunction for participle II"));
    return CONJ_PTCP_L2;
}
(ep|op) {
    yylval = mknode0(strjoin(yytext, ": conjunction for participle III"));
    return CONJ_PTCP_L3;
}
zero {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 0"));
    return NUM_0;
}
uni {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1"));
    return NUM_1;
}
duo {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 2"));
    return NUM_2;
}
tres {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 3"));
    return NUM_3;
}
quatro {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 4"));
    return NUM_4;
}
cinque {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 5"));
    return NUM_5;
}
sex {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 6"));
    return NUM_6;
}
septe {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 7"));
    return NUM_7;
}
octo {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 8"));
    return NUM_8;
}
nove {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 9"));
    return NUM_9;
}
dece {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 10"));
    return NUM_10;
}
vinti {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 20"));
    return NUM_20;
}
trenta {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 30"));
    return NUM_30;
}
quaranta {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 40"));
    return NUM_40;
}
cinquanta {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 50"));
    return NUM_50;
}
sexanta {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 60"));
    return NUM_60;
}
septanta {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 70"));
    return NUM_70;
}
octanta {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 80"));
    return NUM_80;
}
novanta {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 90"));
    return NUM_90;
}
cento {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 100"));
    return NUM_100;
}
mille {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e3"));
    return NUM_1E3;
}
million {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e6"));
    return NUM_1E6;
}
milliardo {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e9"));
    return NUM_1E9;
}
billion {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e12"));
    return NUM_1E12;
}
billiardo {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e15"));
    return NUM_1E15;
}
trillion {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e18"));
    return NUM_1E18;
}
trilliardo {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e21"));
    return NUM_1E21;
}
quatrillion {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e24"));
    return NUM_1E24;
}
quatrilliardo {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e27"));
    return NUM_1E27;
}
quintillion {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e30"));
    return NUM_1E30;
}
quintilliardo {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e33"));
    return NUM_1E33;
}
lu {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, article"));
    return NUM_ART;
}
di {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, divided by"));
    return NUM_DIV;
}
plus {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, and"));
    return NUM_PLUS;
}
comma {
    yylval = mknode0(strjoin(yytext, ": \tnumeral, comma"));
    return NUM_POINT;
}
[a-z]+ot {
    yylval = mknode0(strjoin(yytext, ": verb, impersonal, present"));
    return V_V0;
}
[a-z]+ova {
    yylval = mknode0(strjoin(yytext, ": verb, impersonal, past"));
    return V_V0;
}
[a-z]+ora {
    yylval = mknode0(strjoin(yytext, ": verb, impersonal, future"));
    return V_V0;
}
[a-z]+orea {
    yylval = mknode0(strjoin(yytext, ": verb, impersonal, conditional"));
    return V_V0;
}
[a-z]+oza {
    yylval = mknode0(strjoin(yytext, ": verb, impersonal, imperative"));
    return V_V0;
}
[a-z]+et {
    yylval = mknode0(strjoin(yytext, ": verb, intransitive, present"));
    return V_V1;
}
[a-z]+eva {
    yylval = mknode0(strjoin(yytext, ": verb, intransitive, past"));
    return V_V1;
}
[a-z]+era {
    yylval = mknode0(strjoin(yytext, ": verb, intransitive, future"));
    return V_V1;
}
[a-z]+erea {
    yylval = mknode0(strjoin(yytext, ": verb, intransitive, conditional"));
    return V_V1;
}
[a-z]+eza {
    yylval = mknode0(strjoin(yytext, ": verb, intransitive, imperative"));
    return V_V1;
}
[a-z]+it {
    yylval = mknode0(strjoin(yytext, ": verb, transitive, present"));
    return V_V2;
}
[a-z]+iva {
    yylval = mknode0(strjoin(yytext, ": verb, transitive, past"));
    return V_V2;
}
[a-z]+ira {
    yylval = mknode0(strjoin(yytext, ": verb, transitive, future"));
    return V_V2;
}
[a-z]+irea {
    yylval = mknode0(strjoin(yytext, ": verb, transitive, conditional"));
    return V_V2;
}
[a-z]+iza {
    yylval = mknode0(strjoin(yytext, ": verb, transitive, imperative"));
    return V_V2;
}
[a-z]+iat {
    yylval = mknode0(strjoin(yytext, ": verb, transitive, present, passive"));
    return V_V2;
}
[a-z]+iava {
    yylval = mknode0(strjoin(yytext, ": verb, transitive, past, passive"));
    return V_V2;
}
[a-z]+iara {
    yylval = mknode0(strjoin(yytext, ": verb, transitive, future, passive"));
    return V_V2;
}
[a-z]+iarea {
    yylval = mknode0(strjoin(yytext, ": verb, transitive, conditional, passive"));
    return V_V2;
}
[a-z]+iaza {
    yylval = mknode0(strjoin(yytext, ": verb, transitive, imperative, passive"));
    return V_V2;
}
[a-z]+onda {
    yylval = mknode0(strjoin(yytext, ": gerund, impersonal, singular"));
    return N_V0;
}
[a-z]+ondas {
    yylval = mknode0(strjoin(yytext, ": gerund, impersonal, plural"));
    return N_V0;
}
[a-z]+e {
    yylval = mknode0(strjoin(yytext, ": noun, singular"));
    return N_V1;
}
[a-z]+es {
    yylval = mknode0(strjoin(yytext, ": noun, plural"));
    return N_V1;
}
[a-z]+enda {
    yylval = mknode0(strjoin(yytext, ": gerund, singular"));
    return N_V1;
}
[a-z]+endas {
    yylval = mknode0(strjoin(yytext, ": gerund, plural"));
    return N_V1;
}
[a-z]+(i|ia) {
    yylval = mknode0(strjoin(yytext, ": noun, singular"));
    return N_V2;
}
[a-z]+(is|ias) {
    yylval = mknode0(strjoin(yytext, ": noun, plural"));
    return N_V2;
}
[a-z]+(inda|ianda) {
    yylval = mknode0(strjoin(yytext, ": gerund, singular"));
    return N_V2;
}
[a-z]+(indas|iandas) {
    yylval = mknode0(strjoin(yytext, ": gerund, plural"));
    return N_V2;
}
[a-z]+er {
    yylval = mknode0(strjoin(yytext, ": infinitive, intransitive"));
    return INF_V1;
}
[a-z]+ir {
    yylval = mknode0(strjoin(yytext, ": infinitive, transitive"));
    return INF_V2;
}
[a-z]+iar {
    yylval = mknode0(strjoin(yytext, ": infinitive, transitive, passive"));
    return INF_V2;
}
[a-z]+el {
    yylval = mknode0(strjoin(yytext, ": appositive, intransitive"));
    return APP_V1;
}
[a-z]+il {
    yylval = mknode0(strjoin(yytext, ": appositive, transitive"));
    return APP_V2;
}
[a-z]+ial {
    yylval = mknode0(strjoin(yytext, ": appositive, transitive, passive"));
    return APP_V2;
}
[a-z]+eh {
    yylval = mknode0(strjoin(yytext, ": appositive II, intransitive"));
    return APP_L2_V1;
}
[a-z]+ih {
    yylval = mknode0(strjoin(yytext, ": appositive II, transitive"));
    return APP_L2_V2;
}
[a-z]+iah {
    yylval = mknode0(strjoin(yytext, ": appositive II, transitive, passive"));
    return APP_L2_V2;
}
[a-z]+ec {
    yylval = mknode0(strjoin(yytext, ": appositive III, intransitive"));
    return APP_L3_V1;
}
[a-z]+en {
    yylval = mknode0(strjoin(yytext, ": adverb, intransitive"));
    return ADV_V1;
}
[a-z]+in {
    yylval = mknode0(strjoin(yytext, ": adverb, transitive"));
    return ADV_V2;
}
[a-z]+ian {
    yylval = mknode0(strjoin(yytext, ": adverb, transitive, passive"));
    return ADV_V2;
}
[a-z]+em {
    yylval = mknode0(strjoin(yytext, ": participle, intransitive"));
    return PTCP_V1;
}
[a-z]+im {
    yylval = mknode0(strjoin(yytext, ": participle, transitive"));
    return PTCP_V2;
}
[a-z]+iam {
    yylval = mknode0(strjoin(yytext, ": participle, transitive, passive"));
    return PTCP_V2;
}
[a-z]+ef {
    yylval = mknode0(strjoin(yytext, ": participle II, intransitive"));
    return PTCP_L2_V1;
}
[a-z]+if {
    yylval = mknode0(strjoin(yytext, ": participle II, transitive"));
    return PTCP_L2_V2;
}
[a-z]+iaf {
    yylval = mknode0(strjoin(yytext, ": participle II, transitive, passive"));
    return PTCP_L2_V2;
}
[a-z]+ep {
    yylval = mknode0(strjoin(yytext, ": participle III, intransitive"));
    return PTCP_L3_V1;
}
[[:space:]]+ /* do nothing */
[^[:space:]]+ { wrong_word(); }

%%

void
wrong_word() {
    fprintf(stderr, "error: wrong word: ");
    /* filter out nonprintable characters */
    unsigned char c;
    int i;
    for (i = 0; i < strlen(yytext); i++) {
        c = yytext[i];
        if (c < ' ' || c > '~') {
            fprintf(stderr, "\\%X", c);
        } else if (c == '\\') {
            fprintf(stderr, "\\\\");
        } else {
            fprintf(stderr, "%c", c);
        }
    }
    fprintf(stderr, "\n");
    exit(1);
}

char *
strjoin(char *str1, char *str2) {
    char *str;
    while ((str = (char *)malloc(strlen(str1) + strlen(str2) + 1)) == NULL) {
        fprintf(stderr, "warning: not enough memory\n");
        sleep(1);
    }
    strcpy(str, str1);
    strcat(str, str2);
    return str;
}

int
yywrap() {
    return 1;
}

int
yyerror (char *s) {
    fprintf(stderr, "%s\n", s);
    return 0;
}
