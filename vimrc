filetype off
execute pathogen#infect()

set number
set relativenumber
set ai
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set ruler
set background=dark
set cmdheight=1
set laststatus=2
set scrolloff=3
set virtualedit=all

" Allow backspacing
set backspace=indent,eol,start

" Status line
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)\ [%p%%]\ Buf:%n\ [%b][0x%B]

" Disable clearing scrollback buffer when exiting vim
set t_ti= t_te=

set incsearch
set hlsearch
set ignorecase
set cursorline
filetype plugin on

set t_Co=256
set background=light
colorscheme summerfruit256
let g:molokai_original = 1

"Indent guides
hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=lightgrey
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Add dictionary completion
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words

" Visualize tabs, trailing whitespaces and funny characters
" http://www.reddit.com/r/programming/comments/9wlb7/proggitors_do_you_like_the_idea_of_indented/c0esam1
" https://wincent.com/blog/making-vim-highlight-suspicious-characters
set list
set listchars=nbsp:¬,tab:»·,trail:·

" Add dictionary to complete list
:set complete-=k complete+=k

syntax on
noremap <F4> :set hlsearch! <cr>
noremap <F8> :TagbarToggle <CR>

" Escape insert mode
inoremap jj <esc>

" Find todos
nmap ,p :w \|!grep -r '\# TODO:' ./ \| grep ^./<cr>

" Make sure ruby syntax is OK
nmap ,c :w \|!ruby -c % <cr>

" Test files using rspec
nmap ,tr :w \|!rspec -I ./ % --format=doc --color <cr>

" Build tags for current directory using exuberant c-tags
nmap ,ta :w \|!ctags -R . <cr>

" Map ,e and ,v to open files in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

let g:ctrlp_map='<leader>f'
let g:ctrlp_cmd='CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>u :CtrlPMRU<cr>

nmap ,, <C-^>

" contents of last global command in new window
nmap <F3> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR><CR>

" toggle line numbers
nmap <F12> :set number!<CR>

" json liniting requires jsonlint https://github.com/zaach/jsonlint
nmap ,j :w\|!jsonlint % <CR>

" my common quit and write problems
nmap :Q :q
nmap :W :w

highlight Pmenu ctermbg=238 gui=bold
highlight PMenu gui=bold guibg=#CECECE guifg=#444444
hi CursorLine cterm=none term=none
