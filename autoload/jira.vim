"=============================================================================
" File: jira.vim
" Author: Jemma Nelson <pink.fwip@gmail.com>
" WebPage: http://github.com/Fwip/vim-jira
" License: BSD
" script type: plugin
"

" Prompt user if we need info
function! jira#GetCredentials()
  if !exists('g:vim_jira_url')
    let g:vim_jira_url = input("JIRA url? ")
  endif
  if !exists('g:vim_jira_user')
    let g:vim_jira_user = input("JIRA user? ")
  endif
  if !exists('g:vim_jira_pass')
    let g:vim_jira_pass = inputsecret("JIRA password? ")
  endif
endfunction

" Grab issue from the server
function! jira#GetIssue(id)
  call jira#GetCredentials()
  let url = g:vim_jira_url . 'issue/' . a:id
  let cmd = 'curl '. url .' -s -k -u '. g:vim_jira_user .':'. g:vim_jira_pass

  let data_json = system(cmd)

  let g:jira_current_issue = json_encoding#Decode(data_json)

  return g:jira_current_issue
endfunction

function! jira#PushIssue(issue)
  call jira#GetCredentials()
  let url = g:vim_jira_url . 'issue/' . a:id
  let cmd = 'curl '. url .' -s -k -u '. g:vim_jira_user .':'. g:vim_jira_pass . '-d' . issue
  echo cmd

endfunction

function! jira#UpdateIssue(tmpfile)
  echo a:tmpfile
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

  let tmpfile = '/tmp/vim-jira-' . issue.key . '-desc.jira'
  call writefile(jira#GetDesc(issue), tmpfile)
  execute 'vsplit ' . tmpfile
  execute 'set ft=jira'

endfunction
