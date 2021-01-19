% {{{ PARAMETRI
  myTitle = "MaggioreVeloce"
  myFname = "MaggioreVeloce"
  myKey = \key ees \major
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
      \time 4/4
      ees16 d c bes r bes aes g f8 ees~ ees4 |
      \time 5/4
      ees16 f8 g16 r c16 bes8 ees16 ees8 ees16 r d c bes~ bes8 r8 | \break
    }

    \repeat volta 2{
      \time 4/4
      ees16 d~ d8~ d8 g,16 bes~ bes4 r16 c bes ees, |
      g8. f16~ f2 r4 |
      \time 5/4
      ees16 ees8 g16 r c bes8 ees16 ees8 ees16 r d c bes~ bes4 | \break
    }

    \repeat volta 2{
      \time 3/4
      ees16 d c bes~ bes aes8 bes16 aes g f8 | 
      ees2 ees16 ees8 g16~ |
      g16 c8 bes16~ bes aes g8 f4 |
      ees'16 ees8 ees16~ ees d c bes~ bes4 |
    }
  }

  accordiA = \chordmode{
    \repeat volta 2{
      s1 |
      s4 s1 |
    }

    \repeat volta 2{
      s1 | s1 |
      s1 s4 |
    }

    \repeat volta 2{
      \time 3/4
      ees2. | aes2. | g4:m f2:m | bes2. |
    }
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
