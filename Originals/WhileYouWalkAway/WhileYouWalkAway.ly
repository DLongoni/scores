% {{{ PARAMETRI
  myTitle = "While You Walk Away"
  mySubTitle = ""
  myKey = \key d \minor
  myTime = \time #'(3 2) 5/8
  myTempo =  #(ly:make-moment 190 4)
  struttura = \markup {
    \column {
      \line {\bold{Intro} Gtr+Fisa, \bold{A}x3 Tr, \bold{B}x4, \bold{C}x4}
      \line{\bold{D}x2, \bold{Solo} su D \bold{D}x2 solo prima metà Fisa+Tr, \bold{A}x4}
    }
  }
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

\paper{
  system-system-spacing =
    #'((basic-distance . 10) 
       (minimum-distance . 5)
       (padding . 5)
       (stretchability . 60)) 
}

\layout { indent = #0   
}
%}}}

% {{{ PARTE Intro
  % silenzioIntro = {
  %   \mark "Vamp"
  %   \repeat volta 2 {s1*5/8 | s1*5/8 |}
  %   s1*5/8 | s1*5/8 |
  % }
  %
  % accordiIntro = \chordmode{
  %   \repeat volta 2 {d1*5/8:m | a1*5/8:m |}
  %   a1*5/8:m | a1*5/8:m |
  % }
% }}}

% {{{ PARTE A
  temaA = {
    R1*5/8 | R1*5/8 |
    \repeat volta 2 {
      a4 f'8 e c'| a4.~ a8 c | g4 f8 bes a | f4.~ f4 |\break
      a,4 f'8 a g | 
    } 
    \alternative{
      {e4.~ e4 | d8 d d f f | d4.~ d4 |}
      {e4.~ e8 f16 g | c4 b8 c b16 g | a4.~ a4 |}
    }

  }

  accordiA = \chordmode{
    a1*5/8:m | a1*5/8:m |
    \repeat volta 2 {
      f4.~ f4 | a4.:m/e~ a4:m/e | ees4.~ ees4 | bes4.:/d~ bes4:/d |
      f4.~ f4 |
    } 
    \alternative{
      {c4. c4 | g4. d4:m | d4.:m d4:m |}
      {c4. c4 | g4. g4 | a4.:m a4:m }
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      r8 d, \tuplet 3/2 {a'8 a a} \tuplet 3/2 {g8~ g f} \tuplet 3/2 {g f e} |
      \tuplet 3/2 {f8~ f e~} \tuplet 3/2 {e~ e d} \tuplet 3/2 {e d c} \tuplet 3/2 {a~ a d~} |
      d2 r2 | r1 |
    } 
  }

  accordiB = \chordmode{
    d2:m a2:m | d2:m c2 |
    d2:m a2:m | d2:m c2 |
  }
% }}}

% {{{ PARTE C
  temaC = {
    <b e>16 <c f> <a d> <f c'> r <d a'> <e b'>8~ <e b'>2 |
    r4 <b' e>16 <c f> <a d> <f c'>~ <f c'> <d a'> <e b'> <f c'> <b d> <c f> <a e'>8~ | 
    <a e'>2 r2 |
  }

  accordiC = \chordmode{
    d2:m a2:m | d2:m a2:m | d2:m a2:m |
  }
% }}}

% {{{ PARTE D
  temaD = {
    b'16 c a f r d e4~ | e4. r4 | b'16 c a f~ f d e f b c | a4.~ a4 |
  }

  accordiD = \chordmode{
    d4.:m d4:m | a4.:m a4:m | d4.:m d4:m | a4.:m a4:m |
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \mark \default
  \time 4/4
  \temaB \break
  \mark \default
  \temaC \break 
  \mark \default
  \time 5/8
  \temaD \break \bar "|."
}

temaBb = \relative c {
  \mark \default
  \temaA \break
  \mark \default
  \time 4/4
  \temaB \break
  \mark \default
  \relative c'{\temaC} \break 
  \mark \default
  \time 5/8
  \temaD \break \bar "|."
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \time 5/8
    \accordiB
    \accordiC
    \accordiD
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

temaPartBb = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \temaBb }

scoreContent = << 
  \chordsPart
  \temaPart
>>

scoreContentBb = << 
  \transpose c d {\chordsPart}
  \transpose c d {\temaPartBb}
>>

%}}}

% {{{ BOOKS
  \book{
    \struttura
    \bookOutputSuffix "C"
    \header{ composer="C" }
    \score {
      \scoreContent
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4) } }
    }
  }

  \book{
    \struttura
    \header{ composer="Bb" }
    \bookOutputSuffix "Bb"
    \score { \scoreContentBb} 
  }
% }}}
