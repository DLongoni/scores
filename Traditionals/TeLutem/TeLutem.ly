% {{{ PARAMETRI
  myTitle = "Te Lutem"
  myKey = \key ees \major
  myTime = \time 4/4 
  myTempo =  #(ly:make-moment 130 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2 {
      g16 aes8 b16~ b16 c d8 d16 ees8 f16~ f16 g aes f |
      g4. f16 ees d2 |
    } 
  }

  accordiA = \chordmode{
    \repeat volta 2{
      g1:7 | g1:7 |
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 4 {
      ees16 d c d c8 c16 c  d16 c b c b8 b16 b | 
      c16 b aes g aes8 aes16 aes g aes b c d4 |
    } 
  }

  accordiB = \chordmode{
    \repeat volta 4{
      c2:m g2:7 | f2:m g2:7 |
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2 {
      ees1 | ees8 ees16 d d8 d16 c c8 c8 c16 bes bes c |
      d1 | d8 d16 c16 c8 c16 bes bes8 bes bes16 aes aes bes |
      c1 | c8 c16 bes bes8 bes16 aes aes8 aes aes16 g g aes |
      bes2~ bes8 bes16 c d8 bes| aes2~ aes8 aes16 bes c8 aes |
    } 
    \alternative{
      { g2~ g16 g f g aes b c d |}
      { g1 |}
    }
  }

  accordiC = \chordmode{
    \repeat volta 2{
      c1:m | f1 | bes1 | bes1 | 
      aes1 | aes1 | g1:m | f1:m |
    }
    \alternative{
      { g1 |}
      { g1 |}
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2 {
      g8^"Solo" b f d aes16 g f g r4 |
      g8 b f d aes16 g f g r4 |
    } 
  }

  accordiD = \chordmode{
    \repeat volta 2{
      g1 | g1 |
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
  \temaD 
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
    \accordiC
    \accordiD
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
