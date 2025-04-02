# Minishell Memory Leak Tester

This script is designed to automatically test your `minishell` executable for memory leaks using **Valgrind**.

## 🛠 Requirements

- [Valgrind] must be installed on your system.
- Your `minishell` executable should be compiled and available in the same directory as this script (or update the `MINISHELL` path in the script).
- A `commands.txt` file with shell commands you want to test.
- (Optional) A `local.supp` file for Valgrind suppressions.

## 📄 Usage

1. **Make the script executable:**

   ```bash
   chmod +x leak_checker.sh

2. **Run the script from the terminal:**

   ```bash
   ./leak_checker.sh


```bash
=== Memory Leak Test Started ===

[1] ==> Testing command: echo Hello
✅ No leak.

[2] ==> Testing command: cat < Makefile
❌ Leak detected!
==12345== LEAK SUMMARY:
==12345==    definitely lost: 32 bytes in 1 blocks
...

=== All tests completed ===
