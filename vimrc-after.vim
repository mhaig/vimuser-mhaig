source $HOME/.vimuser-jszakmeister/vimrc-after.vim


" =============================================================
" Options
" =============================================================

" Override scrolling settings from .vimuser-jszakmeseister.
set sidescrolloff=0
set scrolloff=0

" -------------------------------------------------------------
" GUI options
" -------------------------------------------------------------

" If PowerLine is enabled and the GUI is running, hide (what I feel is) the
" redundant mode indicator.
if g:EnablePowerline && has("gui_running")
    set noshowmode
endif

" =============================================================
" Setup routines
" =============================================================

function! CustomSetupRstSyntax()
    " Add dot to supported languages.
    let g:rstEmbeddedLangs = g:rstEmbeddedLangs + ["dot"]

    call SetupRstSyntax()

    " Apply dot syntax highlighting to ``.. graphviz::`` directive.
    let region = "rstDirectiveGraphviz"
    silent! syn clear region
    let cmd  = 'syntax region ' . region
    let cmd .= ' matchgroup=rstDirective fold'
    let cmd .= ' start="^\z(\s*\)\.\.\s\+'
    let cmd .= '\%(graphviz\)::\s*$"'
    let cmd .= ' skip="\n\z1\s\|\n\s*\n"'
    let cmd .= ' end="$"'
    let cmd .= " contains=@rstdot"
    execute cmd
    execute 'syntax cluster rstDirectives add=' . region

    syntax sync fromstart
endfunction
command! -bar SetupRstSyntax call CustomSetupRstSyntax()

" =============================================================
" Autocommands
" =============================================================

augroup mhaig_vimrc
    " Switch between snippet and python files.
    autocmd BufEnter *.snippets let b:fswitchdst = 'snippets.py'
    autocmd BufEnter *.snippets let b:fswitchlocs = '.'

    " Switch between python file and generated snippet file.
    autocmd BufEnter *.snippets.py let b:fswitchdst = 'snippets'
    autocmd BufEnter *.snippets.py let b:fswitchlocs = '.'
    autocmd BufEnter *.snippets.py let b:fswitchfnames = '/.snippets$//'
augroup END

" =============================================================
" Commands
" =============================================================

" Override RestoreSize in ~/.vimuser-jszakmeister/vimrc-after.vim with my
" settings.
function! CustomRestoreSize()
    call RestoreSize()

    if has("gui_running")
        SetFont

        " Set the width to accommodate a full 80 column view + tagbar + 1.
        " This has grown a bit with the new bar on the left side.  I also like
        " having the colorcolumn visible.
        set columns=124
        set lines=51
    endif
endfunction
command! -bar RestoreSize call CustomRestoreSize()

RestoreSize
