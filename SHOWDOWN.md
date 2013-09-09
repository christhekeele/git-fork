git-fork Showdown
=================

This is a comparison of a normal git fork workflow to `git-fork`'s workflow. It uses the example from the [README](README.md#usage). One might say we're being a little paranoid with our updates in this trivial scenario, but it's reasonable to assume you'd be wanting to update more than once for any sustained development. `git-flow` is paranoid for you, and makes sustained development a breeze.

Normal Git Workflow
-------------------

```bash
# Getting the project
git clone git@github.com:elixir-lang/elixir
cd elixir
git remote rename origin source
git remote add origin git@github.com:christhekeele/elixir

# Starting the contribution
git checkout master
git pull origin source
git checkout -b rewrite-string-docs

# Updating
git checkout master
git pull origin source
git checkout rewrite-string-docs
git rebase master

# Submitting
git checkout master
git pull origin source
git checkout rewrite-string-docs
git rebase master
git push origin rewrite-string-docs

# Resubmitting
git checkout master
git pull origin source
git checkout rewrite-string-docs
git rebase master
# ...do some work
git checkout master
git pull origin source
git checkout rewrite-string-docs
git rebase master
git push origin rewrite-string-docs
```

git-fork Workflow
-----------------

```bash
# Getting the project
git fork new git@github.com:elixir-lang/elixir -o git@github.com:christhekeele/elixir
cd elixir

# Starting the contribution
git fork start rewrite-string-docs

# Updating
git fork update rewrite-string-docs

# Submitting
git fork submit rewrite-string-docs

# Resubmitting
git fork update rewrite-string-docs
# ...do some work
git fork submit rewrite-string-docs
```
