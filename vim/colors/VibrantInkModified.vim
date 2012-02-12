" 3: if you wish to use this with screen, add the following to your .screenrc:
"     attrcolor b ".I"
"     termcapinfo xterm 'Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm'
"     defbce "on"
"     term screen-256color-bce

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "VibrantInkModified"

" Support functions taken from vividchalk by Tim Pope
" First two functions adapted from inkpot.vim

" map a urxvt cube number to an xterm-256 cube number
fun! s:M(a)
    return strpart("0245", a:a, 1) + 0
endfun

" map a urxvt colour to an xterm-256 colour
fun! s:X(a)
    if &t_Co == 88
        return a:a
    else
        if a:a == 8
            return 237
        elseif a:a < 16
            return a:a
        elseif a:a > 79
            return 232 + (3 * (a:a - 80))
        else
            let l:b = a:a - 16
            let l:x = l:b % 4
            let l:y = (l:b / 4) % 4
            let l:z = (l:b / 16)
            return 16 + s:M(l:x) + (6 * s:M(l:y)) + (36 * s:M(l:z))
        endif
    endif
endfun

function! E2T(a)
    return s:X(a:a)
endfunction

function! s:choose(mediocre,good)
    if &t_Co != 88 && &t_Co != 256
        return a:mediocre
    else
        return s:X(a:good)
    endif
endfunction

function! s:hifg(group,guifg,first,second,...)
    if a:0 && &t_Co == 256
        let ctermfg = a:1
    else
        let ctermfg = s:choose(a:first,a:second)
    endif
    exe "highlight ".a:group." guifg=".a:guifg." ctermfg=".ctermfg
endfunction

function! s:hibg(group,guibg,first,second)
    let ctermbg = s:choose(a:first,a:second)
    exe "highlight ".a:group." guibg=".a:guibg." ctermbg=".ctermbg
endfunction

" The standard syntax highlighting groups:
highlight Normal                    guifg=#E6E1DC guibg=#000000
"
highlight Comment                   guifg=#BC9458 ctermfg=180 gui=italic
"
highlight Constant                  guifg=#6D9CBE ctermfg=73
highlight String                    guifg=#A5C261 ctermfg=107
hi link   Number                    String
"
highlight Identifier                guifg=#6D9CBE ctermfg=73 gui=NONE cterm=NONE
highlight Function                  guifg=#FFC66D ctermfg=221 gui=NONE cterm=NONE
"
highlight Statement                 guifg=#CC7833 ctermfg=173 gui=NONE cterm=NONE
"
highlight PreProc                   guifg=#E6E1DC ctermfg=103 gui=NONE cterm=NONE
highlight Include                   guifg=#CC7833 ctermfg=173 gui=NONE cterm=NONE
hi link   Define                    Include
hi link   PreCondit                 Include
"
highlight Type                      guifg=#DA4939 ctermfg=167 gui=NONE cterm=NONE
"
hi link   Special                   Type
"
highlight Error                     guifg=#FFC66D ctermfg=221 guibg=#990000 ctermbg=88
"
highlight Todo                      guifg=Yellow ctermfg=Yellow guibg=Black ctermbg=Black
" end of standard syntax highlighting groups

highlight Cursor                    gui=NONE guifg=bg guibg=#FF0000 ctermfg=0 ctermbg=15
highlight CursorLine                guibg=#1c1c1c ctermbg=234 cterm=NONE

highlight User1 guifg=#bc9458 gui=inverse term=inverse cterm=inverse ctermfg=180

highlight Search                    guifg=NONE ctermfg=NONE guibg=#2b2b2b ctermbg=235 gui=italic cterm=underline
highlight Title                     guifg=#FFFFFF ctermfg=15
highlight Visual                    guibg=#5A647E ctermbg=60
highlight DiffAdd                   guifg=#E6E1DC ctermfg=7 guibg=#519F50 ctermbg=71
highlight DiffDelete                guifg=#E6E1DC ctermfg=7 guibg=#660000 ctermbg=52
highlight SpellBad                  guifg=#D70000 ctermfg=160 ctermbg=NONE cterm=underline
highlight SpellRare                 guifg=#D75F87 ctermfg=168 guibg=NONE ctermbg=NONE gui=underline cterm=underline
highlight SpellCap                  guifg=#D0D0FF ctermfg=189 guibg=NONE ctermbg=NONE gui=underline cterm=underline
highlight MatchParen                guifg=#FFFFFF ctermfg=15 guibg=#005f5f ctermbg=23
highlight ModeMsg                   gui=none cterm=none

hi link   pythonBuiltin             Constant

" Ruby highlighting
highlight rubyInstanceVariable      guifg=#D0D0FF ctermfg=189
hi link   rubyLocalVariableOrMethod rubyInstanceVariable
hi link   rubyBlockParameter        Normal
hi link   rubyClass                 Normal
hi link   rubyConstant              Type
hi link   rubyPredefinedConstant    Type
"highlight rubyInterpolation         guifg=#519F50 ctermfg=107
hi link   rubyInterpolation         SpecialChar
hi link   rubyPseudoVariable        Function
hi link   rubyStringDelimiter       String

" (X)HTML highlighting
highlight xmlTag                    guifg=#E8BF6A ctermfg=179
highlight xmlTagName                guifg=#E8BF6A ctermfg=179
highlight xmlEndTag                 guifg=#E8BF6A ctermfg=179
hi link   htmlTag                   xmlTag
hi link   htmlTagName               xmlTagName
hi link   htmlEndTag                xmlEndTag

hi link   mailSubject               String
hi link   mailHeaderKey             Function
highlight mailEmail                 guifg=#A5C261 ctermfg=107 gui=italic cterm=underline

" taken from vividchalk by Tim Pope:
highlight LineNr                    guifg=#DDEEFF ctermfg=White
call s:hibg("LineNr"                ,"#222222","DarkBlue",80)
highlight Pmenu                     guifg=White ctermfg=White
highlight PmenuSel                  guifg=White ctermfg=White
call s:hibg("Pmenu"                 ,"#000099","Blue",18)
call s:hibg("PmenuSel"              ,"#5555ff","DarkCyan",39)
highlight PmenuSbar                 guibg=Grey ctermbg=Grey
highlight PmenuThumb                guibg=White ctermbg=White
highlight StatusLine                guifg=Black guibg=White gui=none ctermfg=Black ctermbg=White  cterm=none
highlight StatusLineNC              guifg=Black guibg=#aaaaaa gui=none ctermfg=Black ctermbg=Grey cterm=none
highlight Folded                    guibg=#1100aa ctermbg=DarkBlue
call s:hibg("Folded"                ,"#110077","DarkBlue",17)
call s:hifg("Folded"                ,"#aaddee","LightCyan",63)
highlight FoldColumn                none

highlight IndentGuidesOdd           ctermbg=234
highlight IndentGuidesEven          ctermbg=233
