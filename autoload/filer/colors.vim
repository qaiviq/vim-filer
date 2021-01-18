function! filer#colors#SetColors()
	" Get filer icons
	let s:i = g:filer#icons

	" Match regexes to color groups
	"exec "syn match filerDirectory '[^" . s:i.f_redirect . "]*\\/\\s*$'"
	exec "syn match filerDirectory '.*\/\s*$'"
	exec "syn match filerExecutable '\\w[^" . s:i.f_redirect . "]*\\*\s*$'"
	syn match filerPwd "^[/~].*/$"
	syn match filerPwd "^/$"

	" exec "syn match filerRedirect '.*" . s:i.f_redirect . " '"
	exec "syn match filerGitCommitted '" . s:i.g_committed . "'"
	exec "syn match filerGitAdded '" . s:i.g_added . "'"
	exec "syn match filerGitModified '" . s:i.g_modified . "'"

	" Link color groups to colors
	silent! let grey = { "fg":synIDattr(synIDtrans(hlID("Comment")), "fg#", "cterm"), "bg":synIDattr(synIDtrans(hlID("Comment")), "fg#", "gui") }
	silent! let red = { "fg":synIDattr(synIDtrans(hlID("Directory")), "fg#", "cterm"), "bg":synIDattr(synIDtrans(hlID("Directory")), "fg#", "gui") }
	silent! let green = { "fg":synIDattr(synIDtrans(hlID("String")), "fg#", "cterm"), "bg":synIDattr(synIDtrans(hlID("String")), "fg#", "gui") }
	silent! let purple = { "fg":synIDattr(synIDtrans(hlID("Question")), "fg#", "cterm"), "bg":synIDattr(synIDtrans(hlID("Question")), "fg#", "gui") }

	silent! exec "hi filerDirectory ctermfg=" . red.fg . " guifg=" . red.bg
	silent! exec "hi filerRedirect ctermfg=" . purple.fg . " guifg=" . purple.bg
	silent! exec "hi filerExecutable ctermfg=" . green.fg . " guifg=" . green.bg
	silent! exec "hi filerPwd ctermfg=" . red.fg . " guifg=" . red.bg . " cterm=bold gui=bold"

	hi filerGitCommitted ctermfg=82  guifg=#5FFF00 cterm=bold gui=bold
	hi filerGitAdded ctermfg=75  guifg=#5FAFFF cterm=bold gui=bold
	hi filerGitModified ctermfg=203  guifg=#FF5F5F cterm=bold gui=bold
endfunction
