" autocmd --- {{{
" Vimscript; file settings --- {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType vim setlocal foldlevel=0
augroup END
" }}}

" Markdown --- {{{
" opm: in@; Markdown; seleccionar el correo siguiente --- {{{
augroup email
	autocmd!
	autocmd FileType markdown onoremap in@ :<c-u>execute "normal! /@\r:nohlsearch\rhvb"<cr>
augroup END
" }}}

" opm: ah; Markdown; seleccionar el título y su marcador (= o -) --- {{{
augroup mdfindtitleylines
	autocmd!
	autocmd FileType markdown onoremap ah :<c-u>execute "normal! ?^[==--]\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}

" opm: ih; Markdown; seleccionar el título --- {{{
augroup mdtitlefind
	autocmd!
	autocmd FileType markdown onoremap ih :<c-u>execute "normal! ?^[==--]\\+$\r:nohlsearch\rkvg_"<cr>
augroup END
" }}}
" }}}

" HTML --- {{{
" nmap: \\f; HTML; visual, etiquetar bloque, doblar manual --- {{{
augroup htmlvtzf
	autocmd!
	autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END
" }}}

" nmap: \\!; HTML; atajo para la estructura básica --- {{{
augroup htmldoctype
	autocmd!
	autocmd FileType html nnoremap <buffer> <localleader>! i<!DOCTYPE html><esc>o<html lang="-"><esc>o<head><esc>o<meta charset="UTF-8" /><esc>o<meta name="viewport" content="width=device-width, initial-scale=1" /><esc>o<title>Document</title><esc>o</head><esc>o<body><esc>o<esc>o</body><esc>o</html> 
augroup END
" }}}

" HTML; indentación automática
autocmd BufWritePre,BufRead *.html :normal gg=G

" nmap: \\c; HTML; poner etiquetas --- {{{
augroup htmltag
	autocmd!
	autocmd FileType html nnoremap <buffer> <localleader>c I<><esc>i
augroup END
" }}}
" }}}

" text; corrector ortográfico (en-GB) --- {{{
augroup plainspell
	autocmd!
	autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_gb
augroup END
" }}}

" abreviaturas --- {{{
" abreviatura: iff; Python; if : --- {{{
augroup pyabr
	autocmd!
	autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END
" }}}

" abreviatura: iff; JavaScript; if ( ) --- {{{
augroup jsabr
	autocmd!
	autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
augroup END
" }}}

" abreviatura: ree; JavaScript; return : --- {{{
augroup jsrre
	autocmd!
	autocmd FileType javascript :iabbrev <buffer> ree return:<left>
	autocmd FileType javascript :iabbrev <buffer> return WRONG
augroup END
" }}}

" abreviatura: ff; JavaScript; function ( ) --- {{{
augroup jsff
	autocmd!
	autocmd FileType javascript :iabbrev <buffer> ff function ()<left>
	autocmd FileType javascript :iabbrev <buffer> function WRONG
augroup END
" }}}
" }}}
" }}}

" abreviaturas --- {{{
iabbrev adn and

iabbrev taht that

iabbrev wehn when
" }}}

" set/let --- {{{
" Camina al archivo, corto
set statusline=%.20F

" Tipo de archivo
set statusline+=%y

" Cambia al lado derecho
set statusline+=%=

" Línea actual
set statusline+=%l

" Separador
set statusline+=/

" Líneas en total
set statusline+=%L

" Añadir números al lado

set number

set norelativenumber

set numberwidth=1

set wrap

set noshiftround

set matchtime=5

set tabstop=4

set shiftwidth=4

" destacas todo los encuentros en el archivo
set hlsearch

" destacas lo que sigue mientras estás teclando
set incsearch

let mapleader = "-"

let localmapleader = "\\"
" }}}

" mapeados de la tecla --- {{{
nnoremap <leader>q :call <SID>QuickfixToggle()<cr> 

let g:quickfix_is_open = 0

function! s:QuickfixToggle()
if g:quickfix_is_open
cclose
let g:quickfix_is_open = 0
execute g:quickfix_return_to_window . "wincmd w"
else
let g:quickfix_return_to_window = winnr()
copen
let g:quickfix_is_open = 1
endif
endfunction

nnoremap <leader>f :call <SID>FoldColumnToggle()<cr>

function! s:FoldColumnToggle()
if &foldcolumn
setlocal foldcolumn=0
else
setlocal foldcolumn=4
endif
endfunction

nnoremap <leader>= :setlocal number!<cr>

nnoremap <leader>N :cnext<cr>

nnoremap <leader>P :cprevious<cr>

" haz el comando 'nohls'
nnoremap <leader>X :nohlsearch<cr>

nnoremap <leader>la :<c-u>execute "leftabove vsplit " . bufname("#")<cr>

nnoremap <leader>rb :<c-u>execute "rightbelow vsplit " . bufname("#")<cr>

nnoremap <leader>; :<c-u>execute "normal! mqA;\e`q"<cr>

" resaltar 'trailing whitespace'
nnoremap <leader>W :match Error /\v\s\s*$/<cr>

" cancelar lo que has resaltado
nnoremap <leader>E :match none<cr>

" haz 'source %'
nnoremap <leader>SR :source %<cr>

" búsqueda con \v
nnoremap <leader>\ /\v

nnoremap <localleader>g :w<cr>

