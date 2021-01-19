% {{{ PARAMETRI
  myTitle = "Simien"
  myFname = "Simien"
  myKey = \key c \major
  myTime = \time 4/4 
  myTempo =  #(ly:make-moment 60 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2{
      \time 6/4
      c16 e r c~ c8 d~ d4 e16 a r g~ g8 f16 e d8. d16 |
      \time 4/4
      e d e d ees d c8~ c4. c16 b | a1 |
    }
  }

  accordiA = \chordmode{
    c2:maj7 g2 d2:m7 | c4.:maj7 f8:7~ f2:7 | a1:m7 |
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
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
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 90 4) } }
    }
  }
% }}}
