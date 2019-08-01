" Rommert Zijlstra's .vimrc

" {{{ General

  set autoindent                    " Automatic indentation in insert mode
  set autoread                      " Re-read files when changed outside vim
  set backspace=indent,eol,start    " Allow backspace in insert mode
  set cindent                       " Smart autmatic indentation
  set clipboard=unnamed             " Use the macOS clipboard
  set colorcolumn=81                " Show a coloumn indicating 80 char width
  set display+=lastline
  set encoding=utf-8 nobomb
  set esckeys                       " Allow arrow keys in insert mode
  set expandtab
  set foldenable                    " enable folding
  set foldlevelstart=99             " open all folds by default
  set foldmethod=indent
  set foldnestmax=10                " 10 nested fold max; > 10 == absurd
  set formatoptions+=j              " Delete comment character when joining lines
  set gdefault                      " Use /g flag for RegExp by default
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set history=200                   " never found use of setting this higher
  set hlsearch                      " highlight matches
  set ignorecase
  set incsearch                     " search as characters are entered
  set laststatus=2                  " Always show status line
  set lazyredraw
  set linebreak                     " Break after words
  set list
  set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
  set mouse=a                       " Enable mouse in all modes
  set nohidden                      " When I close a tab, remove the buffer
  set nomodeline                    " Prevent weird stuff with modelines
  set noshowmode
  set nostartofline
  set number
  set numberwidth=5                 " make the current line stand out
  set relativenumber
  set scrolloff=5                   " Keep 5 lines above/below cursor visible
  set shiftwidth=2
  set shortmess=atI                 " Don’t show the intro message
  set showcmd                       " Show command as it’s being typed
  set showmatch                     " highlight matching [{()}]
  set signcolumn=yes
  set smartcase
  set smarttab
  set softtabstop=2
  set splitbelow                    " split below instead of above
  set splitright                    " split after instead of before
  set synmaxcol=1000                " We don't need that much syntax per line
  set tag+=.git/tags
  set ttimeoutlen=50                " Return to NORMAL quickly after <ESC>
  set title                         " Show the filename in the window titlebar
  set ttyfast                       " Optimize for fast terminal connections
  set vb t_vb=                      " Remove 'bell' in vim
  set wildmenu                      " visual autocomplete for command menu

" }}}

" {{{ Backup & undo

  set writebackup     " Protect files against crash-during-write
  set nobackup        " but remove the backup after succesful write
  set backupcopy=auto "  use rename-and-write-new method whenever safe
  set backupdir=~/.vim/backup//

  set swapfile        " write a swap every now and then
  set directory=~/.vim/swap//

  set undofile        " persistent undo is AWESOME
  set undodir=~/.vim/undo//

" }}}

