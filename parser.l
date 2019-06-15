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
[a-z]+ot[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, valence=0"));
    return V_V0;
}
[a-z]*[a-vx-z]ut[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, valence=1"));
    return V_V1;
}
[a-z]+[ia]t[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, valence=2"));
    return V_V2;
}
[a-z]*[a-vx-z]us[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": noun, valence=1, level=0"));
    return N_V1;
}
[a-z]+[ia]s[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": noun, valence=2, level=0"));
    return N_V2;
}
[a-z]*[a-vx-z]usu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": noun, valence=1, level=1"));
    return N_L1_V1;
}
[a-z]+[ia]su[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": noun, valence=2, level=1"));
    return N_L1_V2;
}
[a-z]*[a-vx-z]usi[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": noun, valence=1, level=2"));
    return N_L2_V1;
}
[a-z]+or[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, valence=0, level=0"));
    return INF_V0;
}
[a-z]*[a-vx-z]ur[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, valence=1, level=0"));
    return INF_V1;
}
[a-z]+[ia]r[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, valence=2, level=0"));
    return INF_V2;
}
[a-z]+oru[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, valence=0, level=1"));
    return INF_L1_V0;
}
[a-z]*[a-vx-z]uru[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, valence=1, level=1"));
    return INF_L1_V1;
}
[a-z]+[ia]ru[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, valence=2, level=1"));
    return INF_L1_V2;
}
[a-z]+ori[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, valence=0, level=2"));
    return INF_L2_V0;
}
[a-z]*[a-vx-z]ul[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adjective, valence=1, level=0"));
    return ADJ_V1;
}
[a-z]+[ia]l[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adjective, valence=2, level=0"));
    return ADJ_V2;
}
[a-z]*[a-vx-z]ulu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adjective, valence=1, level=1"));
    return ADJ_L1_V1;
}
[a-z]+[ia]lu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adjective, valence=2, level=1"));
    return ADJ_L1_V2;
}
[a-z]*[a-vx-z]uli[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adjective, valence=1, level=2"));
    return ADJ_L2_V1;
}
[a-z]*[a-vx-z]um[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb, valence=1, level=0"));
    return ADV_V1;
}
[a-z]+[ia]m[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb, valence=2, level=0"));
    return ADV_V2;
}
[a-z]*[a-vx-z]umu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb, valence=1, level=1"));
    return ADV_L1_V1;
}
[a-z]+[ia]mu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb, valence=2, level=1"));
    return ADV_L1_V2;
}
[a-z]*[a-vx-z]umi[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb, valence=1, level=2"));
    return ADV_L2_V1;
}
[a-z]*[a-vx-z]un[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": participle, valence=1, level=0"));
    return PTCP_V1;
}
[a-z]+[ia]n[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": participle, valence=2, level=0"));
    return PTCP_V2;
}
[a-z]*[a-vx-z]unu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": participle, valence=1, level=1"));
    return PTCP_L1_V1;
}
[a-z]+[ia]nu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": participle, valence=2, level=1"));
    return PTCP_L1_V2;
}
[a-z]*[a-vx-z]uni[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": participle, valence=1, level=2"));
    return PTCP_L2_V1;
}
[a-z]*et[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for sentence"));
    return CONJ_SENT;
}
[a-z]*es[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-0 argument"));
    return CONJ_ARG;
}
[a-z]*esu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-1 argument"));
    return CONJ_ARG_L1;
}
[a-z]*esi[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-2 argument"));
    return CONJ_ARG_L2;
}
[a-z]*el[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-0 adjective"));
    return CONJ_ADJ;
}
[a-z]*elu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-1 adjective"));
    return CONJ_ADJ_L1;
}
[a-z]*eli[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-2 adjective"));
    return CONJ_ADJ_L2;
}
[a-z]*em[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-0 adverb"));
    return CONJ_ADV;
}
[a-z]*emu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-1 adverb"));
    return CONJ_ADV_L1;
}
[a-z]*emi[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-2 adverb"));
    return CONJ_ADV_L2;
}
[a-z]*en[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-0 participle"));
    return CONJ_PTCP;
}
[a-z]*enu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-1 participle"));
    return CONJ_PTCP_L1;
}
[a-z]*eni[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-2 participle"));
    return CONJ_PTCP_L2;
}
(mi|du|ca|ve|si|lu|ba|te|ri|fu|na|ge|pi|zu|ha)+wu(t|s|su|si|r|ru|l|lu|li|m|mu|mi|n|nu|ni)[[:space:]] {
    return check_numeral();
}
[[:space:]]+ /* do nothing */
[^[:space:]]+ { wrong_word(); }

%%

int
yywrap() {
    return 1;
}

int
yyerror (char *s) {
    fprintf(stderr, "%s\n", s);
    return 0;
}

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

void
err_num() {
    fprintf(stderr, "error parsing numeral %s\n", yytext);
    exit(1);
}

int
match_morphemes(char *s) {
    char morphemes[] = "miducavesilubaterifunagepizuhawu";
    int i;
    for (i = 0; i < strlen(morphemes)/2; i++) {
        if (s[0] == morphemes[i * 2] && s[1] == morphemes[i * 2 + 1]) {
            return i;
        }
    }
    err_num();
    return -1;
}

int
match_endings(char *s) {
    char endings[] = "t s susir rul lulim mumin nuni";
    int i;
    for (i = 0; i < strlen(endings)/2; i++) {
        if (s[0] == endings[i * 2] && s[1] == endings[i * 2 + 1]) {
            return i;
        }
    }
    err_num();
    return -1;
}

