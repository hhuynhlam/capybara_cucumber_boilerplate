# Capybara Cucumber Boilerplate

Automated acceptance testing

---

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Configuration](#configuration)
- [Development](#development)
- [Regression Test](#regression-test)

---

## Prerequisites

1. [brew](http://brew.sh)

  ```sh
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```

---

## Setup

1. Install [`rbenv`](https://github.com/sstephenson/rbenv#installation)

1. Install [`ruby-build`](https://github.com/sstephenson/ruby-build#installation)

1. Install the correct version of ruby

  ```sh
  ruby --version      # to find version number
  rbenv install 2.3.1 # If you have installed rbenv
  ```

1. Install bundle and dependencies

  ```sh
  gem install bundle
  bundle
  ```

1. Create `.env` with values in [Configuration](#configuration):

1. Add `RUBY_ENV='development'` to `~/.bash_profile`:

  ```sh
  echo "export RUBY_ENV='development'" >> ~/.bash_profile
  source ~/.bash_profile
  ```

1. Add to `$PATH`, `/capybara-cucumber-boilerplate/bin/<linux64 | macos>`:

  ```sh
  pwd
  # /User/bob/git/partner-regression

  echo "export PATH=$PATH:/User/bob/git/capybara-cucumber-boilerplate/bin/macos" >> ~/.bash_profile
  source ~/.bash_profile
  ```

---

## Configuration

  ```
  CODESHIP_API_KEY=...          # API Key for triggering builds
  CODESHIP_API_PROJECT_ID=...   # Project ID for partner-regression

  APP_URL=...                   # Host URL of site to run regression test on
  ```

---

## Development

1. To run linter

  ```sh
  rubocop
  ```

## Regression Test

1. To run all regression tests:

  ```sh
  cucumber
  ```

1. To run specific regression test suites:

  ```sh
  cucumber --tags @authentication
  ```
