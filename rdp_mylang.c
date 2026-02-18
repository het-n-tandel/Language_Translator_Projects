#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

// --- 1. DEFINE ARRAYS (The Vocabulary) ---
// We end each array with NULL so our loops know where to stop.

const char *SUBJECTS[] = { "I", "i", "We", "You", NULL }; 
const char *VERBS[]    = { "like", "love", "study", NULL };
const char *OBJS_SIMPLE[] = { "programming", "coding", NULL }; 

// Specific phrase parts
const char *ADJECTIVES[] = { "all", "OS", NULL }; 
const char *NOUNS[]      = { "subjects", "subject", NULL };

// Connectors
const char *CONNECTORS[] = { "and", NULL };


// --- GLOBAL VARIABLES ---
char lookahead[50]; // Stores the current word being processed


// --- FUNCTION PROTOTYPES ---
void S();
void SUB();
void VERB();
void OBJ();
void TAIL();
bool check_in_list(const char *token, const char **list);
void match(const char *expected);
void error();
void print_vocabulary();


// --- MAIN DRIVER ---
int main() {
    // 1. Show the user the allowed words (Array List)
    print_vocabulary();

    printf("\nExpected Input Format: [SUBJECT] [VERB] [OBJECT] .\n");
    printf("Example: I like programming .\n");
    printf("Example: We study all subjects and also I like OS subject .\n\n");
    
    printf("Enter sentence (end with . ): ");
    scanf("%s", lookahead);

    S(); // Start Parsing

    // Check for success (must end with a dot)
    if (strcmp(lookahead, ".") == 0) {
        printf("\n✅ SUCCESS: Valid Sentence!\n");
    } else {
        error();
    }

    return 0;
}


// --- HELPER FUNCTIONS ---

// Checks if 'token' exists inside the 'list' array
bool check_in_list(const char *token, const char **list) {
    int i = 0;
    while (list[i] != NULL) {
        if (strcmp(token, list[i]) == 0) {
            return true; 
        }
        i++;
    }
    return false;
}

// Moves to next word if expected word matches
void match(const char *expected) {
    if (strcmp(lookahead, expected) == 0) {
        scanf("%s", lookahead); // Read next word
    } else {
        error();
    }
}

// Same as match, but checks against a whole list (for Subjects/Verbs)
void match_from_list(const char **list) {
    if (check_in_list(lookahead, list)) {
        scanf("%s", lookahead); // Read next word
    } else {
        error();
    }
}

void error() {
    printf("\n❌ ERROR: Unexpected word '%s'\n", lookahead);
    exit(1);
}

// Prints the contents of arrays
void print_vocabulary() {
    printf("--- ALLOWED VOCABULARY (ARRAYS) ---\n");
    
    printf("Subjects: [ ");
    for(int i=0; SUBJECTS[i]!=NULL; i++) printf("'%s' ", SUBJECTS[i]);
    printf("]\n");

    printf("Verbs:    [ ");
    for(int i=0; VERBS[i]!=NULL; i++) printf("'%s' ", VERBS[i]);
    printf("]\n");

    printf("Objects:  [ ");
    for(int i=0; OBJS_SIMPLE[i]!=NULL; i++) printf("'%s' ", OBJS_SIMPLE[i]);
    printf("]\n");
}


// --- GRAMMAR RULES ---

// S -> SUB VERB OBJ TAIL
void S() {
    SUB();
    VERB();
    OBJ();
    TAIL();
}

// SUB -> Check if current word is in SUBJECTS array
void SUB() {
    match_from_list(SUBJECTS);
}

// VERB -> Check if current word is in VERBS array
void VERB() {
    match_from_list(VERBS);
}

// OBJ -> "programming" OR "all subjects" OR "OS subject"
void OBJ() {
    if (check_in_list(lookahead, OBJS_SIMPLE)) {
        match_from_list(OBJS_SIMPLE);
    } 
    else if (strcmp(lookahead, "all") == 0) {
        match("all");
        match("subjects");
    } 
    else if (strcmp(lookahead, "OS") == 0) {
        match("OS");
        match("subject");
    } 
    else {
        error();
    }
}

// TAIL -> "and" "also" SUB VERB OBJ | epsilon
void TAIL() {
    if (strcmp(lookahead, "and") == 0) {
        match("and");
        match("also");
        SUB();
        VERB();
        OBJ();
    }
    // If word is not "and", do nothing (Epsilon)
}