int
check_numeral() {
    yytext[strlen(yytext) - 1] = ' '; /* to lookup endings from string */
    char *s = yytext;
    char *newtoken;
    char tmp[] = "42";
    int i, v;
    while ((newtoken = (char *)malloc(strlen(yytext) + 1)) == NULL) {
        fprintf(stderr, "warning: not enough memory\n");
        sleep(1);
    }
    strcpy(newtoken, "");
    /* 0 1 2 3 4 5 6 7 8 9 .  E  _  -  /  #  */
    enum numeric_char {n0, n1, n2, n3, n4, n5, n6, n7, n8, n9,
            point, exponent, and, minus, div, terminator};
    v = match_morphemes(s);
    if (v > 9 && v != minus) {
        err_num();
    } else if (v == minus) {
        strcat(newtoken, "-");
        s += 2;
        v = match_morphemes(s);
        if (v > 9) err_num(); /* at least one digit */
    }
    do {
        sprintf(tmp, "%i", v);
        strcat(newtoken, tmp);
        s += 2;
        v = match_morphemes(s);
    } while (v < 10);
    if (v == terminator) {
        strcat(newtoken, "#");
    } else if (v == div) {
ldiv:   strcat(newtoken, "/");
        s += 2;
        v = match_morphemes(s);
        if (v > 9) err_num(); /* at least one digit */
        do {
            sprintf(tmp, "%i", v);
            strcat(newtoken, tmp);
            s += 2;
            v = match_morphemes(s);
        } while (v < 10);
        if (v != terminator) err_num();
        strcat(newtoken, "#");
    } else if (v == and) {
        strcat(newtoken, "_");
        s += 2;
        v = match_morphemes(s);
        if (v > 9) err_num(); /* at least one digit */
        do {
            sprintf(tmp, "%i", v);
            strcat(newtoken, tmp);
            s += 2;
            v = match_morphemes(s);
        } while (v < 10);
        if (v != div) err_num();
        goto ldiv;
    } else if (v == exponent) {
lexp:   strcat(newtoken, "e");
        s += 2;
        v = match_morphemes(s);
        if (v > 9 && v != minus) {
            err_num();
        } else if (v == minus) {
            strcat(newtoken, "-");
            s += 2;
            v = match_morphemes(s);
            if (v > 9) err_num(); /* at least one digit */
        }
        do {
            sprintf(tmp, "%i", v);
            strcat(newtoken, tmp);
            s += 2;
            v = match_morphemes(s);
        } while (v < 10);
        if (v != terminator) err_num();
        strcat(newtoken, "#");
    } else if (v == point) {
        strcat(newtoken, ".");
        s += 2;
        v = match_morphemes(s);
        if (v > 9) err_num(); /* at least one digit */
        do {
            sprintf(tmp, "%i", v);
            strcat(newtoken, tmp);
            s += 2;
            v = match_morphemes(s);
        } while (v < 10);
        if (v == terminator) {
            strcat(newtoken, "#");
        } else if (v == exponent) {
            goto lexp;
        } else {
            err_num();
        }
    } else { /* if minus */
        err_num();
    }
    s += 2;
    v = match_endings(s);
    strcat(newtoken, s);
    if (newtoken[strlen(newtoken) - 1] == ' ') {
        newtoken[strlen(newtoken) - 1] = '\0';
    }
    switch(v) {
        case 0:     /* t_ */
            yylval = mknode0(strjoin(newtoken, ": verb, valence=1"));
            return V_V1;
        case 1:     /* s_ */
            yylval = mknode0(strjoin(newtoken, ": noun, valence=1, level=0"));
            return N_V1;
        case 2:     /* su */
            yylval = mknode0(strjoin(newtoken, ": noun, valence=1, level=1"));
            return N_L1_V1;
        case 3:     /* si */
            yylval = mknode0(strjoin(newtoken, ": noun, valence=1, level=2"));
            return N_L2_V1;
        case 4:     /* r_ */
            yylval = mknode0(strjoin(newtoken, ": infinitive, valence=1, level=0"));
            return INF_V1;
        case 5:    /* ru */
            yylval = mknode0(strjoin(newtoken, ": infinitive, valence=1, level=1"));
            return INF_L1_V1;
        case 6:    /* l_ */
            yylval = mknode0(strjoin(newtoken, ": adjective, valence=1, level=0"));
            return ADJ_V1;
        case 7:    /* lu */
            yylval = mknode0(strjoin(newtoken, ": adjective, valence=1, level=1"));
            return ADJ_L1_V1;
        case 8:    /* li */
            yylval = mknode0(strjoin(newtoken, ": adjective, valence=1, level=2"));
            return ADJ_L2_V1;
        case 9:    /* m_ */
            yylval = mknode0(strjoin(newtoken, ": adverb, valence=1, level=0"));
            return ADV_V1;
        case 10:    /* mu */
            yylval = mknode0(strjoin(newtoken, ": adverb, valence=1, level=1"));
            return ADV_L1_V1;
        case 11:    /* mi */
            yylval = mknode0(strjoin(newtoken, ": adverb, valence=1, level=2"));
            return ADV_L2_V1;
        case 12:    /* n_ */
            yylval = mknode0(strjoin(newtoken, ": participle, valence=1, level=0"));
            return PTCP_V1;
        case 13:    /* nu */
            yylval = mknode0(strjoin(newtoken, ": participle, valence=1, level=1"));
            return PTCP_L1_V1;
        case 14:    /* ni */
            yylval = mknode0(strjoin(newtoken, ": participle, valence=1, level=2"));
            return PTCP_L2_V1;
    }
    err_num();
    return -1;
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
