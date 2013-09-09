The Forking Problem
===================

This is a comparison of a normal git fork workflow to `git-fork`'s workflow, to illustrate the verbosity of normal fork management. It uses the example from the [README](README.md#usage).

Some talking points:

- One might say we're being a little paranoid with our updates in this trivial scenario, but it's reasonable to assume you'd be wanting to update more than once for any sustained development. `git-fork` is paranoid for you, and makes sustained development a breeze.
- `git-fork` supports updating and submitting multiple contribution branches in one pass. The equivalent to that in normal git workflow is omitted for the sake of brevity.
- If you have a fork with multiple contributions in progress, `git fork status -L`
can easily traverse them all.

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
git fork update

# Submitting
git fork submit

# Resubmitting
git fork update
# ...do some work
git fork submit
```
