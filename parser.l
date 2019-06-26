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
is[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": \tnumeral, terminator"));
    return NUM_TERM;
}
[a-z]+ot[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, impersonal"));
    return V_V0;
}
[a-z]*[a-vx-z]it[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, intransitive"));
    return V_V1;
}
[a-z]+[ua]t[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, transitive"));
    return V_V2;
}
[a-z]*[a-vx-z]is[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": noun, intransitive"));
    return N_V1;
}
[a-z]+[ua]s[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": noun, transitive"));
    return N_V2;
}
[a-z]+or[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, impersonal"));
    return INF_V0;
}
[a-z]*[a-vx-z]ir[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, intransitive"));
    return INF_V1;
}
[a-z]+[ua]r[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, transitive"));
    return INF_V2;
}
[a-z]*[a-vx-z]il[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adjective, intransitive"));
    return ADJ_V1;
}
[a-z]+[ua]l[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adjective, transitive"));
    return ADJ_V2;
}
[a-z]*[a-vx-z]ih[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adjective, intransitive, level=1"));
    return ADJ_L1_V1;
}
[a-z]+[ua]h[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adjective, transitive, level=1"));
    return ADJ_L1_V2;
}
[a-z]*[a-vx-z]ic[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adjective, intransitive, level=2"));
    return ADJ_L2_V1;
}
[a-z]*[a-vx-z]in[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb, intransitive"));
    return ADV_V1;
}
[a-z]+[ua]n[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb, transitive"));
    return ADV_V2;
}
[a-z]*[a-vx-z]im[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": participle, intransitive"));
    return PTCP_V1;
}
[a-z]+[ua]m[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": participle, transitive"));
    return PTCP_V2;
}
[a-z]*[a-vx-z]if[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": participle, intransitive, level=1"));
    return PTCP_L1_V1;
}
[a-z]+[ua]f[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": participle, transitive, level=1"));
    return PTCP_L1_V2;
}
[a-z]*[a-vx-z]ip[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": participle, intransitive, level=2"));
    return PTCP_L2_V1;
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
    yylval = mknode0(strjoin(yytext, ": conjunction for level-1 argument"));
    return CONJ_ARG_L1;
}
eu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-2 argument"));
    return CONJ_ARG_L2;
}
el[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for adjective"));
    return CONJ_ADJ;
}
eh[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-1 adjective"));
    return CONJ_ADJ_L1;
}
ec[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-2 adjective"));
    return CONJ_ADJ_L2;
}
en[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for adverb"));
    return CONJ_ADV;
}
em[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for participle"));
    return CONJ_PTCP;
}
ef[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-1 participle"));
    return CONJ_PTCP_L1;
}
ep[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-2 participle"));
    return CONJ_PTCP_L2;
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
