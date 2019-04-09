% {{{ PARAMETRI
  \version "2.18.2"
  #(ly:set-option 'relative-includes #t) 
  
  \header{
    composer = \markup{ \italic "Manouche"}
  }

  \include "../Base/LickBag251Minor.ly"
% }}}

% {{{ BOOKS
  \book{
    \bookOutputSuffix "C"    
    \lickA
    \lickB
    \lickD
  }
% }}}