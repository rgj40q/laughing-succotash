define(`NODE0', `$$ = mknode0($1)')
define(`NODE1', `$$ = mknode1($1, $`'1)')
define(`NODE2', `$$ = mknode($1, $`'1, $`'2)')
define(`NODE3', `$$ = mknode3($1, $`'1, $`'2, $`'3)')
define(`NODE4', `$$ = mknode4($1, $`'1, $`'2, $`'3, $`'4)')
define(`NODE5', `$$ = mknode5($1, $`'1, $`'2, $`'3, $`'4, $`'5)')
define(`NODE6', `$$ = mknode6($1, $`'1, $`'2, $`'3, $`'4, $`'5, $`'6)')
define(`NODE7', `$$ = mknode7($1, $`'1, $`'2, $`'3, $`'4, $`'5, $`'6, $`'7)')
%{

#include <stdio.h>
#include <unistd.h>

#define YYSTYPE struct node *
#define YYDEBUG 1

struct node {
    YYSTYPE left;
    YYSTYPE right;
    char *token;
};

extern int yyerror (char *);
extern int yylex();
YYSTYPE mknode0(char *);
YYSTYPE mknode1(char *, YYSTYPE);
YYSTYPE mknode(char *, YYSTYPE, YYSTYPE);
YYSTYPE mknode3(char *, YYSTYPE, YYSTYPE, YYSTYPE);
YYSTYPE mknode4(char *, YYSTYPE, YYSTYPE, YYSTYPE, YYSTYPE);
YYSTYPE mknode5(char *, YYSTYPE, YYSTYPE, YYSTYPE, YYSTYPE, YYSTYPE);
YYSTYPE mknode6(char *, YYSTYPE, YYSTYPE, YYSTYPE, YYSTYPE, YYSTYPE, YYSTYPE);
YYSTYPE mknode7(char *, YYSTYPE, YYSTYPE, YYSTYPE, YYSTYPE, YYSTYPE, YYSTYPE,
                YYSTYPE);

void printtree(YYSTYPE);
int main();

int printtree_level = 0;

%}

%start START
%token V_V0 V_V1 V_V2
%token ART
%token CONJ_ARG CONJ_ARG_L1 CONJ_ARG_L2 CONJ_APP CONJ_APP_L1 CONJ_APP_L2
%token CONJ_SENT CONJ_ADVA
%token CONJ_ADVB CONJ_ADVB_L1 CONJ_ADVB_L2
%token INF_V1 INF_V2
%token N_V0 N_V1 N_V2
%token APP_V1 APP_V2 APP_L1_V1 APP_L1_V2 APP_L2_V1
%token ADVA_V1 ADVA_V2
%token ADVB_V1 ADVB_V2 ADVB_L1_V1 ADVB_L1_V2 ADVB_L2_V1
%token NUM_0 NUM_1 NUM_2 NUM_3 NUM_4 NUM_5 NUM_6 NUM_7 NUM_8 NUM_9 NUM_10
%token NUM_20 NUM_30 NUM_40 NUM_50 NUM_60 NUM_70 NUM_80 NUM_90 NUM_100
%token NUM_1E3 NUM_1E6 NUM_1E9 NUM_1E12 NUM_1E15 NUM_1E18 NUM_1E21 NUM_1E24
%token NUM_1E27 NUM_1E30 NUM_1E33 NUM_DIV NUM_PLUS NUM_POINT NUM_ART

%%

START
    : text { printtree($1); }
    ;

text
    : sentence       { NODE1("[text]"); } /* s      */
    | sentence aux   { NODE2("[text]"); } /* s(cs)+ */
    | aux            { NODE1("[text]"); } /* (cs)+  */
    ;

aux
    : CONJ_SENT sentence       { NODE2(""); } /* token "" is dummy */
    | aux CONJ_SENT sentence   { NODE3(""); }
    ;

sentence
    : adverbA_phrase V_V0 adverbA_phrase { /* V */
            NODE3("[sentence]");
        }
    | adverbA_phrase argument adverbA_phrase V_V1 adverbA_phrase { /* SV */
            NODE5("[sentence]");
        }
    | adverbA_phrase V_V1 adverbA_phrase argument adverbA_phrase { /* VS */
            NODE5("[sentence]");
        }
    | adverbA_phrase argument adverbA_phrase V_V2 adverbA_phrase argument adverbA_phrase { /* SVO */
            NODE7("[sentence]");
        }
    | adverbA_phrase argument adverbA_phrase argument adverbA_phrase V_V2 adverbA_phrase { /* SOV */
            NODE7("[sentence]");
        }
    | adverbA_phrase V_V2 adverbA_phrase argument adverbA_phrase argument adverbA_phrase { /* VSO */
            NODE7("[sentence]");
        }
    ;

argument
    : aux0                   { NODE1(""); }   /* a      */
    | argument CONJ_ARG aux0 { NODE3(""); } /* a(ca)+ */
    ;

aux0
    : ART noun_phrase       { NODE2("[argument]"); }
    | ART infinitive_phrase { NODE2("[argument]"); }
    | noun_phrase           { NODE1("[argument]"); }
    | infinitive_phrase     { NODE1("[argument]"); }
    ;

argument_L1
    : aux1                         { NODE1(""); }   /* a      */
    | argument_L1 CONJ_ARG_L1 aux1 { NODE3(""); } /* a(ca)+ */
    ;

aux1
    : ART noun_L1_phrase       { NODE2("[subargument]"); }
    | ART infinitive_L1_phrase { NODE2("[subargument]"); }
    | noun_L1_phrase           { NODE1("[subargument]"); }
    | infinitive_L1_phrase     { NODE1("[subargument]"); }
    ;

argument_L2
    : aux2                         { NODE1(""); }   /* a      */
    | argument_L2 CONJ_ARG_L2 aux2 { NODE3(""); } /* a(ca)+ */
    ;

aux2
    : ART noun_L2_phrase       { NODE2("[subsubargument]"); }
    | ART infinitive_L2_phrase { NODE2("[subsubargument]"); }
    | noun_L2_phrase           { NODE1("[subsubargument]"); }
    | infinitive_L2_phrase     { NODE1("[subsubargument]"); }
    ;

noun_phrase
    : N_V0 adverbB_phrase apposition_phrase {
            NODE3(`"[noun phrase]"'); /* `quoted' because m4 splits strings with a space */
        }
    | N_V1 adverbB_phrase apposition_phrase {
            NODE3(`"[noun phrase]"');
        }
    | numeral adverbB_phrase apposition_phrase {
            NODE3(`"[noun phrase]"');
        }
    | N_V2 adverbB_phrase apposition_phrase {
            NODE3(`"[noun phrase]"');
        }
    ;

noun_L1_phrase
    : N_V0 adverbB_L1_phrase apposition_L1_phrase {
            NODE3(`"[noun subphrase"');
        }
    | N_V1 adverbB_L1_phrase apposition_L1_phrase {
            NODE3(`"[noun subphrase]"');
        }
    | numeral adverbB_L1_phrase apposition_L1_phrase {
            NODE3(`"[noun subphrase]"');
        }
    | N_V2 adverbB_L1_phrase apposition_L1_phrase {
            NODE3(`"[noun subphrase]"');
        }
    ;

noun_L2_phrase
    : N_V0 adverbB_L2_phrase apposition_L2_phrase {
            NODE3(`"[noun subsubphrase]"');
        }
    | N_V1 adverbB_L2_phrase apposition_L2_phrase {
            NODE3(`"[noun subsubphrase]"');
        }
    | numeral adverbB_L2_phrase apposition_L2_phrase {
            NODE3(`"[noun subsubphrase]"');
        }
    | N_V2 adverbB_L2_phrase apposition_L2_phrase {
            NODE3(`"[noun subsubphrase]"');
        }
    ;

infinitive_phrase
    : INF_V1 adverbB_phrase {
            NODE2(`"[infinitive phrase]"');
        }
    | INF_V2 adverbB_phrase argument_L1 {
            NODE3(`"[infinitive phrase]"');
        }
    ;

infinitive_L1_phrase
    : INF_V1 adverbB_L1_phrase {
            NODE2(`"[infinitive subphrase]"');
        }
    | INF_V2 adverbB_L1_phrase argument_L2 {
            NODE3(`"[infinitive subphrase]"');
        }
    ;

infinitive_L2_phrase
    : INF_V1 adverbB_L2_phrase {
            NODE2(`"[infinitive subsubphrase]"');
        }
    ;

apposition_phrase
    : /* empty */        { NODE0(""); } /* ()      */
    | aux3               { NODE1(""); } /* a+      */
    | aux5 aux4          { NODE2(""); } /* a(ca)+  */
    | CONJ_APP aux5 aux4 { NODE3(""); } /* ca(ca)+ */
    ;

aux3
    : aux5      { NODE1(""); }
    | aux3 aux5 { NODE2(""); }
    ;

aux4 
    : CONJ_APP aux5      { NODE2(""); }
    | aux4 CONJ_APP aux5 { NODE3(""); }
    ;

aux5 
    : APP_V1 adverbB_phrase {
            NODE2(`"[apposition phrase]"');
        }
    | APP_V2 adverbB_phrase argument_L1 {
            NODE3(`"[apposition phrase]"');
        }
    ;

apposition_L1_phrase
    : /* empty */           { NODE0(""); } /* ()      */
    | aux6                  { NODE1(""); } /* a+      */
    | aux8 aux7             { NODE2(""); } /* a(ca)+  */
    | CONJ_APP_L1 aux8 aux7 { NODE3(""); } /* ca(ca)+ */
    ;

aux6 
    : aux8      { NODE1(""); }
    | aux6 aux8 { NODE2(""); }
    ;

aux7 
    : CONJ_APP_L1 aux8      { NODE2(""); }
    | aux7 CONJ_APP_L1 aux8 { NODE3(""); }
    ;

aux8
    : APP_L1_V1 adverbB_L1_phrase {
            NODE2(`"[apposition subphrase]"');
        }
    | APP_L1_V2 adverbB_L1_phrase argument_L2 {
            NODE3(`"[apposition subphrase]"');
        }
    ;

apposition_L2_phrase
    : /* empty */             { NODE0(""); } /* ()      */
    | aux9                    { NODE1(""); } /* a+      */
    | aux11 aux10             { NODE2(""); } /* a(ca)+  */
    | CONJ_APP_L2 aux11 aux10 { NODE3(""); } /* ca(ca)+ */
    ;

aux9
    : aux11      { NODE1(""); }
    | aux9 aux11 { NODE2(""); }
    ;

aux10
    : CONJ_APP_L2 aux11       { NODE2(""); }
    | aux10 CONJ_APP_L2 aux11 { NODE3(""); }
    ;

aux11
    : APP_L2_V1 adverbB_L2_phrase {
            NODE2(`"[apposition subsubphrase]"');
        }
    ;

adverbA_phrase
    : /* empty */           { NODE0(""); } /* ()      */
    | aux12                 { NODE1(""); } /* a+      */
    | aux14 aux13           { NODE2(""); } /* a(ca)+  */
    | CONJ_ADVA aux14 aux13 { NODE3(""); } /* ca(ca)+ */
    ;

aux12
    : aux14       { NODE1(""); }
    | aux12 aux14 { NODE2(""); }
    ;

aux13
    : CONJ_ADVA aux14       { NODE2(""); }
    | aux13 CONJ_ADVA aux14 { NODE3(""); }
    ;

aux14
    : ADVA_V1 adverbB_phrase {
            NODE2(`"[adverbA phrase]"');
        }
    | ADVA_V2 adverbB_phrase argument_L1 {
            NODE3(`"[adverbA phrase]"');
        }
    ;

adverbB_phrase
    : /* empty */           { NODE0(""); } /* ()      */
    | aux21                 { NODE1(""); } /* a+      */
    | aux23 aux22           { NODE2(""); } /* a(ca)+  */
    | CONJ_ADVB aux23 aux22 { NODE3(""); } /* ca(ca)+ */
    ;

aux21
    : aux23       { NODE1(""); }
    | aux21 aux23 { NODE2(""); }
    ;

aux22
    : CONJ_ADVB aux23       { NODE2(""); }
    | aux22 CONJ_ADVB aux23 { NODE3(""); }
    ;

aux23
    : ADVB_V1 adverbB_L1_phrase {
            NODE2(`"[adverbB phrase]"');
        }
    | ADVB_V2 adverbB_L1_phrase argument_L1 {
            NODE3(`"[adverbB phrase]"');
        }
    ;

adverbB_L1_phrase
    : /* empty */              { NODE0(""); } /* ()      */
    | aux24                    { NODE1(""); } /* a+      */
    | aux26 aux25              { NODE2(""); } /* a(ca)+  */
    | CONJ_ADVB_L1 aux26 aux25 { NODE3(""); } /* ca(ca)+ */
    ;

aux24
    : aux26       { NODE1(""); }
    | aux24 aux26 { NODE2(""); }
    ;

aux25
    : CONJ_ADVB_L1 aux26       { NODE2(""); }
    | aux25 CONJ_ADVB_L1 aux26 { NODE3(""); }
    ;

aux26
    : ADVB_L1_V1 adverbB_L2_phrase {
            NODE2(`"[adverbB subphrase]"');
        }
    | ADVB_L1_V2 adverbB_L2_phrase argument_L2 {
            NODE3(`"[adverbB subphrase]"');
        }
    ;

adverbB_L2_phrase
    : /* empty */              { NODE0(""); } /* ()      */
    | aux27                    { NODE1(""); } /* a+      */
    | aux29 aux28              { NODE2(""); } /* a(ca)+  */
    | CONJ_ADVB_L2 aux29 aux28 { NODE3(""); } /* ca(ca)+ */
    ;

aux27
    : aux29       { NODE1(""); }
    | aux27 aux29 { NODE2(""); }
    ;

aux28
    : CONJ_ADVB_L2 aux29       { NODE2(""); }
    | aux28 CONJ_ADVB_L2 aux29 { NODE3(""); }
    ;

aux29
    : ADVB_L2_V1 { NODE1(`"[adverbB subsubphrase]"'); }
    ;

numeral
    : NUM_ART natural   { NODE2(""); }
    | decimal           { NODE1(""); }
    | fractional        { NODE1(""); }
    ;

decimal
    : NUM_ART natural NUM_POINT digits { NODE4(""); }
    ;

digits
    : n_0_9         { NODE1(""); }
    | digits n_0_9  { NODE2(""); }
    ;

fractional
    : NUM_ART natural NUM_DIV natural                   { NODE4(""); }
    | NUM_ART natural NUM_PLUS natural NUM_DIV natural  { NODE6(""); }
    ;

natural
    : n_0_999    { NODE1(""); }
    | n1e3       { NODE1(""); }
    | n1e6       { NODE1(""); }
    | n1e9       { NODE1(""); }
    | n1e12      { NODE1(""); }
    | n1e15      { NODE1(""); }
    | n1e18      { NODE1(""); }
    | n1e21      { NODE1(""); }
    | n1e24      { NODE1(""); }
    | n1e27      { NODE1(""); }
    | n1e30      { NODE1(""); }
    | n1e33      { NODE1(""); }
    ;

n_0_999
    : NUM_0     { NODE1(""); }
    | n_1_999   { NODE1(""); }
    ;

n_1_999
    : n_1_9                             { NODE1(""); }
    | n_10_90                           { NODE1(""); }
    | n_10_90 n_0_9                     { NODE2(""); }
    | n_1_9 NUM_100                     { NODE2(""); }
    | n_1_9 NUM_100 n_0_9               { NODE3(""); }
    | n_1_9 NUM_100 n_10_90             { NODE3(""); }
    | n_1_9 NUM_100 n_10_90 n_0_9       { NODE4(""); }
    ;

n_0_9
    : NUM_0     { NODE1(""); }
    | n_1_9     { NODE1(""); }
    ;

n_1_9
    : NUM_1     { NODE1(""); }
    | NUM_2     { NODE1(""); }
    | NUM_3     { NODE1(""); }
    | NUM_4     { NODE1(""); }
    | NUM_5     { NODE1(""); }
    | NUM_6     { NODE1(""); }
    | NUM_7     { NODE1(""); }
    | NUM_8     { NODE1(""); }
    | NUM_9     { NODE1(""); }
    ;

n_10_90
    : NUM_10     { NODE1(""); }
    | NUM_20     { NODE1(""); }
    | NUM_30     { NODE1(""); }
    | NUM_40     { NODE1(""); }
    | NUM_50     { NODE1(""); }
    | NUM_60     { NODE1(""); }
    | NUM_70     { NODE1(""); }
    | NUM_80     { NODE1(""); }
    | NUM_90     { NODE1(""); }
    ;

n1e3
    : n_1_999 NUM_1E3           { NODE2(""); }
    | n_1_999 NUM_1E3 n_0_999   { NODE3(""); }
    ;

n1e6
    : n_1_999 NUM_1E6           { NODE2(""); }
    | n_1_999 NUM_1E6 n_0_999   { NODE3(""); }
    | n_1_999 NUM_1E6 n1e3      { NODE3(""); }
    ;

n1e9
    : n_1_999 NUM_1E9           { NODE2(""); }
    | n_1_999 NUM_1E9 n_0_999   { NODE3(""); }
    | n_1_999 NUM_1E9 n1e3      { NODE3(""); }
    | n_1_999 NUM_1E9 n1e6      { NODE3(""); }
    ;

n1e12
    : n_1_999 NUM_1E12          { NODE2(""); }
    | n_1_999 NUM_1E12 n_0_999  { NODE3(""); }
    | n_1_999 NUM_1E12 n1e3     { NODE3(""); }
    | n_1_999 NUM_1E12 n1e6     { NODE3(""); }
    | n_1_999 NUM_1E12 n1e9     { NODE3(""); }
    ;

n1e15
    : n_1_999 NUM_1E15          { NODE2(""); }
    | n_1_999 NUM_1E15 n_0_999  { NODE3(""); }
    | n_1_999 NUM_1E15 n1e3     { NODE3(""); }
    | n_1_999 NUM_1E15 n1e6     { NODE3(""); }
    | n_1_999 NUM_1E15 n1e9     { NODE3(""); }
    | n_1_999 NUM_1E15 n1e12    { NODE3(""); }
    ;

n1e18
    : n_1_999 NUM_1E18          { NODE2(""); }
    | n_1_999 NUM_1E18 n_0_999  { NODE3(""); }
    | n_1_999 NUM_1E18 n1e3     { NODE3(""); }
    | n_1_999 NUM_1E18 n1e6     { NODE3(""); }
    | n_1_999 NUM_1E18 n1e9     { NODE3(""); }
    | n_1_999 NUM_1E18 n1e12    { NODE3(""); }
    | n_1_999 NUM_1E18 n1e15    { NODE3(""); }
    ;

n1e21
    : n_1_999 NUM_1E21          { NODE2(""); }
    | n_1_999 NUM_1E21 n_0_999  { NODE3(""); }
    | n_1_999 NUM_1E21 n1e3     { NODE3(""); }
    | n_1_999 NUM_1E21 n1e6     { NODE3(""); }
    | n_1_999 NUM_1E21 n1e9     { NODE3(""); }
    | n_1_999 NUM_1E21 n1e12    { NODE3(""); }
    | n_1_999 NUM_1E21 n1e15    { NODE3(""); }
    | n_1_999 NUM_1E21 n1e18    { NODE3(""); }
    ;

n1e24
    : n_1_999 NUM_1E24          { NODE2(""); }
    | n_1_999 NUM_1E24 n_0_999  { NODE3(""); }
    | n_1_999 NUM_1E24 n1e3     { NODE3(""); }
    | n_1_999 NUM_1E24 n1e6     { NODE3(""); }
    | n_1_999 NUM_1E24 n1e9     { NODE3(""); }
    | n_1_999 NUM_1E24 n1e12    { NODE3(""); }
    | n_1_999 NUM_1E24 n1e15    { NODE3(""); }
    | n_1_999 NUM_1E24 n1e18    { NODE3(""); }
    | n_1_999 NUM_1E24 n1e21    { NODE3(""); }
    ;

n1e27
    : n_1_999 NUM_1E27          { NODE2(""); }
    | n_1_999 NUM_1E27 n_0_999  { NODE3(""); }
    | n_1_999 NUM_1E27 n1e3     { NODE3(""); }
    | n_1_999 NUM_1E27 n1e6     { NODE3(""); }
    | n_1_999 NUM_1E27 n1e9     { NODE3(""); }
    | n_1_999 NUM_1E27 n1e12    { NODE3(""); }
    | n_1_999 NUM_1E27 n1e15    { NODE3(""); }
    | n_1_999 NUM_1E27 n1e18    { NODE3(""); }
    | n_1_999 NUM_1E27 n1e21    { NODE3(""); }
    | n_1_999 NUM_1E27 n1e24    { NODE3(""); }
    ;

n1e30
    : n_1_999 NUM_1E30          { NODE2(""); }
    | n_1_999 NUM_1E30 n_0_999  { NODE3(""); }
    | n_1_999 NUM_1E30 n1e3     { NODE3(""); }
    | n_1_999 NUM_1E30 n1e6     { NODE3(""); }
    | n_1_999 NUM_1E30 n1e9     { NODE3(""); }
    | n_1_999 NUM_1E30 n1e12    { NODE3(""); }
    | n_1_999 NUM_1E30 n1e15    { NODE3(""); }
    | n_1_999 NUM_1E30 n1e18    { NODE3(""); }
    | n_1_999 NUM_1E30 n1e21    { NODE3(""); }
    | n_1_999 NUM_1E30 n1e24    { NODE3(""); }
    | n_1_999 NUM_1E30 n1e27    { NODE3(""); }
    ;

n1e33
    : n_1_999 NUM_1E33          { NODE2(""); }
    | n_1_999 NUM_1E33 n_0_999  { NODE3(""); }
    | n_1_999 NUM_1E33 n1e3     { NODE3(""); }
    | n_1_999 NUM_1E33 n1e6     { NODE3(""); }
    | n_1_999 NUM_1E33 n1e9     { NODE3(""); }
    | n_1_999 NUM_1E33 n1e12    { NODE3(""); }
    | n_1_999 NUM_1E33 n1e15    { NODE3(""); }
    | n_1_999 NUM_1E33 n1e18    { NODE3(""); }
    | n_1_999 NUM_1E33 n1e21    { NODE3(""); }
    | n_1_999 NUM_1E33 n1e24    { NODE3(""); }
    | n_1_999 NUM_1E33 n1e27    { NODE3(""); }
    | n_1_999 NUM_1E33 n1e30    { NODE3(""); }
    ;

%%

YYSTYPE
mknode(char *token, YYSTYPE left, YYSTYPE right) {
    YYSTYPE newnode;
    char *newtoken;
    while ((newnode = (YYSTYPE)malloc(sizeof(struct node))) == NULL) {
        fprintf(stderr, "warning: not enough memory\n");
        sleep(1);
    }
    while ((newtoken = (char *)malloc(strlen(token) + 1)) == NULL) {
        fprintf(stderr, "warning: not enough memory\n");
        sleep(1);
    }
    strcpy(newtoken, token);
    newnode->left = left;
    newnode->right = right;
    newnode->token = newtoken;
    return newnode;
}

YYSTYPE
mknode0(char *token) {
    return mknode(token, NULL, NULL);
}

YYSTYPE
mknode1(char *token, YYSTYPE node) {
    return mknode(token, node, NULL);
}

YYSTYPE
mknode3(char *token, YYSTYPE node1, YYSTYPE node2, YYSTYPE node3) {
    return mknode(token, node1, mknode("", node2, node3));
}

YYSTYPE
mknode4(char *token, YYSTYPE node1, YYSTYPE node2, YYSTYPE node3,
        YYSTYPE node4) {
    return mknode(token, node1, mknode3("", node2, node3, node4));
}

YYSTYPE
mknode5(char *token, YYSTYPE node1, YYSTYPE node2, YYSTYPE node3,
        YYSTYPE node4, YYSTYPE node5) {
    return mknode(token, node1, mknode4("", node2, node3, node4, node5));
}

YYSTYPE
mknode6(char *token, YYSTYPE node1, YYSTYPE node2, YYSTYPE node3,
        YYSTYPE node4, YYSTYPE node5, YYSTYPE node6) {
    return mknode(token, node1, mknode5("", node2, node3, node4, node5,
        node6));
}

YYSTYPE
mknode7(char *token, YYSTYPE node1, YYSTYPE node2, YYSTYPE node3,
        YYSTYPE node4, YYSTYPE node5, YYSTYPE node6, YYSTYPE node7) {
    return mknode(token, node1, mknode6("", node2, node3, node4, node5,
        node6, node7));
}

void
printtree(YYSTYPE tree) {
    if (NULL == tree) {
        return;
    }
    if (NULL == tree->token) {
        return;
    }
    int i;
    /* token "" is dummy, so don't print it and don't shift level */
    if (strcmp(tree->token, "")) {
        for (i = 0; i < printtree_level; i++) {
            printf("    ");
        }
        printf("%s\n", tree->token);
        if (NULL != tree->left || NULL != tree->right) {
            printtree_level++;
        }
    }
    printtree(tree->left);
    printtree(tree->right);
    if (strcmp(tree->token, "")) {
        if (NULL != tree->left || NULL != tree->right) {
            printtree_level--;
        }
    }
}

int
main() {
    return yyparse();
}
