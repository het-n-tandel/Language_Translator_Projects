# Compiler Design & System Software Projects

## 📖 Overview
A suite of compiler design projects exploring lexical analysis, LL/LR parsing, and syntax-directed translation using both custom algorithms and tools like YACC. Key implementations include a Natural-Language-to-SQL translator, a dynamic parser generator, and a custom scanner tool, demonstrating the complete lifecycle of language processing and code generation.

---

## 📂 Project List

### Desktop Calculator (YACC)
**Goal:** Study the YACC tool and create a parser for mathematical expressions.
* **Description:** A Language Processor (LP) that functions as a desktop calculator.
* **Key Concepts:** Syntax Directed Definitions (SDD), LALR Parsing, YACC manual study.
* **Outcome:** A functional calculator that parses arithmetic expressions.

### Recursive Descent Parser (English Subset)
**Goal:** Create a simple parser for a specific subset of the English language.
* **Description:** Implements a Recursive Descent Parser (RDP) to validate sentence structures.
* **Grammar Rules:** Handles sentences like *"I like 'all' subjects"* or *"I like 'OS' subject"*.
* **Key Concepts:** Ambiguity removal, Grammar formulation, Top-down parsing.

### Natural Language to SQL Translator
**Goal:** Develop a language translator for specific source and destination languages.
* **Description:** A source-to-source translator that converts informal "Hinglish" (Hindi-English mix) commands into executable SQL queries.
* **Input Example:** `sab data chaiye 'mytable' sey`
* **Output Example:** `select * from mytable;`
* **Key Concepts:** Lexical analysis, Token mapping, Semantic analysis.

### Dynamic LR Parser Generator
**Goal:** Generate an LR Parser for any user-defined language *without* using external tools.
* **Description:** A robust system that reads a grammar dynamically, handles left recursion/left factoring, computes First & Follow sets, and generates the parsing table.
* **Key Concepts:** Bottom-up parsing, Shift-Reduce algorithms, Automata theory.
* **Features:**
    * Removes Left Recursion/Factoring automatically.
    * Validates strings deterministically.

### Custom Lexical Analyzer Generator (Flex Clone)
**Goal:** Generate a tool similar to 'Flex'.
* **Description:** A meta-compiler tool that reads token specifications and generates equivalent C-code to implement the required scanner logic.
* **Key Concepts:** Finite Automata construction, Regular Expressions, Code generation.

---

## 🛠️ Technologies Used
* **Languages:** C, C++
* **Tools:** YACC (Yet Another Compiler Compiler), Lex/Flex
* **Concepts:** Context-Free Grammars (CFG), Finite Automata, Symbol Tables, Parsing Algorithms (LL/1, LR).

---
