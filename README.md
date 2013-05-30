# Vagrant + Jenkins

This repo spins up a VM instance with Jenkins ready to be used for Rails applications.

# Basebox

The VirtualBox basebox is based off the standard precise64 basebox, with the following changes:

- Upgraded all gems, including chef
- Upgraded Ubuntu (14th April 2013)
- Switched locale and timezone to Sydney, Australia
- Switched apt to use an Australian mirror

## Pre-installed Packages

The following are installed as the base for a typical Rails application:

- MySQL
- PostgreSQL
- rbenv

## Jenkins

Jenkins is running on the default 8080 port, and is not being proxied behind a webserver.

## Getting Started

1. Install [VirtalBox][1] and [Vagrant][2]
2. Make sure you have librarian-chef installed:

    gem install librarian-chef

3. Run `librarian-chef install` to pull down the required cookbooks
4. Run `vagrant up` to start the VM and the chef boostrap process

## License

(The MIT License)

Copyright (c) 2012 Christopher Chow

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[1]: https://www.virtualbox.org/
[2]: http://www.vagrantup.com/
