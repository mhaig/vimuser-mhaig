if has("nvim")
    " Background detection is not trustworthy in nvim, so set the colorscheme.
    colorscheme szakdark

    " Neovim turns on gui support when truecolor support is activated.
    " Unfortunately, it messes with our font selection logic, so let's just set
    " a font knowing full well it won't be used for now.
    if $NVIM_TUI_ENABLE_TRUE_COLOR != ""
        let g:FontFamily = "DejaVu Sans Mono for Powerline"
    endif

    let loaded_fixkey = 1
endif
