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
%token CONJ_ARG CONJ_ARG_L1 CONJ_ARG_L2 CONJ_ADJ CONJ_ADJ_L1 CONJ_ADJ_L2
%token CONJ_SENT CONJ_ADV
%token CONJ_PTCP CONJ_PTCP_L1 CONJ_PTCP_L2
%token INF_V0 INF_V1 INF_V2
%token N_V1 N_V2
%token ADJ_V1 ADJ_V2 ADJ_L1_V1 ADJ_L1_V2 ADJ_L2_V1
%token ADV_V1 ADV_V2
%token PTCP_V1 PTCP_V2 PTCP_L1_V1 PTCP_L1_V2 PTCP_L2_V1
%token NUM_0 NUM_1 NUM_2 NUM_3 NUM_4 NUM_5 NUM_6 NUM_7 NUM_8 NUM_9 NUM_10
%token NUM_20 NUM_30 NUM_40 NUM_50 NUM_60 NUM_70 NUM_80 NUM_90 NUM_100
%token NUM_1E3 NUM_1E6 NUM_1E9 NUM_1E12 NUM_1E15 NUM_1E18 NUM_1E21 NUM_1E24
%token NUM_1E27 NUM_1E30 NUM_1E33 NUM_DIV NUM_PLUS NUM_POINT NUM_TERM

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
    : adverb_phrase V_V0 adverb_phrase { /* V */
            NODE3("[sentence]");
        }
    | adverb_phrase argument adverb_phrase V_V1 adverb_phrase { /* SV */
            NODE5("[sentence]");
        }
    | adverb_phrase V_V1 adverb_phrase argument adverb_phrase { /* VS */
            NODE5("[sentence]");
        }
    | adverb_phrase argument adverb_phrase V_V2 adverb_phrase argument adverb_phrase { /* SVO */
            NODE7("[sentence]");
        }
    | adverb_phrase argument adverb_phrase argument adverb_phrase V_V2 adverb_phrase { /* SOV */
            NODE7("[sentence]");
        }
    | adverb_phrase V_V2 adverb_phrase argument adverb_phrase argument adverb_phrase { /* VSO */
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
    : aux1                         { $$ = $1; }   /* a      */
    | argument_L1 CONJ_ARG_L1 aux1 { NODE3(""); } /* a(ca)+ */
    ;

aux1
    : ART noun_L1_phrase       { NODE2(`"[argument, level=1]"'); } /* `quoted' because m4 splits strings with a space */
    | ART infinitive_L1_phrase { NODE2(`"[argument, level=1]"'); }
    | noun_L1_phrase           { NODE1(`"[argument, level=1]"'); }
    | infinitive_L1_phrase     { NODE1(`"[argument, level=1]"'); }
    ;

argument_L2
    : aux2                         { NODE1(""); }   /* a      */
    | argument_L2 CONJ_ARG_L2 aux2 { NODE3(""); } /* a(ca)+ */
    ;

aux2
    : ART noun_L2_phrase       { NODE2(`"[argument, level=2]"'); }
    | ART infinitive_L2_phrase { NODE2(`"[argument, level=2]"'); }
    | noun_L2_phrase           { NODE1(`"[argument, level=2]"'); }
    | infinitive_L2_phrase     { NODE1(`"[argument, level=2]"'); }
    ;

noun_phrase
    : N_V1 participle_phrase adjective_phrase {
            NODE3(`"[noun phrase]"');
        }
    | numeral participle_phrase adjective_phrase {
            NODE3(`"[noun phrase]"');
        }
    | N_V2 participle_phrase argument_L1 adjective_phrase {
            NODE4(`"[noun phrase]"');
        }
    ;

noun_L1_phrase
    : N_V1 participle_L1_phrase adjective_L1_phrase {
            NODE3(`"[noun phrase, level=1]"');
        }
    | numeral participle_L1_phrase adjective_L1_phrase {
            NODE3(`"[noun phrase, level=1]"');
        }
    | N_V2 participle_L1_phrase argument_L2 adjective_L1_phrase {
            NODE4(`"[noun phrase, level=1]"');
        }
    ;

noun_L2_phrase
    : N_V1 participle_L2_phrase adjective_L2_phrase     { NODE3(`"[noun phrase, level=2]"'); }
    | numeral participle_L2_phrase adjective_L2_phrase  { NODE3(`"[noun phrase, level=2]"'); }
    ;

infinitive_phrase
    : INF_V0 participle_phrase adjective_phrase {
            NODE3(`"[infinitive phrase]"');
        }
    | INF_V1 participle_phrase argument_L1 adjective_phrase {
            NODE4(`"[infinitive phrase]"');
        }
    | INF_V2 participle_phrase argument_L1 argument_L1 adjective_phrase {
            NODE5(`"[infinitive phrase]"');
        }
    ;

infinitive_L1_phrase
    : INF_V0 participle_L1_phrase adjective_L1_phrase {
            NODE3(`"[infinitive phrase, level=1]"');
        }
    | INF_V1 participle_L1_phrase argument_L2 adjective_L1_phrase {
            NODE4(`"[infinitive phrase, level=1]"');
        }
    | INF_V2 participle_L1_phrase argument_L2 argument_L2 adjective_L1_phrase {
            NODE5(`"[infinitive phrase, level=1]"');
        }
    ;

infinitive_L2_phrase
    : INF_V0 participle_L2_phrase adjective_L2_phrase {
            NODE3(`"[infinitive phrase, level=2]"');
        }
    ;

adjective_phrase
    : /* empty */        { $$ = NULL; } /* ()      */
    | aux3               { NODE1(""); } /* a+      */
    | aux5 aux4          { NODE2(""); } /* a(ca)+  */
    | CONJ_ADJ aux5 aux4 { NODE3(""); } /* ca(ca)+ */
    ;

aux3
    : aux5      { NODE1(""); }
    | aux3 aux5 { NODE2(""); }
    ;

aux4 
    : CONJ_ADJ aux5      { NODE2(""); }
    | aux4 CONJ_ADJ aux5 { NODE3(""); }
    ;

aux5 
    : ADJ_V1 participle_phrase {
            NODE2(`"[adjective phrase]"');
        }
    | ADJ_V2 participle_phrase argument_L1 {
            NODE3(`"[adjective phrase]"');
        }
    ;

adjective_L1_phrase
    : /* empty */           { $$ = NULL; } /* ()      */
    | aux6                  { NODE1(""); } /* a+      */
    | aux8 aux7             { NODE2(""); } /* a(ca)+  */
    | CONJ_ADJ_L1 aux8 aux7 { NODE3(""); } /* ca(ca)+ */
    ;

aux6 
    : aux8      { NODE1(""); }
    | aux6 aux8 { NODE2(""); }
    ;

aux7 
    : CONJ_ADJ_L1 aux8      { NODE2(""); }
    | aux7 CONJ_ADJ_L1 aux8 { NODE3(""); }
    ;

aux8
    : ADJ_L1_V1 participle_L1_phrase {
            NODE2(`"[adjective phrase, level=1]"');
        }
    | ADJ_L1_V2 participle_L1_phrase argument_L2 {
            NODE3(`"[adjective phrase, level=1]"');
        }
    ;

adjective_L2_phrase
    : /* empty */             { $$ = NULL; } /* ()      */
    | aux9                    { NODE1(""); } /* a+      */
    | aux11 aux10             { NODE2(""); } /* a(ca)+  */
    | CONJ_ADJ_L2 aux11 aux10 { NODE3(""); } /* ca(ca)+ */
    ;

aux9
    : aux11      { NODE1(""); }
    | aux9 aux11 { NODE2(""); }
    ;

aux10
    : CONJ_ADJ_L2 aux11       { NODE2(""); }
    | aux10 CONJ_ADJ_L2 aux11 { NODE3(""); }
    ;

aux11
    : ADJ_L2_V1 participle_L2_phrase {
            NODE2(`"[adjective phrase, level=2]"');
        }
    ;

adverb_phrase
    : /* empty */          { $$ = NULL; } /* ()      */
    | aux12                { NODE1(""); } /* a+      */
    | aux14 aux13          { NODE2(""); } /* a(ca)+  */
    | CONJ_ADV aux14 aux13 { NODE3(""); } /* ca(ca)+ */
    ;

aux12
    : aux14       { NODE1(""); }
    | aux12 aux14 { NODE2(""); }
    ;

aux13
    : CONJ_ADV aux14       { NODE2(""); }
    | aux13 CONJ_ADV aux14 { NODE3(""); }
    ;

aux14
    : ADV_V1 participle_phrase {
            NODE2(`"[adverb phrase]"');
        }
    | ADV_V2 participle_phrase argument_L1 {
            NODE3(`"[adverb phrase]"');
        }
    ;

participle_phrase
    : /* empty */           { $$ = NULL; } /* ()      */
    | aux21                 { NODE1(""); }   /* a+      */
    | aux23 aux22           { NODE2(""); } /* a(ca)+  */
    | CONJ_PTCP aux23 aux22 { NODE3(""); } /* ca(ca)+ */
    ;

aux21
    : aux23       { NODE1(""); }
    | aux21 aux23 { NODE2(""); }
    ;

aux22
    : CONJ_PTCP aux23       { NODE2(""); }
    | aux22 CONJ_PTCP aux23 { NODE3(""); }
    ;

aux23
    : PTCP_V1 participle_L1_phrase {
            NODE2(`"[participle phrase]"');
        }
    | PTCP_V2 participle_L1_phrase argument_L1 {
            NODE3(`"[participle phrase]"');
        }
    ;

participle_L1_phrase
    : /* empty */              { $$ = NULL; } /* ()      */
    | aux24                    { NODE1(""); } /* a+      */
    | aux26 aux25              { NODE2(""); } /* a(ca)+  */
    | CONJ_PTCP_L1 aux26 aux25 { NODE3(""); } /* ca(ca)+ */
    ;

aux24
    : aux26       { NODE1(""); }
    | aux24 aux26 { NODE2(""); }
    ;

aux25
    : CONJ_PTCP_L1 aux26       { NODE2(""); }
    | aux25 CONJ_PTCP_L1 aux26 { NODE3(""); }
    ;

aux26
    : PTCP_L1_V1 participle_L2_phrase {
            NODE2(`"[participle phrase, level=1]"');
        }
    | PTCP_L1_V2 participle_L2_phrase argument_L2 {
            NODE3(`"[participle phrase, level=1]"');
        }
    ;

participle_L2_phrase
    : /* empty */              { $$ = NULL; } /* ()      */
    | aux27                    { NODE1(""); } /* a+      */
    | aux29 aux28              { NODE2(""); } /* a(ca)+  */
    | CONJ_PTCP_L2 aux29 aux28 { NODE3(""); } /* ca(ca)+ */
    ;

aux27
    : aux29       { NODE1(""); }
    | aux27 aux29 { NODE2(""); }
    ;

aux28
    : CONJ_PTCP_L2 aux29       { NODE2(""); }
    | aux28 CONJ_PTCP_L2 aux29 { NODE3(""); }
    ;

aux29
    : PTCP_L2_V1 { NODE1(`"[participle phrase, level=2]"'); }
    ;

numeral
    : natural NUM_TERM  { NODE2(""); }
    | decimal           { NODE1(""); }
    | fractional        { NODE1(""); }
    ;

decimal
    : natural NUM_POINT digits NUM_TERM { NODE4(""); }
    ;

digits
    : n_0_9         { NODE1(""); }
    | digits n_0_9  { NODE2(""); }
    ;

fractional
    : natural NUM_DIV natural NUM_TERM                   { NODE4(""); }
    | natural NUM_PLUS natural NUM_DIV natural NUM_TERM  { NODE6(""); }
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
    int i;
    if (NULL == tree) {
        return;
    }
    if (NULL == tree->token) {
        return;
    }
    /* token "" is dummy, so print neither token nor parens around it */
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
