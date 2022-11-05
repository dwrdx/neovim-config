function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction


" Copy current file path to clipboard
function! CopyCurrentFilePath()
  let @+ = expand('%')
  echo @+
endfunction

