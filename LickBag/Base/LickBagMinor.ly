% {{{ PARAMETRI
  \version "2.18.2"
  myTitle = "Lick Bag - Minor"
  myTempo =  #(ly:make-moment 190 4)
  \include "LickBagHeader.ly"
% }}}

% {{{ LICK A
  lickA = \LickScore
    \time 4/4
    \key bes \major
    {
      r8. d'16 r16 c bes d, f a g f e d c b | bes d a aes g d' bes d' r2 |
    }
    \chordmode{
      g1:m7 | g1:m7 | 
    }
    #"Bireli"
    #"500 miles high"
% }}}

% {{{ LICK B
  lickB = \LickScore
    \time 4/4
    \key c \major
    {
      r4 r8. e16 c b a d b c e g | b r a e r4 r16 e a b c d e g | gis2 r2 |
    }
    \chordmode{
      a1:m7 | a1:m7 | fis1:m7.5- | 
    }
    #"Bireli"
    #"500 miles high"
% }}}

% {{{ LICK C
  lickC = \LickScore
    \time 4/4
    \key ees \major
    {
      r2 r16 d f aes c ees g bes | g ees c bes r a aes f' aes bes32 aes g16 ges f ees d ces |
      bes aes b d f aes \tuplet 3/2 {bes d g} f8. ees16 d c bes g | f ees d c bes aes g f ees c8. c8 r8 |
    }
    \chordmode{
      f1:m7 | f1:m7 | c1:m11 | c1:m11 | 
    }
    #"Bireli"
    #"500 miles high"
% }}}

% {{{ LICK D
  lickD = \LickScore
    \time 4/4
    \key ees \major
    {
      r8 a c ees g bes c ees | g a c ees d c b d | b g d b r2 |
    }
    \chordmode{
      c1:m7 | c1:m7 | g1 | \bar "|."
    }
    #"Bireli"
    #"After You Have Gone"
% }}}

% {{{ LICK E
  lickE = \LickScore
    \time 4/4
    \key g \major
    {
      e,8 fis g b e fis g b | e g b d b g fis e |
      b g fis f e fis g b | e fis g b e fis g dis |
      fis e cis b g e ees d | cis e g b e4 r4 |
    }
    \chordmode{
      e1:m6 | e1:m6 | e1:m6 | e1:m6 | e1:m6 | e1:m6 |
    }
    #"Libro Manouche"
    #""
% }}}

% {{{ BOOKS
  \book{
    \bookOutputSuffix "C"    
    \lickA
    \lickB
    \lickC
    \lickD
    \lickE }
% }}}
