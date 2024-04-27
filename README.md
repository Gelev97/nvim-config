## Config
-   `mkdir -p ~/.config/nvim`
-   `git clone git@github.com:Gelev97/nvim-config.git`
-   `mkdir -p ~/.local/share/fonts`
-   `cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf`
-   `curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -`
-   `sudo apt-get install ripgrep`
-   Install latest npm
-   Install [im-select](https://github.com/daipeihust/im-select)

## Global Mappings
-   `Caps` to `Crtl`.
-   `crtl + space` to change language input.

## LSP - Mason Install
-   `:Mason` - opens a graphical status window
-   `:MasonUpdate` - updates all managed registries
-   `:MasonInstall <package> ...` - installs/re-installs the provided packages
-   `:MasonUninstall <package> ...` - uninstalls the provided packages
-   Packages LSP - clangd / ltex-ls / marksman / pyright / html / lua-ls
-   Packages Linter - flake8 / cpplint
-   `space+gd` get definition of the code
-   `space+gr` get all the references of the code
-   `crtl+n` next hover choice
-   `crtl+p` previous hover choice
-   `crtl+enter` previous hover choice

## NeoTree - File Structure
-   `crtl+n` open the tree on the left.
-   `a` add item
-   `d` delete item
-   `t` unfold folder
-   `r` rename item
-   `m` move item
-   `i` item information
-   `q` close the tree

## Telescope - Search
-   `crtl+v` Go to file selection as a vsplit
-   `crtl+c` Close telescope (insert mode)
-   `crtl+p` Open search
-   `space+fg` open fuzzy search

## NeoColumn
-   `space+nc` show column 80 and 120 highlighting

## Spell Check
-   `z=` find available words
-   `space+ts` toggle spell check

## Trouble
-   `space+xd` show all documents' errors

## White Space
-   `space+tw` trim all whitespaces
