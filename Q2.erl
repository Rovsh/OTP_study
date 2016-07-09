-module(q2).
-export([sum_even_Fibonacci/4, start/1]).

start(MaxValue) ->
	sum_even_Fibonacci(1,2,0,MaxValue).

sum_even_Fibonacci(0,0,R,MaxValue) ->
	io:format("Result -> ~p~n", [R]),
    done;

sum_even_Fibonacci(F,S,R,MaxValue) ->
%io:format("Inbound: ~p and ~p ~w ~w ~n", [F,S,R,MaxValue]),
N = F + S,
if 
	MaxValue < N  ->
		io:format("Next value ~w more than MaxValue ~w ~n", [N,MaxValue]),
		sum_even_Fibonacci(0,0,R,MaxValue);
	(N rem 2 == 0) ->
%		io:format("Result -> ~w plus ~w = ~w ~n", [R,N,R+N]),
		sum_even_Fibonacci(S, N, R+N,MaxValue);
	(N rem 2 > 0) ->
		sum_even_Fibonacci(S, N, R, MaxValue)
end.
