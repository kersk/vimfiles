call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set nocompatible                    " lets vim enable features that breaks legacy vanilla vi emulation 
syntax enable                       " syntax highlighting
colorscheme kersk                   " sets a vim color theme
"colorscheme wombat256              " sets a vim color theme
"colorscheme candycode              " sets a vim color theme
set ruler                           " shows cursor position coords
set number                          " enables line number gutter
set numberwidth=5		            " adjusts # of columns in the gutter
set showcmd                         " shows in-progress command requesting a motion in the status bar
"set foldmethod=indent				" indent based fold generation
set incsearch                       " searches as you type
set hlsearch                        " highlight search results
set ignorecase			            " case agnostic searches
set smartcase			            " ... unless you start using uppercase
set autoindent                      " automatically indents
set smartindent                     " better than dumbindent
set tabstop=4                       " sets tabs to 4 spaces
set softtabstop=4		            " sets tabs to 4 spaces, differently
set shiftwidth=4                    " sets tabs to 4 spaces, differently.
set virtualedit=all	                " allows cursor to go bravely where no cursor has gone before
set mouse=a				            " enable mouse for everything
"set mousefocus						" enable focus following mouse
set wmh=0                           " splits are minimized to 0 lines.
set cursorline			            " highlight current line
set nostartofline 		            " retain cursor column position
set wrapscan						" incremental search file wrap around
"set autochdir                      " automatically change working dir to the current file's dir
set wildmenu                        " ?
set scrolloff=3      	            " keep line # padding around cursor when scrolling up or down
"set sidescrolloff=10               " keep column # padding around cursor when scrolling sideways
"set columns=140                    " non-fullscreen default window width
"set lines=54                       " non-fullscreen default window height
set nrformats=alpha,octal,hex 
set backspace=indent,eol,start 
if has("gui_running")              " gui-only settings
	set guioptions-=m               " disables gui menu bar
	set guioptions-=e               " disables gui tab bar
	set guioptions-=T               " disables gui toolbar
	set guioptions-=L               " disables all scrollbars
	set guioptions-=l               " disables all scrollbars
	set guioptions-=R               " disables all scrollbars
	set guioptions-=r               " disables all scrollbars
endif

if has('win16') || has('win32') || has('win64')
	nnoremap <F2> :sp C:\Program\ Files\ (x86)\Vim\_vimrc<CR>
	nnoremap <F3> :so C:\Program\ Files\ (x86)\Vim\_vimrc<CR>
	map <F12> :call libcallnr("vimtweak.dll", "SetAlpha", 255)<CR>
	map <S-F12> :call libcallnr("vimtweak.dll", "SetAlpha", 250)<CR>
	map <C-F12> :call libcallnr("vimtweak.dll", "SetAlpha", 240)<CR>
	map <A-F12> :call libcallnr("vimtweak.dll", "SetAlpha", 222)<CR>
	" toggle menu bar in gvim
	"nnoremap <F7> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
	"nnoremap <F8> :if &go=~#'b'<Bar>set go-=b<Bar>else<Bar>set go+=b<Bar>endif<CR>
	"nnoremap <F9> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
	" toggle fullscreen in win32
	map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 
	map <MiddleMouse> <Nop>
	imap <MiddleMouse> <Nop>
	map <2-MiddleMouse> <Nop>
	imap <2-MiddleMouse> <Nop>
	map <3-MiddleMouse> <Nop>
	imap <3-MiddleMouse> <Nop>
	map <4-MiddleMouse> <Nop>
	imap <4-MiddleMouse> <Nop>
else
	if has("gui_running")              " gui-only settings
		set	transparency=10             " makes background transparent
		set fuoptions=maxvert,maxhorz   " fullscreen window resizing options (MacVim only?)
		au GUIEnter * set fullscreen    " automatically enter fullscreen at startup
	endif
endif

map <F5> :cd %:p:h<CR>

set guifont=Consolas:h12
"set spell spelllang=en_us    " activate spell checking
"set list                     " makes whitespace chars visible
"set listchars=tab:>-,trail:- " filter to just tabs and trailing whitespace

" c# mono unity compilation (mac)
":compiler! gmcs
":set mp=gmcs\ -recurse:*.cs\ -lib:/Applications/Unity/Unity.app/Contents/Frameworks/\ -lib:/Applications/Unity/Unity.app/Contents/Frameworks/Mono.framework/\ -r:UnityEngine\ -r:UnityEditor\ -r:Boo.Lang\ -nowarn:0169\ -target:module
":set autowrite

