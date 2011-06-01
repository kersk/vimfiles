" pathogen support
filetype off
runtime! autoload/pathogen.vim
silent! call pathogen#helptags()
silent! call pathogen#runtime_append_all_bundles()

set nocompatible                    " lets vim enable features that breaks legacy vanilla vi emulation 
set background=dark					" assume dark background
syntax enable                       " syntax highlighting
"set guifont=Consolas:h12			" best font!
set guifont=Inconsolata-dz:h12		" 2nd best font!
colorscheme kersk                   " sets a vim color theme
"colorscheme desert					" sets a vim color theme
"colorscheme wombat256              " sets a vim color theme
"colorscheme candycode              " sets a vim color theme
set number                          " enables line number gutter
set numberwidth=5		            " adjusts # of columns in the gutter
set showcmd                         " shows in-progress command requesting a motion in the status bar
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
set winminheight=0					" splits are minimized to 0 lines.
set cursorline			            " highlight current line
set nostartofline 		            " retain cursor column position
set wrapscan						" incremental search file wrap around
set wildmenu                        " show pop-up menu instead of auto-complete
"set wildmode=list:longest,full		" command <Tab> completion, list matches, then longest common part, then all.
set nrformats=alpha,octal,hex       " allows visual-inc plugin to do hex/alpha
set backspace=indent,eol,start      " makes backspace work like a normal app
set scrolloff=3      	            " keep line # padding around cursor when scrolling up or down
set undolevels=1000					" increase max # of undos
set hidden							" keeps a buffer's undo history active while the file is not visible
set nobackup						" disable backups
set noswapfile						" disable swap files
set formatoptions-=ro				" shut off auto comment extension to new lines
set gdefault						" regex substitutions default with /g (global across line)
set listchars=tab:^',trail:',eol:¬  " Highlight problematic whitespace
set matchpairs+=<:>					" add % match pair for <>
"set ruler                           " shows cursor position coords
"set sidescrolloff=10               " keep column # padding around cursor when scrolling sideways
"set columns=140                    " non-fullscreen default window width
"set lines=54                       " non-fullscreen default window height
"set autochdir                      " automatically change working dir to the current file's dir
"set foldmethod=indent				" indent based fold generation
"set spell spelllang=en_us			" activate spell checking
"set list							" makes whitespace chars visible

if has('statusline')
	set laststatus=2
	"set statusline=[%<%t]\ 						" Filename
	"set statusline+=%w%h%m%r					" Options
	"set statusline+=%{fugitive#statusline()}	"  Git Hotness
	"set statusline+=\ [%{getcwd()}]          	" current dir
	"set statusline+=\ [%{&ff}/%Y]            	" filetype
	"set statusline+=\ [A=\%03.3b/H=\%02.2B] 	" ASCII / Hexadecimal value of char
	"set statusline+=%=%-14.(%l,%c%V%)\ %p%%  	" Right aligned file nav info

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
		let statusline .= "\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]\ \ "
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

if has("gui_running")				" gui-only settings
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
else
	if has("gui_running")				" gui-only settings
		set	transparency=10             " makes background transparent
		set fuoptions=maxvert,maxhorz   " fullscreen window resizing options (MacVim only?)
		au GUIEnter * set fullscreen    " automatically enter fullscreen at startup
	endif
endif

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

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" menuone opens popup even if only 1 match, longest only uses longest common text
set completeopt=menuone,longest ",preview    " disabled preview

" automatically save all files before running the make command
autocmd QuickFixCmdPre make wa 

function! g:ToggleNuMode() 
	if(&rnu == 1) 
		set nu 
	else 
		set rnu 
	endif 
endfunc 

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

" set fold settings
"augroup vimrc
"au BufReadPre * setlocal foldmethod=indent
"au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END

" save fold settings
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

" config ctags paths (pre-generated STL tags)
"set tags+=~/.vim/tags/stl_tags
"map <C-F12> :silent !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" config cscopes
"map <C-F11> :silent !find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR> :!cscope -b -i cscope.files -f cscope.out<CR> :cs kill -1<CR>:cs add cscope.out<CR>

" neocomplcache plugin
let g:neocomplcache_enable_at_startup = 1 " Use neocomplcache.
let g:neocomplcache_enable_smart_case = 1 " Use smartcase.
let g:neocomplcache_enable_camel_case_completion = 1 " Use camel case completion.
let g:neocomplcache_enable_underbar_completion = 1 " Use underbar completion.

let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_manual_completion_start_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" snippets expand key
"imap  <silent><expr><TAB>  neocomplcache#plugin#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<C-e>" : "\<TAB>")
""imap  <silent><expr><TAB>  neocomplcache#plugin#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-e>"
"smap  <TAB>  <RIGHT><Plug>(neocomplcache_snippets_jump)
"inoremap <expr><C-e>     neocomplcache#complete_common_string()

"imap  <silent><expr><tab>  neocomplcache#sources#snippets_complete#expandable() ? "\<plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<c-n>" : "\<tab>")
"smap  <tab>  <right><plug>(neocomplcache_snippets_jump) 
"inoremap <expr><c-e>     neocomplcache#complete_common_string()
	
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

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

" yank ring plugin
let g:yankring_persist = 0
let g:yankring_min_element_length = 2
function! YRRunAfterMaps()
	nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction

