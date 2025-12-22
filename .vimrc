" --- GENERAL SETTINGS ---
set nocompatible            " Disable Vi compatibility (enables advanced features)
syntax on                   " Enable syntax highlighting
filetype plugin indent on   " Enable filetype-specific indenting and plugins

" --- UI & VISUALS ---
set number                  " Show line numbers
set cursorline              " Highlight the current line you are on
set ruler                   " Show line/column info in the footer
set wildmenu                " visual autocomplete for command menu
set lazyredraw              " Don't redraw screen while running macros (faster)
set showmatch               " Highlight matching [{()}]

" --- SEARCHING ---
set incsearch               " Search as you type
set hlsearch                " Highlight all search matches
set ignorecase              " Ignore case when searching...
set smartcase               " ...unless you type a capital letter

" --- INDENTATION (The "Spaces > Tabs" Standard) ---
set expandtab               " Convert tabs to spaces
set shiftwidth=4            " Indent by 4 spaces when using >>, <<, ==
set tabstop=4               " Show existing tab characters as 4 spaces width
set smartindent             " Smart auto-indenting for code

" --- QUALITY OF LIFE ---
set mouse=a                 " Enable mouse support (clicking, scrolling)
set clipboard=unnamedplus   " Copy/Paste between Vim and system clipboard
set backspace=indent,eol,start " Allow backspace over everything in insert mode

" --- PERSISTENT UNDO ---
" This saves your undo history to a file, so you can undo changes 
" even after closing and reopening a file.
if has('persistent_undo')
    " Create the directory if it doesn't exist
    let my_undo_dir = expand('~/.vim/undo-dir')
    if !isdirectory(my_undo_dir)
        call mkdir(my_undo_dir, "p")
    endif
    let &undodir = my_undo_dir
    set undofile
endif

" --- KEY MAPPINGS ---
" Press Space to clear search highlighting
nnoremap <space> :nohlsearch<CR>