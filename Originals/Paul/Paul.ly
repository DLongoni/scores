% {{{ PARAMETRI
  myTitle = "Valle de Paul"
  myFname = "Paul"
  myKey = \key f \major
  myTime = \time 5/4 
  myTempo =  #(ly:make-moment 60 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2{
      a'4 r8 d f2 \trip e8 bes d | a4 r c e16 d f c g4 |
    }
  }

  accordiA = \chordmode{
    \repeat volta 2{
      d1:m g4:m | a1:m c4 |
    }
  }

  bassoA = {
    \repeat volta 2{
      d8 d r d d4 r g | a,8 a r a a4 r c8 c |
    }
  }
% }}}

% SCORE {{{
tema = \relative c {
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

bassoPart = \new Staff {
  \clef "bass"
  \global
  \relative c {\bassoA}
}
scoreContent = << 
  \chordsPart
  \temaPart
  \bassoPart
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
