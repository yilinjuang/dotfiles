# confJuang
My (Juang, Yi-Lin's) configurations.


## Environment
- macOS


## Dependencies
- Bash
- Git
- Tmux
- coreutils: more accurate in command elasped time.

## Optional dependencies
### Completion
- bash completion: Install via brew (`brew install bash-completion@2`).
- docker completion: Install via brew (`brew install docker-completion`).
- pip completion: Install via brew (`brew install pip-completion`).
- npm completion: Create soft link of `$NVM_BIN/../lib/node_modules/npm/lib/utils/completion.sh` under `/usr/local/etc/bash_completion.d/`.

### Lint
- [ESLint](http://eslint.org/): The pluggable linting utility for JavaScript and JSX. Bound with [eslintrc.js](eslintrc.js)
- [eslint-config-google](https://github.com/google/eslint-config-google): ESLint shareable config for the Google JavaScript style guide. Used by [eslintrc.js](eslintrc.js)
- [eslint-plugin-html](https://github.com/BenoitZugmeyer/eslint-plugin-html): An ESLint plugin to extract and lint scripts from HTML files. Used by [eslintrc.js](eslintrc.js)


## Features

### Completion
- bash
- docker
- git
- tmux

### Lint
- javascript lint

### Misc
- git-prompt
- ignore bash history duplicates
- accurate command elapsed time
