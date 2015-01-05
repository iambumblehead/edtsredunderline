edtsredunderline
================

use these source files to demonstrate the edts red underline bug.

```
$ git clone https://github.com/iambumblehead/edtsredunderline.git
$ cd edtsredunderline
$ rebar get-deps
$ rebar compile
```

Then open edtsredunderline.erl with emacs. Add whitespace and save the file. See red underline below bcrypt and childmaps.

-------------------------

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


