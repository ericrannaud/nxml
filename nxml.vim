" Vim syntax file
" Language:	nxml
" Maintainer:	Eric Rannaud <e@nanocritical.com>

if exists("b:current_syntax")
  finish
endif

syn sync minlines=20

syn match nxmlEscapedEOL "\\\n" contained

syn match nxmlNotAttr "<%\?[[:alpha:]_][[:alpha:]_0-9:.]*" contained contains=@NoSpell,@nxmlAttr,
syn match nxmlAttr "[[:alpha:]_][[:alpha:]_0-9:.]*=\?" contained contains=@NoSpell,nxmlAttrValue
syn region nxmlAttrValue start="'" skip="\\'" end="'" contained contains=@NoSpell
syn match nxmlTagEnd "[|>]"
syn region nxmlTag start="<%\?[[:alpha:]_][[:alpha:]_0-9:.]*" skip="\\\n" end="\(\n\||\)" contains=@NoSpell,nxmlNotAttr,nxmlAttr,nxmlAttrValue,nxmlTag,nxmlSpaceError,nxmlEscapedEOL

syn match nxmlVerbNotAttr "<<<%\?[[:alpha:]_][[:alpha:]_0-9:.]*" contained contains=@NoSpell,@nxmlVerbAttr
syn match nxmlVerbAttr "[[:alpha:]_][[:alpha:]_0-9:.]*=\?" contained contains=@NoSpell,nxmlVerbAttrValue
syn region nxmlVerbAttrValue start="'" skip="\\'" end="'" contained contains=@NoSpell
syn match nxmlVerbTagEnd "\(|\|>>>\)"
syn region nxmlVerbTag start="<<<%\?[[:alpha:]_][[:alpha:]_0-9:.]*" skip="\\$" end="\(\n\||\)" contains=@NoSpell,nxmlVerbNotAttr,nxmlVerbAttr,nxmlVerbAttrValue,nxmlVerbTag,nxmlSpaceError,nxmlEscapedEOL

syn match nxmlSpaceError "[ \t]\+$"
syn match nxmlSpaceError "\t"

hi def link nxmlEscapedEOL Keyword
hi def link nxmlNotAttr Keyword
hi def link nxmlTagEnd Keyword
hi def link nxmlAttr Type
hi def link nxmlAttrValue String

hi def link nxmlVerbNotAttr Keyword
hi def link nxmlVerbTagEnd Keyword
hi def link nxmlVerbAttr Type
hi def link nxmlVerbAttrValue String

hi def link nxmlSpaceError Error

let b:current_syntax = "nxml"

" vim: ts=8
