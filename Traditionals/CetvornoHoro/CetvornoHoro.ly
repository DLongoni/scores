% {{{ PARAMETRI
  myTitle = "Cetvorno Horo"
  mySubTitle = "Bulgarian"
  myKey = \key bes \major
  myTime = \time #'(3 2 2) 7/16 
  myTempo =  #(ly:make-moment 120 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2 {
      g8 d16 fis g a bes | g bes bes a8 bes16 a | g8 a16 bes d c8 | \break
      bes16 a g fis g a bes | g bes bes a8 bes16 a |
    } 
    \alternative{
      { g8 g16 g8 r8 }
      { g8 g16 g8\staccato g16 a }
    }
  }

  accordiA = \chordmode{
    \repeat volta 2{
      g8.:m g8:m d8:7 | g8.:m c8:m d8:7 | g8.:m g8:m c8:m |
      g4.:m g16:m | c8.:m c8:m d8:7 | 
    }
    \alternative{
      { g1*7/16:m }
      { g1*7/16:m }
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      bes8 f16 bes d c8 | a8 f16 a c bes8 | g8 d16 g bes a8 | g d16 e fis g a | \break
      bes8 f16 bes d c8 | a8 f16 a c bes8 | g8 d16 g bes a8 |
    } 
    \alternative{
      { g8 d16 g8\staccato g16 a }
      { g8 d16 g16 d bes' a }
    }
  }

  accordiB = \chordmode{
    \repeat volta 2{
      bes8. bes8 ees8 | f8. f8 d8:7 | g8.:m c8:m d8:7 | g1*7/16:m |
      bes8. bes8 ees8 | f8. f8 d8:7 | g8.:m c8:m d8:7 |
    }
    \alternative{
      { g1*7/16:m }
      { g1*7/16:m }
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2 {
      g16 fis g a bes g bes | a8 g16 a c bes a | bes8 a16 g d g d| \break
      g16 fis g a bes g bes | a8 g16 a c bes a | 
    } 
    \alternative{
      { bes8 a16 g d g8\staccato }
      { g8 g16 g8 r8 }
    }
  }

  accordiC = \chordmode{
    \repeat volta 2{
     g1*7/16:m | c8.:m d4:7 | g1*7/16:m |
     g1*7/16:m | c8.:m d4:7 | 
    }
    \alternative{
      { g1*7/16:m }
      { g1*7/16:m }
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \key g \major
    \repeat volta 2 {
      cis16 d d cis d cis d | e8 d16 d c b8 | d8 c16 c b a8 | c8 b16 b a g d | \break
      cis'16 d d cis d cis d | e8 d16 d c b8 | d8 c16 c b a8 | c8 b16 b a g8\staccato | 
    } 
  }

  accordiD = \chordmode{
    \repeat volta 2{
       g1*7/16 | g1*7/16 | d1*7/16:7 | d8.:7 g4 |
       g1*7/16 | g1*7/16 | d1*7/16:7 | d8.:7 g4 |
    }
  }
% }}}

% {{{ PARTE E
  temaE = {
    \repeat volta 2 {
      g16 fis g a b g b | a8 d,16 a' b c d | b8 d,16 a'8 b16 a | g8 r16 d' e d8 |\break
      g,16 fis g a b g b | a8 d,16 a' b c d | b8 d,16 a'8 b16 a | g8 d16 g8\prall g\staccato |
    } 
  }

  accordiE = \chordmode{
    \repeat volta 2{
       g1*7/16 | d1*7/16:7 | g8. c8 d8:7 | g8. d4:7 |
       e1*7/16:m | a8.:m d4:7 | g8. c8 d8:7 | g1*7/16 |
    }
  }
% }}}

% {{{ PARTE F
  temaF = {
    \repeat volta 2 {
      a8 e16 a b c a | b8 g16 a g fis e | a8 e16 a b c a | b8 g16 a8 a16 e16 |
      a8 e16 a b c a | b8 g16 a8 a16 b | c8 b16 d8 c16 b16 | a8 e16 a8 r |
    } 
  }

  accordiF = \chordmode{
    \repeat volta 2{
      a1*7/16:m | e8.:m a4:m | a1*7/16:m | e8.:m a4:m |
      a1*7/16:m | e8.:m a4:m | f8. d8:m e8:7 | a1*7/16:m |
    }
  }
% }}}

% {{{ PARTE G
  temaG = {
    \repeat volta 2 {
       b8 d,16 b' c a8 | b16 c a b c a8 | d16 d, d b' c b8 | a16 b a a g g d | \break
       b'8 d,16 b' c a8 | b16 c a b c a8 | d16 d, d b' c b8 | a16 b a a g g8\staccato |
    } 
  }

  accordiG = \chordmode{
    \repeat volta 2{
      g8. g8 d8:7 | g8. g8 d8:7 | g8. g8 e8:m | a8.:m d8:7 g8 |
      g8. g8 d8:7 | g8. g8 d8:7 | g8. g8 e8:m | a8.:m d8:7 g8 |
    }
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break 
  \mark \default
  \temaB \break 
  \mark \default
  \temaC \break 
  \mark \default
  \temaD \break 
  \mark \default
  \temaE \break 
  \mark \default
  \pageBreak
  \temaF \break 
  \mark \default
  \temaG \break 
  \bar "|."
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
    \accordiC
    \accordiD
    \accordiE
    \accordiF
    \accordiG
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
    \bookOutputSuffix "C"
    \score {
      \scoreContent
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 190 4) } }
    }
  }

  \book{
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
  }
% }}}