" c# mono unity compilation (win)
"compiler! gmcs
"vset mp=gmcs\ -recurse:\"*.cs\"\ -lib:\"C:/Program\ Files\ (x86)/Unity/Editor/Data/Frameworks/\"\ -lib:\"C:/Program\ Files\ (x86)/Unity/Editor/Data/Frameworks/Mono.framework/\"\ -r:UnityEngine\ -r:UnityEditor\ -r:Boo.Lang\ -nowarn:0169\ -target:module\ -g
"set autowrite

" filetype detection for indenting and code completion
filetype plugin indent on
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=func=ccomplete#CompleteCpp
autocmd FileType cpp set formatoptions-=ro
"set omnifunc=syntaxcomplete#Complete

" set custom filetypes for .frag and .vert glsl shaders to use c's filetype
au BufNewFile,BufRead *.frag set filetype=cpp
au BufNewFile,BufRead *.vert set filetype=cpp

"augroup vimrc
"au BufReadPre * setlocal foldmethod=indent
"au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END

" save fold settings
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

" config backup swapfiles
"set backup " enable backups
"set backupdir=C:\Users\jhillery\Documents\vimbackups " place backup files here
"set backupdir=C:\Program\ Files\ (x86)\Vim\backups " place backup files here
"set directory=C:\Program\ Files\ (x86)\Vim\swap " place backup files here
"set directory=/.vim/swapfiles " dump swap files here
set hidden " keeps a buffer's undo history active while the file is not visible

" disable backups and swap files
set nobackup
set noswapfile

" shut off auto comment extension to new lines
set formatoptions-=ro

" config ctags paths (pre-generated STL tags)
"set tags+=~/.vim/tags/stl_tags
"map <C-F12> :silent !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" config cscopes
"map <C-F11> :silent !find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR> :!cscope -b -i cscope.files -f cscope.out<CR> :cs kill -1<CR>:cs add cscope.out<CR>

" plugin config
" doxygen syntax hilighting
"let g:load_doxygen_syntax=1

"let g:mapleader = ","

" Command-T plugin
let g:CommandTMaxHeight=15

let g:EasyMotion_leader_key = ','

" LustyExplorer
" let g:LustyExplorerSuppressRubyWarning = 1

" TabBar
"let Tb_UseSingleClick = 1
let Tb_cTabSwitchBufs = 1
let Tb_MaxSize = 10
"let Tb_cTabSwitchWindows = 1

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_SelectFirstItem = 2 " select item but don't auto insert
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" menuone opens popup even if only 1 match, longest only uses longest common text
set completeopt=menuone,longest ",preview    " disabled preview

" supertab plugin 
let g:SuperTabDefaultCompletionType = 'context'

" nerdtree plugin
"au VimEnter *  NERDTree " auto open nerd tree
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['\.vim$', '\~$', '\.svn$', '\.git$', '.DS_Store', 'cscope\.files', 'cscope\.out', 'tags']

" yank ring plugin
"let g:yankring_persist = 0
"let g:yankring_replace_n_pkey = '<C-P>'
"let g:yankring_replace_n_nkey = '<C-N>'
"function! YRRunAfterMaps()
"	nnoremap Y   :<C-U>YRYankCount "y$"<CR>
"endfunction         

" apple xcode integration
" set the :make command to use Xcode to build
" set makeprg=osascript\ -e\ \"tell\ application\ \\\"Xcode\\\"\"\ -e\ \"Build\"\ -e\ \"end\ tell\"
"set makeprg=xcodebuild\ -project\ ../kore_SDL.xcodeproj\ -activeconfiguration
"set makeprg=xcodebuild\ -project\ ../kore_GLFW.xcodeproj\ -activeconfiguration
"set makeprg=cd\ /Users/kersk/Dev/kore_GLFW/;xcodebuild\ -project\ kore_GLFW.xcodeproj\ -activeconfiguration
"set makeprg=\"C:/Program\ Files\ (x86)/Microsoft\ Visual\ Studio\ 9.0/Common7/IDE/devenv\ A

"set makeprg=\"C:\Users\jhillery\Documents\Unity\ Projects\vsbuild.bat\"
"set errorformat=%f(%l\\,%c):\ error\ CS%n:\ %m

" automatically save all files before running the make command
autocmd QuickFixCmdPre make wa 

function! XcodeClean()
        silent execute ':!osascript -e "tell application \"Xcode\"" -e "Clean" -e "end tell"'
endfunction
command! -complete=command XcodeClean call XcodeClean()

function! XcodeDebug()
        silent execute '!osascript -e "tell application \"Xcode\"" -e "Debug" -e "end tell"'
endfunction
command! -complete=command XcodeDebug call XcodeDebug()

function! g:ToggleNuMode() 
	if(&rnu == 1) 
		set nu 
	else 
		set rnu 
	endif 
