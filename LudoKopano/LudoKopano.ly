% {{{ PARAMETRI
  myTitle = "Ludo Kopano"
  mySubTitle = "Bulgarian"
  myKey = \key c \major
  myTime = \time #'(2 2 3 2 2) 11/8
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
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2 { b8 c d c d4 d8 g a a g | g f g a f g4 d d8 c | g f g a f g4 f8 e d e |}
    \alternative{
      {f d e c d4. d4 d8 g, |}
      {f' d e c d4. d4 r4 |}
    }
  }

  accordiA = \chordmode{
    \repeat volta 2  { g4 d4 g4. g2 | d1*11/8:m | c1*11/8 | }
    \alternative {
      {c4 a4 d4.:m d2:m |}
      {c4 a4 d4.:m d2:m |}
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      f8 g g f f g4 f8 e d c | f g g f a g4 f8 e d4 | f8 g g f f g4 f8 e d e | f8 d e c d4. d4 r4 |
    } 
  }

  accordiB = \chordmode{
    \repeat volta 2{
      g1*11/8:m | g2:m d4.:m d2:m | g1*11/8:m | d4:m a4 d4.:m d2:m |
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2 {
      c'4 b8 c d c b a4 a8 g | g4 a8 b c b c d4 r4 | c4 b8 c d c b a4 a8 g | f8 e d c c d e d4 r 4|
    } 
  }

  accordiC = \chordmode{
    \repeat volta 2{
      a1*11/8:m | d1*11/8 |  a1*11/8:m | d4:m a4 d4.:m d2:m |
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2 {
      f4 e c8 d4 g g8 a | f4 e c8 d4 a'8 g f g | f4 e c8 d4 g g8 a| f4 e c8 d e d4 r4 |
    } 
    g8 a8~ a4 ~ a4.~ a2~ | a2~ a4. r2 |
  }

  accordiD = \chordmode{
    \repeat volta 2{
      d1*11/8:m | d1*11/8:m | d1*11/8:m | d1*11/8:m | 
    }
    d1*11/8:m | d1*11/8:m | 
  }
% }}}

% {{{ PARTE E
  temaE = {
    \repeat volta 2 {
      g8 a a f a g f e d e f | g a a f a g f e d a' d, | g a a f a g f e d e f | g a a f a g f e c d4 |
    } 
  }

  accordiE = \chordmode{
    \repeat volta 2{
      s1*11/8 | s1*11/8 | s1*11/8 | s1*11/8 | 
    }
  }
% }}}

% {{{ PARTE F
  temaF = {
    \repeat volta 2 {
      d'8 c b a c b a b g a f | g a a f a g f e d a'4 | d8 c b a c b a b g a f | g a a f a g f e c d4 |
    } 
  }

  accordiF = \chordmode{
    \repeat volta 2{
      s1*11/8 | s1*11/8 | s1*11/8 | s1*11/8 | 
    }
  }
% }}}

% {{{ PARTE G
  temaG = {
    \repeat volta 2 {fis8 g a b c b d c bes a g | g f f e d4. a'8 bes a g | g f f e c4.  e8 f f e |}
    \alternative {
      { e d e f e d e c4 r4 |}
      {e8 d e c d4. r4}
    }
  }

  accordiG = \chordmode{
    \repeat volta 2 {c1*11/8 | c1*11/8 | c1*11/8 }
    \alternative{
      {c1*11/8 |}
      {c2 d4.:m s2 |}
    }
  }
% }}}

% LYRICS {{{
testoCompleto=\markup {
}
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break \bar "||"
  \mark \default
  \temaB \break
  \mark \default
  \temaC \break
  \mark \default
  \temaD \break \bar "||"
  \mark \default
  \temaE \break 
  \mark \default
  \temaF \break
  \mark \default
  \temaG \break \bar "|."
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
