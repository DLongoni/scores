% {{{ PARAMETRI
  myTitle = "Idea Lenta 2"
  myFname = "IdeaLenta2"
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
      g8. ees'8. d4 ees8 f ees | d16 ees d8 g,2. |
      g'8. f8. ees8 d8. c8. b8 | 
      g8. ees'8. d4 ees8 f ees | d16 ees d8 c2. |
      r1 |
    }
  }

  accordiA = \chordmode{
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
