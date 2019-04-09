% {{{ PARAMETRI
  \version "2.18.2"
  myTitle = "Lick Bag - Major"
  myTempo =  #(ly:make-moment 190 4)
  \include "LickBagHeader.ly"
% }}}

% {{{ LICK A
  lickA = \LickScore
    \time 4/4
    \key g \major
    {
      r2 r8 a8 fis g | b d fis g b d e f | fis4 r4 r2 |
    }
    \chordmode{
      g1 | g1 | e1:7 | 
    }
    #"Bireli"
    #"After You Have Gone"
% }}}

% {{{ LICK B
  lickB = \LickScore
    \time 4/4
    \key c \major
    {
      \partial 8 c8 |
      b8 c e g b c e g | b16 a b8~ b a a4 r4 | 
    }
    \chordmode{
      \partial 8 s8 |
      c1 | c1 | 
    }
    #"Bireli"
    #"After You Have Gone"
% }}} 

% {{{ LICK C
  lickC = \LickScore
    \time 4/4
    \key bes \major
    {
      r4 r16 a''16 r16 g f8 a16 c,16~ c16 f a,8 | c16 f,8 a16 d,8 r8 r2|
    }
    \chordmode{
      bes1:maj7 | bes1:maj7 | 
    }
    #"Bireli"
    #"500 miles high"
% }}}

% {{{ BOOKS
  \book{
    \bookOutputSuffix "C"    
    \lickA
    \lickB
    \lickC
  }
% }}}