" {{{ Plugins

  " {{{ Auto-install Plug

    " https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

  " }}}

  call plug#begin('~/.vim/bundle')

  " Plugins: editing {{{

    packadd! editexisting               " Open existing vim instance if open
    packadd! matchit                    " Make % command work better

    Plug 'editorconfig/editorconfig-vim'
    Plug 'mattn/emmet-vim'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'

    " Use double <Leader> for expansion
    let g:user_emmet_leader_key='<Leader>'

    " make emmet behave well with JSX in JS and TS files
    let g:user_emmet_settings = {
    \  'javascript' : {
    \      'extends' : 'jsx',
    \  },
    \  'typescript' : {
    \      'extends' : 'tsx',
    \  },
    \}

  " }}}

  " Plugins: linting {{{

    Plug 'dense-analysis/ale'

    " fix files on save
    let g:ale_fix_on_save = 1

    " lint 1000ms after changes are made both on insert mode and normal mode
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_delay = 1000

    " use nice symbols for errors and warnings
    let g:ale_sign_error = '✗ '
    let g:ale_sign_warning = '⚠ '
    let g:ale_sign_column_always = 1

    " fixer configurations
    let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'css': ['prettier'],
    \   'html': ['prettier'],
    \   'javascript': ['prettier'],
    \   'scss': ['prettier'],
    \   'php': ['php_cs_fixer'],
    \}

  " }}}

  " Plugins: UI {{{

    " netrw UI tweaks
    let g:netrw_banner = 0
    let g:netrw_winsize = 20
    let g:netrw_liststyle = 3
    let g:netrw_altv = 1

    Plug 'airblade/vim-gitgutter'
    Plug 'itchyny/lightline.vim'

    " Make vim + tmux awesome
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'tmux-plugins/vim-tmux-focus-events'

    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-unimpaired'

    let g:lightline = {
    \   'active': {
    \     'left': [ [ 'mode', 'paste' ],
    \               [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
    \   },
    \   'inactive': {
    \     'left': [ [ 'relativepath', 'modified' ] ],
    \     'right': [ [ 'lineinfo' ],
    \                [ 'percent' ] ]
    \   },
    \   'component_function': {
    \     'gitbranch': 'fugitive#head'
    \   },
    \   'separator': {
    \     'left': '', 'right': '',
    \   },
    \   'subseparator': {
    \     'left': '▪', 'right': '▪',
    \   }
    \ }

    " Theme
    Plug 'gruvbox-community/gruvbox'

    " Needs to be set before the theme loads
    let g:gruvbox_italic = 1

    " fzf fuzzyfinding
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

    " [Buffers] Jump to the existing window if possible
    let g:fzf_buffers_jump = 1

    " Use preview with :Files
    command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

  " }}}

  " Plugins: syntax {{{

    Plug 'cakebaker/scss-syntax.vim'
    Plug 'chr4/nginx.vim'
    Plug 'mustache/vim-mustache-handlebars'
    Plug 'mxw/vim-jsx'
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'

    " Enable JSDoc highlighting
    let g:javascript_plugin_jsdoc = 1

  " }}}

call plug#end()
" }}}

" Key bindings {{{

  " Move visually instead of by line
  nnoremap <silent> j gj
  nnoremap <silent> k gk

  " Center on n and N
  map n nzz
  map N Nzz

  " :W sudo saves the file
  command W w !sudo tee % > /dev/null
  command Q q

  " Clear highlight with leader
  nnoremap <Leader>c :noh<Cr>

  " Invoke :Files finder on ctrl-p
  nnoremap <C-p> :Files<Cr>
  nnoremap <C-g> :Rg<Cr>
  nnoremap <C-o> :Tags<Cr>
  nnoremap <S-Tab> <C-o>

  " use `u` to undo, use `U` to redo
  nnoremap U <C-r>

" }}}

" Commands {{{

  " Diff changes before save
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis

" }}}

" Autocommands {{{

  augroup ImproveEditing
    au!
    " Return to last edit position when opening files
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    " Hack to make <C-x><C-f> work with files relative to current buffer
    au InsertEnter * let cwd = getcwd() | lcd %:p:h
    au InsertLeave * execute 'lcd' fnameescape(cwd)

    " Treat .json files as .js
    au BufNewFile,BufRead *.json setfiletype json syntax=javascript
    " Treat .md files as Markdown
    au BufNewFile,BufRead *.md setfiletype markdown
    " Treat .svelte files as HTML
    au BufNewFile,BufRead *.svelte setfiletype html
    " Improve working with node_modules projects
    au FileType javascript,json,jsx,sass,scss,typescript,tsx call ImproveNodeEditing()
  augroup END

  function! ImproveNodeEditing()
    setlocal isfname+=@-@
    setlocal suffixesadd+=.sass,.scss,.js,.json,.jsx,.ts,.tsx
    setlocal includeexpr=LookupNodeModule(v:fname)
  endfunction

  function! LookupNodeModule(fname)
    let basePath = finddir('node_modules', expand('%:p:h') . ';' . getcwd()) . '/' . a:fname
    let indexFile = basePath . '/index.js'
    let packageFile = basePath . '/package.json'

    if filereadable(packageFile)
      let package = json_decode(join(readfile(packageFile)))

      if has_key(package, 'module')
        return basePath . '/' . package.module
      endif

      if has_key(package, 'main')
        return basePath . '/' . package.main
      endif
    endif

    if filereadable(indexFile)
      return indexFile
    endif

    return basePath
  endfunction

  " Auto-reload vim when ~/.vimrc is saved
  augroup ReloadVimrc
    au!
    au BufRead .vimrc setlocal foldmethod=marker
    au BufWritePost .vimrc source $MYVIMRC | call ReloadLightline()
  augroup END

  function! ReloadLightline()
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
  endfunction

" }}}

" Theme {{{

  set background=dark

  " Enable file type detection
  filetype plugin indent on

  " Use <!-- --> comments in HTML
  let html_wrong_comments=1

  " fix indenting of css/js syntax in script/style tags
  let g:html_indent_script1 = "inc"
  let g:html_indent_style1 = "inc"

  " Enable italics support in Terminal.app
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"

  " Change cursor in insert mode
  let &t_SI="\e[5 q"
  let &t_EI="\e[2 q"

  colorscheme gruvbox
  syntax enable

  " Set highlight options
  hi! link Folded LineNr
  hi! link GitGutterAdd GruvboxGreen
  hi! link GitGutterChange GruvboxAqua
  hi! link GitGutterDelete GruvboxRed
  hi! link GitGutterChangeDelete GruvboxAqua
  hi! link SignColumn LineNr
  hi! link EndOfBuffer NonText

" }}}

" Misc {{{

  " Attempt to rename tmyx pane title
  if &term == "tmux-256color"
    set t_ts=]2
    set t_fs=\\
  endif

" }}}
