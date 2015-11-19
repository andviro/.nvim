setlocal et
nmap <silent> <buffer> K :exec 'he ' . expand('<cword>')<CR>
