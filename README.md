git-fork
========

A git extension for keeping forks in sync with their original repositories.

The Problem
-----------

'Forking' a git repository is a common git workflow.

A 'fork' is simply a cloned copy of another repository. We generally create a fork when we want to contribute to a repository we don't have the ability to commit to, so want to stage our changes somewhere public; or when we want to maintain a copy of a codebase with our own custom changes.

The problem is that `git` is ignorant of this common practice. Forking is a higher-level concern in environments where repositories are publicly hosted with an authoritative source. In particular, we frequently want to keep our forks as up-to-date as possible with their original source. Either we want our fork to be in sync with the source as we develop and submit contributions, or we want to harvest the latest improvement to our project's seed while keeping our modifications.

While this quite possible with standard `git`, it's a fairly verbose process to accommodate something I do several times a day. We have more productive things to be typing than [a bunch of boilerplate commands](PROBLEM.md) every time we're concerned we're getting behind.

`git-fork` provides several commands that save you most of this typing and promotes good contribution patterns. It plays well with remote repository hosting sites and their native implementations of forks, but it is in no way restricted to any particular host. It's purely a tool that augments your local `git`'s vocabulary with abstractions around this common workflow.

Installation
------------

Installation is done through git.

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

This clones Elixir locally, with a `source` remote pointing to the source code and `origin` pointing to your version.

Start developing your documentation with

```bash
$ git fork start rewrite-string-docs
```

This makes sure your master is up to date with `source`, and branches off `rewrite-string-docs` for you to work on.

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

Options and detailed usage instructions can be found running `git fork help`.

Contributing
------------

You know the drill: clone `git-fork`, and then... use it. This is the process it's trying to simplify, after all.

If `git-fork` is sufficiently broken that you can't use it to fix itself, please open an [issue](https://www.github.com/christhekeele/git-fork/issues) and fall back to standard git commands!
