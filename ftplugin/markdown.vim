setlocal spell nonumber
noremap <buffer> <silent> <F8> :Pandoc #pdf<CR>
noremap <buffer> <silent> <F9> :!pandoc -s % -o %:r.html<CR>
noremap <buffer> <silent> <F10> :!pandoc -s % -o %:r.odt<CR>
inoreab <buffer> ююю ```
