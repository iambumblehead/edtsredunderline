-module(edtsredunderline).
-author('bumblehead <chris@bumblehead.com>').

-export([redunderline/0]).

redunderline() ->
    bcrypt:start(),
    childmaps:to_list(#{"map" => "val"}).
