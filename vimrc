" initialize pathogen
filetype off
execute pathogen#infect()

" Line numbering
set number
set relativenumber

" auto-indent
set ai

" Tabbing
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Start scrolling when the cursor is 3 lines from the bottom of the buffer
set scrolloff=3

" Allow the cursor to go anywhere in the buffer
set virtualedit=all

" command area height
set cmdheight=1

" Allow backspacing
set backspace=indent,eol,start

" Status line
set laststatus=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)\ [%p%%]\ Buf:%n\ [%b][0x%B]

" Disable clearing scrollback buffer when exiting vim
set t_ti= t_te=

" Searching
set incsearch
set hlsearch
set ignorecase

" Recognize file types for syntax highlighting
filetype plugin on

" Colors
set t_Co=256
set background=dark
colorscheme molokai
set cursorline

" Add dictionary completion
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words

" Store swap files in /tmp
set directory=/tmp

" Visualize tabs, trailing whitespaces and funny characters
" http://www.reddit.com/r/programming/comments/9wlb7/proggitors_do_you_like_the_idea_of_indented/c0esam1
" https://wincent.com/blog/making-vim-highlight-suspicious-characters
set list
set listchars=nbsp:¬,tab:»·,trail:·

" Add dictionary to complete list
:set complete-=k complete+=k

" Turn on syntax highlighting
syntax on

" toggle search highlighting
noremap <F4> :set hlsearch! <cr>

" toggle Tagbar
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

" Get back to alt buffer
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

" Get rid of trailing whitespace
nmap ,de :%s= *$==<cr>

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "Dispatch rspec {spec}"

"Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async','sorters','sorter_rank', )
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>m :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
nnoremap <Leader>g :Unite grep:.<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

if executable('ag')
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
let g:unite_source_grep_recursive_opt=''
endif

" Indent guides settings
"hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=darkgrey
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

