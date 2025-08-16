---
layout: post
title: How I created the demo GIF for tbdflow
---

All projects need a good `README.md`, It’s the front door to the project and it needs to quickly show a potential user what the tool does and why it’s valuable. I put a lot of effort in having a good `README` for `tbdflow` but it was still static text, and the examples was buried deep down.

After receiving some great feedback I decided I wanted to put the examples on top and create a GIF of the core workflow.

### The goal; a clean, repeatable demo

My first thought was to just use a screen recording tool. The problem with live recording is that it’s hard to get perfect. You make typos, you pause for too long, or you have to resize the window. It can be a bit frustrating.

I wanted a way to create a near-perfect, repeatable demo without the stress of a live performance. The solution? A "tape-driven" terminal recorder.

### Meet `vhs`, the CLI video recorder 📼 

After some research, I landed on [vhs](https://github.com/charmbracelet/vhs). It’s a fantastic tool that generates terminal recordings from a simple script file (a `.tape` file). 
This was exactly what I was looking for, DSL's are great! With the script I could,

* **Script the entire session**: I could write out every command, every keystroke, and every pause in advance.
* **Avoid typos**: The demo would be perfect every time.
* **Control the look and feel**: I could set the font size, window dimensions, and even the colour of the window bar to create a nice, clean GIF.

### From script to GIF

1. **Install the tools needed**

  First install `vhs` using their [guidelines](https://github.com/charmbracelet/vhs?tab=readme-ov-file#installation).

2. **Write the "Tape"**

  Next, I created a script file named `commit-demo.tape`. The `vhs` scripting language is simple and intuitive. You just write a series of commands that tell it what to do.

Here’s a snippet from the script that demonstrates the `tbdflow commit` command:

```bash
# tbdflow-demo.tape

# Set the output file and window properties
Output "commit-demo.gif"
Set FontSize 22
Set Width 1200
Set Height 800
Set WindowBar Colorful

# Create a file to commit
Type "echo 'A new feature' > changes.txt"
Enter
Sleep 1s

# Run the tbdflow commit command
Type 'tbdflow commit -t feat -s auth -m "add password reset endpoint"'
Enter
Sleep 1s

# Answer the DoD checklist
# Use Space to select, Down to move
Space
Sleep 500ms
Down
Space
Sleep 500ms
Down
Space
Sleep 500ms
Down
Space
Sleep 500ms
Down
Space
Sleep 1s

# Show the final result
Type 'tbdflow sync'
Enter
Sleep 5s
```

See the full script at [tbdflow-commit.tape](https://github.com/cladam/tbdflow/blob/main/docs/commit-demo.tape).

3. Generate the GIF
  This was the easiest part. With the script written, all I had to do was run:

```bash
vhs commit-demo.tape
```

`vhs` then automatically opened a terminal, ran my entire scripted demo, and saved the output as a high-quality GIF.


### Conclusion

Using a tool like `vhs` was a amazing. It turned what could have been a frustrating recording session into a simple, repeatable engineering task. It allowed me to create the exact demo I wanted and is a tool I'd highly recommend to anyone looking to create documentation for their own CLI projects.

Check it out:

![A terminal running the command tbdflow](https://raw.githubusercontent.com/cladam/tbdflow/main/docs/commit-demo.gif "A demo of tbdflow running commit-to-main commands")

