ShoulderTap gives desktop notifications from the output of TAP (Test Anything Protocol)

== Example

Using [Bats](https://github.com/sstephenson/bats) as a TAP Producer, we pipe its output into ShoulderTap

  bats test.bats | shouldertap

![](https://github.com/ryandoyle/shouldertap/blob/master/doc/assets/shouldertap-passed.png)

And for failing tests:

  bats failing.bats | shouldertap

![](https://github.com/ryandoyle/shouldertap/blob/master/doc/assets/shouldertap-failed.png)

ShoulderTap also supports changing the name of the notification with the `-n` switch 

  bats tests.bats | shouldertap -n 'My Project'

![](https://github.com/ryandoyle/shouldertap/blob/master/doc/assets/shouldertap-passed-custom-name.png)

There are a bunch of other producers available at the [Test Anything website](http://testanything.org/producers.html)

== Advanced Usage

With some simple shell scripting, we can run tests every time we save changes to our code. Here we are using [Bacon](https://github.com/chneukirchen/bacon) as our test harness.

  while true; do
    find . | xargs -- inotifywait --event modify
    bacon --tap tests/* | shouldertap
  done

== Installation

  gem install shouldertap 

== Contributing

Please fork and issue a pull request.

== License

Copyright (c) 2014 Ryan Doyle

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
