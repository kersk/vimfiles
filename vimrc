" pathogen support
filetype off
runtime! autoload/pathogen.vim
silent! call pathogen#helptags()
silent! call pathogen#runtime_append_all_bundles()

set nocompatible                    " lets vim enable features that breaks legacy vanilla vi emulation
set background=dark                 " assume dark background
syntax enable                       " syntax highlighting
set guifont=Consolas:h12            " best font!
"set guifont=Consolas\ Bold:h12     " best font bold!
"set guifont=Inconsolata-dz:h12     " 2nd best font!
colorscheme kersk                   " sets a vim color theme
set autoread                        " auto reload externally modified files
set number                          " enables line number gutter
set numberwidth=5                   " adjusts # of columns in the gutter
set showcmd                         " shows in-progress command requesting a motion in the status bar
set incsearch                       " searches as you type
set hlsearch                        " highlight search results
set ignorecase                      " case agnostic searches
set smartcase                       " ... unless you start using uppercase
"set autoindent                     " automatically indents
"set smartindent                    " better than dumbindent
"set cindent                        " c-style aware indenting
set tabstop=4                       " sets tabs to 4 spaces
set softtabstop=4                   " sets tabs to 4 spaces, differently
set shiftwidth=4                    " sets tabs to 4 spaces, differently.
set expandtab                       " expands all the tabs.
set virtualedit=all                 " allows cursor to go bravely where no cursor has gone before
set mouse=a                         " enable mouse for everything
set winminheight=0                  " splits are minimized to 0 lines.
set cursorline                      " highlight current line
set nostartofline                   " retain cursor column position
set wrapscan                        " incremental search file wrap around
set nrformats=alpha,octal,hex       " allows visual-inc plugin to do hex/alpha
set backspace=indent,eol,start      " makes backspace work like a normal app
set scrolloff=3                     " keep line # padding around cursor when scrolling up or down
set undolevels=1000                 " increase max # of undos
set hidden                          " keeps a buffer's undo history active while the file is not visible
set nobackup                        " disable backups
set noswapfile                      " disable swap files
set formatoptions-=ro               " shut off auto comment extension to new lines
set listchars=tab:'`,trail:~        " Highlight problematic whitespace
set list                            " makes whitespace chars visible
set matchpairs+=<:>                 " add % match pair for <>
set noea                            " prevent resizing/repositioning entire window when closing buffers -- 'no equal always'
"set ruler                          " shows cursor position coords
"set sidescrolloff=10               " keep column # padding around cursor when scrolling sideways
"set autochdir                      " automatically change working dir to the current file's dir

let $VIMHOME=expand('<sfile>:p:h')

if has('statusline')
    set laststatus=2
    "set statusline=[%<%t]\                     " Filename
    "set statusline+=%w%h%m%r                   " Options
    "set statusline+=%{fugitive#statusline()}   "  Git Hotness
    "set statusline+=\ [%{getcwd()}]            " current dir
    "set statusline+=\ [%{&ff}/%Y]              " filetype
    "set statusline+=\ [A=\%03.3b/H=\%02.2B]    " ASCII / Hexadecimal value of char
    "set statusline+=%=%-14.(%l,%c%V%)\ %p%%    " Right aligned file nav info

    "" custom statusline
    hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
    hi Modified guibg=orange guifg=black ctermbg=lightred ctermfg=black

    function! MyStatusLine(mode)
        let statusline=""
        if a:mode == 'Enter'
            let statusline.="%#StatColor#"
        endif
        let statusline.="\(%n\)\ %f\ "
        if a:mode == 'Enter'
            let statusline.="%*"
        endif
        let statusline.="%#Modified#%m"
        if a:mode == 'Leave'
            let statusline.="%*%r"
        elseif a:mode == 'Enter'
            let statusline.="%r%*"
        endif
        let statusline .="\ %{fugitive#statusline()}"
        "let statusline .="\ [%{getcwd()}]"
        let statusline .= "%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]"
        let statusline .= "\ (%l/%L,\ %c)\ %P\ \ "
        return statusline
    endfunction

    au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
    au WinLeave * setlocal statusline=%!MyStatusLine('Leave')
    set statusline=%!MyStatusLine('Enter')

    function! InsertStatuslineColor(mode)
        if a:mode == 'i'
            hi StatColor guibg=orange ctermbg=lightred
        elseif a:mode == 'r'
            hi StatColor guibg=#e454ba ctermbg=magenta
        elseif a:mode == 'v'
            hi StatColor guibg=#e454ba ctermbg=magenta
        else
            hi StatColor guibg=red ctermbg=red
        endif
    endfunction

    au InsertEnter * call InsertStatuslineColor(v:insertmode)
    au InsertLeave * hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
endif

if has("gui_running")               " gui-only settings
    set guioptions-=m               " disables gui menu bar
    set guioptions-=e               " disables gui tab bar
    set guioptions-=T               " disables gui toolbar
    set guioptions-=L               " disables all scrollbars
    set guioptions-=l               " disables all scrollbars
    set guioptions-=R               " disables all scrollbars
    set guioptions-=r               " disables all scrollbars
