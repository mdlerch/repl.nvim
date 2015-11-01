function! repl#Repl_start()
    if exists("b:repl_cmd")
        let repl_cmd = b:repl_cmd
        if exists("b:repl_syntax")
            let repl_syn = b:repl_syntax
        endif
        new
        let g:repl_id = termopen(repl_cmd, {'name': 'repl'} )
        if exists("repl_syn")
            exe "runtime! " . repl_syn
        endif
    endif
endfunction

function! repl#Repl_send(tosend)
    call jobsend(g:repl_id, add(a:tosend, ''))
endfunction

function! repl#Repl_line()
    let tosend = [getline('.')]
    call repl#Repl_send(tosend)
endfunction

function! repl#Repl_down()
    call repl#Repl_line()
    call repl#Repl_move_down()
endfunction

function! repl#Repl_quit()
    call repl#Repl_send([b:repl_quit])
endfunction

function! repl#Repl_file()
    let repl_load_file = b:repl_file . "(\"" . expand("%") . "\")"
    call repl#Repl_send([repl_load_file])
endfunction

function! repl#Repl_move_down()
    let maxline = line('$')
    let nextline = line('.') + 1
    if nextline >= maxline
        let nextline = maxline
    endif
    call cursor(nextline, 1)
endfunction
