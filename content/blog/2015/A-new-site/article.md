---
title: A new site
kind: :blog
date: 2015-09-16
created_at: 2015-09-16
author: Matthias Beyer
tags:
  - site
---

This is the very first entry in the unfug.org blog.

We created this new site because we thought the old one was getting a bit
dusty. Also, the old site was updated writing plain html, which was not only
ugly but also too complicated and frustrating. So I started to set up a new
page using a static site compiler: [nanoc](https://nanoc.ws). By using a
static site compiler, we can now update the site by writing almost plain text
(markdown) and run one command. Plus, we can keep the content easily tracked
with git, which enables us to put the source of the website on
[github](https://github.com/hfuunfug/unfug.org).

Everyone can build a local clone of the website by cloning the git repository
and running:

    git clone https://github.com/hfuunfug/unfug.org && cd unfug.org
    bundle install --path vendor/bundle
    bundle exec nanoc
    bundle exec nanoc view # to view the site

To make contributions to the site, one can then create a new branch and commit
changes to this branch. Later, a pull request on github has to be opened, so
we can merge in the changes.

As soon as the setup is finished, a merge to the master branch of the github
repository of the website will automatically trigger a rebuild and update the
site. A blog post how this is done will follow.