endif

if has('win16') || has('win32') || has('win64')
    map <MiddleMouse> <Nop>
    imap <MiddleMouse> <Nop>
    map <2-MiddleMouse> <Nop>
    imap <2-MiddleMouse> <Nop>
    map <3-MiddleMouse> <Nop>
    imap <3-MiddleMouse> <Nop>
    map <4-MiddleMouse> <Nop>
    imap <4-MiddleMouse> <Nop>
endif

" filetype detection for indenting and code completion
filetype plugin indent on
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=syntaxcomplete#Complete
autocmd FileType cpp set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType cpp set formatoptions-=ro
autocmd FileType cs set formatoptions-=ro

" set custom filetypes for .frag and .vert glsl shaders to use c's filetype
au BufNewFile,BufRead *.frag set filetype=cpp
au BufNewFile,BufRead *.vert set filetype=cpp
au BufNewFile,BufRead *.shader set filetype=cpp

" menuone opens popup even if only 1 match, longest only uses longest common text
set completeopt=menuone,longest ",preview    " disabled preview

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

let g:ctrlp_max_files = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_max_height = 15
let g:ctrlp_switch_buffer = 0

let g:SuperTabClosePreviewOnPopupClose = 1

" indent guides plugin
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 5
" Command-T plugin
let g:CommandTMaxHeight=15

" LustyExplorer plugin
let g:LustyExplorerSuppressRubyWarning = 1 " removes warning in terminal vim

" Gundo plugin
let gundo_help = 0 " disable help text at top
let gundo_preview_bottom = 1 " give preview window entire width of screen
let gundo_close_on_revert = 1 " auto close on choosing version

" nerdtree plugin
"au VimEnter *  NERDTree " auto open nerd tree
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['\.vim$', '\~$', '\.svn$', '\.git$', '.DS_Store', 'cscope\.files', 'cscope\.out', 'tags']

" plugin key bindings
nnoremap <leader>_ :NERDTreeFind<CR>
nnoremap <leader>- :NERDTreeToggle<CR>
nnoremap <leader>p :YRShow<CR>
nnoremap <leader>o :TagbarToggle<CR>
nnoremap <bar> :Ag!<space>
nnoremap <leader><leader> :FufLine<CR>
nnoremap <leader>[ :FufDirWithFullCwd<CR>
nnoremap <leader>] :CtrlP<CR>
nnoremap <leader>= :GundoToggle<CR>

" set path to current file
map <F5> :cd %:p:h<CR>
map <F12> :call GotoDefinition()<CR>
map gd :call GotoDefinition()<CR>
map <leader>s :call FindImplementations()<CR>
map <leader>r :call FindUsages()<CR>

" normalize line-endings and strip trailing whitespace
map <F6> :e ++ff=dos<CR>:set ff=unix<CR>:%s/\s\+$//<CR>:w<CR>
noremap <leader><F6> :%s/\r$//<CR>

" bind both ; and : to EX
map ; :

" move char searching to - and _
noremap - ;
noremap _ ,

" scroll screen with spacebar
noremap <S-Space> <C-d>
noremap <C-Space> <C-u>

" rebind j and k to move up and down virtual lines
noremap j gj
noremap k gk

" rebind join lines is rebound to Control-s
noremap <C-s> <S-j>

" disable Shift-Up and Shift-Down -- just move up and down 1 line
nmap <S-Up> k
vmap <S-Up> k
nmap <S-Down> j
vmap <S-Down> j

" Bubble single lines
nmap <S-k> [e
nmap <S-j> ]e
" Bubble multiple lines
vmap <S-k> [egv
vmap <S-j> ]egv

" map , to mirror leader
map , <Leader>

" make enter insert new lines in normal mode
nnoremap <CR> i<CR><Esc>
nnoremap <C-CR> <CR>

" clear search highlighting with escape
noremap <Esc> :noh<CR><Esc>

" rebinds ' to ` so that ' uses line+column for marks
noremap ' `
"noremap ` '

" bind control-jklh to switch active window buffer
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" bind alt-jklh to minimize/maximize window buffers
noremap <a-k> <c-w>_
noremap <a-j> <c-w>1_
noremap <a-l> <c-w><bar>
noremap <a-h> <c-w>1<bar>

" preserve visual selection when shifting
vnoremap < <gv
vnoremap > >gv

" visual mode search
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" mappings to edit and source vimrc
nmap <leader>v :sp $MYVIMRC<CR>
nmap <leader>s :so $MYVIMRC<CR>

" :%!<term_command> or :r!<term_command> ie :%!sort ... sorts entire file or " the visual selection, neat
" @: repeats last :-mode command.
" ctrl-o while in insert mode crops you back to normal mode for one command
" ctrl-f while in commandline mode opens command window which allows editing
" q/ gets all recent searches into cmd window, ctrl-c to quit
" q: gets all recent command line usage into cmd window, ctrl-c to quit
"
" fix mixed newlines
" :set ff=unix
" :%s/\r//g
