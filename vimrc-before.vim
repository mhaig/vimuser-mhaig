let s:inherit_dir = expand("$HOME/.vimuser-jszakmeister")
call RtpInherit(s:inherit_dir)
exec 'source ' . fnameescape(s:inherit_dir . '/vimrc-before.vim')

" My settings here...

" Unlet mapleader to prevent using ',' as the mapleader.
unlet! mapleader
