% DEFINIZIONI {{{
myTitle = "Jurjuna"
myFname = "Jurjuna"
mySubTitle = "Sufi Traditional"
myKey = \key b \minor
myTime = \time #'(3 2 2 3) 10/8
myTempo =  #(ly:make-moment 70 4)
%}}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

tema = {
  \repeat volta 2 {
    r4 a8 b4 b c b8 |
    d4 e8 c4 b b4.~ |
    b4 d8 e4 e e d8 |
    e4 fis8~ fis8 e e d e4.| \break
  }
  r4 d8 e4 e8 fis d4 cis8|
  d4 e8 c b c b c4 b8|
  b4 d8 e4 e8 fis d4 cis8|
  d4 e8 c4 b b4.|\bar"||" \break

  r4 a8 b4 b c b8 |
  fis'4 e8 e d e fis d4 c8|
  b4 d8 e4 e8 fis d4 cis8|
  d4 e8 c4 b b4.|\bar"||" \break

  r4 g'8 fis e e d e4 cis8 |
  d4 e8 cis e d e c4 b8 |
  b4 g'8 fis e e d e4 cis8 |
  d4 c8 b a cis d e4.~ |\bar"||" \break

  e4 g8 fis e e d e4 cis8 |
  d4 e8 cis e d e c4 b8 |
  b4 b'8 a g fis e d4 cis8 |
  d4 e8 c4 b b4.| \bar"|."
}

accordi = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    b4.:m b4:m b4:m b4.:m |
    b4.:m b4:m b4:m b4.:m |
    b4.:m b4:m b4:m b4.:m |
    b4.:m b4:m b4:m b4.:m |
  }
}

% SCORE {{{
tema = \relative c' {
  \global 
  \tema
}

chordsPart ={
  \new ChordNames {
    \accordi
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \tema }

scoreC = <<
  \chordsPart
  \temaPart
>>

\book{
  \bookOutputName \myFname
  \bookOutputSuffix "C"
  \score {
    \scoreC
    \layout { indent = #0 }
  }
}

\book{
  \bookOutputName \myFname
  \bookOutputSuffix "Bb"
  \score {
    <<
      \transpose c d { \chordsPart }
      \transpose c d { \temaPart}
    >>
    \layout { indent = #0 }
  }
}

\book{
    \bookOutputName \myFname
    \bookOutputSuffix "Eb"
    \header{ composer="Eb" }
    \score { \transpose ees c { \scoreC } }
  }

% }}}
