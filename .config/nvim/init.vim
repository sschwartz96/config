""""""""""""""""""    user config    """"""""""""""""
" tab size
set tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
autocmd FileType dart setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType svelte setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set smartindent

inoremap jk <Esc>
set noswapfile
set nowrap
set backupdir=~/vimtmp//,.
set directory=~/vimtmp//,.
set number
set relativenumber
" status
set laststatus=2
set statusline=%f
" scroll offset
set scrolloff=7
set mouse=a
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o "turn off next line comments

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Load Plugs
call plug#begin()

" gruvbox colorscheme and visuals
Plug 'gruvbox-community/gruvbox'
Plug 'lifepillar/vim-gruvbox8'
Plug 'arcticicestudio/nord-vim'
Plug 'jnurmine/Zenburn'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'huyvohcmc/atlas.vim/'
Plug 'axvr/photon.vim'
Plug '/home/sam/projects/photon-lightline'
"Plug 'Jorengarenar/vim-darkness'

Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" lsp client
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" vim-go (other go specific)
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'buoto/gotests-vim'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/github.com/fzf', 'do': './install --all' }
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" NERDtree
Plug 'scrooloose/nerdtree'

Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
"Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'

" vim-smoothie
Plug 'psliwka/vim-smoothie'

" dart plugin
Plug 'dart-lang/dart-vim-plugin'
Plug 'tiagofumo/dart-vim-flutter-layout' "for indention

""" javascript stuff

" svelte
Plug 'evanleck/vim-svelte'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'

" react
Plug 'maxmellon/vim-jsx-pretty'

Plug 'mattn/emmet-vim', { 'for': ['javascript', 'jsx', 'html', 'css'] }

" git
Plug 'tpope/vim-fugitive'

" focus
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" ledger
Plug 'ledger/vim-ledger'

call plug#end()

"""""""""""""""""""""""""""      visuals      ************************
" colorscheme config
set bg=dark
"colorscheme gruvbox
" set termguicolors
" autocmd VimEnter * Limelight " start limelight
set noshowmode " removes insert at the bottom
" colorscheme nord
" colorscheme solarized
" colorscheme darkness
" colorscheme atlas
colorscheme photon
" let g:lightline = {}
" let g:lightline.colorscheme = 'photon'
let g:lightline = {
		\ 'colorscheme': 'photon_lightline',
		\ 'active': {
		\	'left': [ [ 'mode', 'paste' ],
		\			[ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
		\	},
		\ 'component_function': {
		\	'gitbranch': 'FugitiveHead'
		\ },
		\ }
"
" NERDtree
:let g:NERDTreeWinSize=20

"Goyo 
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set linebreak
  CocDisable
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set linebreak
  CocEnable
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"hi Normal guibg=NONE "for transparency, not needed anymore?

" FZF config
nnoremap <silent> <C-p> :FZF<CR>



"""""""""""""""""""""""""""      vim-go config      ************************

" disable GoDef gd mapping (handled by coc lsp client)
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_fmt_fail_silently = 1

let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1


" gohtml support
au BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl



""""""""""""""""""""""""""      vim-closetag          """"""""""""""""""""""""" 
let g:closetag_filenames = '*.html,*.xhtml,*phtml,*.gohtml,*.gohtmltmpl,*.svelte'
let g:closetag_xhtml_filenames = '*.svelte'
let g:closetag_xhtml_filetypes = 'svelte'


"""""""""""""""""""""""""""      COC CONFIG     ****************************

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" auto-format gocode and add missing imports on save
"autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" coc-pairs  to place cursor on its own line after <CR>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" map gohtml to html for html support
let g:coc_filetype_map = {
	\ 'gohtmltmpl': 'html',
	\ }

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? coc#_select_confirm() :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Map <c-space> to pop up autocomplete
inoremap <silent><expr> <c-space> coc#refresh()

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
"let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
"let g:coc_snippet_prev = '<c-k>'

" emmet
"autocmd BufNewFile,BufRead *.js :set filetype=javascript.jsx


" dart & flutter
let g:dart_style_guide = 2
