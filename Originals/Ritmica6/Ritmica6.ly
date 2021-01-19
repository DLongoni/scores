% {{{ PARAMETRI
  myTitle = "Ritmica 6"
  myFname = "Ritmica6"
  myKey = \key c \major
  myTime = \time 6/4 
  myTempo =  #(ly:make-moment 60 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2{
      r16 e8 e16 e8 r8 r16 e8 e16 e8 g b,16 b32 b b16 d b8 r |
      r16 e8 e16 e8 r8 r16 e8 e16 e8 g b,16 b32 b b16 d b8 r |
    }
  }

  accordiA = \chordmode{
    e2.:m c4 g2 | c1 e2:m | 
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
