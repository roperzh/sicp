## SICP exercises

> Moriturus te saluto.

This is a collection of my answers to the exercises in the [SICP][sicp] book.

In order to run the excercises I'm using [MIT/GNU Scheme][mit-scheme], you can
find installation instructions for your platform in their website, for macOS it
can be installed via homebrew:

```
$ brew install mit-scheme
```

### Tips & Tricks

- There's a MIT Scheme Reference [available online][scheme-ref], many of the
  procedures introduced in the book are available as built-in procedures that
  you can directly use in other excercises without having to import or
  re-define them.

- All the `.scm` archives are valid code that can be run by the interpreter, to
  make this process faster I have defined the following in my `.vimrc`:

  ```vim
  autocmd BufNewFile,BufRead *.scm nnoremap <leader>r <Esc>:w<CR>:!mit-scheme < %<CR>
  ```

- The interpreter has nice debugging capabilities described in the
  [reference][scheme-ref] but I've found the `(trace procedure-name)` procedure
  to be the most useful for rapid iteration.

[sicp]: http://sarabander.github.io/sicp/
[mit-scheme]: https://www.gnu.org/software/mit-scheme/
[scheme-ref]: https://groups.csail.mit.edu/mac/ftpdir/scheme-7.4/doc-html/scheme_toc.html
