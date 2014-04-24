"=============================================================================
" File: jira.vim
" Author: Jemma Nelson <pink.fwip@gmail.com>
" WebPage: http://github.com/Fwip/vim-jira
" License: BSD
" script type: plugin
"

" Prompt user if we need info
function! jira#GetCredentials()
  if !exists('g:jira_vim_url')
    let g:jira_vim_url = input("JIRA url?")
  endif
  if !exists('g:jira_vim_user')
    let g:jira_vim_user = input("JIRA user?")
  endif
  if !exists('g:jira_vim_pass')
    let g:jira_vim_pass = inputsecret("JIRA password?")
  endif
endfunction

" Grab issue from the server
function! jira#GetIssue(id)
  call jira#GetCredentials()
  let url = g:jira_vim_url . 'issue/' . a:id
  let cmd = 'curl '. url .' -s -k -u '. g:jira_vim_user .':'. g:jira_vim_pass

  let data_json = system(cmd)

  let g:jira_current_issue = json_encoding#Decode(data_json)

  return g:jira_current_issue
endfunction

" Extract an issue's description as an array of lines
function! jira#GetDesc(issue)
  return split(a:issue.fields.description, '\r\n\?')
endfunction

" Set an issue's description
" Description should be an array of lines, will be joined
function! jira#SetDesc(issue, description)
  let a:issue.fields.description = join(a:description, '\r\n')
endfunction

" Open up a new split with the given issue
function! jira#OpenBuffer(id)
  let issue = jira#GetIssue(a:id)

  vsplit 'vim-jira'
  call append(0, jira#GetDesc(issue))

endfunction
