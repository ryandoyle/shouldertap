ShoulderTap gives desktop notifications from the output of [TAP](http://testanything.org/) (Test Anything Protocol)

## Example

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

## Advanced Usage

With some simple shell scripting, we can run tests every time we save changes to our code. Here we are using [Bacon](https://github.com/chneukirchen/bacon) as our test harness.

    while true; do
      find . | xargs -- inotifywait --event modify
      bacon --tap tests/* | shouldertap
    done

## Installation

    gem install shouldertap 

## Contributing

Please fork and issue a pull request.

## License

Copyright (c) 2014 Ryan Doyle

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see www.gnu.org/licenses.
