define(`NODE0', `$$ = mknode0($1)')
define(`NODE1', `$$ = mknode1($1, $`'1)')
define(`NODE2', `$$ = mknode($1, $`'1, $`'2)')
define(`NODE3', `$$ = mknode3($1, $`'1, $`'2, $`'3)')
define(`NODE4', `$$ = mknode4($1, $`'1, $`'2, $`'3, $`'4)')
define(`NODE5', `$$ = mknode5($1, $`'1, $`'2, $`'3, $`'4, $`'5)')
define(`NODE6', `$$ = mknode6($1, $`'1, $`'2, $`'3, $`'4, $`'5, $`'6)')
define(`NODE7', `$$ = mknode7($1, $`'1, $`'2, $`'3, $`'4, $`'5, $`'6, $`'7)')
define(`NODE8', `$$ = mknode8($1, $`'1, $`'2, $`'3, $`'4, $`'5, $`'6, $`'7, $`'8)')
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
%token V_V0 V_V1 V_V2
%token ART
%token CONJ_SENT CONJ_ARG CONJ_ARG_L1 CONJ_ARG_L2 CONJ_ADJ CONJ_ADJ_L1 CONJ_ADJ_L2
%token CONJ_ADV CONJ_ADV_L1 CONJ_ADV_L2
%token CONJ_PTCP CONJ_PTCP_L1 CONJ_PTCP_L2
%token INF_V0 INF_V1 INF_V2 INF_L1_V0 INF_L1_V1 INF_L1_V2 INF_L2_V0
%token N_V1 N_V2 N_L1_V1 N_L1_V2 N_L2_V1
%token ADJ_V1 ADJ_V2 ADJ_L1_V1 ADJ_L1_V2 ADJ_L2_V1
%token ADV_V1 ADV_V2 ADV_L1_V1 ADV_L1_V2 ADV_L2_V1
%token PTCP_V1 PTCP_V2 PTCP_L1_V1 PTCP_L1_V2 PTCP_L2_V1

%%

START
    : text { printtree($1); }
    ;

text
    : sentence       { NODE1("[text]"); } /* s      */
    | sentence aux30 { NODE2("[text]"); } /* s(cs)+ */
    | aux30          { NODE1("[text]"); } /* (cs)+  */
    ;

aux30
    : CONJ_SENT sentence       { NODE2(""); } /* token "" is dummy */
    | aux30 CONJ_SENT sentence { NODE3(""); }
    ;

sentence
    : adverb_phrase V_V0 adverb_phrase {
            NODE3("[sentence]");
        }
    | adverb_phrase argument adverb_phrase V_V1 adverb_phrase {
            NODE5("[sentence]");
        }
    | adverb_phrase argument adverb_phrase V_V2 adverb_phrase argument adverb_phrase {
            NODE7("[sentence]");
        }
    ;

argument
    : aux0                   { $$ = $1; }   /* a      */
    | argument CONJ_ARG aux0 { NODE3(""); } /* a(ca)+ */
    ;

aux0
    : ART noun_phrase       { NODE2(`"[argument, level=0]"'); } /* `quoted' because m4 splits strings with a space */
    | ART infinitive_phrase { NODE2(`"[argument, level=0]"'); }
    | noun_phrase           { NODE1(`"[argument, level=0]"'); }
    | infinitive_phrase     { NODE1(`"[argument, level=0]"'); }
    ;

argument_L1
    : aux1                         { $$ = $1; }   /* a      */
    | argument_L1 CONJ_ARG_L1 aux1 { NODE3(""); } /* a(ca)+ */
    ;

aux1
    : ART noun_L1_phrase       { NODE2(`"[argument, level=1]"'); }
    | ART infinitive_L1_phrase { NODE2(`"[argument, level=1]"'); }
    | noun_L1_phrase           { NODE1(`"[argument, level=1]"'); }
    | infinitive_L1_phrase     { NODE1(`"[argument, level=1]"'); }
    ;

argument_L2
    : aux2                         { $$ = $1; }   /* a      */
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
            NODE3(`"[noun phrase, level=0]"');
        }
    | N_V2 participle_phrase argument_L1 adjective_phrase {
            NODE4(`"[noun phrase, level=0]"');
        }
    ;

noun_L1_phrase
    : N_L1_V1 participle_L1_phrase adjective_L1_phrase {
            NODE3(`"[noun phrase, level=1]"');
        }
    | N_L1_V2 participle_L1_phrase argument_L2 adjective_L1_phrase {
            NODE4(`"[noun phrase, level=1]"');
        }
    ;

noun_L2_phrase
    : N_L2_V1 participle_L2_phrase adjective_L2_phrase { NODE3(`"[noun phrase, level=2]"'); }
    ;

infinitive_phrase
    : INF_V0 participle_phrase adjective_phrase {
            NODE3(`"[infinitive phrase, level=0]"');
        }
    | INF_V1 participle_phrase argument_L1 adjective_phrase {
            NODE4(`"[infinitive phrase, level=0]"');
        }
    | INF_V2 participle_phrase argument_L1 argument_L1 adjective_phrase {
            NODE5(`"[infinitive phrase, level=0]"');
        }
    ;

infinitive_L1_phrase
    : INF_L1_V0 participle_L1_phrase adjective_L1_phrase {
            NODE3(`"[infinitive phrase, level=1]"');
        }
    | INF_L1_V1 participle_L1_phrase argument_L2 adjective_L1_phrase {
            NODE4(`"[infinitive phrase, level=1]"');
        }
    | INF_L1_V2 participle_L1_phrase argument_L2 argument_L2 adjective_L1_phrase {
            NODE5(`"[infinitive phrase, level=1]"');
        }
    ;

infinitive_L2_phrase
    : INF_L2_V0 participle_L2_phrase adjective_L2_phrase {
            NODE3(`"[infinitive phrase, level=2]"');
        }
    ;

adjective_phrase
    : /* empty */        { $$ = NULL; } /* ()      */
    | aux3               { $$ = $1; }   /* a+      */
    | aux5 aux4          { NODE2(""); } /* a(ca)+  */
    | CONJ_ADJ aux5 aux4 { NODE3(""); } /* ca(ca)+ */
    ;

aux3
    : aux5      { $$ = $1; }
    | aux3 aux5 { NODE2(""); }
    ;

aux4 
    : CONJ_ADJ aux5      { NODE2(""); }
    | aux4 CONJ_ADJ aux5 { NODE3(""); }
    ;

aux5 
    : ADJ_V1 participle_phrase {
            NODE2(`"[adjective phrase, level=0]"');
        }
    | ADJ_V2 participle_phrase argument_L1 {
            NODE3(`"[adjective phrase, level=0]"');
        }
    ;

adjective_L1_phrase
    : /* empty */           { $$ = NULL; } /* ()      */
    | aux6                  { $$ = $1; }   /* a+      */
    | aux8 aux7             { NODE2(""); } /* a(ca)+  */
    | CONJ_ADJ_L1 aux8 aux7 { NODE3(""); } /* ca(ca)+ */
    ;

aux6 
    : aux8      { $$ = $1; }
    | aux6 aux8 { NODE2(""); }
    ;

aux7 
    : CONJ_ADJ_L1 aux8   { NODE2(""); }
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
    | aux9                    { $$ = $1; }   /* a+      */
    | aux11 aux10             { NODE2(""); } /* a(ca)+  */
    | CONJ_ADJ_L2 aux11 aux10 { NODE3(""); } /* ca(ca)+ */
    ;

aux9
    : aux11      { $$ = $1; }
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
    | aux12                { $$ = $1; }   /* a+      */
    | aux14 aux13          { NODE2(""); } /* a(ca)+  */
    | CONJ_ADV aux14 aux13 { NODE3(""); } /* ca(ca)+ */
            
    ;

aux12
    : aux14       { $$ = $1; }
    | aux12 aux14 { NODE2(""); }
    ;

aux13
    : CONJ_ADV aux14       { NODE2(""); }
    | aux13 CONJ_ADV aux14 { NODE3(""); }
    ;

aux14
    : ADV_V1 adverb_L1_phrase {
            NODE2(`"[adverb phrase, level=0]"');
        }
    | ADV_V2 adverb_L1_phrase argument_L1 {
            NODE3(`"[adverb phrase, level=0]"');
        }
    ;

adverb_L1_phrase
    : /* empty */             { $$ = NULL; } /* ()      */
    | aux15                   { $$ = $1; }   /* a+      */
    | aux17 aux16             { NODE2(""); } /* a(ca)+  */
    | CONJ_ADV_L1 aux17 aux16 { NODE3(""); } /* ca(ca)+ */
    ;

aux15
    : aux17       { $$ = $1; }
    | aux15 aux17 { NODE2(""); }
    ;

aux16
    : CONJ_ADV_L1 aux17       { NODE2(""); }
    | aux16 CONJ_ADV_L1 aux17 { NODE3(""); }
    ;

aux17
    : ADV_L1_V1 adverb_L2_phrase {
            NODE2(`"[adverb phrase, level=1]"');
        }
    | ADV_L1_V2 adverb_L2_phrase argument_L2 {
            NODE3(`"[adverb phrase, level=1]"');
        }
    ;

adverb_L2_phrase
    : /* empty */             { $$ = NULL; } /* ()      */
    | aux18                   { $$ = $1; }   /* a+      */
    | aux20 aux19             { NODE2(""); } /* a(ca)+  */
    | CONJ_ADV_L2 aux20 aux19 { NODE3(""); } /* ca(ca)+ */
    ;

aux18
    : aux20       { $$ = $1; }
    | aux18 aux20 { NODE2(""); }
    ;

aux19
    : CONJ_ADV_L2 aux20       { NODE2(""); }
    | aux19 CONJ_ADV_L2 aux20 { NODE3(""); }
    ;

aux20
    : ADV_L2_V1 { NODE1(`"[adjective phrase, level=2]"'); }
    ;

participle_phrase
    : /* empty */           { $$ = NULL; } /* ()      */
    | aux21                 { $$ = $1; }   /* a+      */
    | aux23 aux22           { NODE2(""); } /* a(ca)+  */
    | CONJ_PTCP aux23 aux22 { NODE3(""); } /* ca(ca)+ */
    ;

aux21
    : aux23       { $$ = $1; }
    | aux21 aux23 { NODE2(""); }
    ;

aux22
    : CONJ_PTCP aux23       { NODE2(""); }
    | aux22 CONJ_PTCP aux23 { NODE3(""); }
    ;

aux23
    : PTCP_V1 participle_L1_phrase {
            NODE2(`"[participle phrase, level=0]"');
        }
    | PTCP_V2 participle_L1_phrase argument_L1 {
            NODE3(`"[participle phrase, level=0]"');
        }
    ;

participle_L1_phrase
    : /* empty */              { $$ = NULL; } /* ()      */
    | aux24                    { $$ = $1; }   /* a+      */
    | aux26 aux25              { NODE2(""); } /* a(ca)+  */
    | CONJ_PTCP_L1 aux26 aux25 { NODE3(""); } /* ca(ca)+ */
    ;

aux24
    : aux26       { $$ = $1; }
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
    | aux27                    { $$ = $1; }   /* a+      */
    | aux29 aux28              { NODE2(""); } /* a(ca)+  */
    | CONJ_PTCP_L2 aux29 aux28 { NODE3(""); } /* ca(ca)+ */
    ;

aux27
    : aux29       { $$ = $1; }
    | aux27 aux29 { NODE2(""); }
    ;

aux28
    : CONJ_PTCP_L2 aux29       { NODE2(""); }
    | aux28 CONJ_PTCP_L2 aux29 { NODE3(""); }
    ;

aux29
    : PTCP_L2_V1 { NODE1(`"[participle phrase, level=2]"'); }
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
