% {{{ PARAMETRI
  \version "2.18.2"
  myTitle = "Lick Bag - Major 251"
  myTempo =  #(ly:make-moment 190 4)
  \include "LickBagHeader.ly"
% }}}

% {{{ LICK A
  lickA = \LickScore
    \time 4/4
    \key c \major
    {
      r4 \trip e8 f g \tuplet 3/2 {a b c} \tuplet 3/2 {d e f} | 
      \tuplet 3/2 {g a g} \tuplet 3/2 {f e d} \tuplet 3/2 {c b a} \tuplet 3/2 {g ges f} | e2 r2 |
    }
    \chordmode{
      d1:m7 | g1:13 | c1:maj7 | 
    }
    #"Unknown"
    #"Blue Bossa"
% }}}

% {{{ LICK B
  lickB = \LickScore
    \time 4/4
    \key a \major
    {
      \partial 4. d''8 e f |
      fis c cis e d b gis e | d b gis f e es d ees16 d | cis4 r4 r2 |
    }
    \chordmode{
      \partial 4. s4. |
      e1:7 | e1:7 | a1 | 
    }
    #"Bireli"
    #"After You Have Gone"
% }}}

% {{{ LICK C
  lickC = \LickScore
    \time 4/4
    \key g \major
    {
      r2 r8 c8 ees fis | bes c ees fis \ottava #1 a c ees fis | b2 r2 |
    }
    \chordmode{
      d1:7 | d1:7 | g1 |
    }
    #"Bireli"
    #"After You Have Gone"
% }}}

% {{{ LICK D
  lickD = \LickScore
    \time 4/4
    \key c \major
    {
      r2 a''8 ais cis b | gis f cis b g f d c | b4 r4 r2 |
    }
    \chordmode{
      g1:7 | g1:7 | c1 | 
    }
    #"Bireli"
    #"After You Have Gone"
% }}}

% {{{ LICK E
  lickE = \LickScore
    \time 4/4
    \key g \major
    {
      \partial 4. d'8 des c |
      b c e g ais b d4 | fis,8 d bes fis d b c e | g4 r4 r2 | 
    }
    \chordmode{
      \partial 4. s4. |
      a1:m7 | d1:7 | g1 | 
    }
    #"Bireli"
    #"After You Have Gone"
% }}}

% {{{ LICK F
  lickF = \LickScore
    \time 4/4
    \key d \major
    {
      cis''8 r b cis b32 c b16 g8 e d | cis a g dis bes4 r |
    }
    \chordmode{
      e1:m7 | a1:7 |
    }
    #"Io"
    #"Coquette"
% }}}

% {{{ LICK G
  lickG = \LickScore
    \time 4/4
    \key d \major
    {
      \partial 8 dis8 |
      \tuplet 3/2 {e g b} d8 e cis a fis dis |
      e g bes cis e g bes gis | a2 r2 |
    }
    \chordmode{
      \partial 8 s8 |
      e1:m7 | a1:7 | d1:maj7 |
    }
    #"Io"
    #"Coquette."
% }}}

% {{{ BOOKS
  \book{
    \bookOutputSuffix "C"    
    \lickA
    \lickB
    \lickC
    \lickD
    \lickE
    \lickF
    \lickG
  }
% }}}
