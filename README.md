edtsredunderline
================

use these source files to demonstrate the edts red underline bug, the edts dialyzer bug and the uuid:get_v4_urandom bug.

```
$ git clone https://github.com/iambumblehead/edtsredunderline.git
$ cd edtsredunderline
$ rebar get-deps
$ rebar compile
```

Then open edtsredunderline.erl with emacs. Add whitespace and save the file. See red underline below bcrypt and childmaps.

-------------------------
# edts dialyzer

build a plt file with this command:
```
$ dialyzer --build_plt --output_plt .edtsredunderline.plt \
		--apps erts kernel stdlib sasl inets crypto public_key ssl \
		-r deps
```

and open edtsredunderline.erl then call M-x edts-dialyzer-analyze
```
error in process filter: edts-dialyzer-handle-analysis-result: Wrong type argument: listp, "{dialyzer_error,[78,111,116,32,97,32,114,101,103,117,108,97,114,32,102,105,
                 108,101,58,32,
                 \"/home/duko/Software/edtsredunderline/src/edtsredunderline.beam\",
                 10]}"
error in process filter: Wrong type argument: listp, "{dialyzer_error,[78,111,116,32,97,32,114,101,103,117,108,97,114,32,102,105,
                 108,101,58,32,
                 \"/home/duko/Software/edtsredunderline/src/edtsredunderline.beam\",
                 10]}"
```

-------------------------
# uuid:get_v4_urandom

use these source files to demonstrate the predictable urandom (bug?) in uuid:get_v4_urandom.

```
$ git clone https://github.com/iambumblehead/edtsredunderline.git
$ cd edtsredunderline
$ rebar get-deps
$ rebar compile
$ rebar eunit
```

The result:
 for example, uuid:get_v4_urandom()  _always_ returns these results the first four times it is called:

```
 info {"01056c26-74c1-49f9-9c40-5162c8c7c1aa",
       "3bc859b2-3174-4b3c-986a-52a95f8175f7",
       "50c84cda-e011-49d3-889a-0b2ad8206e6c",
       "774129ae-db15-431e-9ded-fbfb924b33b2"}
```

The expected result:
 uuid:get_v4_urandom() should return a random unique number

I'm unsure exactly which circumstances cause this. I found it while trying to understand failing eunit tests around uuid and so I added an eunit test here to reproduce.

My system:
 Ubuntu, Erlang/OTP 17 [erts-6.0] [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false]