endfunc 

" custom key bindings
nnoremap <leader>i :call g:ToggleNuMode()<CR> 
" plugin toggles
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>p :YRShow<CR>
nnoremap <leader>o :TagbarToggle<CR>
nnoremap <bar> :Ack<space>
nnoremap <leader><leader> :FufLine<CR>
nnoremap <leader>[ :FufDir<CR>
nnoremap <leader>] :CommandT<CR>
nnoremap <leader>= :GundoToggle<CR>
nnoremap <F4> :CommandTFlush<CR>

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

nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>' :call ToggleList("Quickfix List", 'c')<CR>

" bind both ; and : to EX 
map ; :

" move char searching to - and _
noremap - ;
noremap _ ,

" makes shift-Y consistent with shift-D, shift-C, etc [yankring conflict?]
noremap <S-y> y$

" scroll screen with spacebar
noremap <S-Space> <C-d>
noremap <C-Space> <C-u>

" disable Shift-K (man page lookup) and Shift-J (join lines is rebound to Control-S) 
noremap <C-s> <S-j>

" rebind j and k to move up and down virtual lines
noremap j gj
noremap k gk

nmap <S-j> <C-d>
vmap <S-j> <C-d>
nmap <S-k> <C-u>
vmap <S-k> <C-u>

" disable Shift-Up and Shift-Down -- just move up and down 1 line
nmap <S-Up> k
vmap <S-Up> k
nmap <S-Down> j
vmap <S-Down> j

" make enter insert new lines in normal mode
nnoremap <S-CR> i<CR><Esc>
nnoremap <CR> i<CR><Esc>
"nnoremap <S-CR> <Down>0i<CR><Esc>kk
"nnoremap <m-CR> k$a<CR><Esc>j
nnoremap <C-CR> <CR>

" clear search highlighting with escape
"noremap <Esc> :noh<CR>:set wrapscan<CR><C-g><Esc>
noremap <Esc> :noh<CR><Esc>

" swap ` and ' keys so that ' uses line+column for marks and ` just uses line
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

" bind control-arrowkeys to switch active window buffer 
map <c-down> <c-w>j
map <c-up> <c-w>k
map <c-right> <c-w>l
map <c-left> <c-w>h

" bind alt-arrowkeys to resize the active window buffer
map <m-left> <c-w><
map <m-right> <c-w>>
map <m-down> <c-w>-
map <m-up> <c-w>+

" rebind [[,[],][,]] to be more intuitive
noremap [] ][
noremap ][ [[
noremap [[ :set nowrapscan<CR>?[{}]<CR>:noh<CR>:set wrapscan<CR>
noremap ]] :set nowrapscan<CR>/[{}]<CR>:noh<CR>:set wrapscan<CR>
noremap [ <Esc>
noremap ] <Esc>

" normalize line-endings
nnoremap <leader><F6> :%s/\r$//<CR>

" preserve visual selection when shifting
vnoremap < <gv
vnoremap > >gv

nmap <leader>ev :e ~/.vim/vimrc<CR>
nmap <leader>sv :so ~/.vim/vimrc<CR>


" repeat one-off macro @q with ctrl-q, slightly quicker than @@
"nnoremap <C-q> @q

" changes behavior of the <Enter> key when the popup menu is visible to simply select the highlighted menu item, just as <C-Y> does.
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" notes
" completion mode reference
" <c-x><c-L> completion: whole line
" <c-x><c-N> completion: keywords using current file
" <c-x><c-K> completion: keywords using dictionary
" <c-x><c-T> completion: keywords using thesaurus
" <c-x><c-I> completion: keywords in current and included files
" <c-x><c-]> completion: tags
" <c-x><c-F> completion: file names
" <c-x><c-D> completion: definitions or macros
" <c-x><c-V> completion: vim command line
" <c-x><c-O> completion: omni completion

" :set scroll=0 " resets scroll lines for ctrl-D/ctrl-U to 1/2 window height
" (default is changed for ctrl-D/ctrl-U by prepending with a #, ie 5ctrl-d)

" generated stl_tags with...
" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ cpp_src 
" ctags ^^^ /usr/include/GL/ && mv tags gl # for OpenGL
" ctags ^^^ /usr/include/SDL/ && mv tags sdl # for SDL

" makes ctags recurse up directory structure if tags not found?
" set tags=./tags;/ 

" in :-mode or /-mode, ctrl-r,ctrl-w pastes current word under cursor!

" :%!<term_command> or :r!<term_command> ie :%!sort ... sorts entire file or " the visual selection, neat

" @: repeats last :-mode command.

" ctrl-o while in insert mode drops you back to normal mode for one command
