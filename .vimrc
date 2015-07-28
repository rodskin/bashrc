source ~/.vimrc_common
set nocompatible  " no vi compatibility
filetype off

" ==========================================
" Divers
" ==========================================
set title
set number
set ruler    	" Affiche la position actuelle du curseur
set wrap    	" Affiche les lignes trop longues sur plusieurs lignes
set scrolloff=3    	" Affiche un minimum de 3 lignes autour du curseur
        	" (pour le scroll)
set ignorecase    	" Ignore la casse lors d’une recherche
set smartcase    	" Si une recherche contient une majuscule,
        	" re-active la sensibilite a la casse
set incsearch    	" Surligne les resultats de recherche pendant la
        	" saisie
set hlsearch    	" Surligne les resultats de recherche

set guioptions-=m "Hide toolbar

" ==========================================
" Met en surbrillance des lignes et colonnes
" ==========================================
set cursorline " highlight current line
set cursorcolumn " highlight current column
set colorcolumn=78
hi cursorline guibg=#3a3a3a " highlight bg color of current line
hi cursorcolumn guibg=#3a3a3a " highlight cursor
hi ColorColumn guibg=#2e2e2e
hi ExtraWhitespace guibg=#550000
hi SpecialKey term=bold ctermfg=DarkCyan guifg=#555555

set autoindent smartindent " indent at the same level of the previous line
set shiftwidth=4 ts=4 sts=4 " use indents of 4 spaces
set shiftround " arrondit l'indentation
set expandtab " tabs are tabs, not spaces
set matchpairs+=<:> " match, to be used with %
set pastetoggle=<f12> " pastetoggle (sane indentation on pastes)
set comments=sl:/*,mb:*,elx:*/ " auto format comment blocks
"set foldenable " auto fold code
"set foldmethod=marker " type of folding
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.

" -- Beep
"set visualbell
set noerrorbells

" Active la coloration syntaxique
syntax enable
" Active les comportements specifiques aux types de fichiers comme
" la syntaxe et l’indentation
filetype off
filetype plugin on
filetype indent on

colorscheme desert

set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set antialias

" ============
" Comportement
" ============
set mousemodel=popup " Le clic droit ouvre un menu
set wildchar=<Tab> " Use <Tab> to complete
set ignorecase smartcase incsearch " Smart search
set history=20 " history in cmd
set ch=3                                    	" Rend la ligne de commande de 2 lignes plus grande
set backspace=indent,eol,start              	" autorisation du retour arrière
