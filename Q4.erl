%4. A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
% 	Find the largest palindrome made from the product of two 3-digit numbers.
-module(q4_1).
-export([max_palindrome/4, start/1]).

start(DigitQuantity) ->
	S = list_to_integer(lists:duplicate(DigitQuantity,57)),
	io:format("max_palindrome = ~p~n", [max_palindrome(0,0,S,0)]).

max_palindrome(X, Y, S, MaxValue) ->
	NormalList = integer_to_list(X*Y), 
	ReverseList = lists:reverse(integer_to_list(X*Y)),
%	io:format("~p * ~p = ~p~n", [X, Y, NormalList]),
	if
		Y > S -> 
			max_palindrome(X+1, 0, S, MaxValue);
		X > S -> 
			MaxValue;
		(NormalList == ReverseList) andalso (X*Y > MaxValue) ->
%			io:format("(~p*~p = largest_palindrome -> ~p~n", [X, Y, MaxValue]),
			max_palindrome(X, Y+1, S, X*Y);
		true -> 
			max_palindrome(X, Y+1, S, MaxValue)
	end.