" Vim syntax file
" Language:	nxml
" Maintainer:	Eric Rannaud <e@nanocritical.com>

if exists("b:current_syntax")
  finish
endif

syn match nxmlNotAttr "<[[:alpha:]_][[:alpha:]_0-9:.]*" contained contains=@NoSpell,@nxmlAttr
syn match nxmlAttr "[[:alpha:]_][[:alpha:]_0-9:.]*" contained contains=@NoSpell,nxmlAttrValue
syn region nxmlAttrValue start="'" skip="\\'" end="'" contained contains=@NoSpell
syn match nxmlTagEnd ">"
syn region nxmlTag start="<[[:alpha:]_][[:alpha:]_0-9:.]*" end="\(\n\||\)" contains=@NoSpell,nxmlNotAttr,nxmlAttr,nxmlAttrValue,nxmlTag

syn match nxmlVerbNotAttr "<<<[[:alpha:]_][[:alpha:]_0-9:.]*" contained contains=@NoSpell,@nxmlVerbAttr
syn match nxmlVerbAttr "[[:alpha:]_][[:alpha:]_0-9:.]*" contained contains=@NoSpell,nxmlVerbAttrValue
syn region nxmlVerbAttrValue start="'" skip="\\'" end="'" contained contains=@NoSpell
syn match nxmlVerbTagEnd ">>>"
syn region nxmlVerbTag start="<<<[[:alpha:]_][[:alpha:]_0-9:.]*" end="\(\n\||\)" contains=@NoSpell,nxmlVerbNotAttr,nxmlVerbAttr,nxmlVerbAttrValue,nxmlVerbTag

syn match nxmlSpaceError "^[ \t]\+$"
syn match nxmlSpaceError "\t"

hi def link nxmlTag Keyword
hi def link nxmlNotAttr Keyword
hi def link nxmlTagEnd Keyword
hi def link nxmlAttr Type
hi def link nxmlAttrValue String

hi def link nxmlVerbTag Keyword
hi def link nxmlVerbNotAttr Keyword
hi def link nxmlVerbTagEnd Keyword
hi def link nxmlVerbAttr Type
hi def link nxmlVerbAttrValue String

hi def link nxmlSpaceError Error

let b:current_syntax = "nxml"

" vim: ts=8
