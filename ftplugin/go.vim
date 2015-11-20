setlocal ts=4 sw=4 list noet
nmap <buffer> K <Plug>(go-doc)
nmap <buffer> <leader>r <Plug>(go-run)
nmap <buffer> <leader>l :<C-u>Neomake! go_lint<CR>
nmap <buffer> <leader>t :<C-u>Neomake! go_test<CR>
"nmap <buffer> <leader>b :<C-u>GoBuild<CR>
"nmap <buffer> <leader>b :<C-u>silent make\|echo 'Done'<CR>
nmap <buffer> <CR> <Plug>(go-def)
nmap <buffer> <leader>n <Plug>(go-referrers)
nmap <buffer> <leader>R <Plug>(go-rename)
nmap <buffer> <leader>e <Plug>(go-generate)
"inoremap <silent> <buffer> . .<C-x><C-o>
"inoremap <silent> <buffer> ( <C-x><C-o>(
