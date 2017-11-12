% {{{ PARAMETRI
  myTitle = "Hora Moldoveneasca"
  mySubTitle = "Romanian - Moldavian"
  myKey = \key f \major
  myTime = \time 2/4 
  myTempo =  #(ly:make-moment 190 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"

\header {
  title = \myTitle
  composer = \mySubTitle
}

\paper{
  print-first-page-number = ##t
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  #(set-global-staff-size 10)
  myStaffSize = #20
  fonts = #(make-pango-font-tree
  "FontAwesome"
  "FontAwesome"
  "FontAwesome"
  (/ myStaffSize 20))
}

global = {
  \myKey
  \numericTimeSignature
  \myTime
  \set Score.markFormatter = #format-mark-box-alphabet
}
\layout { indent = #0 }
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2 {
      d16 e f g a d, f a | d a bes gis a4 | b16 c8 c16 c b d c |
    } 
    \alternative{
      { c bes bes a a4 |}
      { c16 bes bes a a16 \breathe d,16 f a |}
    }
  }

  accordiA = \chordmode{
    \repeat volta 2 {
      d2:m | d2:m | c2 |
    } 
    \alternative{
      {c4:7 f4 |}
      {c4:7 f4 |}
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      cis16 d8 c16 c bes a g | fis16 g8.~ g16 f e f | fis16 g8 fis16 g a bes g | a4 a16 d, f a | 
      cis d d c c bes a g | fis16 g8.~ g16 e f g | aes g g e f a e cis |
    } 
    \alternative{
      {d16 a b cis d \breathe d f a |}
      {d16 a b cis d \breathe a bes b |}
    }
  }

  accordiB = \chordmode{
    \repeat volta 2 {
      d4:m d4:7 | g2:m | c4 c4:7 | f4 a4:7 | 
      d4:m d4:7 | g2:m | b4:7 a4:7 |
    } 
    \alternative{
      {d2:m|}
      {d2:m|}
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2 {
      c16 b d c c b d c | c b d c c bes bes a | a d8.~ d4~ | d4~ d16 c d c |
      b16 c8 c16 c b d c | c b d c c bes bes a | g bes a8~ a4~ | 
    } 
    \alternative{
      {a4~ a16 \breathe a16 bes b |}
      {a4 r4 |}
    }
  }

  accordiC = \chordmode{
    \repeat volta 2 {
      d2:m | d2:m | d2:m | d2:m | 
      c2:7 | c2:7 | f2 |
    } 
    \alternative{
      {a2:7|}
      {a2:7|}
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \bar "||"
    \key d \major
    \bar ".|:"
    d,16 fis8 fis16 fis f fis gis | a16 b8 b16 b gis a b | c a b gis a fis g e |
    \set Score.repeatCommands = #'((volta "1, 3"))
    {fis16 d fis a d c d8 |}
    \set Score.repeatCommands = #'((volta "2") end-repeat)
    {fis,4 r4|}
    \set Score.repeatCommands = #'((volta "4") end-repeat)
    {fis4 r16 gis16 a b |}
    \set Score.repeatCommands = #'((volta #f))
  }

  accordiD = \chordmode{
    d4 d4:7 | g2 | d4:7 a4:7 |  
    {d2 |}
    {d2 |}
    {d2 |}
  }
% }}}

% {{{ PARTE E
  temaE = {
    \repeat volta 2 {
      c16 b b a c b b a | a fis g e fis gis a b | c b b a a fis g e | fis d fis a d cis d8 |
      c16 b b a c b b a | a fis g e fis16 r a8~ | a16 b g a fis g e fis | d4 r4 |
    } 
  }

  accordiE = \chordmode{
    \repeat volta 2 { d2:7 | a4:7 d4 | d4:7 a4:7 | d2 | d2:7 | a4:7 d4 | a2:7 | d2 | } 
  }
% }}}

% {{{ PARTE F
  temaF = {
    \key f \major

    \repeat volta 2 {
      e16 f a f e d a d | cis d8 d16 d e f d | e f a f e d a d | 
    } 
    \alternative{
      {d a b cis d e f d |}
      {d a b cis d8 r8 |}
    }
  }

  accordiF = \chordmode{
    \repeat volta 2 {
      d2:m | d2:m | d2:m | 
    } 
    \alternative{
      {d2:m|}
      {d2:m|}
    }
  }
% }}}

% {{{ PARTE G
  temaG = {
    g16 bes d bes a g d g | fis g8 g16 g a bes g | a bes d bes a g d g | fis g8 g16 g f e d |
    e f a f e d a d | cis d8 d16 d e f d | e f a f e d a d | d a b cis d8 r8 |
  }

  accordiG = \chordmode{
    g2:m | g2:m | g2:m | g2:m | 
    d2:m | d2:m | d2:m | d2:m | 
  }
% }}}

% LYRICS {{{
testoCompleto=\markup {
}
% }}}

% SCORE {{{
tema = \relative c {
  \mark \default
  \temaA \break \bar "||"
  \mark \default
  \temaB \break \bar "||"
  \mark \default
  \temaC \break \bar "||"
  \mark \default
  \temaD 
  \mark \default
  \temaE 
  \mark \default
  \temaF \break
  \mark \default
  \temaG 
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
    \testoCompleto
  }

  \book{
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
    \testoCompleto
  }

  \book{
    \bookOutputSuffix "Eb"
    \score { \transpose ees c { \scoreContent } }
    \testoCompleto
  }
% }}}
