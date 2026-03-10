## Experiment 10: Natural Language to SQL Translator

This project implements a source-to-source translating tool that utilizes Lex (Flex) and Yacc (Bison) to parse informal Hindi-English queries into structural SQL commands.

### Prerequisites
To run this project, you need to have `flex`, `bison`, and a C compiler (like `gcc`) installed on your system.
On macOS (with Homebrew), you can install them via:
```bash
brew install flex bison
```

### Compilation & Execution
1. Open your terminal and navigate to the `Exp10` directory.
   ```bash
   cd ~/Developer/Language_Translator_Projects/Exp10
   ```

2. Generate the Yacc parser in C using Bison:
   ```bash
   bison -d translator.y
   ```
   *(This creates `translator.tab.c` and `translator.tab.h`)*

3. Generate the Lex scanner using Flex:
   ```bash
   flex translator.l
   ```
   *(This creates `lex.yy.c`)*

4. Compile all the generated C files into an executable named `translator`:
   ```bash
   gcc translator.tab.c lex.yy.c -o translator -ll
   ```

5. Run the executable:
   ```bash
   ./translator
   ```

### Example Usage
Once you run the compiler, it waits for your input. Try pasting the sentences from the assignment:

**Input:**
```text
sab data chaiye 'mytable' sey.
'mytable' ke sab data.
sirf 'name' chaiye, 'mytable ' sey.
'mytable' aur 'yourtable' kaa sab data chaiye.
```

*(Press `Ctrl+D` on a new line to exit!)*

**Expected Output:**
```sql
select * from mytable;
select * from mytable;
select * from mytable with column='name';
select * from mytable, yourtable;
```
