"
" Plugins
"

call plug#begin()

" https://github.com/sgur/vim-editorconfig
" pure vim script implementation that doesn't
" need if_python

Plug 'editorconfig/editorconfig-vim'

Plug '~/.tools/fzf'

Plug 'junegunn/fzf.vim'

let g:fzf_layout = { 'down': '~20%' }

Plug 'jiangmiao/auto-pairs'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'nvim-treesitter/nvim-treesitter-refactor'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'mgred/nord-vim', {'branch': 'debian'}

call plug#end()

colorscheme nord
syntax on

let $BAT_THEME = 'Nord'
let $FZF_PREVIEW_PREVIEW_BAT_THEME = 'Nord'

lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "all",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ia"] = "@parameter.inner",
        ["aa"] = "@parameter.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>ma"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>mA"] = "@parameter.inner",
      },
    },
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  refactor = {
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
  },
}
EOF

" vim:tw=80:ts=2:sw=2:expandtab
