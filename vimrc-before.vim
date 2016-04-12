let s:inherit_dir = expand("$HOME/.vimuser-jszakmeister")
call RtpInherit(s:inherit_dir)
exec 'source ' . fnameescape(s:inherit_dir . '/vimrc-before.vim')

" My settings here...

" For now, font size should be 14 unless on a Mac.
if !(g:Platform == "darwin")
    let g:FontSize = 14
endif

let g:EnablePowerline = 1

" Unlet mapleader to prevent using ',' as the mapleader.
unlet! mapleader
