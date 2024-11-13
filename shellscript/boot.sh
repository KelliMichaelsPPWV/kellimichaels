
#!/bin/bash ##indicates that this is bash script

# Ask the user if they'd like to play rock paper scissors
echo "Would you like to play rock paper scissors? (yes/no)"
read response

# Convert the response to lowercase
response=$(echo "$response" | tr '[:upper:]' '[:lower:]')

# Check if the response is 'yes'
if [ "$response" == "yes" ]; then
    # Run the Python file if the user wants to play
    python3 play_game.py
else
    # Show a message if the user doesn't want to play
    echo "That's too bad, maybe next time."
fi
