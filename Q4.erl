%4. A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
% 	Find the largest palindrome made from the product of two 3-digit numbers.
-module(q4).
-export([is_palindrome/2, start/1]).

start(DigitQuantity) ->
	S = list_to_integer(lists:duplicate(DigitQuantity,57)),
	is_palindrome(S,S).

is_palindrome(X,Y) ->
	NormalList = integer_to_list(X*Y), 
	ReverseList = lists:reverse(integer_to_list(X*Y)),
%	io:format("current_value -> ~p~n", [NormalList]),
	if
		NormalList == ReverseList	->
			io:format("(~p*~p = largest_palindrome -> ~p~n", [X,Y,NormalList]),
			exit;
		X >= Y -> 
			is_palindrome(X-1,Y);
		X < Y -> 
			is_palindrome(X,Y-1)
	end.
