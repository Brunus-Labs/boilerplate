# Brunus Labs Boilerplate

Here in the lab, we use a specific boilerplate in order to start our
experiments. Feel free to use this repo to give yourself a head start on
your next project!

## .git-hooks

Git hooks are a way to automate certain tasks triggered by git.
This boilerplate uses conventional commits, so our git-hooks help us
make sure our commit messages are following the correct standards before committing.

`commit-msg` is run when you enter your commit message, and makes sure its following the right
naming conventions.

`prepare-commit-msg` is run when you open up the commit file (you may or may not do this in your
general workflow, and that okay). All this does is add an extra newline so that if your entering
a commit message from the CLI, you don't get a warning about spaces before body content.

#### Dependencies

These use the `commitlint` cli tool. Install this via your node package manager.
```bash
yarn global add @commitlint/config-conventional @commitlint/cli
# or
npm install --global @commitlint/config-conventional @commitlint/cli
# etc
```

#### Setup
If you want to enable these in your workflow, make sure you run 
```bash
git config core.hooksPath ".git-hooks"
```
This tells git where to look for git-hooks.

## .github

If your using this template, your probably using Github. This folder
is what Github uses to define its CI/CD.

`PULL_REQUEST_TEMPLATE.md` is a PR template. It is used automatically on the
gh website, or CLI (if your using gh cli). This helps keep your PR's consistent and readable.

- Pro tip! Use `Closes #[issueNumber]` or `Fixes [issueNumber]` to automatically close issues when the PR merges

`dependabot.yml` is a bot that automatically keeps your CI/CD infra up to date.

### Workflows

Workflows are the real CI/CD of Github. We have 3 that we generally use for our projects.

`app-ci.yml` will run `just test` on your repository, and make sure that the tests defined in your justfile pass 
when someone opens a PR to either the stage branch, or main. Make sure if you need a .env file, you change around the `init env file`
section to fit your needs.

`lint-pr.yml` makes sure that your commits, pr title, and branch name are following the right conventional commit standards. This makes sure that
the releaser will run properly, and be able to generate its changelog.

`release.yml` will bump your repository tag, and automatically generate a changelog based on all the commits that have been generated since last merge
from stage into master


These workflows expect that you work on development branches that merge into stage. Stage is then expected to merge into master
later on.

## Other Files

`commitlint.config.js` is what our conventional commits parser uses to make sure we are following our defined standards.
We use some custom conventions, like `ref` instead of `refactor`. Feel free to customize this for your team.

`justfile` contains a baseline justfile for using github worktrees, and some basic docker compose work.

`sample.env` is a blank file, we just normally end up haivng one so i thought id throw it in our boilerplate repo anyways.

# License

The MIT License (MIT)

Copyright (c) 2023 Brunus Labs

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
