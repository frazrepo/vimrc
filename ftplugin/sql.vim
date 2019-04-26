" Formatexpr for SQL
" Warning : Python code requires indentation at the start
" Install : pip install sqlparse or pip3 install sqlparse

function! FormatSQL()
python3 << EOF

import vim
import sqlparse

start = int(vim.eval('v:lnum')) - 1
end = int(vim.eval('v:count')) + start
buf = vim.current.buffer
NL = '\n'

try:
    sql = NL.join(buf[start:end + 1])
    sql_new = sqlparse.format(sql, reindent=True, keyword_case='upper')

    lines = [line.encode('utf-8') for line in sql_new.split(NL)] + ['']

    buf[:] = buf[:start] + lines + buf[end + 1:]
except Exception as e:
    print(e)
EOF
endfunction

set formatexpr=FormatSQL()