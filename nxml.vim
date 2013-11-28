" Vim syntax file
" Language:	nxml
" Maintainer:	Eric Rannaud <e@nanocritical.com>

if exists("b:current_syntax")
  finish
endif

syn sync minlines=20

syn match nxmlEscapedEOL "\\\n" contained
syn match nxmlOp "[<>=|]" contained

syn match nxmlNotAttr "<%\?[[:alpha:]_][[:alpha:]_0-9:.]*" contained contains=@NoSpell,@nxmlAttr,nxmlOp
syn match nxmlAttr "[[:alpha:]_][[:alpha:]_0-9:.]*=\?" contained contains=@NoSpell,nxmlAttrValue,nxmlOp
syn region nxmlAttrValue start="'" skip="\\'" end="'" contained contains=@NoSpell
syn match nxmlTagEnd "\(|\|>\)" contained contains=nxmlOp
syn region nxmlTagContent start="|" end=">" keepend contained contains=nxmlTagEnd,nxmlTag,nxmlVerbTag
syn region nxmlTag start="<%\?[[:alpha:]_][[:alpha:]_0-9:.]*" skip="\\\n" end="\(\n\|>\)" keepend contains=@NoSpell,nxmlNotAttr,nxmlAttr,nxmlAttrValue,nxmlTag,nxmlTagEnd,nxmlTagContent,nxmlSpaceError,nxmlEscapedEOL

syn match nxmlVerbNotAttr "<<<%\?[[:alpha:]_][[:alpha:]_0-9:.]*" contained contains=@NoSpell,@nxmlVerbAttr,nxmlOp
syn match nxmlVerbAttr "[[:alpha:]_][[:alpha:]_0-9:.]*=\?" contained contains=@NoSpell,nxmlVerbAttrValue,nxmlOp
syn region nxmlVerbAttrValue start="'" skip="\\'" end="'" contained contains=@NoSpell
syn match nxmlVerbTagEnd "\(|\|>>>\)" contained contains=nxmlOp
syn region nxmlVerbTagContent start="|" end=">>>" keepend contained contains=nxmlVerbTagEnd,nxmlVerbTag,@NoSpell
syn region nxmlVerbTag start="<<<%\?[[:alpha:]_][[:alpha:]_0-9:.]*" skip="\\$" end="\(\n\|>>>\)" keepend contains=@NoSpell,nxmlVerbNotAttr,nxmlVerbAttr,nxmlVerbAttrValue,nxmlVerbTag,nxmlVerbTagEnd,nxmlVerbTagContent,nxmlSpaceError,nxmlEscapedEOL,nxmlOp

syn match nxmlSpaceError "[ \t]\+$"
syn match nxmlSpaceError "\t"

hi def link nxmlEscapedEOL Delimiter
hi def link nxmlOp Delimiter

hi def link nxmlNotAttr Keyword
hi def link nxmlTagEnd Operator
hi def link nxmlAttr Type
hi def link nxmlAttrValue String

hi def link nxmlVerbNotAttr Keyword
hi def link nxmlVerbTagEnd Operator
hi def link nxmlVerbAttr Type
hi def link nxmlVerbAttrValue String

hi def link nxmlSpaceError Error

let b:current_syntax = "nxml"

" vim: ts=8
