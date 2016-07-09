%1. If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
%	Find the sum of all the multiples of 3 or 5 below 1000.

-module(q1).
-export([sum_dev3or5/2, start/1]).

start(X) ->
	sum_dev3or5(X-1,0).

sum_dev3or5(0,R) ->
	io:format("~p~n", [R]),
    done;
sum_dev3or5(X,R) ->
if
	X rem 3 == 0 ;	X rem 5 == 0 ->
		Y=X;
	true -> Y = 0
end,
sum_dev3or5(X-1,R+Y).
