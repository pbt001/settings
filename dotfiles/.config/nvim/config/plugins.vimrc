" ack.vim
" don't jump to first result automatically
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>"

" deoplete.nvim
let g:deoplete#enable_at_startup = 1
let g:tern_request_timeout = 1

" vim-fugitive
" Automatically remove fugitive buffers from the buffer list
augroup plugin_fugitive
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" neomake
autocmd! BufWritePost * Neomake
let g:neoformat_only_msg_on_error = 1
let g:neomake_javascript_enabled_makers = ['eslint_d', 'eslint']
let g:neomake_jsx_enabled_makers = ['eslint_d', 'eslint']

" vim-move
nmap <M-j> <Plug>MoveLineDown
nmap <M-k> <Plug>MoveLineUp
vmap <M-j> <Plug>MoveBlockDown
vmap <M-k> <Plug>MoveBlockUp

" consolate-vim
nnoremap <leader>c :Consolate<cr>

" ctrlp
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'results:100'

" vim-jsx
let g:jsx_ext_required = 0

" coverage.vim
let g:coverage_json_report_path = 'artifacts/coverage/coverage-final.json'
let g:coverage_sign_covered = '⦿'
let g:coverage_interval = 5000
let g:coverage_show_covered = 0
let g:coverage_show_uncovered = 1

" neoformat
autocmd BufWritePre *.js Neoformat
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_javascript_prettier = {
  \ 'exe': 'prettier',
  \ 'args': ['--single-quote', '--no-bracket-spacing', '--trailing-comma', 'es5', '--stdin'],
  \ 'stdin': 1
\ }
