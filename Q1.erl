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
