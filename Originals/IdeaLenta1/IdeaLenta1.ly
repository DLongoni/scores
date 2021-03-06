% {{{ PARAMETRI
  myTitle = "Idea Lenta 1"
  myFname = "IdeaLenta1"
  myKey = \key bes \major
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
      bes8. c16 d2 \tuplet 3/2 {c8 a g} | f2. r8 g16 a |
      bes8. g16 a8. f16 g8 ees d4~ | d2 r2 |
    }
  }

  accordiA = \chordmode{
    ees2.:maj7 f4 | g1:m7 | c4:m7 d4:m7 ees4 bes4:maj7 | bes1:maj7 |
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
