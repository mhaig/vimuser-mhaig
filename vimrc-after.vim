source $HOME/.vimuser-jszakmeister/vimrc-after.vim

" If PowerLine is enabled and the GUI is running, hide the redundant mode
" indicator.
if g:EnablePowerline && has("gui_running")
    set noshowmode
endif

" The following section overrides settings from .vimuser-jszakmeseister.
set sidescrolloff=0
set scrolloff=0
if has("gui_running")
    SetFont

    " Set the width to accommodate a full 80 column view + tagbar.
    set columns=121
endif
