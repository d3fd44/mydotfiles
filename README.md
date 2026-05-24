My stupid dotfiles for \[Neo\]vim, zsh, and some other tools.

the installation script creates symlinks for dotfiles under $HOME, or under .config directory for configration directories:
```bash
./install
```
- .ignore
to **ignore** files, put patterns (glob-style) in -- guess what... a `.ignore` file (unexpected, huh?), the installation script will not create symlinks for those entries.

---

= why don't you use GNU stow? \
\- we got stow at home

*the stow at home:*
