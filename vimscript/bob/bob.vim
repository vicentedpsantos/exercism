"
" This function takes any remark and returns Bob's response.
"
function! Response(remark) abort
  if IsSilence(a:remark)
    return "Fine. Be that way!"
  elseif IsShout(a:remark) && IsQuestion (a:remark)
    return "Calm down, I know what I'm doing!"
  elseif IsShout(a:remark)
    return "Whoa, chill out!"
  elseif IsQuestion(a:remark)
    return "Sure."
  else
    return "Whatever."
  endif
endfunction

function! IsShout(sentence) abort
  let l:sanitized = RemoveTabsAndSpaces(a:sentence)

  return a:sentence =~# '[A-Z]' && toupper(a:sentence) ==# a:sentence
endfunction

function! IsQuestion(sentence) abort
  let l:sanitized = RemoveTabsAndSpaces(a:sentence)
  let l:sentence_length = len(l:sanitized)

  return l:sanitized[sentence_length - 1] == '?'
endfunction

function! IsSilence(sentence) abort
  let l:sanitized = RemoveTabsAndSpaces(a:sentence)

  return len(l:sanitized) == 0
endfunction

function RemoveTabsAndSpaces(sentence) abort
  return substitute(a:sentence, '\n\|\r\|\t\|\ ' , "", "g")
endfunction
