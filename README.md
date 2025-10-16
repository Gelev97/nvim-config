## Config
-   `git clone --single-branch --depth 1 git@github.com:Gelev97/nvim-config.git ~/.config/nvim`
-   `mkdir -p ~/.local/share/fonts`
-   `cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf`
-   `sudo apt-get install ripgrep`
-   `sudo apt install nodejs npm`
-   Install [ImageMagick](https://github.com/3rd/image.nvim) 
-   Install [im-select](https://github.com/daipeihust/im-select)

## Global Mappings
-   `Caps` to `Crtl`.
-   `crtl + space` to change language input.

## LSP - Mason Install
-   `:Mason` - opens a graphical status window
-   `:MasonUpdate` - updates all managed registries
-   `:MasonInstall <package> ...` - installs/re-installs the provided packages
-   `:MasonUninstall <package> ...` - uninstalls the provided packages
-   Packages LSP - clangd / ltex-ls / marksman / pyright / html-lsp / lua-ls
-   Packages Linter - flake8 / cpplint
-   `K` - hover to see information about the word under the cursor.
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

## DAP
- `space+fr` **Run / Continue**: Start or continue the debug session.
- `<SPC>fc` **Choose & Launch**: Select a debug configuration to launch.
- `<SPC>fq` **Super Quit**: Terminate the session and close all DAP windows.
- `<SPC>fb` **Toggle Breakpoint**: Set or remove a breakpoint on the current line.
- `<SPC>fo` **Step Over**: Execute the current line without entering functions.
- `<SPC>fi` **Step Into**: Enter the function call on the current line.
- `<SPC>fu` **Step Out**: Exit the current function and return to the caller.
- `<SPC>fe` **Open REPL**: Open the interactive REPL window.
- `<SPC>fs` **View Scopes**: Show all variables in a floating window.
- `K` **Hover Variable**: View the value of the variable under the cursor.

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
