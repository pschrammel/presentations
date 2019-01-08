---
layout: slide
title:  "Ruby 2.6 JIT - lightning talk"
date:   2019-01-09 05:14:46 +0000
categories: ruby
---

<section markdown="1">
## The goal
Ruby3x3: Ruby 3.0 3 times faster than Ruby 2.0

Usually they measure with optcarrot
</section>

<section markdown="1">
## setup
```
docker pull ruby:2.6-stretch
docker run --rm -ti  -v `pwd`:/code ruby:2.6-stretch /bin/bash
```

bundler is outdated here
</section>

<section markdown="1">
```
  ruby --jit --jit-verbose=1 test.rb
```
{% highlight ruby %}
require 'benchmark'

def sum(n)
  sum=1.upto(n).inject(0) do |sum, i|
    sum+=i
  end
end

n = 50_000_000
Benchmark.bm do |x|
  x.report { sum(n) }
end
{% endhighlight %}

</section>

<section markdown="1">
```
RUBYOPT="--jit --jit-verbose=1" ruby  test.rb
```
more opts:
```
ruby --help
JIT options (experimental):
  --jit-warnings      Enable printing JIT warnings
  --jit-debug         Enable JIT debugging (very slow)
  --jit-wait          Wait until JIT compilation is finished everytime (for testing)
  --jit-save-temps    Save JIT temporary files in $TMP or /tmp (for testing)
  --jit-verbose=num   Print JIT logs of level num or less to stderr (default: 0)
  --jit-max-cache=num Max number of methods to be JIT-ed in a cache (default: 1000)
  --jit-min-calls=num Number of calls to trigger JIT (for testing, default: 5)
```
</section>


<section markdown="1">
# First result

* ~10% speed improvement <fragment/>
* some talk about 27% speed improvements <fragment/>
* 16% are realistic <fragment/>
* couldn't see this in rails <fragment/>

</section>

<section markdown="1"> 
# stack oriented VM

```
$> puts RubyVM::InstructionSequence.compile("18 + 24").disasm
== disasm: <RubyVM::InstructionSequence:<compiled>@<compiled>>==========
0000 trace            1                                               (   1)
0002 putobject        18
0004 putobject        24
0006 opt_plus         <callinfo!mid:+, argc:1, ARGS_SIMPLE>
0008 leave
=> nil

```
</section>

<section markdown="1"> 
# register oriented VM
```
plus <operand 1 address> <operand 2 address> <result address>
```
</section>
<section markdown="1">
MJIT: method JIT vs. tracing JIT

speculative optimizations over operands
</section>

<section markdown="1">
# going through gcc
Vlad Makarov: RUBY -MRI-> RTL -MJIT-> C -GCC-> machine code

Vlad is a gcc freak at redhat
</section>

<section markdown="1">
Takashi Kokubun: yarv-mjit
</section>







<section markdown="1">
## resources

 * https://blog.heroku.com/ruby-just-in-time-compilation
 * https://www.ruby-lang.org/en/news/2018/12/25/ruby-2-6-0-released/
 * https://blog.heroku.com/ruby-mjit
</section>
