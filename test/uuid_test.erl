-module(uuid_test).
-author('bumblehead <chris@bumblehead.com>').

-include_lib("eunit/include/eunit.hrl").

start() -> 
    io:format(user, "~n~n seed quickrand ~p~n~n", [edtsredunderline:start()]).

stop(_PID) ->
    edtsredunderline:stop().

uuid_isnotrandom() ->
    Result = edtsredunderline:uuidtest(),
    SameResult = "01056c26-74c1-49f9-9c40-5162c8c7c1aa",
    io:format(user, "~n~n info ~p~n~n", [{SameResult, edtsredunderline:uuidtest(), edtsredunderline:uuidtest(), edtsredunderline:uuidtest()}]),
    SameResult =:= Result.

do_api_test_() ->
    {"Test: is uuid predictable?",
     {setup,
      fun start/0,
      fun stop/1,
      fun (_) ->
              [
               ?_assertMatch(true, uuid_isnotrandom())
               ]
      end
     }}.










