" Vim syntax file
" Language:	ndoc
" Maintainer:	Eric Rannaud <e@nanocritical.com>

if exists("b:current_syntax")
  finish
endif

syn match ndocNotAttr "<[[:alpha:]_][[:alpha:]_0-9:.]*" contained contains=@NoSpell,@ndocAttr
syn match ndocAttr "[[:alpha:]_][[:alpha:]_0-9:.]*" contained contains=@NoSpell,ndocAttrValue
syn region ndocAttrValue start="'" skip="\\'" end="'" contained contains=@NoSpell
syn match ndocTagEnd ">"
syn region ndocTag start="<[[:alpha:]_][[:alpha:]_0-9:.]*" end="\(\n\||\)" contains=@NoSpell,ndocNotAttr,ndocAttr,ndocAttrValue,ndocTag

syn match ndocVerbNotAttr "<<<[[:alpha:]_][[:alpha:]_0-9:.]*" contained contains=@NoSpell,@ndocVerbAttr
syn match ndocVerbAttr "[[:alpha:]_][[:alpha:]_0-9:.]*" contained contains=@NoSpell,ndocVerbAttrValue
syn region ndocVerbAttrValue start="'" skip="\\'" end="'" contained contains=@NoSpell
syn match ndocVerbTagEnd ">>>"
syn region ndocVerbTag start="<<<[[:alpha:]_][[:alpha:]_0-9:.]*" end="\(\n\||\)" contains=@NoSpell,ndocVerbNotAttr,ndocVerbAttr,ndocVerbAttrValue,ndocVerbTag

syn match ndocSpaceError "^[ \t]\+$"
syn match ndocSpaceError "\t"

hi def link ndocTag Keyword
hi def link ndocNotAttr Keyword
hi def link ndocTagEnd Keyword
hi def link ndocAttr Type
hi def link ndocAttrValue String

hi def link ndocVerbTag Keyword
hi def link ndocVerbNotAttr Keyword
hi def link ndocVerbTagEnd Keyword
hi def link ndocVerbAttr Type
hi def link ndocVerbAttrValue String

hi def link ndocSpaceError Error

let b:current_syntax = "ndoc"

" vim: ts=8
