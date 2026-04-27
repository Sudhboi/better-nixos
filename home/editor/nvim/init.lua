-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("luasnip").config.set_config({ -- Setting LuaSnip config

    -- Enable autotriggered snippets
    enable_autosnippets = true,

    -- Use Tab (or some other key if you prefer) to trigger visual selection
    --store_selection_keys = "<Tab>",

    update_events = "TextChanged,TextChangedI",
    link_roots = false,
})

vim.cmd([[
    " Expand or jump in insert mode
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'

    " Jump forward through tabstops in visual mode
    smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

    " Jump backward through snippet tabstops with Shift-Tab (for example)
    imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
    smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]])

-- Lazy-load snippets, i.e. only load when required, e.g. for a given filetype
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/LuaSnip/" })

vim.cmd([[
au BufRead,BufNewFile *.agda call AgdaFiletype()
au QuitPre *.agda :CornelisCloseInfoWindows
function! AgdaFiletype()
    nnoremap <buffer> <localleader>l :CornelisLoad<CR>
    nnoremap <buffer> <localleader>r :CornelisRefine<CR>
    nnoremap <buffer> <localleader>d :CornelisMakeCase<CR>
    nnoremap <buffer> <localleader>, :CornelisTypeContext<CR>
    nnoremap <buffer> <localleader>. :CornelisTypeContextInfer<CR>
    nnoremap <buffer> <localleader>n :CornelisSolve<CR>
    nnoremap <buffer> <localleader>a :CornelisAuto<CR>
    nnoremap <buffer> gd        :CornelisGoToDefinition<CR>
    nnoremap <buffer> [/        :CornelisPrevGoal<CR>
    nnoremap <buffer> ]/        :CornelisNextGoal<CR>
    nnoremap <buffer> <C-A>     :CornelisInc<CR>
    nnoremap <buffer> <C-X>     :CornelisDec<CR>
endfunction

function! CornelisLoadWrapper()
  if exists(":CornelisLoad") ==# 2
    CornelisLoad
  endif
endfunction

au BufReadPre *.agda call CornelisLoadWrapper()
au BufReadPre *.lagda* call CornelisLoadWrapper()

au BufWritePost *.agda execute "normal! :CornelisLoad\<CR>"
]])
