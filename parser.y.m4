divert(-1)
define(`NODE0', `$$ = mknode0($1)')
define(`NODE1', `$$ = mknode1($1, $`'1)')
define(`NODE2', `$$ = mknode($1, $`'1, $`'2)')
define(`NODE3', `$$ = mknode3($1, $`'1, $`'2, $`'3)')
define(`NODE4', `$$ = mknode4($1, $`'1, $`'2, $`'3, $`'4)')
define(`NODE5', `$$ = mknode5($1, $`'1, $`'2, $`'3, $`'4, $`'5)')
define(`NODE6', `$$ = mknode6($1, $`'1, $`'2, $`'3, $`'4, $`'5, $`'6)')
define(`NODE7', `$$ = mknode7($1, $`'1, $`'2, $`'3, $`'4, $`'5, $`'6, $`'7)')
define(`NODE8', `$$ = mknode8($1, $`'1, $`'2, $`'3, $`'4, $`'5, $`'6, $`'7, $`'8)')
divert(0)dnl
dnl
%{

#include <stdio.h>
#include <unistd.h>

#define YYSTYPE struct node *

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
YYSTYPE mknode8(char *, YYSTYPE, YYSTYPE, YYSTYPE, YYSTYPE, YYSTYPE, YYSTYPE,
                YYSTYPE, YYSTYPE);

void printtree(YYSTYPE);
int main();

int printtree_level = 0;

%}

%start START
%token V_0 V_1 V_2
%token ART ARTI ARTU
%token CONJSENT CONJARG CONJARGI CONJARGU CONJADJ CONJADJI CONJADJU
%token INF_0 INF_1 INF_2 INFI_0 INFI_1 INFI_2 INFU_0
%token N_1 N_2 NI_1 NI_2 NU_1
%token ADJ_1 ADJ_2 ADJI_1 ADJI_2 ADJU_1
%token ADV_1 ADV_2 ADVI_1 ADVI_2 ADVU_1
%token PTCP_1 PTCP_2 PTCPI_1 PTCPI_2 PTCPU_1
%token CONJADV CONJADVI CONJADVU
%token CONJPTCP CONJPTCPI CONJPTCPU

%%

START   : text {
                printtree($1);
            }
        ;

text    : sentence {                            /* s */
                NODE1("[text]");
            }
        | sentence text1 {                      /* s(cs)+ */
                NODE2("[text]");
            }
        | text1 {                               /* (cs)+ */
                NODE1("[text]");
            }
        ;

text1
    : CONJSENT sentence {
            NODE2(""); /* token "" is dummy */
        }
    | text1 CONJSENT sentence {
            NODE3("");
        }
    ;

sentence
    : adverb_phrase V_0 adverb_phrase {
            NODE3("[sentence]");
        }
    | adverb_phrase argument adverb_phrase V_1 adverb_phrase {
            NODE5("[sentence]");
        }
    | adverb_phrase argument adverb_phrase V_2 adverb_phrase argument adverb_phrase {
            NODE7("[sentence]");
        }
    ;

argument
    : argument0 {                           /* a */
            $$ = $1;
        }
    | argument CONJARG argument0 {          /* a(ca)+ */
            NODE3("");
        }
    ;

argument0
    : ART noun_phrase       { NODE2(`"[argument, level=0]"'); }
    | ART infinitive_phrase { NODE2(`"[argument, level=0]"'); }
    ;

argument_i
    : argument_i0 {                           /* a */
            $$ = $1;
        }
    | argument_i CONJARGI argument_i0 {          /* a(ca)+ */
            NODE3("");
        }
    ;

argument_i0
    : ARTI noun_i_phrase       { NODE2(`"[argument, level=1]"'); }
    | ARTI infinitive_i_phrase { NODE2(`"[argument, level=1]"'); }
    ;

argument_u
    : argument_u0 {                           /* a */
            $$ = $1;
        }
    | argument_u CONJARGU argument_u0 {          /* a(ca)+ */
            NODE3("");
        }
    ;

argument_u0
    : ARTU noun_u_phrase       { NODE2(`"[argument, level=2]"'); }
    | ARTU infinitive_u_phrase { NODE2(`"[argument, level=2]"'); }
    ;

noun_phrase
    : N_1 participle_phrase adjective_phrase {
            NODE3(`"[noun phrase, level=0]"');
        }
    | N_2 participle_phrase argument_i adjective_phrase {
            NODE4(`"[noun phrase, level=0]"');
        }
    ;

noun_i_phrase
    : NI_1 participle_i_phrase adjective_i_phrase {
            NODE3(`"[noun phrase, level=1]"');
        }
    | NI_2 participle_i_phrase argument_u adjective_i_phrase {
            NODE4(`"[noun phrase, level=1]"');
        }
    ;

noun_u_phrase
    : NU_1 participle_u_phrase adjective_u_phrase { NODE3(`"[noun phrase, level=2]"'); }
    ;

infinitive_phrase
    : INF_0 participle_phrase adjective_phrase {
            NODE3(`"[infinitive phrase, level=0]"');
        }
    | INF_1 participle_phrase argument_i adjective_phrase {
            NODE4(`"[infinitive phrase, level=0]"');
        }
    | INF_2 participle_phrase argument_i argument_i adjective_phrase {
            NODE5(`"[infinitive phrase, level=0]"');
        }
    ;

infinitive_i_phrase
    : INFI_0 participle_i_phrase adjective_i_phrase {
            NODE3(`"[infinitive phrase, level=1]"');
        }
    | INFI_1 participle_i_phrase argument_u adjective_i_phrase {
            NODE4(`"[infinitive phrase, level=1]"');
        }
    | INFI_2 participle_i_phrase argument_u argument_u adjective_i_phrase {
            NODE5(`"[infinitive phrase, level=1]"');
        }
    ;

infinitive_u_phrase
    : INFU_0 participle_u_phrase adjective_u_phrase {
            NODE3(`"[infinitive phrase, level=2]"');
        }
    ;

adjective_phrase
    : /* empty */ {                                     /* () */
            $$ = NULL;
        }
    | adjective_phrase1 {                               /* a+ */
            $$ = $1;
        }
    | adjective_phrase0 adjective_phrase2 {             /* a(ca)+ */
            NODE2("");
        }
    | CONJADJ adjective_phrase0 adjective_phrase2 {     /* ca(ca)+ */
            NODE3("");
        }
    ;

adjective_phrase1
    : adjective_phrase0                     { $$ = $1; }
    | adjective_phrase1 adjective_phrase0   { NODE2(""); }
    ;

adjective_phrase2
    : CONJADJ adjective_phrase0 {
            NODE2("");
        }
    | adjective_phrase2 CONJADJ adjective_phrase0 {
            NODE3("");
        }
    ;

adjective_phrase0
    : ADJ_1 participle_phrase {
            NODE2(`"[adjective phrase, level=0]"');
        }
    | ADJ_2 participle_phrase argument_i {
            NODE3(`"[adjective phrase, level=0]"');
        }
    ;

adjective_i_phrase
    : /* empty */ {                                         /* () */
            $$ = NULL;
        }
    | adjective_i_phrase1 {                                 /* a+ */
            $$ = $1;
        }
    | adjective_i_phrase0 adjective_i_phrase2 {             /* a(ca)+ */
            NODE2("");
        }
    | CONJADJI adjective_i_phrase0 adjective_i_phrase2 {    /* ca(ca)+ */
            NODE3("");
        }
    ;

adjective_i_phrase1
    : adjective_i_phrase0 {
            $$ = $1;
        }
    | adjective_i_phrase1 adjective_i_phrase0 {
            NODE2("");
        }
    ;

adjective_i_phrase2
    : CONJADJI adjective_i_phrase0 {
            NODE2("");
        }
    | adjective_i_phrase2 CONJADJI adjective_i_phrase0 {
            NODE3("");
        }
    ;

adjective_i_phrase0
    : ADJI_1 participle_i_phrase {
            NODE2(`"[adjective phrase, level=1]"');
        }
    | ADJI_2 participle_i_phrase argument_u {
            NODE3(`"[adjective phrase, level=1]"');
        }
    ;

adjective_u_phrase
    : /* empty */ {                                         /* () */
            $$ = NULL;
        }
    | adjective_u_phrase1 {                                 /* a+ */
            $$ = $1;
        }
    | adjective_u_phrase0 adjective_u_phrase2 {             /* a(ca)+ */
            NODE2("");
        }
    | CONJADJU adjective_u_phrase0 adjective_u_phrase2 {    /* ca(ca)+ */
            NODE3("");
        }
    ;

adjective_u_phrase1
    : adjective_u_phrase0 {
            $$ = $1;
        }
    | adjective_u_phrase1 adjective_u_phrase0 {
            NODE2("");
        }
    ;

adjective_u_phrase2
    : CONJADJU adjective_u_phrase0 {
            NODE2("");
        }
    | adjective_u_phrase2 CONJADJU adjective_u_phrase0 {
            NODE3("");
        }
    ;

adjective_u_phrase0
    : ADJU_1 participle_u_phrase {
            NODE2(`"[adjective phrase, level=2]"');
        }
    ;

adverb_phrase
    : /* empty */ {                                     /* () */
            $$ = NULL;
        }
    | adverb_phrase1 {                               /* a+ */
            $$ = $1;
        }
    | adverb_phrase0 adverb_phrase2 {             /* a(ca)+ */
            NODE2("");
        }
    | CONJADV adverb_phrase0 adverb_phrase2 {     /* ca(ca)+ */
            NODE3("");
        }
    ;

adverb_phrase1
    : adverb_phrase0                     { $$ = $1; }
    | adverb_phrase1 adverb_phrase0   { NODE2(""); }
    ;

adverb_phrase2
    : CONJADV adverb_phrase0 {
            NODE2("");
        }
    | adverb_phrase2 CONJADV adverb_phrase0 {
            NODE3("");
        }
    ;

adverb_phrase0
    : ADV_1 adverb_i_phrase {
            NODE1(`"[adverb phrase, level=0]"');
        }
    | ADV_2 adverb_i_phrase argument_i {
            NODE2(`"[adverb phrase, level=0]"');
        }
    ;

adverb_i_phrase
    : /* empty */ {                                         /* () */
            $$ = NULL;
        }
    | adverb_i_phrase1 {                                 /* a+ */
            $$ = $1;
        }
    | adverb_i_phrase0 adverb_i_phrase2 {             /* a(ca)+ */
            NODE2("");
        }
    | CONJADVI adverb_i_phrase0 adverb_i_phrase2 {    /* ca(ca)+ */
            NODE3("");
        }
    ;

adverb_i_phrase1
    : adverb_i_phrase0 {
            $$ = $1;
        }
    | adverb_i_phrase1 adverb_i_phrase0 {
            NODE2("");
        }
    ;

adverb_i_phrase2
    : CONJADVI adverb_i_phrase0 {
            NODE2("");
        }
    | adverb_i_phrase2 CONJADVI adverb_i_phrase0 {
            NODE3("");
        }
    ;

adverb_i_phrase0
    : ADVI_1 adverb_u_phrase {
            NODE1(`"[adverb phrase, level=1]"');
        }
    | ADVI_2 adverb_u_phrase argument_u {
            NODE2(`"[adverb phrase, level=1]"');
        }
    ;

adverb_u_phrase
    : /* empty */ {                                         /* () */
            $$ = NULL;
        }
    | adverb_u_phrase1 {                                 /* a+ */
            $$ = $1;
        }
    | adverb_u_phrase0 adverb_u_phrase2 {             /* a(ca)+ */
            NODE2("");
        }
    | CONJADVU adverb_u_phrase0 adverb_u_phrase2 {    /* ca(ca)+ */
            NODE3("");
        }
    ;

adverb_u_phrase1
    : adverb_u_phrase0 {
            $$ = $1;
        }
    | adverb_u_phrase1 adverb_u_phrase0 {
            NODE2("");
        }
    ;

adverb_u_phrase2
    : CONJADVU adverb_u_phrase0 {
            NODE2("");
        }
    | adverb_u_phrase2 CONJADVU adverb_u_phrase0 {
            NODE3("");
        }
    ;

adverb_u_phrase0
    : ADVU_1 {
            NODE1(`"[adjective phrase, level=2]"');
        }
    ;

participle_phrase
    : /* empty */ {                                     /* () */
            $$ = NULL;
        }
    | participle_phrase1 {                               /* a+ */
            $$ = $1;
        }
    | participle_phrase0 participle_phrase2 {             /* a(ca)+ */
            NODE2("");
        }
    | CONJPTCP participle_phrase0 participle_phrase2 {     /* ca(ca)+ */
            NODE3("");
        }
    ;

participle_phrase1
    : participle_phrase0                     { $$ = $1; }
    | participle_phrase1 participle_phrase0   { NODE2(""); }
    ;

participle_phrase2
    : CONJPTCP participle_phrase0 {
            NODE2("");
        }
    | participle_phrase2 CONJPTCP participle_phrase0 {
            NODE3("");
        }
    ;

participle_phrase0
    : PTCP_1 participle_i_phrase {
            NODE2(`"[participle phrase, level=0]"');
        }
    | PTCP_2 participle_i_phrase argument_i {
            NODE3(`"[participle phrase, level=0]"');
        }
    ;

participle_i_phrase
    : /* empty */ {                                         /* () */
            $$ = NULL;
        }
    | participle_i_phrase1 {                                 /* a+ */
            $$ = $1;
        }
    | participle_i_phrase0 participle_i_phrase2 {             /* a(ca)+ */
            NODE2("");
        }
    | CONJPTCPI participle_i_phrase0 participle_i_phrase2 {    /* ca(ca)+ */
            NODE3("");
        }
    ;

participle_i_phrase1
    : participle_i_phrase0 {
            $$ = $1;
        }
    | participle_i_phrase1 participle_i_phrase0 {
            NODE2("");
        }
    ;

participle_i_phrase2
    : CONJPTCPI participle_i_phrase0 {
            NODE2("");
        }
    | participle_i_phrase2 CONJPTCPI participle_i_phrase0 {
            NODE3("");
        }
    ;

participle_i_phrase0
    : PTCPI_1 participle_u_phrase {
            NODE2(`"[participle phrase, level=1]"');
        }
    | PTCPI_2 participle_u_phrase argument_u {
            NODE3(`"[participle phrase, level=1]"');
        }
    ;

participle_u_phrase
    : /* empty */ {                                         /* () */
            $$ = NULL;
        }
    | participle_u_phrase1 {                                 /* a+ */
            $$ = $1;
        }
    | participle_u_phrase0 participle_u_phrase2 {             /* a(ca)+ */
            NODE2("");
        }
    | CONJPTCPU participle_u_phrase0 participle_u_phrase2 {    /* ca(ca)+ */
            NODE3("");
        }
    ;

participle_u_phrase1
    : participle_u_phrase0 {
            $$ = $1;
        }
    | participle_u_phrase1 participle_u_phrase0 {
            NODE2("");
        }
    ;

participle_u_phrase2
    : CONJPTCPU participle_u_phrase0 {
            NODE2("");
        }
    | participle_u_phrase2 CONJPTCPU participle_u_phrase0 {
            NODE3("");
        }
    ;

participle_u_phrase0
    : PTCPU_1 {
            NODE1(`"[participle phrase, level=2]"');
        }
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

YYSTYPE
mknode8(char *token, YYSTYPE node1, YYSTYPE node2, YYSTYPE node3,
        YYSTYPE node4, YYSTYPE node5, YYSTYPE node6, YYSTYPE node7,
        YYSTYPE node8) {
    return mknode(token, node1, mknode7("", node2, node3, node4, node5,
        node6, node7, node8));
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
            printf("  ");
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
