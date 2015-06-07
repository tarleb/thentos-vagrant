# Vagrant based Thentos development environment

This projects offers a virtual machine setup to quickly get started with
[Thentos](https://github.com/liqd/thentos) development.  The VM runs Debian
Jessie (stable) and is set up via [Vagrant](https://www.vagrantup.com) and
[Salt](https://saltstack.com)

## Getting started

Setting up the development environment requires very few, simple steps.

### Prerequisites

One will need to have [Vagrant](https://www.vagrantup.com) and
[VirtualBox](https://www.virtualbox.org/) installed for the following to work.
Most package managers bundle both, getting them should not be too difficult.
On Debian, e.g., it would suffice to run `sudo apt-get install vagrant
virtualbox` to get both.


### Get the Thentos source code

Start by initializing the Thentos git submodule:

    git submodule update --init --recursive

This will clone and checkout Thentos from its GitHub repository.  The
referenced commit might be outdated, so one might want to update to the
lastest commit.

    git submodule foreach 'git checkout master && git pull'


### Create the VM

Creation of the virtual machine is as simple as running

    vagrant up

from the root directory of this project.  You should probably get yourself a
cup of coffee or something, this will take a while.

### Access the VM

Run

    vagrant ssh

to connect to your new virtual machine.  The Thentos souce code is synced to
`/home/vagrant/thentos`.  Go there and compile away!

## What's included in the VM

The VM contains, among other things,

- a reasonably fresh versions of `GHC` and `cabal-install`,
- all Debian packages required to compile the Thentos sources, and
- Selenium server in a node/grid setup (WIP, comming real soon now).


## License

Copyright © 2015, Albert Krewinkel <albert+code@zeitkraut.de>

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.


