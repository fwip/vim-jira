vim-jira
========

Vim plugin to view/update JIRA issues

This'll probably end up being tailored to my particular workflow, which involves modifying the JIRA descriptions quite a bit.

Implemented so far:
* `:call jira#OpenBuffer('myID')` - fetches JIRA description in a new vertical split
* `:call jira#PostBuffer()` - updates description with the contents of the buffer

TODO:
* Better bindings for the above
* Browsable list of issues (perhaps a small sidebar?)
