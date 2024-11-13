# rock_paper_scissors.py

import random

def play_game():
    ##getting everything set up
    choices = ["rock", "paper", "scissors"] ##define possible choices
    user_choice = input("Enter rock, paper, or scissors: ").lower() ##prompt for input and make all lowercase
    computer_choice = random.choice(choices) ##have the computer randomly make a choice
    
    print(f"Computer chose: {computer_choice}") ##print the computer choice
    
    ##game logic time
    if user_choice == computer_choice:
        print("It's a tie!") #check for a tie
    ##check for a win
    elif (user_choice == "rock" and computer_choice == "scissors") or \
         (user_choice == "paper" and computer_choice == "rock") or \
         (user_choice == "scissors" and computer_choice == "paper"):
        print("You win!")
    else:
        print("You lose!") #if no tie or win, must be a loss

if __name__ == "__main__": ## this ensures that we execute when called
    play_game()