" =============================================================
" Options
" =============================================================

" Turn on list, and setup the listchars.
set listchars=tab:▸\ ,trail:·,extends:>,precedes:<,nbsp:·
if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
    let &fillchars = "vert:\u254e,fold:\u00b7"
endif
set list

" When I do turn it on though, I want to see a better line break character.
let &showbreak = '↳   '

" =============================================================
" Autocommands
" =============================================================

" Always turn on the sign column.  An autocommand will be used to insert this
" into every buffer.
sign define _hidden

function! ReloadColorScheme()
    redir => current_scheme
    colorscheme
    redir END

    let current_scheme = xolox#misc#str#trim(current_scheme)

    execute 'colorscheme ' . current_scheme
endfunction

augroup mhaig_vimrc
    autocmd!

    if has("nvim") && $NVIM_TUI_ENABLE_TRUE_COLOR != ""
        " Neovim has a few issues when it comes to colorschemes right now.  The
        " main one being is that some of the terminal support bits don't come
        " until much later, for truecolor support.  So you need to reload the
        " colorscheme to have it take effect.
        autocmd VimEnter * nested call ReloadColorScheme()
    endif

    " Make sure the sign column is always present.
    autocmd BufEnter *
                \ execute 'sign place 9999999 line=1000000000 name=_hidden '
                \ . 'buffer=' . expand('<abuf>')

augroup END

" =============================================================
" Commands
" =============================================================

function! RestoreSize()
    if has("gui_running")
        SetFont

        " Set the width to accommodate a full 80 column view + tagbar + 1.
        " This has grown a bit with the new bar on the left side.  I also like
        " having the colorcolumn visible.
        set columns=124
        set lines=51
    endif
endfunction
command! -bar RestoreSize call RestoreSize()

RestoreSize
