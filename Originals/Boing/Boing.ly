% {{{ PARAMETRI
  myTitle = "Boing"
  myFname = "Boing"
  mySubTitle = ""
  myKey = \key c \major
  myTime = \time 4/4 
  myTempo =  #(ly:make-moment 190 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
      r8 c b c d r16 c b8 c | 
      g8 r <e g c>4 <fis b dis>4 <fis a dis>4 |
      r8 c' b c d r16 c b8 c | 
      g8 r <e a c>4 <fis a dis>4 <e g e'>4 |
      fis4 g <f a des> <e a c> | 
      fis8 e g gis <fis a e'>4. <g b d>8 |
      <a d fis>2 r2 |
  }

  accordiA = \chordmode{
    s1 | s1 | s1 | s1 | s1 | s1 | s1 |
  }

  bassoA = {
    c1 | c8. a'16 g8. c16 b4 a |
    c,1 | c8. a'16 g8. c16 b4 c |
    r2 b,4 c | r8 c d cis e4. g8 | b,2 r2 |
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \bar "|."
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
  }
}

bassoPart = \new Staff {
  \clef "bass"
  \global
  \relative c {\bassoA}
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

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
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 190 4) } }
    }
  }

  \book{
    \bookOutputName \myFname
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
  }
% }}}
