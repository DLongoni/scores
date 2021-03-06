% {{{ PARAMETRI
  myTitle = "Tema Veloce"
  myFname = "TemaVeloce"
  myKey = \key f \major
  myTime = \time 4/4 
  myTempo =  #(ly:make-moment 130 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2{
      r1 |
      \time 6/4
      r16 a' c cis d e g f~ f e d c bes a des bes~ bes aes g ees des g bes c |
      \time 4/4
      a1 |
    }
  }

  accordiA = \chordmode{
    \repeat volta 2{
      fis2:m7 fis8:m7 a4.:m7 |
      ees4:m9/bes ees4:9 d4:m7 d4:m7/a ees4:m7 a4:m7 |
      fis2:m7 fis8:m7 a4.:m7 |
    }
  }

  bassoA = {
    \repeat volta 2{
      fis,16 fis r fis r4 r8 a8~ a4 |
      bes4 ees d a ees' a, |
      fis16 fis r fis r4 r8 a8~ a4 |
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
