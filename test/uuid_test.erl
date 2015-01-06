-module(uuid_test).
-author('bumblehead <chris@bumblehead.com>').

-include_lib("eunit/include/eunit.hrl").


uuid_isnotrandom_test_() ->
    Result = edtsredunderline:uuidtest(),
    SameResult = "01056c26-74c1-49f9-9c40-5162c8c7c1aa",
    io:format(user, "~n~n info ~p~n~n", [{SameResult, edtsredunderline:uuidtest(), edtsredunderline:uuidtest(), edtsredunderline:uuidtest()}]),
    ?_assertMatch(Result, SameResult).
