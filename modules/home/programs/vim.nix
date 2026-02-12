{
  flake.modules.homeManager.owner =
    { pkgs, ... }:
    {
      home.sessionVariables.EDITOR = "vim";

      programs.vim = {
        enable = true;

        plugins = with pkgs.vimPlugins; [
          vim-airline
          vim-airline-themes
          vim-startify
        ];

        settings = {
          ignorecase = true;
        };

        extraConfig = ''
          "" General
          set number
          set history=1000
          set nocompatible
          set modelines=0
          set encoding=utf-8
          set scrolloff=3
          set showmode
          set showcmd
          set hidden
          set wildmenu
          set wildmode=list:longest
          set ttyfast
          set nowrap
          set ruler
          set backspace=indent,eol,start
          set laststatus=2
          set clipboard=autoselect

          "" Dir stuff
          set nobackup
          set nowritebackup
          set noswapfile
          set backupdir=~/.config/vim/backups
          set directory=~/.config/vim/swap

          "" Whitespace rules
          set tabstop=8
          set shiftwidth=2
          set softtabstop=2
          set expandtab

          "" Searching
          set incsearch
          set gdefault

          "" Statusbar
          set nocompatible " Disable vi-compatibility
          set laststatus=2 " Always show the statusline
          let g:airline_theme='bubblegum'

          "" File-type highlighting and configuration
          syntax on
          filetype on
          filetype plugin on
          filetype indent on

          let g:startify_lists = [
            \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      }
            \ ]

          let g:startify_bookmarks = [
            \ '~/.local/share/src',
            \ ]
        '';

        packageConfigurable = pkgs.vim-full.override {
          guiSupport = "no";
          darwinSupport = pkgs.stdenvNoCC.isDarwin;
        };
      };
    };
}
