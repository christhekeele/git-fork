The Forking Problem
===================

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

Normal Git Workflow
-------------------

Let's see how this locally with git:

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

This is a lot of boilerplate typing...

git-fork Workflow
-----------------

Let's abstract all that away:

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
