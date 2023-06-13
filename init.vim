
" ##########################vim选项设置:options##########################
" 每一个设置上面都有中文翻译,和完整的设置名称
" 因为大部分设置使用的都是简写

" 允许跨行移动的按键
" whichwrap
set ww=b,s,h,l,<,>,[,]

" 插入模式下回格键，删除键，CTRL-W，CTRL-U 的功能
" backspace
set bs=2

" 搜索不区分大小写
" ignorecase
set ic

" 搜索智能区分大小写
" 本选项的作用是配合上面不区分大小写的设置
" 这样,只要包含一个大写字母则搜索时区分大小写
" smartcase
set scs

" 光标上下最少保留行数
" 比如当向下移动光标时,光标不会移动到当前编辑区最低部
" 才开始滚动编辑区,这样能保证看到部分连续的上下文
" scrolloff
set so=4

" 同上,但对横向滚动起作用,且只有设置了nowrap(下面)的时候才起作用
" sidescrolloff
set siso=4

" 显示行数
" number
set nu

" 显示相对行数
" relativenumber
"set rnu

" 颜色主题
" 主题的设置应在语法高亮和类型检测后面,否则会出现一些问题
" 执行版本管理之外的配置文件来设置主题，避免因为改完主题而提交代码
" 主题配置文件的为HOME目录下的".vimrc-colorscheme"文件
if filereadable(glob("~/.vimrc-colorscheme"))
    source ~/.vimrc-colorscheme
else
    colorscheme molokai
endif

" 高亮光标所在列和行
" cursorcolumn
" cursorline
"set cuc
"set cul

" 状态行显示的内容
" statusline
set stl=%t%m%r%h%w%=[%c-%l]%P

" 启动鼠标
" mouse
set mouse=a

" 确认对话框
" 多用于退出时文件已修改但未保存时询问,询问选项有:
" 保存,不保存,取消
" confirm
set cf

" 以下四个选项设置了使用4个空格代替tab制表符
" 文件里制表键代表的空格数
" tabstop
set ts=4
" (自动)缩进时的空格数目
" shiftwidth
set sw=4
" 行首一次性插入或删除sw所设置的空格数
" smarttab
set sta
" 输入制表键时以空格代替
" expandtab
set et

" 智能缩进
" 主要适用于c这样的程序,也可能适用于其他程序
" 另外,对于c程序还有更好但也更严谨,配置更复杂的cindent
" smartindent
set si

" 自动写入(不包含"edit","quit"等命令,如需包含参见autowriteall)
" 当在执行一些跳转,离开本缓冲区的命令时自动写入文件,如:
" :next,:last,:stop,:suspend,CTRL-],CTRL-O,'{A-Z0-9}等
" autowrite
set aw

" 编码
" encoding:vim内部使用的编码
" termencoding终端使用的编码(一般与encoding相同)
" fileencoding:当前文件编码(不在此处设置,vim会自动设置)
" fileencodings:可选的文件编码
"     utf-8不能放到usc-bom之前,latin1应为最后,default是encoding的值
set enc=utf-8
set fencs=ucs-bom,utf-8,gbk,gb2312,default,latin1

" 以下设置一些超时时间(超过这个时间后才不在等待后续按键)
" 这样可以避免状态栏提示信息的一点延迟
" 开启映射超迟(默认是开启):自己定义的按键映射比如<leader>y
set timeout
" 设置映射超迟时间(默认是1000)
set timeoutlen=3000
" 开启键码超迟(默认是关闭):比如按ESC键退出插入,命令,可视模式的超时
set ttimeout
" 设置键码超时时间(默认是负数也就是关闭,关闭时由timeoutlen的值管理键码超时)
set ttimeoutlen=100

" 当打开文件时切换当前的工作目录到文件所在的目录下
" 当前工作目录可以通过:pwd命令查看
"set autochdir





" ##########################按键映射设置:mapkeys##########################
" map:全局的映射,映射之后的按键可以递归(被再次映射)
" noremap:全局的映射,但映射后的按键不可递归(多用于定义一个命令)
" unmap:删除一个映射
" mapclear:删除所有映射
"
" 映射也区分模式,如果上述命令前有如下字符,则该命令只对该模式生效:
" n:normal(正常)模式下
" v:可视模式
" i:插入模式
" c:命令行模式
"
" map可以增加参数或者说选项，可用如下：
" <buffer> : 只在当前buffer生效
" <nowait> : 一旦匹配到可用按键序列立即生效，不等待后续按键，相当于对更长按键映射的一种覆盖
" <silent> : 静默，不在状态栏显示
" <special> :
" <script> :
" <expr> :
" <unique> :
" <nowait>举例：有一个"imap <nowait> ,w week"按键映射，但还有一个"imap ,wl weekly"
" 前一个imap加入了<nowait>的参数，那么输入",w"后就会理解匹配到第一个imap，
" 如果没有<nowait>参数，那么输入",w"后就会等待输入"l"，如果输入了"l"那么就会匹配上第二个imap，
" 如果一直没有输入"l"，那么就会超时，超时后才会匹配第一个imap

" 设置<leader>为空格键
let mapleader = "\<Space>"

