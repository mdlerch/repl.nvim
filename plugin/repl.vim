function! Repl_start()
    if exists("b:repl_cmd")
        let repl_cmd = b:repl_cmd
        new
        let g:repl_id = termopen(repl_cmd, {'name': 'repl'} )
    endif
    if exists("b:repl_syntax")
        exe "runtime! " . b:repl_syn
    endif
endfunction

function! Repl_send(tosend)
    call jobsend(g:repl_id, add(a:tosend, ''))
endfunction

function! Repl_line()
    let tosend = [getline('.')]
    call Repl_send(tosend)
endfunction

function! Repl_quit()
    call Repl_send([b:repl_quit])
endfunction

function! Repl_file()
    let repl_load_file = b:repl_file . "(\"" . expand("%") . "\")"
    call Repl_send([repl_load_file])
endfunction

