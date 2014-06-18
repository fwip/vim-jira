highlight jiraMarkOn ctermfg=yellow guifg=yellow
highlight jiraMarkOff ctermfg=darkgrey guifg=darkgrey
highlight jiraMarkCheck ctermfg=green guifg=green
highlight jiraMarkError ctermfg=red guifg=red
highlight jiraMarkWarn ctermfg=202 guifg=#ff5f00
highlight jiraMarkYes ctermfg=green guifg=green
highlight jiraMarkNo ctermfg=red guifg=red
highlight jiraMarkInfo ctermfg=blue guifg=blue

highlight link jiraPanelTitle Title
highlight hide guifg=darkgrey ctermfg=darkgrey
highlight link jiraPanelEnd hide
highlight jiraBold gui=bold cterm=bold
highlight jiraItalic gui=italic cterm=underline

" TODO: Figure out how to make conceal chars the correct color
"
syntax match jiraMarkOn    /(on)/  " conceal cchar=⚙
syntax match jiraMarkOff   /(off)/ " conceal cchar=⚪
syntax match jiraMarkCheck /(\/)/  " conceal cchar=✔
syntax match jiraMarkError /(x)/
syntax match jiraMarkWarn  /(!)/   " conceal cchar=!
syntax match jiraMarkYes   /(y)/
syntax match jiraMarkNo    /(n)/
syntax match jiraMarkInfo  /(?)/
syntax cluster jiraMark contains=jiraMarkOn,jiraMarkOff,jiraMarkCheck,jiraMarkError,jiraMarkWarn,jiraMarkYes,jiraMarkNo

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
