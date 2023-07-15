# Home

[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/alperyazar/home/master)](https://github.com/alperyazar/home/commits/master)
[![GitHub commit activity (branch)](https://img.shields.io/github/commit-activity/m/alperyazar/home/master)](https://github.com/alperyazar/home/commits/master)
[![GitHub commit activity (branch)](https://img.shields.io/github/commit-activity/t/alperyazar/home/master)](https://github.com/alperyazar/home/commits/master)
[![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/alperyazar/home/pages%2Fpages-build-deployment?label=deployment)](https://github.com/alperyazar/home/actions/workflows/pages/pages-build-deployment)
[![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/alperyazar/home/md-lint.yml?label=markdown%20lint)](https://github.com/alperyazar/home/actions/workflows/md-lint.yml)
[![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/alperyazar/home/md-link-check.yml?label=broken-link%20control)](https://github.com/alperyazar/home/actions/workflows/md-link-check.yml)
[![GitHub issues by-label](https://img.shields.io/github/issues/alperyazar/home/broken-link)](https://github.com/alperyazar/home/issues?q=is%3Aissue+is%3Aopen+label%3Abroken-link)

This repo holds source code of my personal webpage. Please visit the site for better
experience:

<https://www.alperyazar.com>

## License

[![CC-BY-SA-4.0](cc-by-sa.png)](http://creativecommons.org/licenses/by-sa/4.0/)

This project is licensed under CC-BY-SA-4.0 if otherwise stated. Check
[LICENSE](LICENSE) for further information.

`SPDX-License-Identifier: CC-BY-SA-4.0`

## Building

### Site

This site is built with [Jekyll](https://jekyllrb.com/), a Ruby program.

At root:

```shell
bundle update
bundle exec jekyll build
```

## Checking Broken Links

```shell
docker run --init --rm -it -v ${PWD}:/input lycheeverse/lychee -c /input/lychee.toml /input/**/*.md
```

## Linting Markdown Files

On Windows:

```shell
docker run -v ${PWD}:/workdir ghcr.io/igorshubovych/markdownlint-cli:latest "*.md"
```