nnoremap <localleader>q :q<cr>

nnoremap <localleader>q! :q!<cr>

" Borrar una línea y pegarla a la línea abajo
nnoremap <leader> ddp

nnoremap <leader>o o<esc>

nnoremap <leader>O O<esc>

" Borrar una línea y pegarla a la línea arriba
noremap <leader> dd<A-k>P

" Capitalizar las letras en modo insertar
inoremap <leader><c-u> <esc>gUiwea

" Capitalizar las letras en modo normal
nnoremap <leader><c-u> gUiwe

" Editar el .vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>

" Extraer el .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Agregar comas invertidas alrededor una palabra desde modo normal
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

nnoremap H 0

nnoremap L $

nnoremap $ H

nnoremap 0 L

nnoremap tp 0gg

nnoremap bt $G

inoremap jk <esc>

inoremap <esc> <nop>

vnoremap <esc> <nop>

nnoremap <Up> <nop>

vnoremap <Up> <nop>

nnoremap <Down> <nop> 

vnoremap <Down> <nop>

nnoremap <Left> <nop>

vnoremap <Left> <nop>

nnoremap <Right> <nop>

vnoremap <Right> <nop>

" Agregar comas invertidas alrededor una palabra desde modo visual
vnoremap <c-h> <esc>`<i"<esc>ea"<esc>`>

onoremap in( :<c-u>normal! f(vi(<cr>

onoremap il) :<c-u>normal! F)vi)<cr>

onoremap ol( :<c-u>normal! f(vf)<cr>

onoremap on) :<c-u>normal! F)vF(<cr>

onoremap kn{ :<c-u>normal! f{vi{<cr>

onoremap kl} :<c-u>normal! F}vi{<cr>

onoremap vl{ :<c-u>normal! f{vf}<cr>

onoremap vn} :<c-u>normal! F}vF{<cr>
" }}}

" funciones --- {{{
"poner la lista en orden alfabético o númerico (p. ej. :echo Sorted([2, 3, 1, 4]) = [1, 2, 3,4])
function! Sorted(l)
	let new_list = deepcopy(a:l)
	call sort(new_list)
	return new_list
endfunction

"poner la lista en reverso (p. ej. :echo Reversed([2, 3, 1, 4]) = [4, 1, 3, 2])
function! Reversed(l)
	let new_list = deepcopy(a:l)
	call reverse(new_list)
	return new_list
endfunction

"agregar un valor al final de la lista (p. ej. :echo Append([2, 3, 1, 4,], 'Hola') = [2, 3, 1, 4, 'Hola'])
function! Append(l, val)
	let new_list = deepcopy(a:l)
	call add(new_list, a:val)
	return new_list
endfunction

"sustituir una palabra por otra (p. ej. :echo Assoc([2, 3, 1, 4,], 2, 'Hola') = [2, 3, 'Hola', 4])
function! Assoc(l, i, val)
	if type(a:l) == v:t_dict
		let new_dict = deepcopy(a:l)
		let new_dict[a:i] = a:val
		return new_dict
	else
		let new_list = deepcopy(a:l)
		let new_list[a:i] = a:val
		return new_list
	endif
endfunction

"borrar un valor de la lista o diccionario (p. ej :echo Pop([1, 2, 3, 4,], 3) = [1, 2, 3])
function! Pop(l, i)
	if type(a:l) == v:t_dict
		let new_dict = deepcopy(a:l)
		call remove(new_dict, a:i)
		return new_dict
	else
		let new_list = deepcopy(a:l)
		call remove(new_list, a:i)
		return new_list
	endif
endfunction

" utilizar una función con una lista o diccionario (p. ej. :echo Mapped(function("toupper"), mylist) = :let mylist = ['my', 'list'] ~ ['MY', 'LIST'] 
function! Mapped(fn, l)
	if type(a:l) == v:t_dict
		let new_dict = deepcopy(a:l)
		call map(new_dict, string(a:fn) . '(v:val)')
		return new_dict
	else
		let new_list = deepcopy(a:l)
		call map(new_list, string(a:fn) . '(v:val)')
		return new_list
endfunction

" filtrar una lista para valores que son 'truthy'
function! Filtered(fn, l)
	if type(a:l) == v:t_dict
		let new_dict = deepcopy(a:l)
		call filter(new_dict, string(a:fn) . '(v:val)')
		return new_dict
	else
		let new_list = deepcopy(a:l)
		call filter(new_list, string(a:fn) . '(v:val)')
		return new_list
endfunction

" filtrar una lista para valores que no son 'truthy'
function! Removed(fn, l)
	if type(a:l) == v:t_dict
		let new_dict = deepcopy(a:l)
		call filter(new_dict, '!' . string(a:fn) . '(v:val)')
		return new_dict
	else
		let new_list = deepcopy(a:l)
		call filter(new_list, '!' . string(a:fn) . '(v:val)')
		return new_list
endfunction

" las funciones para llamar Reduced()
function! Add(a, b)
	return a:a + a:b
endfunction

function! Multiply(a, b)
	return a:a * a:b
endfunction

" combinar una lista de números en un valor único
function! Reduced(fn, l)
	let [acc; tail] = a:l
	while !empty(tail)
		let [head; tail] = tail
		let acc = a:fn(acc, head)
	endwhile
	return acc
endfunction

" }}}

echo "WELCOME!  ¡BIENVENIDO!"
