-module(vshlr_4).

-export([start/0, start_link/0, stop/0, to_query/2, get_query/1]).

-behaviour(gen_server).

-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2]).

%% These are the interface routines 

start() -> gen_server:start({local, xx4}, vshlr_3, [], []).
start_link() -> gen_server:start_link({local, xx4}, vshlr_3, [], []).

stop()  -> gen_server:call(xx4, die, 10000).

to_query(Group, Message) ->
    Queue_List = gen_server:call(xx4, {to_query, Group, Message}, 10000),
    io:format("Query is: ~p~n", [Queue_List]).
get_query(Group) ->
    Return_Queue_List = gen_server:call(xx4, {get_query, Group}, 10000),
    io:format("Remain query is: ~p~n", [Return_Queue_List]).
	

%% These Routine MUST be exported since they are called by gen_server
init(_) -> {ok, []}.

handle_call({to_query, Group, Message}, _, Query) ->
    Query1 = sub_to_query(Group, Message, Query),
    {reply, Query1, Query1};
handle_call({get_query, Group}, _, Query) ->
    Query1 = sub_get_query(Group, Query),
    {reply, Query1, Query1};
handle_call(die, _, State) ->
    %% ok goes back to the user and terminate(normal, State)
    %% will be called
    {stop,  normal, ok, State}.

handle_cast(Request, State) -> {noreply, State}.

handle_info(Request, State) -> {noreply, State}.

terminate(Reason, State) -> 
    ok.

	
	
%% sub-functions
sub_to_query(Group, Message,[]) 		->	T_Queue_List = queue:new(),
											sub_to_query(Group, Message, T_Queue_List);
sub_to_query(Group, Message, Query)		->	queue:in({Group, Message}, Query).

sub_get_query(Group, []) 		-> {[],[]};
sub_get_query(Group, {[],[]}) 	-> {[],[]};
sub_get_query(Group, Query) 	-> 
								case queue:member({Group, {}}, Query) of
									false ->
										io:format("Group: ~p, Message not found~n", [Group]),
										Query;
									{Group, Message} ->
										io:format("Group: ~p, Message: ~p~n", [Group, Message]),
										queue:drop(Query)
								end.