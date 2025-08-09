## Making `tbdflow` Your Own

I've received some great feedback since launching `tbdflow`: while the tool is powerful, the commands can be long to type, and it's another set of flags to remember. This is a great point, the goal of any good CLI is to _reduce_ friction, not add to it.

While `tbdflow` provides powerful workflows, you shouldn't have to type them out in full every time. Let's look at two ways to make `tbdflow feel like a natural extension of your shell: **aliases** and **shell completion**.

### The Quick Fix: Shell Aliases

Aliases are simple shortcuts for your shell. You can create short, memorable commands that expand to longer `tbdflow` commands. This is a great way to make the tool your own.

I used to have a `gpc` ("git pull commit") alias myself, and it's what inspired `tbdflow` in the first place!

#### How to Set Up Aliases

Add the following lines to your shell's configuration file (e.g. `~/.zshrc`, `~/.bashrc`, or `~/.config/fish/config.fish`).

For `bash` or `zsh`:

```bash
# A short alias for the commit command
alias tfc='tbdflow commit'

# An even shorter alias for a common commit type
alias tff='tbdflow commit -t feat -m'

# A quick way to sync up
alias tfs='tbdflow sync'

# And a shortcut for completing a feature branch
alias tfcomp='tbdflow complete -t feature -n'
```

For `fish`:

```bash
# A short alias for the commit command
alias tfc 'tbdflow commit'

# An even shorter alias for a common commit type
alias tff 'tbdflow commit -t feat -m'

# A quick way to sync up
alias tfs 'tbdflow sync'

# And a shortcut for completing a feature branch
alias tfcomp 'tbdflow complete -t feature -n'
```

After adding these and restarting your shell, you can now run commands like:
```bash
tff "Add new login button"
tfcomp "new-dashboard-widget"
```

### The Pro Move: Shell Completion

Aliases are great, but what if you can't remember the exact flag you need? That's where shell completion comes in. It allows you to use the `<Tab>` key to have your shell automatically suggest and complete commands, flags, and arguments for you.

`tbdflow` has a built-in command to generate the necessary script for your shell.

#### How to Set Up Shell Completion

You only need to do this once. Add the line for your shell to its configuration file.

For Zsh (`~/.zshrc`):

```bash
eval "$(tbdflow generate-completion zsh)"
```

For Bash (`~/.bashrc`):

```bash
eval "$(tbdflow generate-completion bash)"
```

For Fish (`~/.config/fish/config.fish`):

```bash
tbdflow generate-completion fish | source
```

After restarting your shell, your command line will come alive. You can now type `tbdflow com<Tab>` and it will expand to `tbdflow commit`. Type `tbdflow commit --<Tab>` and it will show you all the available flags like `--type`, `--scope`, and `--breaking`.

This is the perfect way to make `tbdflow` fast and easy to use and helping you stay in flow.
