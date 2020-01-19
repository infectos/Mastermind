# Mastermind
Ruby_Mastermind with AI

Run main.rb to play

AI winrate:
4 turns game - 90%
5 turns game - 99%
6 turns game - 100%

An average 3.5 turns to solve 

# How AI guess?

The hidden code can be pictured as a Two Dimensional Array 
@avalible_guesses=[[1,2,3,4,5,6],[1,2,3,4,5,6],[1,2,3,4,5,6],[1,2,3,4,5,6],]

The hack method get an array with colored digits. It searches with RegExp for colours.

If digit is red then @avalible_guesses must be changed. The method deletes red(wrong) numbers from arrays in @avalible_guesses array.

If digit is yellow then it need be checked later, but current position can't hold this digit. The method stores yellow (right digit in wrong position) digits in @yellow_digits array. Also the method delete digit from array that holds current position (not from all arrays).

If digit is green then it must be left as it is. The method locks current index in @avalible_guesses array with green (right digit in right position). It also stores green digit in @green_digits array

Then it makes the guess with following rules:

Furstly, yellow digits hold in @yellow_digits array must be cheked in other positions.

Seconly, you need to try as many digit as you can, so you open all the numbers during two first guesses.
In one guess you also want to try as many digit as you can. So variable "checked_digits" preventing you from creating the code that consists of repeated numbers. You need something like this (6532) as your guess, not like this (2333). In some cases repeated numbers cannot be avoided. 



