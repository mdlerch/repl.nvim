function! Repl_start()
    if exists("b:repl_cmd")
        let repl_cmd = b:repl_cmd
        new
        call termopen(repl_cmd, {'name': 'repl'} )
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

if has('nvim')
    augroup repl_plugin
        au TermOpen term://*repl let g:repl_id = b:terminal_job_id
    augroup END
endif


