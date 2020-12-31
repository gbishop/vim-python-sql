" Disable current syntax temporarily.
let saved_syntax = b:current_syntax
unlet! b:current_syntax

" Load SQL syntax.
syntax include @SQL syntax/sql.vim

" Restore original syntax.
let b:current_syntax = saved_syntax
unlet! saved_syntax

" Set SQL to match in any triple quoted string
syn region SQLEmbedded contains=@SQL containedin=pythonString contained
    \ start="\v^\s+(insert|select|with|create|delete|alter|--sql)"
    \ end=+"""+me=s-3
