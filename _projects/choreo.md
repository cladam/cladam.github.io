---
layout: project
title: "choreo"
tagline: "BDD testing that runs in your shell"
tags: [project, choreo]
---

<p align="center">
  <img src="/assets/images/choreo-logo.png" alt="choreo logo" width="200"/>
</p>

### Overview

`choreo` is a test runner and executable Domain-Specific Language (DSL) designed for behavior-driven testing of command-line applications. It brings the power and expressiveness of a BDD framework like Cucumber to the shell, allowing you to write automated, human-readable tests for any command-line tool or system interaction.

The tests are written in a structured, Gherkin-inspired format, making them easy to read and maintain. Each `.chor` file is a self-contained, executable test, eliminating the need for separate "step definition" files.

> [!TIP]
> **Looking for the full manual?** This page is a high-level overview. Visit the [**Official Choreo Documentation Site**](https://cladam.github.io/choreo/) for installation guides and language references.

<a href="https://cladam.github.io/choreo/" class="doc-button">Read the Documentation →</a>

## Why choreo?

Most BDD tools require you to write feature files and then write separate code to back them up. `choreo` treats the documentation *as* the execution.

Here is a complete, runnable `.chor` file as a quick taste:

```choreo
feature "CLI Command Authorisation"

# User Story:
# * As an administrator
# * I want to verify that a command-line tool correctly handles permissions
# * for different user roles.
#
# Acceptance Criteria:
# * Admin users should be granted access.
# * Guest users should be denied access.
actor Terminal

var USER_PERMISSIONS = [
    { NAME: "admin", ROLE: "admin", EXPECTED_OUTPUT: "Access Granted" },
    { NAME: "guest", ROLE: "guest", EXPECTED_OUTPUT: "Access Denied" }]

scenario "Verify command access for different user roles" {

    # The `foreach` loop iterates over the array of examples.
    # On each iteration, the 'user' variable will be one of the objects.
    foreach user in ${USER_PERMISSIONS} {

        # The test name and description are now dynamic, using dot notation
        # to access the properties of the 'user' object.
        test "CheckPermissionsFor_${user.NAME}" "it correctly checks permissions for user '${user.NAME}'" {
            given:
                Test can_start
            when:
                # The values from the current row are substituted into the CLI command.
                Terminal run "$(pwd)/auth-cli check --user ${user.NAME} --role ${user.ROLE}"
            then:
                Terminal last_command succeeded
                # The expected output is also substituted from the data table.
                Terminal output_contains "${user.EXPECTED_OUTPUT}"
        }
    }
}
```

### Key Features:

* **Human-Readable BDD Syntax:** Utilises a `given-when-then` structure within `test` blocks for clear and descriptive tests.
* **Executable Scripts:** `.chor` files are complete, runnable tests without needing separate "step definition" files.
* **Stateful Scenarios:** Capture variables from command output and reuse them in subsequent steps, allowing for complex, stateful test scenarios.
* **Multi-Actor System:** Interact with and assert against multiple parts of a system in a single test, including a "Terminal" for checking `stdout`, `stderr`, and exit codes, and a "FileSystem" for managing files and directories.
* **Configurable Test Runner:** Provides a settings block to control test behavior such as timeouts and custom shell paths.
* **CI-Friendly Reporting:** Generates standard JSON reports for easy integration with CI/CD pipelines.

## Architecture at a Glance
`choreo` is built for speed and reliability using a modern Rust stack. It parses your DSL into an Abstract Syntax Tree (AST) before executing it against specialised system actors.

## Deep Dive

- [Full Documentation](https://cladam.github.io/choreo)
- [GitHub Repository](https://github.com/cladam/choreo)
- [Crates.io Package](https://crates.io/crates/choreo)

