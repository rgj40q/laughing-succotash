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
    yylval = mknode0(strjoin(yytext, ": noun, intransitive, level=0"));
    return N_V1;
}
[a-z]+[ua]s[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": noun, transitive, level=0"));
    return N_V2;
}
[a-z]+or[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, impersonal, level=0"));
    return INF_V0;
}
[a-z]*[a-vx-z]ir[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, intransitive, level=0"));
    return INF_V1;
}
[a-z]+[ua]r[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": infinitive, transitive, level=0"));
    return INF_V2;
}
[a-z]*[a-vx-z]il[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adjective, intransitive, level=0"));
    return ADJ_V1;
}
[a-z]+[ua]l[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adjective, transitive, level=0"));
    return ADJ_V2;
}
[a-z]*[a-vx-z]ilt[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adjective, intransitive, level=1"));
    return ADJ_L1_V1;
}
[a-z]+[ua]lt[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adjective, transitive, level=1"));
    return ADJ_L1_V2;
}
[a-z]*[a-vx-z]ilc[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adjective, intransitive, level=2"));
    return ADJ_L2_V1;
}
[a-z]*[a-vx-z]in[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb, intransitive, level=0"));
    return ADV_V1;
}
[a-z]+[ua]n[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb, transitive, level=0"));
    return ADV_V2;
}
[a-z]*[a-vx-z]int[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb, intransitive, level=1"));
    return ADV_L1_V1;
}
[a-z]+[ua]nt[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb, transitive, level=1"));
    return ADV_L1_V2;
}
[a-z]*[a-vx-z]inc[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": adverb, intransitive, level=2"));
    return ADV_L2_V1;
}
[a-z]*[a-vx-z]if[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": participle, intransitive, level=0"));
    return PTCP_V1;
}
[a-z]+[ua]f[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": participle, transitive, level=0"));
    return PTCP_V2;
}
[a-z]*[a-vx-z]ift[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": participle, intransitive, level=1"));
    return PTCP_L1_V1;
}
[a-z]+[ua]ft[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": participle, transitive, level=1"));
    return PTCP_L1_V2;
}
[a-z]*[a-vx-z]ifc[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": participle, intransitive, level=2"));
    return PTCP_L2_V1;
}
et[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for sentence"));
    return CONJ_SENT;
}
es[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-0 argument"));
    return CONJ_ARG;
}
est[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-1 argument"));
    return CONJ_ARG_L1;
}
esc[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-2 argument"));
    return CONJ_ARG_L2;
}
el[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-0 adjective"));
    return CONJ_ADJ;
}
elt[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-1 adjective"));
    return CONJ_ADJ_L1;
}
elc[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-2 adjective"));
    return CONJ_ADJ_L2;
}
en[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-0 adverb"));
    return CONJ_ADV;
}
ent[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-1 adverb"));
    return CONJ_ADV_L1;
}
enc[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-2 adverb"));
    return CONJ_ADV_L2;
}
ef[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-0 participle"));
    return CONJ_PTCP;
}
eft[[:space:]] {
    yytext[strlen(yytext) - 1] = '\0';
    yylval = mknode0(strjoin(yytext, ": conjunction for level-1 participle"));
    return CONJ_PTCP_L1;
}
efc[[:space:]] {
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
