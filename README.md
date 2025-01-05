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

## Handling file conflicts

### Overwrite

[Note](https://yadm.io/docs/getting_started) that:

> The clone command will attempt to check out all files that exist in the repository. If a file already exists locally and has content that differs from the one in the repository, the local file will be left unmodified and you’ll have to review and resolve the differences.

To overwrite existing dotfiles with those from this repo:

```bash
yadm checkout "$HOME"
```

### Ignore

For many dotfiles, you will prefer to use your own versions:

> **How can I configure ignored files?**
> 
> By default, yadm is configured to ignore untracked files when displaying a status. This does not prevent you from adding untracked files. However, if you would like to prevent some files from being added accidentally, you can configure them to be ignored.
> 
> If you add a `.gitignore` file to your `$HOME` directory (or subdirectories) you can have those patterns ignored by yadm. This works exactly like it does for Git. Be sure to add these `.gitignore` files to your repo, so they can be synced along with your other configurations.
> 
> Another option is to add patterns to `$HOME/.local/share/yadm/repo.git/info/exclude`. If you use this file, be sure to add your patterns above any `yadm-auto-excludes` line, as all lines below this can be overwritten by yadm when encrypting data.

## Contributing

To contribute to the lab's configuration dotfiles:

```bash
yadm checkout -b <branch-name>
yadm add <contributions>
yadm commit -m <commit msg>
yadm push -u origin <branch-name>
```

Please consider using a linting tool like [ShellCheck](https://www.shellcheck.net) before opening a PR.
