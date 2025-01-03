# Lab dotfiles

## Usage

To use the lab's `yadm` executable, use the corresponding environment module (`module load yadm`).

`yadm` is designed to run from your `HOME` directory. Add the lab's configuration dotfiles to your `HOME`:

```bash
# cd $HOME <- Not necessary: Will automatically act on $HOME
yadm clone git@github.com:fm-key-lab/dotfiles.git
yadm status
```

[Note](https://yadm.io/docs/getting_started) that:

> The clone command will attempt to check out all files that exist in the repository. If a file already exists locally and has content that differs from the one in the repository, the local file will be left unmodified and you’ll have to review and resolve the differences.

To overwrite existing dotfiles with those from this repo, use

```bash
yadm checkout "$HOME"
```

Contribute to the lab's configuration dotfiles:

```bash
yadm checkout -b <branch-name>
yadm add <contributions>
yadm commit -m <commit msg>
yadm push -u origin <branch-name>
```
