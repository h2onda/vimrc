syntax on
filetype indent on
set nocompatible
set nopaste
set pastetoggle=<f11>
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
set incsearch
set laststatus=2
set statusline=%<%t\ %y%{GetEncoding()}%r%m%=%l:%c%V\ %3p%%
set foldtext=PreserveTextPosition()
"set foldtext=foldtext()
set foldmethod=manual
set foldlevel=1
"set foldminlines=3

" cscope
if has("cscope")
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif


" はてなプラグイン
let g:hatena_user='h2onda'

function! GetEncoding()
	let fileformat = &fileformat != '' ? &fileformat : 'none'
	let fileencoding = &fileencoding != '' ? &fileencoding : 'none'
	let str = '[' . fileencoding . ':' . fileformat . ']'
	return str
endfunction

function! PreserveTextPosition()
	let str = getline(v:foldstart)
	let space = ''
	let s:count = &tabstop
	while s:count > 0
		let space = space . ' '
		let s:count = s:count - 1
	endwhile
	let str = substitute(str, '\t', space, 'g')
	let str = str . ' >> ' . (v:foldend - v:foldstart) . ' lines '
	return str
endfunction
