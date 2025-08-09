## Stop Re-installing Your Tools

When you publish a CLI tool on crates.io, you’ll often get a familiar question (at least I did):

> *"How do I update it?"*

The standard answer is usually:

```bash
cargo uninstall <crate>
cargo install <crate>
```

It works, but it’s clunky. For `tbdflow`, a tool designed to keep developers in their flow, forcing a two-step uninstall/re-install felt like going against the whole point of the project.

So I decided to let tbdflow update itself.

### The Goal: Self-updating

The ideal flow should be:

```bash
tbdflow update
```

The command should:

* Check if a newer version is available on crates.io (or GitHub).
* If so, download the right pre-compiled binary for the current platform.
* Replace the existing executable.
* If not, simply let the user know they’re already up to date.

No extra steps, no hunting down version numbers, just update and carry on.

## The Solution: `self_update`

The [self\_update](https://crates.io/crates/self_update) crate takes care of all the heavy lifting:

* Checking the current version against the latest.
* Fetching release assets from GitHub.
* Safely swapping the binary in place.

It’s simple to set up and works across platforms.


## Implementation

**1. Add the dependency**

In `Cargo.toml`:

```toml
self_update = "0.40.0"
```

**2. Add the CLI command**

In `cli.rs`:

```rust
#[derive(clap::Subcommand, Debug)]
pub enum Commands {
    // ...
    /// Checks for a new version of tbdflow and updates it if available.
    Update,
}
```

**3. Wire up the logic**

In `main.rs`:

```rust
Commands::Update => {
    println!("{}", "--- Checking for updates ---".blue());
    let status = self_update::backends::github::Update::configure()
        .repo_owner("cladam") // My username
        .repo_name("tbdflow") // my crate
        .bin_name("tbdflow")
        .show_download_progress(true)
        .current_version(self_update::cargo_crate_version!())
        .build()?
        .update()?;
    
    println!("Update status: `{}`!", status.version());
    if status.updated() {
        println!("{}", "Successfully updated tbdflow!".green());
    } else {
        println!("{}", "tbdflow is already up to date.".green());
    }
}
```

This is now available from `tbdflow-0.10.0` onwards.

## Wrapping Up

It’s a small addition, but it makes a big difference.
`tbdflow update` now gives users the latest version in one step, no uninstalling, no reinstalling. It fits the tool’s philosophy: keep things simple, reduce friction, and let people focus on their work.

If you’re building a CLI in Rust, adding a self-update command is worth considering. Your users will appreciate it.

