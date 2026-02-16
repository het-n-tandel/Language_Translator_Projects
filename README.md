# Desktop Calculator (YACC)

A Language Processor (LP) that functions as a desktop calculator, built using **Lex** (Lexical Analyzer) and **YACC** (Yet Another Compiler Compiler). This project demonstrates the implementation of LALR parsing and Syntax Directed Definitions (SDD) to evaluate arithmetic expressions.

## 📋 Project Overview
* **Goal:** Study the YACC tool and create a parser for mathematical expressions.
* **Key Concepts:** Syntax Directed Definitions (SDD), LALR Parsing, Context-Free Grammar (CFG).
* **Outcome:** A functional CLI calculator that parses and evaluates arithmetic strings.

## 🚀 Features
* **Basic Arithmetic:** Addition (`+`), Subtraction (`-`), Multiplication (`*`), Division (`/`).
* **Precedence Handling:** Correctly evaluates expressions based on standard mathematical order of operations (e.g., `*` before `+`).
* **Parentheses:** Supports nested grouping `( )`.
* **Floating Point:** Handles decimal numbers.
* **Error Reporting:** Detects division by zero and syntax errors.

## 🛠️ Prerequisites
To compile and run this project, you need the following installed on your system (Linux/WSL):

* **GCC:** GNU Compiler Collection
* **Flex:** Fast Lexical Analyzer Generator
* **Bison:** GNU Parser Generator (compatible with YACC)
