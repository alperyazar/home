# Home

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
docker run --init --rm -it -v ${PWD}:/input lycheeverse/lychee -c /input/lychee.toml /input
```

## Linting Markdown Files

On Windows:

```shell
docker run -v ${PWD}:/workdir ghcr.io/igorshubovych/markdownlint-cli:latest "*.md"
```
