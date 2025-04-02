#!/bin/bash

# Check for Valgrind
if ! command -v valgrind &> /dev/null; then
    echo "❌ Valgrind not found. Please install it:"
    exit 1
fi

# Path to the Minishell program
MINISHELL=./minishell

# Valgrind suppression file
SUPPRESS=local.supp

# Commands will be read from this file
COMMAND_FILE=commands.txt

if [ ! -f "$COMMAND_FILE" ]; then
    echo "❌ Command file not found: $COMMAND_FILE"
    exit 1
fi

# Temporary file
TMP_OUTPUT=valgrind_output.txt

echo "=== Memory Leak Test Started ==="

i=1
while IFS= read -r CMD || [ -n "$CMD" ]; do
    echo ""
    echo "[$i] ==> Testing command: $CMD"

    # Run with Valgrind
    VALGRIND_CMD="valgrind --leak-check=full --show-leak-kinds=all --suppressions=$SUPPRESS $MINISHELL"
    echo "$CMD" | $VALGRIND_CMD > "$TMP_OUTPUT" 2>&1

    # Read the leak summary lines
    SUMMARY=$(grep -A4 "LEAK SUMMARY" "$TMP_OUTPUT")

    # Check if a leak is present
    if echo "$SUMMARY" | grep -qE 'definitely lost: [^0]|indirectly lost: [^0]|possibly lost: [^0]|still reachable: [^0]' ; then
        echo "❌ Leak detected!"
        echo "$SUMMARY"
    else
        echo "✅ No leak."
    fi

    ((i++))
done < "$COMMAND_FILE"

# Cleanup
rm -f "$TMP_OUTPUT"

echo ""
echo "=== All tests completed ==="
```