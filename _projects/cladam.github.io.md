---
layout: project
title: "Personal Site & Blog"
tagline: "An iterative journey in building a GitHub Page"
---

## The Goal: A Home for My Work

Every developer needs a home on the web; a space to share ideas, document experiments, and showcase what they're building. This site is my space. I wanted something clean, content-first, and flexible enough to host both long-form writing and structured documentation for my open-source projects.

It's not my first "home on the web", I've had multiple homepages, blogs and other sites but I never kept them going. I guess the hassle of hosting and publishing back in the day wasn't worth it but GitHub Pages with Jekyll and an easy URL patter (just name the repo cladam.github.io) is convinient so I might keept this running.

## The Process: A Test & Learn Mentality

The development of this site has been a good example of a "test and learn" mentality. I didn’t aim for perfection on day one. I just wanted something working, and then I let the improvements come, one step at a time. The whole process reflected the same development principles I use in my day-to-day work.

I started with a clear vision inspired by the classic Lanyon theme for Jekyll. I wanted a simple, elegant design with a persistent sidebar for easy navigation. Instead of using the theme, I decided to build my own version from scratch as a learning exercise, because NIH syndrome :)

#### Iteration: One Fix at a Time

The initial setup involved creating the basic Jekyll file structure. My first attempt to build the site failed immediately due to incorrectly formatted "front matter" in my `index.html file. A small syntax error can really break the build, that's why a fast feedback loops is so important.

Once the site was building, the real work began. Each step was a small iteration:

- **Styling:** The first version was barebones. I gradually added better looking fonts, spacing, and colours to make the content easier to read.

- **Layout Bugs:** The sidebar was misbehaving, images weren’t scaling properly, and alignment was off. A few small CSS tweaks at a time solved it.

- **Broken Links:** As I added content, I ran into broken link issues. This led me to dig into `baseurl` and `relative_url`, small things that make a big difference when deploying on GitHub Pages.

- **New Features:** I introduced a dedicated *Projects* collection to separate documentation from blog posts, and later added pagination to keep the homepage clean.

## Still Evolving

This site is a work in progress, and that’s the point. I built it by making small, testable changes and letting each improvement inform the next. That same philosophy, _make it work, make it better_, is what shapes the tools I build and the workflows I advocate for. 
