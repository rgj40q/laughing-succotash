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
    yylval = mknode0(strjoin(yytext, ": article, level=0"));
    return ART;
}
(li|uni)[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": article, level=1"));
    return ARTI;
}
(lu|unu)[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": article, level=2"));
    return ARTU;
}
[a-z]+ot[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, valence=0"));
    return V_0;
}
[a-z]*[a-vx-z]it[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, valence=1"));
    return V_1;
}
[a-z]+[au]t[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": verb, valence=2"));
    return V_2;
}
[a-z]*[a-vx-z]is[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": noun, valence=1, level=0"));
    return N_1;
}
[a-z]+[au]s[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": noun, valence=2, level=0"));
    return N_2;
}
[a-z]*[a-vx-z]isi[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": noun, valence=1, level=1"));
    return NI_1;
}
[a-z]*[a-vx-z]ise[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": noun, valence=1, level=1"));
    return NI_1;
}
[a-z]+[au]si[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": noun, valence=2, level=1"));
    return NI_2;
}
[a-z]*[a-vx-z]isu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": noun, valence=1, level=2"));
    return NU_1;
}
[a-z]+or[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, valence=0, level=0"));
    return INF_0;
}
[a-z]*[a-vx-z]ir[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, valence=1, level=0"));
    return INF_1;
}
[a-z]+[au]r[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, valence=2, level=0"));
    return INF_2;
}
[a-z]+ori[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, valence=0, level=1"));
    return INFI_0;
}
[a-z]*[a-vx-z]iri[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, valence=1, level=1"));
    return INFI_1;
}
[a-z]+[au]ri[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, valence=2, level=1"));
    return INFI_2;
}
[a-z]+oru[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, valence=0, level=2"));
    return INFU_0;
}
[a-z]*[a-vx-z]il[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adjective, valence=1, level=0"));
    return ADJ_1;
}
[a-z]+[au]l[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adjective, valence=2, level=0"));
    return ADJ_2;
}
[a-z]*[a-vx-z]ili[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adjective, valence=1, level=1"));
    return ADJI_1;
}
[a-z]+[au]li[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adjective, valence=2, level=1"));
    return ADJI_2;
}
[a-z]*[a-vx-z]ilu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adjective, valence=1, level=2"));
    return ADJU_1;
}
[a-z]*[a-vx-z]im[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb, valence=1, level=0"));
    return ADV_1;
}
[a-z]+[au]m[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb, valence=2, level=0"));
    return ADV_2;
}
[a-z]*[a-vx-z]imi[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb, valence=1, level=1"));
    return ADVI_1;
}
[a-z]+[au]mi[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb, valence=2, level=1"));
    return ADVI_2;
}
[a-z]*[a-vx-z]imu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb, valence=1, level=2"));
    return ADVU_1;
}
[a-z]*[a-vx-z]in[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": participle, valence=1, level=0"));
    return PTCP_1;
}
[a-z]+[au]n[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": participle, valence=2, level=0"));
    return PTCP_2;
}
[a-z]*[a-vx-z]ini[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": participle, valence=1, level=1"));
    return PTCP_1;
}
[a-z]+[au]ni[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": participle, valence=2, level=1"));
    return PTCP_2;
}
[a-z]*[a-vx-z]inu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": participle, valence=1, level=2"));
    return PTCP_1;
}
[a-z]*et[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for sentence"));
    return CONJSENT;
}
[a-z]*es[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-0 argument"));
    return CONJARG;
}
[a-z]*esi[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-1 argument"));
    return CONJARGI;
}
[a-z]*esu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-2 argument"));
    return CONJARGU;
}
[a-z]*el[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-0 adjective"));
    return CONJADJ;
}
[a-z]*eli[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-1 adjective"));
    return CONJADJI;
}
[a-z]*elu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-2 adjective"));
    return CONJADJU;
}
[a-z]*em[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-0 adverb"));
    return CONJADV;
}
[a-z]*emi[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-1 adverb"));
    return CONJADVI;
}
[a-z]*emu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-2 adverb"));
    return CONJADVU;
}
[a-z]*en[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-0 participle"));
    return CONJPTCP;
}
[a-z]*eni[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-1 participle"));
    return CONJPTCPI;
}
[a-z]*enu[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-2 participle"));
    return CONJPTCPU;
}
(mi|du|ca|ve|si|lu|ba|te|ri|fu|na|ge|pi|zu|ha)+wi(t|s|si|su|r|ri|ru|l|li|lu|m|mi|mu|n|ni|nu)[[:space:]] {
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
    char morphemes[] = "miducavesilubaterifunagepizuhawi";
    int i;
    for (i = 0; i < 16; i++) {
        if (s[0] == morphemes[i * 2] && s[1] == morphemes[i * 2 + 1]) {
            return i;
        }
    }
    err_num();
    return -1;
}

int
match_endings(char *s) {
    char endings[] = "t s sisur rirul lilum mimu";
    int i;
    for (i = 0; i < 13; i++) {
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
        case 0:     /* t_, V_1 */
            yylval = mknode0(strjoin(newtoken, ": verb, valence=1"));
            return V_1;
        case 1:     /* s_, N_1 */
            yylval = mknode0(strjoin(newtoken, ": noun, valence=1, level=0"));
            return N_1;
        case 2:     /* si, NI_1 */
            yylval = mknode0(strjoin(newtoken, ": noun, valence=1, level=1"));
            return NI_1;
        case 3:     /* su, NU_1 */
            yylval = mknode0(strjoin(newtoken, ": noun, valence=1, level=2"));
            return NU_1;
        case 4:     /* r_, INF_1 */
            yylval = mknode0(strjoin(newtoken,
                ": infinitive, valence=1, level=0"));
            return INF_1;
        case 5:    /* ri, INFI_1 */
            yylval = mknode0(strjoin(newtoken,
                ": infinitive, valence=1, level=1"));
            return INFI_1;
        case 6:    /* ru, impossible *INFU_1 */
            err_num();
        case 7:    /* l_, ADJ_1 */
            yylval = mknode0(strjoin(newtoken,
                ": adjective, valence=1, level=0"));
            return ADJ_1;
        case 8:    /* li, ADJI_1 */
            yylval = mknode0(strjoin(newtoken,
                ": adjective, valence=1, level=1"));
            return ADJI_1;
        case 9:    /* lu, ADJU_1 */
            yylval = mknode0(strjoin(newtoken,
                ": adjective, valence=1, level=2"));
            return ADJU_1;
        case 10:    /* m_, ADV_1 */
            yylval = mknode0(strjoin(newtoken,
                ": adverb, valence=1, level=0"));
            return ADJ_1;
        case 11:    /* mi, ADVI_1 */
            yylval = mknode0(strjoin(newtoken,
                ": adverb, valence=1, level=1"));
            return ADJI_1;
        case 12:    /* mu, ADVU_1 */
            yylval = mknode0(strjoin(newtoken,
                ": adverb, valence=1, level=2"));
            return ADJU_1;
        case 13:    /* n_, PTCP_1 */
            yylval = mknode0(strjoin(newtoken,
                ": participle, valence=1, level=0"));
            return ADJ_1;
        case 14:    /* ni, PTCP_1 */
            yylval = mknode0(strjoin(newtoken,
                ": participle, valence=1, level=1"));
            return ADJI_1;
        case 15:    /* nu, PTCP_1 */
            yylval = mknode0(strjoin(newtoken,
                ": participle, valence=1, level=2"));
            return ADJU_1;
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
