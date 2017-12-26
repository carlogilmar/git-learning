# Git Simple Readme

Git Objects
- Blobs (files or content)
- Trees (directories)
- Commits (snapshots of your repo)

Git Folder .git
- Branches
- Config
- Description
- Hooks
- Info
- Objects
- Refs

Github file:
- Content
- Header information
- Blob content-length content

Sampler.rb it’s a ruby script for made a git repository

- Create the folders **.git/objects/
- Made the first part (blob) in irb console.
	- Blob
		- content
		- header
		- store
		- hash
		- compress file
		- make directory
		- store into the directory

```
λ  demo ❯❯❯ find .
.
./.git
./.git/objects
./.git/objects/40
./.git/objects/40/164f29e310b28a6e028499d5a1f611b8323a76
```

- Write the second part, create the tree

```
λ  demo ❯❯❯ find .
.
./.git
./.git/objects
./.git/objects/4b
./.git/objects/4b/54562df61ea89b21ce62724e8872ea939b6e0c
./.git/objects/40
./.git/objects/40/164f29e310b28a6e028499d5a1f611b8323a76
```

- Write the third part, create the commit

```
λ  demo ❯❯❯ find .
.
./.git
./.git/objects
./.git/objects/4b
./.git/objects/4b/54562df61ea89b21ce62724e8872ea939b6e0c
./.git/objects/2f
./.git/objects/2f/e3e466fdd8fe00cf6f3eed3a6c554e4bab15e8
./.git/objects/40
./.git/objects/40/164f29e310b28a6e028499d5a1f611b8323a76
```

Create the directory **.git/refs/heads**

Write the hash commit in master file

> echo 40/164f29e310b28a6e028499d5a1f611b8323a76 > .git/refs/heads/master

Write the last reference:

> echo 'ref: refs/heads/master' > .git/HEAD

