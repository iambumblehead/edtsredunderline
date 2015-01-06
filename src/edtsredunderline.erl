-module(edtsredunderline).
-author('bumblehead <chris@bumblehead.com>').

-export([redunderline/0]).
-export([uuidtest/0]).
-export([start/0]).
-export([stop/0]).

start() ->
    application:load(quickrand),
    quickrand:seed().    

stop() ->
    ok.

redunderline() ->
    bcrypt:start(),
    childmaps:to_list(#{"map" => "val"}).

uuidtest() ->
    uuid:uuid_to_string(uuid:get_v4_urandom()).
