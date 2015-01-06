-module(edtsredunderline).
-author('bumblehead <chris@bumblehead.com>').

-export([redunderline/0]).
-export([uuidtest/0]).

redunderline() ->
    bcrypt:start(),
    childmaps:to_list(#{"map" => "val"}).

uuidtest() ->
    uuid:uuid_to_string(uuid:get_v4_urandom()).
