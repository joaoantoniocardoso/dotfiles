# dotfiles
***Important: use at your own risk. Test with dummy files before use it with your real dotfiles.***

**TLDR**: You can find two things here: 
- my dotfiles at *files* folder;
- a manager to keep them here at *manager* folder.

---

### Description
In the folder *manager* there are two complementary scripts which manages the files kept in *files* folder, replacing the original files with symbolic links, but saving their original location in the folder *locations* and in the git commit messages.

... and yeah, I know that probably it isn't the best approach to do it, but I think it is really simple to implement and use. I would really like if someone improve it in any way! :)

- manager/dot2git: symlink the original dotfile to *files* folder to keep it;
- manager/git2dot: recreate the symlink in the original location for a given kept dotfile;
- files: contains the original dotfiles;
- locations: contains the original dotfiles path;

### Usage
- Configure paths in dot2git and git2dot scripts;
- Add *manager* folder to your paths;
- Use `dot2git <.mydotfilename>` to keep the file *.mydotfilename*;
- Use `git2dot <files/.mydotfilename>` to recover / install the dotfile kept in *files/.mydotfilename*;

### Contribute
Feel free to Use, Issue, Fork and make it better with Pull Requests.
