highlight jiraOn ctermfg=yellow guifg=yellow
highlight jiraOff ctermfg=darkgrey guifg=darkgrey
highlight jiraCheck ctermfg=green guifg=green
highlight jiraError ctermfg=red guifg=red
highlight jiraWarn ctermfg=202 guifg=#ff5f00
highlight jiraYes ctermfg=green guifg=green
highlight jiraNo ctermfg=red guifg=red

highlight link jiraPanelTitle Title
highlight hide guifg=darkgrey ctermfg=darkgrey
highlight link jiraPanelEnd hide
highlight jiraBold gui=bold cterm=bold
highlight jiraItalic gui=italic cterm=underline

" TODO: Figure out how to make conceal chars the correct color
"
syntax match jiraOn    /(on)/  " conceal cchar=⚙
syntax match jiraOff   /(off)/ " conceal cchar=⚪
syntax match jiraCheck /(\/)/  " conceal cchar=✔
syntax match jiraError /(x)/
syntax match jiraWarn  /(!)/   " conceal cchar=!
syntax match jiraYes   /(y)/
syntax match jiraNo    /(n)/
syntax cluster jiraSymbol contains=jiraOn,jiraOff,jiraCheck,jiraError,jiraWarn,jiraYes,jiraNo

syntax match jiraItalic /_[^_]\+_/ excludenl contains=ALL
syntax match jiraBold /\*[^*]\+\*/ excludenl contains=ALL

syntax region jiraNoFormat matchgroup=hide start="{noformat}" end="{noformat}" keepend

syntax region jiraPanel start="{panel:" end="{panel}" fold contains=ALL keepend
syntax region jiraPanelTitle matchgroup=hide start="{panel:.\{-}\(title=\)" end="|.*}" contained 
syntax match jiraPanelEnd /{panel}/ contained

highlight link jiraTableHeader jiraBold
syntax region jiraTableHeader start="^\s*||" end="||\s*$" contains=ALL
syntax region jiraTableRow start="^\s*|" end="|\s*$" contains=ALL

set foldmethod=syntax
