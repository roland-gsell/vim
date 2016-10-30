" einzelne Faltung öffnen:      zo
" einzelne Faltung schließen:   zc
" alle öffnen:                  zR
" alle schließen:               zM

set nocompatible

" INSTALLATION {{{
"
" mkdir -p ~/.vim/bundle/Vundle.vim
" sudo apt-get install git
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" Place  .vimrc (this file) in your home directory ...
" source it or restart vim, then:
"
" :PluginInstall
"
"
" Install Powerline Fonts ...
"
" wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
" wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
"
" mkdir -p ~/.config/fontconfig/conf.d
" mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
"
" xset q
" sudo mv PowerlineSymbols.otf /usr/share/fonts/X11/misc/
" fc-cache -vf /usr/share/fonts/X11/misc
"
" ... Restart terminal! ...
" }}}

"Plugins {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-abolish'

Plugin 'tpope/vim-fugitive'

" Bundle 'scrooloose/nerdtree'

" The bundles you install will be listed here

filetype plugin indent on

" }}}

" Plugins direkt implementiert {{{
" nelstrom/vim-visual-star-search
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

" nelstrom/vim-qargs
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction
" }}}

" Autocmd-Block {{{
if has("autocmd")
    " Marker-Faltung aktivieren und alles einklappen
    autocmd BufRead .vimrc setlocal foldmethod=marker
    autocmd BufRead .vimrc normal zM
    "Filetype aktivieren
    filetype on
    autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
    augroup vimrc_autocmds
        autocmd!
        " Zeichen nach Spalte 120 hervorheben
        autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
        autocmd FileType python match Excess /\%120v.*/
        autocmd FileType python set nowrap
        autocmd FileType python setlocal foldmethod=indent
        autocmd FileType python normal zR
        augroup END
    " rss und atom-Files wie XML behandeln
    autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml
    " Python und Javascript von Leerraum-Zeichen am Ende der Zeilen befreien
    autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()
endif
" }}}

" Airline Config {{{
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = "ravenpower"
set t_Co=256
set encoding=utf-8
" }}}

" Config {{{
" Standard-Einrückung
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" History auf 200 setzen - default ist nur 50
" Die History wird ueber mehrere vim-Sessions hinweg gespeichert.
set history=200

" Tab-Vervollstaendigung wie in der bash
set wildmode=longest,list

" Alternative Tab-Vervollstaendigung wie in der zsh:
" set wildmenu
" set wildmode=full

" Suche hervorheben (highlight search)
set hlsearch

" Zeilennummerierung einschalten:
set number

" Inkrementelle Suche aktivieren
set incsearch

" Syntax Highlighting
syntax on

" Teilweise eingetippte Befehle in der letzten Zeile anzeigen
set showcmd

" Veränderte Buffer automatisch auf hidden setzen
set hidden

" Standard-Suchverhalten anpassen
set ignorecase
set smartcase

" Kommandozeilenhöhe auf 2 setzen, damit man etwas seltener das hier sieht:
" Betätigen Sie die EINGABETASTE oder geben Sie einen Befehl ein
set cmdheight=2

" Whitespace wird per default angezeigt
set list

" Listchars anpassen
set listchars=tab:▸\ ,eol:¬
" }}}

" Farben {{{
" Specialkey = Tab, NonText = EOL
" highlight SpecialKey guifg=#4a4a59
" highlight NonText guifg=#4a4a59
highlight SpecialKey ctermfg=8
highlight NonText ctermfg=8

" Suche mit hohem Kontrast
highlight Search ctermbg=11, ctermfg=0

" Suche mit hohem Kontrast
highlight Folded ctermbg=10, ctermfg=0

" Visual Mode
highlight Visual ctermbg=9, ctermfg=0
" }}}

" Mappings {{{
" Treffenhervorhebung temporär unterdrücken
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Den &-Befehl reparieren (die Flags der letzten Substitution berücksichtigen)
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" " which is the default
map Y y$

" Schnell runter und rauf
nmap ä Lzz
nmap ü Hzz

" Einfache Expansion des Verzeichnisses der aktiven Datei
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" }}}

" Leader Mappings {{{
" Leader auf ö setzen:
let mapleader="ö"

" Use <leader>w to toggle display of whitespace
nmap <leader>w :set list!<CR>

" Leerzeilen in Normal Mode einfügen
nmap <leader>ö o<Esc>

" Zum alternativen Puffer springen
nmap <leader>a <C-^>

" Zur Marke und Spalte springen: (deutsche Keyboard ohne 'nodeadkeys')
nmap <leader>m `

" Treffen zählen
nmap <leader>h :%s///gn<CR>

" Neue Files im selben Verzeichnis öffnen:
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Puffer schneller durchlaufen
nnoremap <silent> <leader>n :bnext<CR>
nnoremap <silent> <leader>p :bprevious<CR>
nnoremap <silent> <leader>f :bfirst<CR>
nnoremap <silent> <leader>l :blast<CR>

" Zeilennummerierung hin- und herschalten
nmap <leader>z :set nu!<CR>
" }}}

" Funktionstasten {{{
" Kopiere die Zeilen mit Suchergebnissen in einen neuen Buffer
nnoremap <silent> <F3> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR>

" Für mehrere Suchmuster
nnoremap <silent> <F4> :redir >>matches.tmp<CR>:g//<CR>:redir END<CR>:new matches.tmp<CR>

" Aus der Zwischenablage einfügen - Vim mit F5 vorbereiten
:set pastetoggle=<F5>

" Whitespace am Ende entfernen
nnoremap <silent> <F6> :call <SID>StripTrailingWhitespaces()<CR>
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" }}}

" misc {{{
" NerdTree
" map <F2> :NERDTreeToggle<CR>

" Für Anfänger: Cursortasten deaktivieren
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>
" }}}
