%{

#include <stdbool.h>
#include <stdio.h>
#include <unistd.h>
#include "y.tab.h"

#define YYSTYPE struct node *

struct node {
    YYSTYPE left;
    YYSTYPE right;
    char *token;
};

extern YYSTYPE yylval;
extern YYSTYPE mknode0(char *);

int yywrap();
int yyerror (char *);
void wrong_word();
int check_numeral();
char * strjoin(char *, char *);

%}

%%

(le|un)[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": article"));
    return ART;
}
et[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for sentence"));
    return CONJ_SENT;
}
e[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for argument"));
    return CONJ_ARG;
}
ei[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for subargument"));
    return CONJ_ARG_L1;
}
eu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for subsubargument"));
    return CONJ_ARG_L2;
}
el[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for apposition"));
    return CONJ_APP;
}
eh[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for subapposition"));
    return CONJ_APP_L1;
}
ec[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for subsubapposition"));
    return CONJ_APP_L2;
}
en[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for adverb A"));
    return CONJ_ADVA;
}
em[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for adverb B"));
    return CONJ_ADVB;
}
ef[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for subadverb B"));
    return CONJ_ADVB_L1;
}
ep[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for subsubadverb B"));
    return CONJ_ADVB_L2;
}
zero[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 0"));
    return NUM_0;
}
une[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1"));
    return NUM_1;
}
duo[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 2"));
    return NUM_2;
}
tres[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 3"));
    return NUM_3;
}
quatro[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 4"));
    return NUM_4;
}
cinque[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 5"));
    return NUM_5;
}
sex[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 6"));
    return NUM_6;
}
septe[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 7"));
    return NUM_7;
}
octo[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 8"));
    return NUM_8;
}
nove[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 9"));
    return NUM_9;
}
dece[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 10"));
    return NUM_10;
}
vinti[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 20"));
    return NUM_20;
}
trenta[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 30"));
    return NUM_30;
}
quaranta[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 40"));
    return NUM_40;
}
cinquanta[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 50"));
    return NUM_50;
}
sexanta[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 60"));
    return NUM_60;
}
septanta[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 70"));
    return NUM_70;
}
octanta[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 80"));
    return NUM_80;
}
novanta[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 90"));
    return NUM_90;
}
cento[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 100"));
    return NUM_100;
}
mille[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e3"));
    return NUM_1E3;
}
million[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e6"));
    return NUM_1E6;
}
milliardo[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e9"));
    return NUM_1E9;
}
billion[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e12"));
    return NUM_1E12;
}
billiardo[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e15"));
    return NUM_1E15;
}
trillion[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e18"));
    return NUM_1E18;
}
trilliardo[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e21"));
    return NUM_1E21;
}
quatrillion[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e24"));
    return NUM_1E24;
}
quatrilliardo[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e27"));
    return NUM_1E27;
}
quintillion[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e30"));
    return NUM_1E30;
}
quintilliardo[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, 1e33"));
    return NUM_1E33;
}
di[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, divided by"));
    return NUM_DIV;
}
plus[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, and"));
    return NUM_PLUS;
}
comma[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, comma"));
    return NUM_POINT;
}
lo[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, article"));
    return NUM_ART;
}
[a-z]*ot[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, impersonal, present"));
    return V_V0;
}
[a-z]*ova[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, impersonal, past"));
    return V_V0;
}
[a-z]*ora[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, impersonal, future"));
    return V_V0;
}
[a-z]*orea[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, impersonal, conditional"));
    return V_V0;
}
[a-z]*oza[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, impersonal, imperative"));
    return V_V0;
}
[a-z]*et[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, intransitive, present"));
    return V_V1;
}
[a-z]*eva[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, intransitive, past"));
    return V_V1;
}
[a-z]*era[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, intransitive, future"));
    return V_V1;
}
[a-z]*erea[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, intransitive, conditional"));
    return V_V1;
}
[a-z]*eza[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, intransitive, imperative"));
    return V_V1;
}
[a-z]*it[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, transitive, present"));
    return V_V2;
}
[a-z]*iva[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, transitive, past"));
    return V_V2;
}
[a-z]*ira[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, transitive, future"));
    return V_V2;
}
[a-z]*irea[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, transitive, conditional"));
    return V_V2;
}
[a-z]*iza[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, transitive, imperative"));
    return V_V2;
}
[a-z]*iat[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, transitive, present, passive"));
    return V_V2;
}
[a-z]*iava[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, transitive, past, passive"));
    return V_V2;
}
[a-z]*iara[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, transitive, future, passive"));
    return V_V2;
}
[a-z]*iarea[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, transitive, conditional, passive"));
    return V_V2;
}
[a-z]*iaza[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, transitive, imperative, passive"));
    return V_V2;
}
[a-z]*onda[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": gerund, impersonal, singular"));
    return N_V0;
}
[a-z]*ondas[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": gerund, impersonal, plural"));
    return N_V0;
}
[a-z]*e[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": noun, singular"));
    return N_V1;
}
[a-z]*es[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": noun, plural"));
    return N_V1;
}
[a-z]*enda[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": gerund, singular"));
    return N_V1;
}
[a-z]*endas[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": gerund, plural"));
    return N_V1;
}
[a-z]*(i|ia)[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": noun, singular"));
    return N_V2;
}
[a-z]*(is|ias)[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": noun, plural"));
    return N_V2;
}
[a-z]*(inda|ianda)[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": gerund, singular"));
    return N_V2;
}
[a-z]*(indas|iandas)[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": gerund, plural"));
    return N_V2;
}
[a-z]*er[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, intransitive"));
    return INF_V1;
}
[a-z]*ir[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, transitive"));
    return INF_V2;
}
[a-z]*iar[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, transitive, passive"));
    return INF_V2;
}
[a-z]*el[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": apposition, intransitive"));
    return APP_V1;
}
[a-z]*il[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": apposition, transitive"));
    return APP_V2;
}
[a-z]*ial[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": apposition, transitive, passive"));
    return APP_V2;
}
[a-z]*eh[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": subapposition, intransitive"));
    return APP_L1_V1;
}
[a-z]*ih[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": subapposition, transitive"));
    return APP_L1_V2;
}
[a-z]*iah[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": subapposition, transitive, passive"));
    return APP_L1_V2;
}
[a-z]*ec[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": subsubapposition, intransitive"));
    return APP_L2_V1;
}
[a-z]*en[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb A, intransitive"));
    return ADVA_V1;
}
[a-z]*in[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb A, transitive"));
    return ADVA_V2;
}
[a-z]*ian[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb A, transitive, passive"));
    return ADVA_V2;
}
[a-z]*em[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb B, intransitive"));
    return ADVB_V1;
}
[a-z]*im[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb B, transitive"));
    return ADVB_V2;
}
[a-z]*iam[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb B, transitive, passive"));
    return ADVB_V2;
}
[a-z]*ef[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": subadverb B, intransitive"));
    return ADVB_L1_V1;
}
[a-z]*if[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": subadverb B, transitive"));
    return ADVB_L1_V2;
}
[a-z]*iaf[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": subadverb B, transitive, passive"));
    return ADVB_L1_V2;
}
[a-z]*ep[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": subsubadverb B, intransitive"));
    return ADVB_L2_V1;
}
[[:space:]]+ /* do nothing */
[^[:space:]]+ { wrong_word(); }

%%

void
wrong_word() {
    fprintf(stderr, "error: wrong word: ");
    /* filter out nonprintable characters */
    unsigned char c;
    for (int i = 0; i < strlen(yytext); i++) {
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
