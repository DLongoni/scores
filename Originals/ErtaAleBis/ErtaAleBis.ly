% {{{ PARAMETRI
  myTitle = "Erta Ale Bis"
  myFname = "ErtaAleBis"
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
    \repeat volta 2{
      d'4. ees8 d f~ f ees d ees d c |
      bes4 d8 ees d g ees4 d8 c bes d |
    }
  }

  accordiA = \chordmode{
    \repeat volta 2{
      bes2. f2. | g1:m g2:m |
    }
  }

  bassoA = {
    \repeat volta 2{
      bes4. d f, a | g4 g8~ g8 bes d g,4 g8~ g8 bes d |
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
