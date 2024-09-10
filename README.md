# 🚩 Challenge 3: 🎲 Dice Game


💬 Dice Game is a contract that allows users to roll the dice to try and win the prize. If players roll either a 0, 1, 2, 3, 4 or 5 they will win the current prize amount. The initial prize is 10% of the contract's balance, which starts out at .05 Eth.

🧤 Every time a player rolls the dice, they are required to send .002 Eth. 40 percent of this value is added to the current prize amount while the other 60 percent stays in the contract to fund future prizes. Once a prize is won, the new prize amount is set to 10% of the total balance of the DiceGame contract.

🧨 Your job is to attack the Dice Game contract! You will create a new contract that will predict the randomness ahead of time and only roll the dice when you're guaranteed to be a winner!
