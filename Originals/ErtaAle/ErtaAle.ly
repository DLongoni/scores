% {{{ PARAMETRI
  myTitle = "Erta Ale"
  myFname = "ErtaAle"
  myKey = \key bes \major
  myTime = \time 12/8 
  myTempo =  #(ly:make-moment 60 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
    \partial 4 ees8 d
    \repeat volta 2{
      g,4 c8 ees d g ees4 d8 c bes d~ |
      d4. ees8 d f~ f ees d ees d g,|
      R1*12/8 |
      r2. r4. r8 ees'8 d |
    }
  }

  accordiA = \chordmode{
    \partial 4 s4
    \repeat volta 2{
      g1*12/8:m | bes2. f 2. | g1*12/8:m | g1*12/8:m |
    }
  }

  bassoA = {
    \partial 4 s4
    \repeat volta 2{
      g4 bes8 r c d g,4 bes8 r c d |
      bes4. c4. f,4. r8 a c |
      g4 bes8 r c d g,4 bes8 r c d |
      g,4 bes8 r c d g,4 bes8 r c d |
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
