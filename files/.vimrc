" This is the oh my vim directory
let $OH_MY_VIM="/home/joaoantoniocardoso/.oh-my-vim"
let &runtimepath=substitute(&runtimepath, '^', $OH_MY_VIM.",", 'g')

" /USER CUSTOMIZATIONS
set runtimepath^=./vim/ifdef/ifdef.vim


" enable/disable bufferline integration
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 1

" Select the packages you need
let g:oh_my_vim_packages=[
            \'vim',
            \'basic',
            \'code', 
            \'text', 
            \'grep', 
            \'searching', 
            \'registers', 
            \'navigation', 
            \'files', 
            \'git', 
            \'python', 
            \'tools', 
            \'markdown', 
            \'bookmarks', 
            \'bufferline',
            \'sessions', 
            \'spelling',
            \'neobundle', 
            \'vimfiler',
            \'gundo',
            \]

exec ':so ' $OH_MY_VIM."/vimrc"

filetype plugin indent on
let g:foam256_use_custom_colors=1
set t_Co=256
set exrc
set secure
