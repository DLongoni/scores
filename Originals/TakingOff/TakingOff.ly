% {{{ PARAMETRI
  myTitle = "Taking Off"
  myFname = "TakingOff"
  myKey = \key c \major
  myTime = \time #'(3 2 2) 7/8 
  myTempo =  #(ly:make-moment 190 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
    \partial 1*5/8 e,8 a a b c |
    \repeat volta 2 {
      b4 bes8 b a g b | c4 g8 r8 c d e | 
      f e d d e f g | e4. r4 d8 e | \break
      f4 f8 a4 f | e d8 c4 e8 a |
      gis4 f8 e4 e8 b | c4 e,8 a a b c | \break
      b4 bes8 b a g b | c4 g8 r8 c d e | 
      f e d d e f g | e4. r4 d8 e |  \break
      f4 f8 a4 f | e d8 c4 c8 e |
      d4 d8 d e c b | 
    } 
    \alternative{
      { a4 e8 a a b c | }
      { \time 2/4 a4 r4 | }
    }
  }

  accordiA = \chordmode{
    \partial 1*5/8 s1*5/8 |
    \repeat volta 2{
      g1*7/8 | c1*7/8 | g1*7/8 | c1*7/8 |
      d1*7/8:m | c1*7/8 | e1*7/8:7 | a4.:m d2:7 |
      g1*7/8 | c1*7/8 | g1*7/8 | c1*7/8 |
      d1*7/8:m | c1*7/8 | e1*7/8:7 |
    }
    \alternative{
      { a4.:m d2:7 | }
      { \time 2/4 a4:m a4:7 | }
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \time 2/4
    \repeat volta 2 {
      fis'8 fis16 e d e fis a | gis8 gis16 fis e fis gis a |
      b c b8 b16 c b8 | b16 c b8 gis a |
      fis8 fis16 e d e fis a |g8~ g16 a bes a g8 | 
      fis16 g fis ees a g fis ees |
    } 
    \alternative{
      { \trip fis g fis \trip ees d c a4 | }
      { \time 1/4 \trip fis'16 g fis \trip ees d c | \time 7/8 a4 d,8 a' a b c | }
    }
  }

  accordiB = \chordmode{
    \time 2/4
    \repeat volta 2{
      d2 | e2 | a2:m | a4:m a4 |
      d2 | g2:m | c2:m |
    }
    \alternative{
      { fis4:m7.5- d8 a8 |}
      { \time 1/4 fis4:m7.5- | \time 7/8 d4.:7 d2:7 | }
    }
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \bar "||"
  \mark \default
  \temaB \break
  \bar "|."
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
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
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 190 4) } }
    }
  }

  \book{
    \bookOutputName \myFname
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
  }
% }}}
