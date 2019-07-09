%{

#include <stdio.h>
#include <unistd.h>
#include <string.h>

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
YYSTYPE mknode2(char *, YYSTYPE, YYSTYPE);
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
    : sentence       { $$ = mknode1("[text]", $1); }     /* s      */
    | sentence aux   { $$ = mknode2("[text]", $1, $2); } /* s(cs)+ */
    | aux            { $$ = mknode1("[text]", $1); }     /* (cs)+  */
    ;

aux
    : CONJ_SENT sentence       { $$ = mknode2("", $1, $2); } /* token "" is dummy */
    | aux CONJ_SENT sentence   { $$ = mknode3("", $1, $2, $3); }
    ;

sentence
    : adverbA_phrase V_V0 adverbA_phrase { /* V */
            $$ = mknode3("[sentence]", $1, $2, $3);
        }
    | adverbA_phrase argument adverbA_phrase V_V1 adverbA_phrase { /* SV */
            $$ = mknode5("[sentence]", $1, $2, $3, $4, $5);
        }
    | adverbA_phrase V_V1 adverbA_phrase argument adverbA_phrase { /* VS */
            $$ = mknode5("[sentence]", $1, $2, $3, $4, $5);
        }
    | adverbA_phrase argument adverbA_phrase V_V2 adverbA_phrase argument adverbA_phrase { /* SVO */
            $$ = mknode7("[sentence]", $1, $2, $3, $4, $5, $6, $7);
        }
    | adverbA_phrase argument adverbA_phrase argument adverbA_phrase V_V2 adverbA_phrase { /* SOV */
            $$ = mknode7("[sentence]", $1, $2, $3, $4, $5, $6, $7);
        }
    | adverbA_phrase V_V2 adverbA_phrase argument adverbA_phrase argument adverbA_phrase { /* VSO */
            $$ = mknode7("[sentence]", $1, $2, $3, $4, $5, $6, $7);
        }
    ;

argument
    : aux0                   { $$ = mknode1("", $1); }         /* a      */
    | argument CONJ_ARG aux0 { $$ = mknode3("", $1, $2, $3); } /* a(ca)+ */
    ;

aux0
    : ART noun_phrase       { $$ = mknode2("[argument]", $1, $2); }
    | ART infinitive_phrase { $$ = mknode2("[argument]", $1, $2); }
    | noun_phrase           { $$ = mknode1("[argument]", $1); }
    | infinitive_phrase     { $$ = mknode1("[argument]", $1); }
    ;

argument_L1
    : aux1                         { $$ = mknode1("", $1); }         /* a      */
    | argument_L1 CONJ_ARG_L1 aux1 { $$ = mknode3("", $1, $2, $3); } /* a(ca)+ */
    ;

aux1
    : ART noun_L1_phrase       { $$ = mknode2("[subargument]", $1, $2); }
    | ART infinitive_L1_phrase { $$ = mknode2("[subargument]", $1, $2); }
    | noun_L1_phrase           { $$ = mknode1("[subargument]", $1); }
    | infinitive_L1_phrase     { $$ = mknode1("[subargument]", $1); }
    ;

argument_L2
    : aux2                         { $$ = mknode1("", $1); }         /* a      */
    | argument_L2 CONJ_ARG_L2 aux2 { $$ = mknode3("", $1, $2, $3); } /* a(ca)+ */
    ;

aux2
    : ART noun_L2_phrase       { $$ = mknode2("[subsubargument]", $1, $2); }
    | ART infinitive_L2_phrase { $$ = mknode2("[subsubargument]", $1, $2); }
    | noun_L2_phrase           { $$ = mknode1("[subsubargument]", $1); }
    | infinitive_L2_phrase     { $$ = mknode1("[subsubargument]", $1); }
    ;

noun_phrase
    : N_V0 adverbB_phrase appositive_phrase {
            $$ = mknode3("[noun phrase]", $1, $2, $3);
        }
    | N_V1 adverbB_phrase appositive_phrase {
            $$ = mknode3("[noun phrase]", $1, $2, $3);
        }
    | numeral adverbB_phrase appositive_phrase {
            $$ = mknode3("[noun phrase]", $1, $2, $3);
        }
    | N_V2 adverbB_phrase appositive_phrase {
            $$ = mknode3("[noun phrase]", $1, $2, $3);
        }
    ;

noun_L1_phrase
    : N_V0 adverbB_L1_phrase appositive_L1_phrase {
            $$ = mknode3("[noun subphrase]", $1, $2, $3);
        }
    | N_V1 adverbB_L1_phrase appositive_L1_phrase {
            $$ = mknode3("[noun subphrase]", $1, $2, $3);
        }
    | numeral adverbB_L1_phrase appositive_L1_phrase {
            $$ = mknode3("[noun subphrase]", $1, $2, $3);
        }
    | N_V2 adverbB_L1_phrase appositive_L1_phrase {
            $$ = mknode3("[noun subphrase]", $1, $2, $3);
        }
    ;

noun_L2_phrase
    : N_V0 adverbB_L2_phrase appositive_L2_phrase {
            $$ = mknode3("[noun subsubphrase]", $1, $2, $3);
        }
    | N_V1 adverbB_L2_phrase appositive_L2_phrase {
            $$ = mknode3("[noun subsubphrase]", $1, $2, $3);
        }
    | numeral adverbB_L2_phrase appositive_L2_phrase {
            $$ = mknode3("[noun subsubphrase]", $1, $2, $3);
        }
    | N_V2 adverbB_L2_phrase appositive_L2_phrase {
            $$ = mknode3("[noun subsubphrase]", $1, $2, $3);
        }
    ;

infinitive_phrase
    : INF_V1 adverbB_phrase {
            $$ = mknode2("[infinitive phrase]", $1, $2);
        }
    | INF_V2 adverbB_phrase argument_L1 {
            $$ = mknode3("[infinitive phrase]", $1, $2, $3);
        }
    ;

infinitive_L1_phrase
    : INF_V1 adverbB_L1_phrase {
            $$ = mknode2("[infinitive subphrase]", $1, $2);
        }
    | INF_V2 adverbB_L1_phrase argument_L2 {
            $$ = mknode3("[infinitive subphrase]", $1, $2, $3);
        }
    ;

infinitive_L2_phrase
    : INF_V1 adverbB_L2_phrase {
            $$ = mknode2("[infinitive subsubphrase]", $1, $2);
        }
    ;

appositive_phrase
    : /* empty */        { $$ = mknode0(""); }             /* ()      */
    | aux3               { $$ = mknode1("", $1); }         /* a+      */
    | aux5 aux4          { $$ = mknode2("", $1, $2); }     /* a(ca)+  */
    | CONJ_APP aux5 aux4 { $$ = mknode3("", $1, $2, $3); } /* ca(ca)+ */
    ;

aux3
    : aux5      { $$ = mknode1("", $1); }
    | aux3 aux5 { $$ = mknode2("", $1, $2); }
    ;

aux4 
    : CONJ_APP aux5      { $$ = mknode2("", $1, $2); }
    | aux4 CONJ_APP aux5 { $$ = mknode3("", $1, $2, $3); }
    ;

aux5 
    : APP_V1 adverbB_phrase {
            $$ = mknode2("[appositive phrase]", $1, $2);
        }
    | APP_V2 adverbB_phrase argument_L1 {
            $$ = mknode3("[appositive phrase]", $1, $2, $3);
        }
    ;

appositive_L1_phrase
    : /* empty */           { $$ = mknode0(""); }             /* ()      */
    | aux6                  { $$ = mknode1("", $1); }         /* a+      */
    | aux8 aux7             { $$ = mknode2("", $1, $2); }     /* a(ca)+  */
    | CONJ_APP_L1 aux8 aux7 { $$ = mknode3("", $1, $2, $3); } /* ca(ca)+ */
    ;

aux6 
    : aux8      { $$ = mknode1("", $1); }
    | aux6 aux8 { $$ = mknode2("", $1, $2); }
    ;

aux7 
    : CONJ_APP_L1 aux8      { $$ = mknode2("", $1, $2); }
    | aux7 CONJ_APP_L1 aux8 { $$ = mknode3("", $1, $2, $3); }
    ;

aux8
    : APP_L1_V1 adverbB_L1_phrase {
            $$ = mknode2("[appositive subphrase]", $1, $2);
        }
    | APP_L1_V2 adverbB_L1_phrase argument_L2 {
            $$ = mknode3("[appositive subphrase]", $1, $2, $3);
        }
    ;

appositive_L2_phrase
    : /* empty */             { $$ = mknode0(""); }             /* ()      */
    | aux9                    { $$ = mknode1("", $1); }         /* a+      */
    | aux11 aux10             { $$ = mknode2("", $1, $2); }     /* a(ca)+  */
    | CONJ_APP_L2 aux11 aux10 { $$ = mknode3("", $1, $2, $3); } /* ca(ca)+ */
    ;

aux9
    : aux11      { $$ = mknode1("", $1); }
    | aux9 aux11 { $$ = mknode2("", $1, $2); }
    ;

aux10
    : CONJ_APP_L2 aux11       { $$ = mknode2("", $1, $2); }
    | aux10 CONJ_APP_L2 aux11 { $$ = mknode3("", $1, $2, $3); }
    ;

aux11
    : APP_L2_V1 adverbB_L2_phrase {
            $$ = mknode2("[appositive subsubphrase]", $1, $2);
        }
    ;

adverbA_phrase
    : /* empty */           { $$ = mknode0(""); }             /* ()      */
    | aux12                 { $$ = mknode1("", $1); }         /* a+      */
    | aux14 aux13           { $$ = mknode2("", $1, $2); }     /* a(ca)+  */
    | CONJ_ADVA aux14 aux13 { $$ = mknode3("", $1, $2, $3); } /* ca(ca)+ */
    ;

aux12
    : aux14       { $$ = mknode1("", $1); }
    | aux12 aux14 { $$ = mknode2("", $1, $2); }
    ;

aux13
    : CONJ_ADVA aux14       { $$ = mknode2("", $1, $2); }
    | aux13 CONJ_ADVA aux14 { $$ = mknode3("", $1, $2, $3); }
    ;

aux14
    : ADVA_V1 adverbB_phrase {
            $$ = mknode2("[adverbA phrase]", $1, $2);
        }
    | ADVA_V2 adverbB_phrase argument_L1 {
            $$ = mknode3("[adverbA phrase]", $1, $2, $3);
        }
    ;

adverbB_phrase
    : /* empty */           { $$ = mknode0(""); }             /* ()      */
    | aux21                 { $$ = mknode1("", $1); }         /* a+      */
    | aux23 aux22           { $$ = mknode2("", $1, $2); }     /* a(ca)+  */
    | CONJ_ADVB aux23 aux22 { $$ = mknode3("", $1, $2, $3); } /* ca(ca)+ */
    ;

aux21
    : aux23       { $$ = mknode1("", $1); }
    | aux21 aux23 { $$ = mknode2("", $1, $2); }
    ;

aux22
    : CONJ_ADVB aux23       { $$ = mknode2("", $1, $2); }
    | aux22 CONJ_ADVB aux23 { $$ = mknode3("", $1, $2, $3); }
    ;

aux23
    : ADVB_V1 adverbB_L1_phrase {
            $$ = mknode2("[adverbB phrase]", $1, $2);
        }
    | ADVB_V2 adverbB_L1_phrase argument_L1 {
            $$ = mknode3("[adverbB phrase]", $1, $2, $3);
        }
    ;

adverbB_L1_phrase
    : /* empty */              { $$ = mknode0(""); }             /* ()      */
    | aux24                    { $$ = mknode1("", $1); }         /* a+      */
    | aux26 aux25              { $$ = mknode2("", $1, $2); }     /* a(ca)+  */
    | CONJ_ADVB_L1 aux26 aux25 { $$ = mknode3("", $1, $2, $3); } /* ca(ca)+ */
    ;

aux24
    : aux26       { $$ = mknode1("", $1); }
    | aux24 aux26 { $$ = mknode2("", $1, $2); }
    ;

aux25
    : CONJ_ADVB_L1 aux26       { $$ = mknode2("", $1, $2); }
    | aux25 CONJ_ADVB_L1 aux26 { $$ = mknode3("", $1, $2, $3); }
    ;

aux26
    : ADVB_L1_V1 adverbB_L2_phrase {
            $$ = mknode2("[adverbB subphrase]", $1, $2);
        }
    | ADVB_L1_V2 adverbB_L2_phrase argument_L2 {
            $$ = mknode3("[adverbB subphrase]", $1, $2, $3);
        }
    ;

adverbB_L2_phrase
    : /* empty */              { $$ = mknode0(""); }             /* ()      */
    | aux27                    { $$ = mknode1("", $1); }         /* a+      */
    | aux29 aux28              { $$ = mknode2("", $1, $2); }     /* a(ca)+  */
    | CONJ_ADVB_L2 aux29 aux28 { $$ = mknode3("", $1, $2, $3); } /* ca(ca)+ */
    ;

aux27
    : aux29       { $$ = mknode1("", $1); }
    | aux27 aux29 { $$ = mknode2("", $1, $2); }
    ;

aux28
    : CONJ_ADVB_L2 aux29       { $$ = mknode2("", $1, $2); }
    | aux28 CONJ_ADVB_L2 aux29 { $$ = mknode3("", $1, $2, $3); }
    ;

aux29
    : ADVB_L2_V1 { $$ = mknode1("[adverbB subsubphrase]", $1); }
    ;

numeral
    : NUM_ART natural   { $$ = mknode2("[natural numeral]", $1, $2); }
    | decimal           { $$ = mknode1("", $1); }
    | fractional        { $$ = mknode1("", $1); }
    ;

decimal
    : NUM_ART natural NUM_POINT digits { $$ = mknode4("[decimal numeral]", $1, $2, $3, $4); }
    ;

digits
    : n_0_9         { $$ = mknode1("", $1); }
    | digits n_0_9  { $$ = mknode2("", $1, $2); }
    ;

fractional
    : NUM_ART natural NUM_DIV natural {
            $$ = mknode4("[fractional numeral]", $1, $2, $3, $4);
        }
    | NUM_ART natural NUM_PLUS natural NUM_DIV natural {
            $$ = mknode6("[compound fractional numeral]", $1, $2, $3, $4, $5, $6);
        }
    ;

natural
    : n_0_999    { $$ = mknode1("", $1); }
    | n1e3       { $$ = mknode1("", $1); }
    | n1e6       { $$ = mknode1("", $1); }
    | n1e9       { $$ = mknode1("", $1); }
    | n1e12      { $$ = mknode1("", $1); }
    | n1e15      { $$ = mknode1("", $1); }
    | n1e18      { $$ = mknode1("", $1); }
    | n1e21      { $$ = mknode1("", $1); }
    | n1e24      { $$ = mknode1("", $1); }
    | n1e27      { $$ = mknode1("", $1); }
    | n1e30      { $$ = mknode1("", $1); }
    | n1e33      { $$ = mknode1("", $1); }
    ;

n_0_999
    : NUM_0     { $$ = mknode1("", $1); }
    | n_1_999   { $$ = mknode1("", $1); }
    ;

n_1_999
    : n_1_9                             { $$ = mknode1("", $1); }
    | n_10_90                           { $$ = mknode1("", $1); }
    | n_10_90 n_0_9                     { $$ = mknode2("", $1, $2); }
    | n_1_9 NUM_100                     { $$ = mknode2("", $1, $2); }
    | n_1_9 NUM_100 n_0_9               { $$ = mknode3("", $1, $2, $3); }
    | n_1_9 NUM_100 n_10_90             { $$ = mknode3("", $1, $2, $3); }
    | n_1_9 NUM_100 n_10_90 n_0_9       { $$ = mknode4("", $1, $2, $3, $4); }
    ;

n_0_9
    : NUM_0     { $$ = mknode1("", $1); }
    | n_1_9     { $$ = mknode1("", $1); }
    ;

n_1_9
    : NUM_1     { $$ = mknode1("", $1); }
    | NUM_2     { $$ = mknode1("", $1); }
    | NUM_3     { $$ = mknode1("", $1); }
    | NUM_4     { $$ = mknode1("", $1); }
    | NUM_5     { $$ = mknode1("", $1); }
    | NUM_6     { $$ = mknode1("", $1); }
    | NUM_7     { $$ = mknode1("", $1); }
    | NUM_8     { $$ = mknode1("", $1); }
    | NUM_9     { $$ = mknode1("", $1); }
    ;

n_10_90
    : NUM_10     { $$ = mknode1("", $1); }
    | NUM_20     { $$ = mknode1("", $1); }
    | NUM_30     { $$ = mknode1("", $1); }
    | NUM_40     { $$ = mknode1("", $1); }
    | NUM_50     { $$ = mknode1("", $1); }
    | NUM_60     { $$ = mknode1("", $1); }
    | NUM_70     { $$ = mknode1("", $1); }
    | NUM_80     { $$ = mknode1("", $1); }
    | NUM_90     { $$ = mknode1("", $1); }
    ;

n1e3
    : n_1_999 NUM_1E3           { $$ = mknode2("", $1, $2); }
    | n_1_999 NUM_1E3 n_0_999   { $$ = mknode3("", $1, $2, $3); }
    ;

n1e6
    : n_1_999 NUM_1E6           { $$ = mknode2("", $1, $2); }
    | n_1_999 NUM_1E6 n_0_999   { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E6 n1e3      { $$ = mknode3("", $1, $2, $3); }
    ;

n1e9
    : n_1_999 NUM_1E9           { $$ = mknode2("", $1, $2); }
    | n_1_999 NUM_1E9 n_0_999   { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E9 n1e3      { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E9 n1e6      { $$ = mknode3("", $1, $2, $3); }
    ;

n1e12
    : n_1_999 NUM_1E12          { $$ = mknode2("", $1, $2); }
    | n_1_999 NUM_1E12 n_0_999  { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E12 n1e3     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E12 n1e6     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E12 n1e9     { $$ = mknode3("", $1, $2, $3); }
    ;

n1e15
    : n_1_999 NUM_1E15          { $$ = mknode2("", $1, $2); }
    | n_1_999 NUM_1E15 n_0_999  { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E15 n1e3     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E15 n1e6     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E15 n1e9     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E15 n1e12    { $$ = mknode3("", $1, $2, $3); }
    ;

n1e18
    : n_1_999 NUM_1E18          { $$ = mknode2("", $1, $2); }
    | n_1_999 NUM_1E18 n_0_999  { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E18 n1e3     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E18 n1e6     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E18 n1e9     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E18 n1e12    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E18 n1e15    { $$ = mknode3("", $1, $2, $3); }
    ;

n1e21
    : n_1_999 NUM_1E21          { $$ = mknode2("", $1, $2); }
    | n_1_999 NUM_1E21 n_0_999  { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E21 n1e3     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E21 n1e6     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E21 n1e9     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E21 n1e12    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E21 n1e15    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E21 n1e18    { $$ = mknode3("", $1, $2, $3); }
    ;

n1e24
    : n_1_999 NUM_1E24          { $$ = mknode2("", $1, $2); }
    | n_1_999 NUM_1E24 n_0_999  { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E24 n1e3     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E24 n1e6     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E24 n1e9     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E24 n1e12    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E24 n1e15    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E24 n1e18    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E24 n1e21    { $$ = mknode3("", $1, $2, $3); }
    ;

n1e27
    : n_1_999 NUM_1E27          { $$ = mknode2("", $1, $2); }
    | n_1_999 NUM_1E27 n_0_999  { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E27 n1e3     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E27 n1e6     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E27 n1e9     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E27 n1e12    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E27 n1e15    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E27 n1e18    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E27 n1e21    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E27 n1e24    { $$ = mknode3("", $1, $2, $3); }
    ;

n1e30
    : n_1_999 NUM_1E30          { $$ = mknode2("", $1, $2); }
    | n_1_999 NUM_1E30 n_0_999  { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E30 n1e3     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E30 n1e6     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E30 n1e9     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E30 n1e12    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E30 n1e15    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E30 n1e18    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E30 n1e21    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E30 n1e24    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E30 n1e27    { $$ = mknode3("", $1, $2, $3); }
    ;

n1e33
    : n_1_999 NUM_1E33          { $$ = mknode2("", $1, $2); }
    | n_1_999 NUM_1E33 n_0_999  { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E33 n1e3     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E33 n1e6     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E33 n1e9     { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E33 n1e12    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E33 n1e15    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E33 n1e18    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E33 n1e21    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E33 n1e24    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E33 n1e27    { $$ = mknode3("", $1, $2, $3); }
    | n_1_999 NUM_1E33 n1e30    { $$ = mknode3("", $1, $2, $3); }
    ;

%%

YYSTYPE
mknode2(char *token, YYSTYPE left, YYSTYPE right) {
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
    return mknode2(token, NULL, NULL);
}

YYSTYPE
mknode1(char *token, YYSTYPE node) {
    return mknode2(token, node, NULL);
}

YYSTYPE
mknode3(char *token, YYSTYPE node1, YYSTYPE node2, YYSTYPE node3) {
    return mknode2(token, node1, mknode2("", node2, node3));
}

YYSTYPE
mknode4(char *token, YYSTYPE node1, YYSTYPE node2, YYSTYPE node3,
        YYSTYPE node4) {
    return mknode2(token, node1, mknode3("", node2, node3, node4));
}

YYSTYPE
mknode5(char *token, YYSTYPE node1, YYSTYPE node2, YYSTYPE node3,
        YYSTYPE node4, YYSTYPE node5) {
    return mknode2(token, node1, mknode4("", node2, node3, node4, node5));
}

YYSTYPE
mknode6(char *token, YYSTYPE node1, YYSTYPE node2, YYSTYPE node3,
        YYSTYPE node4, YYSTYPE node5, YYSTYPE node6) {
    return mknode2(token, node1, mknode5("", node2, node3, node4, node5,
        node6));
}

YYSTYPE
mknode7(char *token, YYSTYPE node1, YYSTYPE node2, YYSTYPE node3,
        YYSTYPE node4, YYSTYPE node5, YYSTYPE node6, YYSTYPE node7) {
    return mknode2(token, node1, mknode6("", node2, node3, node4, node5,
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
