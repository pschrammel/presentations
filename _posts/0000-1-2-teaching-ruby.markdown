---
layout: slide
title:  "Teaching my daughter some Ruby"
date:   2018-07-02 05:14:46 +0000
categories: ruby
---



<section markdown="1">
## Setup
{% highlight ruby %}
ronja.class
#=> #<Child>
ronja.age
#=> 11
ronja.interests.first
#=> 'Build a robot like "Baymax"'
{% endhighlight %}
</section>

<section markdown="1">
 What kind of language/environment to use:

 * nodejs? java? go? php?
 * windows? linux? mac?
 * web? desktop?
</section>

<section markdown="1">
 * linux is set (cheap, already there)
 * ruby is "simple","natural","dirty"
 * web is [complex][webcomplexity]!

 [webcomplexity]: https://github.com/kamranahmedse/developer-roadmap
</section>

<section markdown="1">
Let's start
{% highlight ruby %}
puts 'hello' # ruby is strange! is this OO? where's puts from?
{% endhighlight %}
</section>

<section markdown="1">
{% highlight ruby %}
p self.inspect
p self.class.inspect
p self.class.ancestors.inspect
#=>
"main"
"Object"
"[Object, Kernel, BasicObject]"
{% endhighlight %}

<aside class="notes" markdown="1">
 * Object has 58 methods
 * BasicObject 13
</aside>
</section>


<section markdown="1">
The Kernel module is included into Object! Thats why we can go php style:
{% highlight ruby %}
input=gets
for i in 0..5
  puts "You wrote: '#{input}'"
end
{% endhighlight %}
<aside class="notes" markdown="1">
 chomp is strange
 braces would be nice from the start
 -p/-n have a strong influense on chomps gsub ... available
 lambda, exit, fork, at_exit (Kernel is the Utils)
 already Kernel alone gives us a nice hacking environment
</aside>
</section>

<section markdown="1">
{% highlight ruby %}
 input=gets  #which side is the variable ?
 if input == "ok\n"  # why no "then"
   puts "yeah" # what's the difference between ' and "
 else
   puts "ups"
 end
{% endhighlight %}

</section>

<section markdown="1">
Integer, Float, String, Array, Hash
</section>

<section markdown="1">
motivation:

 * pair programming: calculator + marks calculator
 * small tasks: (input, if then else, output)
</section>


<section markdown="1">
Next:
* own classes
* hard parts: blocks, mixins,
</section>

<section markdown="1">
We're still not programming roboters!
</section>
<section markdown="1">
more motivation: plants vs. zombies (vaporware!)
</section>

<section markdown="1">
[libgosu][libgosu]
  * window + main loop
  * 2d graphics (more via extensions)
  * sound
  * keyboard, mouse, gamepad

mostly based on libsdl2

[libgosu]: https://www.libgosu.org/
</section>

<section>
  Demo:  ruby-game-dev-book-examples
</section>

<section>
  Demo: gosu + chipmunk
</section>

<section>
  Demo: gosu + opengl (lesson06)
</section>
