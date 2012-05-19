" Vim syntax file
" Language:	ndoc
" Maintainer:	Eric Rannaud <e@nanocritical.com>

if exists("b:current_syntax")
  finish
endif

syn match ndocNotAttr "(([[:alpha:]_][[:alpha:]_0-9:.]*" contained contains=@NoSpell,@ndocAttr
syn match ndocAttr "[[:alpha:]_][[:alpha:]_0-9:.]*" contained contains=@NoSpell,ndocAttrValue
syn region ndocAttrValue start="'" skip="\\'" end="'" contained contains=@NoSpell
syn match ndocTagEnd "))"
syn region ndocTag start="(([[:alpha:]_][[:alpha:]_0-9:.]*" end="\(\n\||\)" contains=@NoSpell,ndocNotAttr,ndocAttr,ndocAttrValue,ndocTag

hi def link ndocTag Keyword
hi def link ndocNotAttr Keyword
hi def link ndocTagEnd Keyword
hi def link ndocAttr Type
hi def link ndocAttrValue String

let b:current_syntax = "ndoc"

" vim: ts=8
