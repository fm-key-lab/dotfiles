# Lab dotfiles

## Usage

To use the lab's `yadm` executable, use the corresponding environment module (`module load yadm`).

`yadm` is designed to run from your `HOME` directory. Add the lab's configuration dotfiles to your `HOME`:

```bash
# cd $HOME <- Not necessary: Will automatically act on $HOME
yadm clone git@github.com:fm-key-lab/dotfiles.git
yadm status
```

Contribute to the lab's configuration dotfiles:

```bash
yadm checkout -b <branch-name>
yadm add <contributions>
yadm commit -m <commit msg>
yadm push -u origin <branch-name>
```