" plugin key bindings
nnoremap <leader>T :NERDTreeFind<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>p :YRShow<CR>
nnoremap <leader>o :TagbarToggle<CR>
nnoremap <bar> :LAck<space>
nnoremap <leader><leader> :FufLine<CR>
nnoremap <leader>[ :FufDir<CR>
nnoremap <leader>] :CommandT<CR>
nnoremap <leader>= :GundoToggle<CR>
nnoremap <F4> :CommandTFlush<CR>
nmap <Leader>a :Tabularize /
vmap <Leader>a :Tabularize /

" custom key bindings
nnoremap <leader>i :call g:ToggleNuMode()<CR> 
nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>' :call ToggleList("Quickfix List", 'c')<CR>

" set path to current file 
map <F5> :cd %:p:h<CR>

" normalize line-endings
nnoremap <leader><F6> :%s/\r$//<CR>

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
nmap  ddkP
nmap <S-j> ddp
" Bubble multiple lines
vmap <S-k> xkP`[V`]
vmap <S-j> xp`[V`]

" Bubble single lines
nmap <S-k> [e
nmap <S-j> ]e
" Bubble multiple lines
vmap <S-k> [egv
vmap <S-j> ]egv

" make enter insert new lines in normal mode
nnoremap <CR> i<CR><Esc>
nnoremap <C-CR> <CR>
"nnoremap <S-CR> i<CR><Esc>
"nnoremap <S-CR> <Down>0i<CR><Esc>kk
"nnoremap <m-CR> k$a<CR><Esc>j

" clear search highlighting with escape
noremap <Esc> :noh<CR><Esc>
"noremap <Esc> :noh<CR>:set wrapscan<CR><C-g><Esc>

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

" bind arrowkeys to switch active window buffer 
map <down> <c-w>j
map <up> <c-w>k
map <right> <c-w>l
map <left> <c-w>h

" bind ctrl-arrowkeys to resize the active window buffer
map <c-left> <c-w><
map <c-right> <c-w>>
map <c-down> <c-w>-
map <c-up> <c-w>+

" rebind [[,[],][,]] to be more useful
noremap [] ][
noremap ][ [[
noremap [[ :set nowrapscan<CR>?[{}]<CR>:noh<CR>:set wrapscan<CR>
noremap ]] :set nowrapscan<CR>/[{}]<CR>:noh<CR>:set wrapscan<CR>
noremap [ <Esc>
noremap ] <Esc>

" preserve visual selection when shifting
vnoremap < <gv
vnoremap > >gv

" mappings to edit and source vimrc
nmap <leader>v :sp $MYVIMRC<CR>
" source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost vimrc source $MYVIMRC
endif

" changes behavior of the <Enter> key when the popup menu is visible to simply select the highlighted menu item, just as <C-Y> does.
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" c# mono unity compilation (mac)
:compiler! gmcs
:set mp=gmcs\ -recurse:*.cs\ -lib:/applications/unity/unity.app/contents/frameworks/\ -lib:/applications/unity/unity.app/contents/frameworks/mono.framework/\ -r:unityengine\ -r:unityeditor\ -r:boo.lang\ -nowarn:0169\ -target:module

" c# mono unity compilation (win)
"compiler! gmcs
"vset mp=gmcs\ -recurse:\"*.cs\"\ -lib:\"C:/Program\ Files\ (x86)/Unity/Editor/Data/Frameworks/\"\ -lib:\"C:/Program\ Files\ (x86)/Unity/Editor/Data/Frameworks/Mono.framework/\"\ -r:UnityEngine\ -r:UnityEditor\ -r:Boo.Lang\ -nowarn:0169\ -target:module\ -g

" apple xcode integration
" set the :make command to use Xcode to build
" set makeprg=osascript\ -e\ \"tell\ application\ \\\"Xcode\\\"\"\ -e\ \"Build\"\ -e\ \"end\ tell\"
"set makeprg=xcodebuild\ -project\ ../kore_SDL.xcodeproj\ -activeconfiguration
"set makeprg=xcodebuild\ -project\ ../kore_GLFW.xcodeproj\ -activeconfiguration
"set makeprg=cd\ /Users/kersk/Dev/kore_GLFW/;xcodebuild\ -project\ kore_GLFW.xcodeproj\ -activeconfiguration
"set makeprg=\"C:/Program\ Files\ (x86)/Microsoft\ Visual\ Studio\ 9.0/Common7/IDE/devenv\ A

"set makeprg=\"C:\Users\jhillery\Documents\Unity\ Projects\vsbuild.bat\"
"set errorformat=%f(%l\\,%c):\ error\ CS%n:\ %m

"function! XcodeClean()
"        silent execute ':!osascript -e "tell application \"Xcode\"" -e "Clean" -e "end tell"'
"endfunction
"command! -complete=command XcodeClean call XcodeClean()
"
"function! XcodeDebug()
"        silent execute '!osascript -e "tell application \"Xcode\"" -e "Debug" -e "end tell"'
"endfunction
"command! -complete=command XcodeDebug call XcodeDebug()

" generated stl_tags with...
"ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ cpp_src 
"ctags ^^^ /usr/include/GL/ && mv tags gl # for OpenGL
"ctags ^^^ /usr/include/SDL/ && mv tags sdl # for SDL

" makes ctags recurse up directory structure if tags not found?
"set tags=./tags;/ 

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

" :%!<term_command> or :r!<term_command> ie :%!sort ... sorts entire file or " the visual selection, neat
" @: repeats last :-mode command.
" ctrl-o while in insert mode crops you back to normal mode for one command
" ctrl-f while in commandline mode opens command window which allows editing
" q/ gets all recent searches into cmd window, ctrl-c to quit
" q: gets all recent command line usage into cmd window, ctrl-c to quit
" :verbose map <leader>t, etc can be used to check mappings
