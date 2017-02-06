" Vim syntax file
" Language:         Generic log files
" Maintainer:       Alex Dzyoba <avd@reduct.ru>
" Latest Revision:  2013-03-08
" Changes:          2013-03-08 Initial version

" Based on messages.vim - syntax file for highlighting kernel messages

if exists("b:current_syntax")
  finish
endif

syn match log_trace             '\<TRACE\>'
hi def link log_trace           Type

syn match log_debug             '\<DEBUG\>'
hi def link log_debug           Function

syn match log_info              '\<INFO\>'
hi def link log_info            Operator

syn match log_warning           '\c.*\<\(WARNING\|DELETE\|DELETING\|DELETED\|RETRY\|RETRYING\|WARN\).*'
hi def link log_warning         WarningMsg

syn match log_error             '\<\(FATAL\|ERROR\|ERRORS\|FAIL\|FAILED\|FAILURE\)\>'
hi def link log_error           ErrorMsg

syn match log_stacktrace        '^   at.*'
hi def link log_stacktrace      Tag


syn match log_caller            '   \[[A-z]*\]' nextgroup=log_thread
hi def link log_caller          Exception 

syn match log_thread            '\[\d\{1,3}\]'
hi def link log_thread          Include


syn region log_string           start=/'/ end=/'/ end=/$/ skip=/\\./
syn region log_string           start=/"/ end=/"/ skip=/\\./
hi def link log_string          String

syn match   log_date            '^\d\{4}-\d\d-\d\d \d\d:\d\d:\d\d.\d\{4} \@='
syn match   log_date            '^\d\d:\d\d:\d\d.\d\{3,4} \@='
syn match   log_date            '^\d\{4}-\d\d-\d\d \d\d:\d\d:\d\d \@='
hi def link log_date            Constant


let b:current_syntax = "log"
