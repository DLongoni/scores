% {{{ PARAMETRI
  myTitle = "Daichovo Horo"
  mySubTitle = "Bulgarian"
  myKey = \key d \major
  myTime = \time #'(2 2 2 3) 9/8
  myTempo =  #(ly:make-moment 100 4)
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
  oddFooterMarkup = \markup {
    \fill-line {
      \on-the-fly \print-page-number-check-first
      \fromproperty #'page:page-number-string
    }
  }
  evenFooterMarkup = \oddFooterMarkup
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
fakeBar = {  
  \bar""
  \cadenzaOn
  \once \omit Score.TimeSignature
  \time 1/16
  
    \bar ":|."
  s16  
  \cadenzaOff
  \once \omit Score.TimeSignature
  \myTime
}
struttura = \markup {
  \column {
    \line {
      (\bold{A}, \bold{B}, \bold{A}, \bold{B}), \bold{A...H}, (\bold{A}, \bold{B})
    }
  }
}
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2 {
      cis8 d~ d cis~ cis b d cis b | a4 a8 b a g fis4 d8 | cis'8 d~ d cis~ cis b d cis b | a4~ a4 a a4. |
      cis8 d~ d cis~ cis b d cis b | a4 a8 b a g fis4 d8 | fis8 g~ g fis~ fis g g fis e | d4 d8 a d a d4. |
    } 
  }

  accordiA = \chordmode{
    \repeat volta 2{
      g1*9/8 | d1*9/8 | g1*9/8 | d1*9/8 | g1*9/8 | d1*9/8 | a1*9/8:7 | d1*9/8 |
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      g4 g a8 b b4 a8 | a4 a8 b a g fis4 d8 | g4 g a8 b b4 b8 | a4~ a a a4. | \break
      g4 g a8 b b4 a8 | a4 a8 b a g fis4 d8 | fis8 g~ g fis~ fis g g fis e | 
    }
    \alternative{
      {d4 d8 a d a d4. |}
      {d4 d8 a d e fis g a |}
    }
  }

  accordiB = \chordmode{
    \repeat volta 2{
      g1*9/8 | d1*9/8 | g1*9/8 | d1*9/8 | g1*9/8 | d1*9/8 | a1*9/8:7 |
    }
    \alternative{
      { d1*9/8 |}
      { d1*9/8 |}
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \key g \major
    \bar ".|:"
    \repeat volta 2 {
      b8 c~ c b~ b a c b a | g4 g8 d g a b4 g8 | b c~ c b~ b a c b a | g4 g8 d g g g4. |
    } 
    \mark \markup {"4x"}
    \fakeBar 
  }

  accordiC = \chordmode{
    \repeat volta 2{
      d1*9/8:7 | g1*9/8 | d1*9/8:7 | g1*9/8 |
    }
    \fakeBar 
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2 {
      b4 b cis8 d d4. | d8 e c4 c8 b a4 g8 | b4 b c8 d d c b | c4~ c c c b8 |
      b4 b cis8 d d4. | d8 e c4 c8 b a4 g8 | a b b4 g4 a8 bes g | 
    }
    \alternative{
      {a4~ a a a g8|}
      {a4~ a4 a a4.|}
    }
  }

  accordiD = \chordmode{
    \repeat volta 2{
      g1*9/8 | d1*9/8:7 | g1*9/8 | d1*9/8:7 | g1*9/8 | d1*9/8:7 | a1*9/8:7 |
    }
    \alternative{
      { d1*9/8 |}
      { d1*9/8 |}
    }
  }
% }}}

% {{{ PARTE E
  temaE = {
    \bar ".|:"
    \repeat volta 4 {
      g8 d a' bes g d a' bes4 | g8 d a' bes cis4 bes8 a g | a bes cis d d cis bes a g | a4 g8 fis g d g4. | \break
      g8 d a' bes g d a' bes4 | g8 d a' bes cis4 bes8 a g | a4 g8 fis fis d e f d | \noBreak e4 e e e4. |
    } 
    a8 b~ b4 b b4. | b4 b8 b b4 b4. |
  }

  accordiE = \chordmode{
    \repeat volta 4{
      g1*9/8:m | g1*9/8:m | g1*9/8:m | g1*9/8:m | g1*9/8:m | g1*9/8:m | g2.:m d4. |a1*9/8 |
    }
    e1*9/8 | e1*9/8 |
  }
% }}}

% {{{ PARTE F
  temaF = {
    \key d \major
    \repeat volta 2 {
      d8 cis b e, d' cis d e, e | d' cis b e, d' e b e, e | d' cis b e, d' cis b e, e | d' cis b e, d' cis b e, e |
    } 
  }

  accordiF = \chordmode{
    \repeat volta 2{
      e1*9/8 | e1*9/8 | e1*9/8 | e1*9/8 | 
    }
  }
% }}}

% {{{ PARTE G
  temaG = {
    \key d \major
    \repeat volta 2 {
      d'8 cis cis4 a8 e b'4. | a8 e cis'4 a8 e b'4. | d8 cis cis4 a8 e b'4.| a8 e cis'4 a8 e b'4. |
    } 
  }

  accordiG = \chordmode{
    \repeat volta 2{
      a1*9/8 | a2. e4. | a1*9/8 | a2. e4. | 
    }
  }
% }}}

% {{{ PARTE H
  temaH = {
    \repeat volta 2 {
      cis8 e, b' a cis e, b'4 a8 | cis8 e, b' a cis d e a, a | cis8 e, b' a cis e, b'4 a8 |
    }
    \alternative{
      {cis4 b8 a a e a4. |}
      {a4 g8 fis fis a, e'4 d8| }
    }
    d4~ d d d4. | d4~ d4~ d4~ d4. | 
  }

  accordiH = \chordmode{
    \repeat volta 2{
      a1*9/8 | a1*9/8:7 | a1*9/8 | 
    }
    \alternative{
      {a2 e4 a4.|}
      {a2 e4 a4.|}
    }
    d1*9/8 | d1*9/8 | 
  }
% }}}

% LYRICS {{{
testoCompleto=\markup { }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \mark \default
  \temaB \break \bar "||"
  \mark \default
  \temaC \break 
  \mark \default
  \temaD \break \bar "||"
  \mark \default
  \temaE \break \bar "||"
  \mark \default
  \temaF \break
  \mark \default
  \temaG \break
  \mark \default
  \temaH \break \bar "|."
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
    \accordiH
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
    \struttura
    \bookOutputSuffix "C"
    \score {
      \scoreContent
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 190 4) } }
    }
    \testoCompleto
  }

  \book{
    \struttura
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
    \testoCompleto
  }
   \book{
    \struttura
     \bookOutputSuffix "Eb"
     \score { \transpose ees c { \scoreContent } }
     \testoCompleto
   }
% }}}