" 更方便的进入命令模式
nnoremap <leader>; :

" 插入模式下快速移动光标
inoremap <C-H> <Left>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>

" 插入二合字符
" 默认是<C-K>,但已被上面的定义所占用
inoremap <Insert> <C-K>

" 快速移动到行首行尾
" 直接使用map命令从而全局不使用H,L的原功能
map H ^
map L $
" 可视模式下移动到行尾(不包含换行符)
vnoremap L $h

" 复制到系统剪切板
noremap <leader>y "+y

" 复制行到系统剪切板
noremap <leader>Y "+yy

" 剪切到系统剪切板
noremap <leader>d "+d
noremap <leader>x "+x

" 从系统剪切板粘贴
noremap <leader>p "+p
noremap <leader>P "+P

" 保存
nnoremap <leader>w :w<CR>
nnoremap <leader>W :w !sudo tee % > /dev/null<CR>
" :exit 类似于 :wq
nnoremap <leader>e :exit<CR>

" 保证搜索结果高亮,避免下面取消高亮后再次搜索没有高亮
nnoremap n :set hlsearch<CR>n
nnoremap N :set hlsearch<CR>N
nnoremap * :set hlsearch<CR>*
nnoremap # :set hlsearch<CR>#

" 取消搜索的高亮
nnoremap <leader><Space> :set nohlsearch<cr>

" 可视模式下搜索高亮的内容
" 向下搜索
vnoremap / y:set hlsearch<CR>/<C-R>"<CR>
" 向上搜索
vnoremap ? y:set hlsearch<CR>?<C-R>"<CR>

" 窗口切换
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" 打开当前窗口的位置列表
nnoremap <leader>lo :lopen<cr>
" 关闭当前窗口的位置列表
nnoremap <leader>lc :lclose<cr>
" 跳转到当前窗口位置列表的下一项和前一项
" 当syntastic或ycm检测到语法错误时可使用此映射跳转下一个或前一个错误
nnoremap <leader>ln :lnext<cr>
nnoremap <leader>lp :lprevious<cr>

" 打开当前窗口的quickfix列表
nnoremap <leader>fo :copen<cr>
" 关闭当前窗口的quickfix列表
nnoremap <leader>fc :cclose<cr>
" 跳转到当前窗口quickfix列表的下一项和前一项
nnoremap <leader>fn :cnext<cr>
nnoremap <leader>fp :cprevious<cr>

" 删除当前buffer
" 如果有多个buffer则自动编辑之前的buffer或前一个buffer
" 如果只有当前一个buffer则删除后打开NERDTree(未启用, 如果需要取消下面 "NERDTreeFocus 的注释即可)
nnoremap <leader>q :call CloseCurrentBuffer()<CR>

function! CloseCurrentBuffer()
    " 在处理buffer前先关闭预览，quickfix，位置列表这几个窗口，不然会有些问题
    pclose
    cclose
    lclose

    let l:bufsInfo = getbufinfo()
    let l:bufsNrListed = []
    for l:bufInfo in l:bufsInfo
        if get(l:bufInfo, "listed") == 1
            call add(l:bufsNrListed, get(l:bufInfo, "bufnr"))
        endif
    endfor
    let l:bufsNrListedCount = len(l:bufsNrListed)
    if l:bufsNrListedCount <= 1
        execute "bw"
        "NERDTreeFocus
    else
        if bufloaded(bufnr("#"))
            execute "b#"
        else
            execute "bp"
        endif
        execute "bw #"
    endif
endfunction

" 删除所有buffer
nnoremap <leader>bc :call CloseListedBuffers()<cr>
" 删除所有buffer,除了当前的
nnoremap <leader>bo :call CloseOtherBuffers()<cr>
" 切换到上一个buffer
nnoremap <leader>bp :bp<cr>
" 切换到下一个buffer
nnoremap <leader>bn :bn<cr>
" 切换到之前的buffer
nnoremap <leader>0 :b#<cr>

function! CloseListedBuffers()
    " 在处理buffer前先关闭预览，quickfix，位置列表这几个窗口，不然会有些问题
    pclose
    cclose
    lclose

    let l:bufsInfo = getbufinfo()
    for l:bufInfo in l:bufsInfo
        if get(l:bufInfo, "listed") == 1
            let l:bufNr = get(l:bufInfo, "bufnr")
            if bufloaded(l:bufNr)
                execute "bw" l:bufNr
            endif
        endif
    endfor
    NERDTreeFocus
endfunction

function! CloseOtherBuffers()
    " 在处理buffer前先关闭预览，quickfix，位置列表这几个窗口，不然会有些问题
    pclose
    cclose
    lclose

    let l:bufsInfo = getbufinfo()
    for l:bufInfo in l:bufsInfo
        if get(l:bufInfo, "listed") == 1
            let l:bufNr = get(l:bufInfo, "bufnr")
            if l:bufNr != bufnr("%")
                if bufloaded(l:bufNr)
                    execute "bw" l:bufNr
                endif
            endif
        endif
    endfor
endfunction





" ##########################自动命令设置:autocmds##########################

" 自动保存和恢复一些vim的状态, 如光标位置, 折叠状态等待
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
