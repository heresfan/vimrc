
"""""""""""""""""""""""""""""
" => global
"""""""""""""""""""""""""""""
" gvim settings
"if has("gui_running")
"    if has("gui_gtk2")
"        set guifont=Monaco\ 11
"    elseif has("gui_photon")
"        set guifont=Courier\ New:s11
"    elseif has("gui_kde")
"        set guifont=Courier\ New/11/-1/5/50/0/0/0/1/0
"    elseif has("x11")
"        set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
"    else
"        set guifont=Courier_New:h11:cDEFAULT
"    endif
"    "hi CursorLine  ctermbg=red ctermfg=white gui=NONE guibg=Grey30 guifg=white
"endif
if has("gui_running")
    if has("gui_gtk2") || has("gui_gtk3")
        set guifont=Monaco\ 13
    elseif has("gui_photon")
        set guifont=Monaco:s13
    elseif has("gui_kde")
        set guifont=Monaco/13/-1/5/50/0/0/0/1/0
    elseif has("x11")
        set guifont=-*-monaco-medium-r-normal-*-*-180-*-*-m-*-*
    else
        set guifont=Monaco:h13:cDEFAULT
    endif
endif

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

"""""""""""""""""""""""""""""
" => taglist
"""""""""""""""""""""""""""""
map <leader><leader> :TlistToggle<cr>
let Tlist_Use_Right_Window=1 
let Tlist_Show_One_File = 1

"""""""""""""""""""""""""""""
" => GLOBAL 
"""""""""""""""""""""""""""""
set number
set cursorline


"""""""""""""""""""""""""""""
" => go language setting
"""""""""""""""""""""""""""""
let g:go_disable_autoinstall = 0
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck'] " vim default
let g:go_metalinter_autosave = 0 " syntastic_go_checkers is used instead
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
" overwrite config in `vimrcs/plugins_config.vim`
let g:syntastic_auto_loc_list = 1
let g:syntastic_go_checkers = ['errcheck']
"let g:tlist_go_settings = 'go;f:func;v:var;t:type'
"let s:tlist_def_go_settings = 'go;g:enum;s:struct;u:union;t:type;' .
"                           \ 'v:variable;f:function'

""""""""""""""""""""""""""""""
" => tagbar
""""""""""""""""""""""""""""""
let g:neocomplete#enable_at_startup = 1

""""""""""""""""""""""""""""""
" => tagbar
""""""""""""""""""""""""""""""
map <leader>. :TagbarToggle<cr>
let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',  
    \ 'kinds'     : [  
        \ 'p:package',  
        \ 'i:imports:1',  
        \ 'c:constants',  
        \ 'v:variables',  
        \ 't:types',  
        \ 'n:interfaces',  
        \ 'w:fields',  
        \ 'e:embedded',  
        \ 'm:methods',  
        \ 'r:constructor',  
        \ 'f:functions'  
    \ ],  
    \ 'sro' : '.',  
    \ 'kind2scope' : {  
        \ 't' : 'ctype',  
        \ 'n' : 'ntype'  
    \ },  
    \ 'scope2kind' : {  
        \ 'ctype' : 't',  
        \ 'ntype' : 'n'  
    \ },  
    \ 'ctagsbin'  : 'gotags',  
    \ 'ctagsargs' : '-sort -silent'  
\ }  
