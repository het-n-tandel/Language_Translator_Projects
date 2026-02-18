# MyLang Parser using Lex & Yacc (Bison)

A simple compiler design project that implements a **Recursive Descent style grammar using Lex & Yacc** to parse a small subset of English language called **MyLang**.

---

## 📌 Project Description

This project builds a parser for a tiny English-like language **MyLang** using **Lex (Flex) and Yacc (Bison)**.

The parser checks whether a given sentence follows the defined grammar rules and prints:

- `Valid sentence` ✅
- `Invalid sentence` ❌

---

## 🧠 Grammar (MyLang)

Start Symbol → `S`

```
S → SIMPLE
  | SIMPLE AND ALSO SIMPLE

SIMPLE → I LIKE OBJ

OBJ → ALL SUBJECTS
    | OS SUBJECT
    | PROGRAMMING
```

---

## ✨ Supported Sentences

✔ Valid:

```
I like all subjects
I like OS subject
I like all subjects and also I like programming
I like all subjects.
I like all subjects and also i like programming.
```

❌ Invalid:

```
I love OS subject
I like all
like I subjects
I like subject OS
```

---

## 🛠 Technologies Used

- Lex / Flex → Tokenizer (Lexer)
- Yacc / Bison → Parser
- C Language
- GCC Compiler

---

## 📂 Project Structure

```
MyLang-Parser/
│
├── mylang.l        # Lex file (Lexer)
├── mylang.y        # Yacc/Bison file (Parser)
├── README.md       # Documentation
```

---

## ⚙️ How to Compile & Run

### 1. Clean old files (optional)

```bash
rm lex.yy.c mylang.tab.c mylang.tab.h mylang
```

### 2. Generate Lexer

```bash
lex mylang.l
```

### 3. Generate Parser

```bash
bison -d mylang.y
```

### 4. Compile

```bash
gcc lex.yy.c mylang.tab.c -o mylang
```

### 5. Run

```bash
./mylang
```

Enter sentence and press **Enter**.

---

## 🧪 Example Run

```
$ ./mylang
Enter sentence:
I like all subjects
Valid sentence
```

```
$ ./mylang
Enter sentence:
I like all subjectssdf
Invalid sentence
```

---

## 🔍 Features

- Case-insensitive support for `I` and `i`
- Ignores punctuation like `.`
- Detects invalid grammar usage
- Simple English subset parser
- Useful for Compiler Design Lab / Viva

---

## 📘 Learning Outcomes

- Writing Context Free Grammar (CFG)
- Building Lexical Analyzer using Lex
- Designing Parser using Yacc/Bison
- Understanding parsing and grammar validation
- Compiler Design fundamentals

---

## 👨‍💻 Author

**Aarya Suthar**

Compiler Design Lab – MyLang Parser Project

---

## ⭐ If you like this project

Give it a ⭐ on GitHub and feel free to fork / improve it.