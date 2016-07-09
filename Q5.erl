%5. 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
%	What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
-module(q5).
-export([find_easy_divisible_number/3, start/1]).

start(MaxDivider) ->
	io:format("Start:~s~n",[print_time:format_utc_timestamp()]),
	find_easy_divisible_number(MaxDivider,2,MaxDivider),
	io:format("Finish:~s~n",[print_time:format_utc_timestamp()]).


find_easy_divisible_number(X,0,MaxDivider) ->
	io:format("number_found -> ~p  can be divided to any [1..~p]~n", [X,MaxDivider]);
find_easy_divisible_number(X,Divider,MaxDivider) ->
if
	X rem Divider == 0 ->
%		io:format("Divided ok -> ~p~n", [Divider]),
		if 
			Divider < MaxDivider ->
				find_easy_divisible_number(X,Divider+1,MaxDivider);
			true ->
				find_easy_divisible_number(X,0,MaxDivider)
		end;
	true ->
%		io:format("next_number -> ~p~n", [X+1]),
		find_easy_divisible_number(X+1,2,MaxDivider)
end.
