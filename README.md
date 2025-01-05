# Lab dotfiles

On a Unix-like OS, files or folders beginning with a dot character are commonly called **dotfiles**. Dotfiles are "hidden" from many filesystem commands and commonly used for storing user or application configurations.

`yadm` is [Yet Another Dotfiles Manager](https://yadm.io) that mostly behaves as a plug-in replacement for Git commands. The most important difference between `yadm` and Git is that `yadm` can only track a single repository: `$HOME`.

This repository holds the lab's configuration dotfiles and is meant to be used with `yadm`.

## Usage

The lab maintains an installation of `yadm`, available via environment module. To add the lab's configuration dotfiles to your `$HOME` directory:

```bash
module load yadm
# cd $HOME <- Not necessary: Will automatically act on $HOME.
yadm clone git@github.com:fm-key-lab/dotfiles.git
yadm status
```

[Note](https://yadm.io/docs/getting_started) that:

> The clone command will attempt to check out all files that exist in the repository. If a file already exists locally and has content that differs from the one in the repository, the local file will be left unmodified and you’ll have to review and resolve the differences.

To overwrite existing dotfiles with those from this repo:

```bash
yadm checkout "$HOME"
```

## Contributing

To contribute to the lab's configuration dotfiles:

```bash
yadm checkout -b <branch-name>
yadm add <contributions>
yadm commit -m <commit msg>
yadm push -u origin <branch-name>
```
