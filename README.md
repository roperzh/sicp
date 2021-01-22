## SICP exercises

> Moriturus te saluto.

This is a collection of my answers to the exercises in the [SICP][sicp] book.

In order to run the excercises I'm using [MIT/GNU Scheme][mit-scheme], you can
find installation instructions for your platform in their website, for macOS it
can be installed via homebrew:

```
$ brew install mit-scheme
```

All the `.scm` archives are valid code that can be run by the interpreter, to
make this process faster I have defined the following in my `.vimrc`:

```vim
autocmd BufNewFile,BufRead *.scm nnoremap <leader>r <Esc>:w<CR>:!mit-scheme < %<CR>
```

[sicp]: http://sarabander.github.io/sicp/
[mit-scheme]: https://www.gnu.org/software/mit-scheme/
