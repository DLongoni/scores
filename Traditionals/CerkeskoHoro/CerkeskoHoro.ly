% {{{ PARAMETRI
  myTitle = "Cerkesko Horo"
  mySubTitle = "Bulgarian"
  myKey = \key g \major
  myTime = \time #'(2 2 2 3) 9/8
  myTempo =  #(ly:make-moment 126 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
    d,4 g fis8 g a4 g8 | b4 c b8 g a4 g8 |
    b4 d e8 d c b a | b g a fis g4 g16 f e8 d | \break
    d4 g fis8 g a4 g8 | b4 c b8 g a4 g8 |
    b4 d e8 d c b a | b g a fis g4 g4 r8 |
  }

  accordiA = \chordmode{
    g2 d2 d8 | g4 c g d4. | g2 d2 d8 | g4 d4 g4 g4. |
    g2 d2 d8 | g4 c g d4. | g2 d2 d8 | g4 d4 g4 g4. |
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      d'4 g g g8 d e | f4 e d8 c b4 g8 | 
      b g e' d d c c b a | b g a fis g a b c cis |
      d4 g g g8 d e | f4 e d8 c b4 g8 | 
      b g e' d d c c b a | b g a fis g4 g d8 |
    } 
  }

  accordiB = \chordmode{
    g1*9/8 | g1*9/8 | g4 c g d4. | g4 d g g4. |
    g1*9/8 | g1*9/8 | g4 c g d4. | g4 d g g4. |
  }
% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2 {
      b'8 g a fis g a b16 c d8 c | b g a fis g g g16 f e8 d |
      b'8 g a fis g a b16 c d8 c | b g a fis g4 g d8 |
    } 
  }

  accordiC = \chordmode{
    \repeat volta 2{
      g4 d g g4. | g4 d g g4. | g4 d g g4. | g4 d g g4. |
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \key c \major
    \repeat volta 2 {
      g8 a16 a a e f g a8 a16 g a bes cis d e f | g e f d e cis d bes cis8 bes16 a a g e' e e g, |
      g8 a16 a a e f g a8 a16 g a bes cis d e f | g e f d e cis d bes cis8 bes16 a a8 a4 |
    } 
  }

  accordiD = \chordmode{
    \repeat volta 2{
      a2. g4.:m | g2:m a4 a4. |
      a2. g4.:m | g2:m a4 a4. |
    }
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \bar "||"
  \mark \default
  \temaB \break
  \bar "||"
  \mark \default
  \temaC \break 
  \mark \default
  \temaD 
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
    \accordiC
    \accordiD
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

scoreContent = << 
  \chordsPart
  \temaPart
>>
%}}}

% {{{ BOOKS
  \book{
    \bookOutputSuffix "C"
    \score {
      \scoreContent
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 190 4) } }
    }
  }

  \book{
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
  }
% }}}
