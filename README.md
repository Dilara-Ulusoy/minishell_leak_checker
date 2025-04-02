Preparation:

Ensure that Valgrind is installed on your system.

Place your minishell executable in the same directory as the script (or update the script’s MINISHELL variable to the correct path).

Create a commands.txt file containing the commands you want to test.

Optionally, adjust or create a local.supp file for Valgrind suppressions if needed.

Execution:

Make the script executable by running:
chmod +x your_script_name.sh

Run the script from the terminal:
./your_script_name.sh

What It Does:

The script reads each command from commands.txt and runs it through your Minishell using Valgrind.

It checks for memory leaks and displays a summary for each command.

At the end, it cleans up temporary files and reports that all tests are completed.
