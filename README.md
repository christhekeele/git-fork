git-fork
========

A git extension that streamlines developing contributions to open source software.

The Problem
-----------

The process for contributing to open source git repositories is well established:

1.  Clone an open source project at a destination
2.  Set the source code as a special remote
3.  Set up a remote you own to host your contributions
4.  Ensure your master is up to date with source if this is an old fork
5.  Branch off of master to develop a contribution
6.  As time passes, periodically updating master from source
7.  Rebase your contribution branch off of master
8.  Handle merge conflicts during rebase
9.  Ensure master is up to date with source when contribution is ready
10. Rebase your contribution branch off of master one final time
11. Push contribution branches to your public remote for approval
12. Repeat until your contribution meets approval and gets merged in

None of this is exactly hard... but it's a lot of extra typing for a very standard workflow. It's practically begging to be abstracted. In fact, only step 8 can't done via script. We have more productive things to be typing than [a bunch of boilerplate commands](SHOWDOWN.md) every time we're concerned we're getting behind.

`git-fork` provides several commands that save you most of this typing and promotes good contribution patterns. It plays well with GitHub forks, but is in no way restricted to any particular host—it's purely a local workflow tool.

Installation
------------

Installation is done through git, although I'd like to put `git-fork` on homebrew eventually.

``` bash
$ git clone git@github.com:christhekeele/git-fork.git
$ cd git-fork
$ sudo make install
```

By default, `git-fork` will be installed in `/usr/local`. To change the prefix where git-fork will be installed, simply specify it explicitly, using:

``` bash
$ sudo make prefix=$HOME install
```

Usage
-----

Say you want to contribute documentation to the programming language [Elixir](https://www.github.com/elixir-lang/elixir). Since it's hosted on GitHub, you fork it to `www.github.com/christhekeele/elixir`. To work with it, just

```bash
$ git fork new git@github.com:elixir-lang/elixir \
$           -o git@github.com:christhekeele/elixir
$ cd elixir
```

This clones elixir locally, with a `source` remote pointing to the source code and `origin` pointing to your version.

Start developing your documentation with

```bash
$ git fork start rewrite-string-docs
```

This makes sure your master is up to date with `source`, and branches off `improve-string-docs` for you to work on.

If your extensive contributions take a few days, and you want to ensure you're developing against Elixir edge, run

```bash
$ git fork update
```

This will bring master up to date and rebase your contribution branch against it.

When you're done with your contribution, just run

```bash
$ git fork submit
```

This will update your branch one last time, then push it off to a corresponding branch on `origin`. All that's left is go to `www.github.com/christhekeele/elixir/tree/improve-string-docs` and submit a pull request back to `elixir-lang/elixir`. If you decide to make improvements to your request, you can revisit your branch and run

```bash
$ git fork update
$ #...code away...
$ git fork submit
```

Much better.

Dependencies
------------

`git-fork` does not currently work on Windows, although this may change in the future. Aside from the obvious `git` dependency, it uses `cd`, `grep`, and `sed` under the hood.

Contributing
------------

You know the drill: clone `git-fork`, and then... use it. That's the problem it's trying to solve, after all.

If it's sufficiently broken that you can't use it to fix itself, please open an [issue](https://www.github.com/christhekeele/git-fork/issues)!
