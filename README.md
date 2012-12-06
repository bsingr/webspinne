# Webspinne

Webspinne analyzes websites by counting their pages.

Named after [http://de.wikipedia.org/wiki/Webspinnen](http://de.wikipedia.org/wiki/Webspinnen).

## Installation

Add this line to your application's Gemfile:

    gem 'webspinne'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install webspinne

## Usage

From the commandline:

    $ webspinne http://www.wikipedia.org 1000

This will make webspinne go to Wikipedia website and make up to 1,000 web requests to follow the links and sublinks found on the pages. The links found will automatically be reported in a file called `www.wikipedia.org.csv`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright (c) 2012 Jens Bissinger. See [LICENSE.txt](LICENSE.txt)
