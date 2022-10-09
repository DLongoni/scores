% {{{ PARAMETRI
  myTitle = "Finally Home"
  myFname = "FinallyHome"
  myKey = \key c \major
  myTime = \time 6/4 
  myTempo =  #(ly:make-moment 64 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"

struttura = \markup {
  \column {
      \line {
        \bold{Intro} 1x Gtr, 3x Gtr+Fisa, \bold{A} Tr, \bold{B} Fisa, \bold{B} Tr, 
        \bold{A} Tr}
      \line{\bold{Solo}Tr: Pedale F +\bold{C}, \bold{Solo}Fisa: Pedale F +\bold{C},
            \bold{D}, \bold{B}, \bold{A} 1/2 Fisa II voce, 1/2 Tr
    }
  }
}
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2 {
      b4 c8 d e4 \trip g8 f e f4 b, | a4 b8 c d4 \trip f8 e d e4 c |
    } 
  }

  accordiA = \chordmode{
    \repeat volta 2{
      g2 c2 d2:m | f2 g2 c2 |
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      b4 c8 d e4 \trip g8 f e f4 bes, | a4 b8 c d4 \trip f8 e d e4 c |
    } 
  }

  accordiB = \chordmode{
    \repeat volta 2{
      e2 a2:m bes2 | d2:m g2 c2 |
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2 {
      b4 c8 d e4 \trip g8 fis e fis4 b, | a4 b8 c d4 \trip f8 e d e4 c |
    } 
  }

  accordiC = \chordmode{
    \repeat volta 2{
      g2 c2 b2:m | d2 g2 c2 |
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2 {
      b4 c8 d e4 \trip g8 f e f4 b, | a4 bes8 c d4 \trip f8 e d e4 c | \break
      bes4 c8 d e4 \trip g8 f e f4 b, | a4 b8 c d4 \trip f8 e d e4 c |
    } 
  }

  accordiD = \chordmode{
    \repeat volta 2{
      g2 c2 d2:m | f2 bes2 a2:m |
      g2:m c2 d2:m | f2 g2 c2 |
    }
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break 
  \mark \default
  \temaB \break \bar "||"
  \mark \default
  \temaC \break \bar "||"
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
    \bookOutputName \myFname
    \bookOutputSuffix "C"
    \score {
      \scoreContent
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 190 4) } }
    }
  }

  \book{
    \bookOutputName \myFname
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
  }
% }}}
