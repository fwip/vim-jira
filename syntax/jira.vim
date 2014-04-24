highlight jiraOn ctermfg=yellow guifg=yellow
highlight jiraOff ctermfg=darkgrey guifg=darkgrey
highlight jiraCheck ctermfg=green guifg=green
highlight jiraError ctermfg=red guifg=red
highlight jiraWarn ctermfg=202 guifg=#ff5f00
highlight jiraYes ctermfg=green guifg=green
highlight jiraNo ctermfg=red guifg=red

" TODO: Figure out how to make conceal chars the correct colorj
syntax match jiraOn    /(on)/  " conceal cchar=⚙
syntax match jiraOff   /(off)/ " conceal cchar=⚪
syntax match jiraCheck /(\/)/   " conceal cchar=✔
syntax match jiraError /(x)/
syntax match jiraWarn  /(!)/   " conceal cchar=!
syntax match jiraYes   /(y)/
syntax match jiraNo    /(n)/

syntax region jiraPanel start="{panel:" end="{panel}" transparent fold

set foldmethod=syntax
