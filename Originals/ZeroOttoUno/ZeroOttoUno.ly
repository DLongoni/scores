% {{{ PARAMETRI
  myTitle = "081"
  myFname = "ZeroOttoUno"
  myKey = \key bes \major
  myTime = \time 4/4 
  myTempo =  #(ly:make-moment 190 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
    \partial 8. g16 c d | 
    \repeat volta 2 {
      ees16 ees r d r ees g,8 ees'16 ees r d r ees g,8 |
      ees'16 ees r d r ees g,8 bes'16 bes r a r bes d,8~ |
      d1 | r4 d8 ees \trip f4 ees d | g4 g8 a \trip bes4 a bes |
      f4 aes8 \trip g16 aes g \trip f4 ees d | f1 |
    } 
    \alternative{
      { r4 aes16 g r f ees r d c r g c d | }
      { r4 aes'16 g r f ees r d c r4 | }
    }
  }

  accordiA = \chordmode{
    \partial 8. s8. |
    \repeat volta 2{
      c1:m | c2:m aes2 | g1:m | g1:m |
      c1:m | bes1 | f2:m des2 | 
    }
    \alternative{
      { d2:dim7 g2:7 | }
      { d2:dim7 g2:7 | }
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    r16 f r f32 fes ees16 c aes f16~ f4 r16 aes r f |
    g4 r16 f aes f g bes b d g bes r a | d,4 r16 f r ees c2 | r1 |
    r16 c' r c32 ces bes16 g ees c~ c4 r16 ees r d | 
    c4 r16 c ees c d f fis a d a r c | b1 | r1 |
  }

  accordiB = \chordmode{
    des1:maj7.9.11+ | des1:7.11+ | c1:m | ees1 |
    aes1:maj7.9.11+ | aes1:7.11+ | g1 | g1 |

  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
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
