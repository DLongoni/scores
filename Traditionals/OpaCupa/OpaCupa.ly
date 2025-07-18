% {{{ PARAMETRI
  myTitle = "Opa Cupa"
  myKey = \key d \minor
  myTime = \time 2/4 
  myTempo =  #(ly:make-moment 70 4)
  myFname = "Daissa"
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2 {
    d16 d d8 a d16 d | d8 a d16 d c b | c c c8 a c16 c | c8 a c16 b a gis |
    b c cis d c b a gis | a8 gis f f16 d | gis8 f f16 f d f | e4 r4 |
    } 
  }

  accordiA = \chordmode{
    \repeat volta 2{
      d2:m | d2:m | a2:m | a2:m | 
      d4:m des4:7.5+ | f4:/c b4:m7.5- | e2:7 | a2:7 | 
    }
  }

  bassoA = {
    \repeat volta 2{
      d4 e, | f g | a gis | f e |
      d' des | c b | e, gis | a e |
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
      f16 f f8 d f16 f | f8 d f16 f e d | g16 g g8 e g16 g | g8 e g16 g f e |
      f16 f f8 d f16 f | f8 d f16 f e d | e f fis e f f d f | e4 r4 | \break
      f16 f f8 d f16 f | f8 d f16 f e d | g16 g g8 e g16 g | g8 e g16 g f e |
      f16 f f8 d f16 f | f8 d f16 f e d | e f fis e f f d f | e4 r4 |
  }

  bassoB = {
      d'4 a | d a | a e | a e |
      d' des | c b | e, gis | a8 g f e |
      d'4 a8 d | r a d a | r a g4 | bes cis |
      d des | c b | e, gis | a8 g f e |
    }

  accordiB = \chordmode{
      d2:m | d2:m | a2:7 | a2:7 | 
      d4:m d4:m/des | d4:m/c b4:m7.5- | e2:7 | a2:7 | 
      d2:m | d2:m | a2:7 | a2:7 | 
      d4:m d4:m/des | d4:m/c b4:m7.5- | e2:7 | a2:7 | 
  }
% }}}

% {{{ PARTE C
  temaC = {
    c'8 b c b | c b c16 b a8~ | a8 a16 a a a gis8 | a gis f4 | \break
    r8 f8 f f | g f f e | d e e e | f e e r | \break
    d8 d e f | g4 r4 | d8 d e f | g4 r4 | \break
    d'8 cis d cis |d c a16 gis f8 | d e e e | f e e4 |
  }

  accordiC = \chordmode{
      d2:m | d2:m | a2:m | a2:m | 
      d4:m des4:7.5+ | f4:/c b4:m7.5- | e2:7 | a2:7 | 
      d2:m | g4:m a4:7 | d2:m | g4:m a4:7 |
      d4:m des4:7.5+ | f4:/c b4:m7.5- | e2:7 | a2:7 | 

  }

  bassoC = {
      d'4 e, | f g | a gis | f e |
      d' des | c b | e, gis | a8 g f e |
      d'4 a | g8. a16~ a8 a8 | d4 a | g8. a16~ a8 a8 |
      d4 des | c b | e, gis | a e |
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2 {
      g4.^ \markup  \italic { O.. } gis8 | a8^ \markup{ \italic Opa cupa} g f e |
      r8 f16 f f8 f | g f e d | d d'4 c16 b | c8 b a16 gis f8 | d e4 e8 | f8 e e4 |
    } 
  }

  accordiD = \chordmode{
    \repeat volta 2{
      g2:m | a2:7 | d2:m | d2:m | 
      d4:m des4:7.5+ | f4:/c b4:m7.5- | e2:7 | a2:7 | 
    }
  }

  bassoD = {
    g4. gis8 | a8 r8 r4 | d4 a4 | d a |
    d des | c b | e, gis | a4 e |
  }
% }}}

% {{{ PARTE E
  temaE = {
    \repeat volta 2 {
      d8 a' a a | a a a gis | gis gis gis gis | a gis f e |
      d f f f | e f f4 | d8 e e e | f e e4 |
    } 
  }

  accordiE = \chordmode{
    \repeat volta 2{
      d2:m | d2:m | gis2:dim7 | a2:7 |
      d2:m | d2:m | e2:7 | a2:7 |
    }
  }

  bassoE = {
    d'4 a | d a | gis gis | a e |
    d'4 a | d a | e gis | a e |
  }
% }}}

% LYRICS {{{
testoCompleto=\markup {
  \vspace #2
  \fill-line {
    \column {
      \line {RIT:}
      \vspace #1
      \line {Lumbaj, lumbaj, lumbalaj, ajde ajde ajde,}
      \line {Lumbaj, lumbaj, lumbalaj, ajde ajde ajde.}
    }
  }
}
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \mark \default
  \temaB \break
  \mark \default
  \temaC \break \bar "||"
  \mark \default
  \temaD \break
  \mark \default
  \temaE
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
    \accordiC
    \accordiD
    \accordiE
  }
}

basso = \relative c {
  \bassoA 
  \bassoB
  \bassoC 
  \bassoD 
  \bassoE
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

bassoPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "bass"
} { \clef "bass" \global \basso }

scoreContent = << 
  \chordsPart
  \temaPart
  \bassoPart
>>
%}}}

% {{{ BOOKS
  \book{
    \bookOutputSuffix "C"
    \score {
      \scoreContent
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4) } }
    }
    \testoCompleto
  }

  \book{
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
    \testoCompleto
  }
% }}}
