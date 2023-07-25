% {{{ PARAMETRI
  myTitle = "MorescaNuziale"
  myFname = "MorescaNuziale"
  myKey = \key c \major
  myTime = \time 3/4
  myTempo =  #(ly:make-moment 70 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
    \partial 2 a8 b c d | 
    \repeat volta 2{
      e e, c' e d b | c a e c' b g | a b c b c b | 
    }
    \alternative{
      { a g a b c d | }
      { a g d' c b c | }
    }
  }

  accordiA = \chordmode{
    \partial 2 s2 |
      \repeat volta 2{
        c2 g4 | a2:m e4:m | f4. e4.:m | 
      }
      \alternative{
        { a2:m g4 | }
        { a4:m d4:m e4:m | }
      }
    }

% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2{
      a8 f a b c e | d r d d c b | c b a b c b | 
    }
    \alternative{
      { a g d' c b c | }
      { a g a b c d | }
    }
  }

  accordiB = \chordmode{
      \repeat volta 2{
        f2 c4 | d2.:m | f4. e4.:m |
      }
      \alternative{
        { a4:m d4:m e4:m | }
        { a2.:m | }
      }
    }

% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2{
      d4 b8 e e e | d4 b8 e e e | f e d e d c | b g a b c g | \break
    }
    \repeat volta 2{
      d'8 g, b e g, e' | d g, d' g, e' g, | f' e d e d c | b g a b c g | \break
    }
    \repeat volta 2{
      d'8 g,16 a b8 c d e | d8 g,16 a b8 c d e | f e d e d c |
    }
    \alternative{
      { b g a b c g | }
      { b8 g a b c d | }
    }
  }

  accordiC = \chordmode{
      \repeat volta 2{
        g2 c4 | g2 c4 | f4. c4. | g2. |
      }
      \repeat volta 2{
        g2 c4 | g2 c4 | f4. c4. | g2. |
      }
      \repeat volta 2{
        g2 c4 | g2 c4 | f4. c4. | 
      }
      \alternative{
        { g2. |}
        { g2. |}
      }
    }

% }}}

% {{{ PARTE Coda
  temaCoda = {
    \repeat volta 2{
      a8 f a b c e | d r d d c b |
    }
    \alternative{
      { c b a b c b | a g d' c b c | }
      { c8 b a b4 g8 | }
    }
    \repeat volta 3 { a8 r a a g b | c b a b4 g8 | }
    a2. |
  }

  accordiCoda = \chordmode{
      \repeat volta 2{
        f2 c4 | d2.:m |
      }
      \alternative{
        { f4. e4.:m | a4:m d4:m e4:m | }
        { f4. g4. | }
      }
      \repeat volta 3 { a2.:m | f4. g4. | }
      a2.:m |
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
  \mark \markup { \musicglyph #"scripts.coda" }
  \temaCoda \break
  \bar "|."
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
    \accordiC
    \accordiCoda
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

scoreC = <<
  \chordsPart
  \temaPart
>>

scoreBb = <<
  \transpose c d { \chordsPart }
  \transpose c d { \temaPart}
>>
%}}}

% {{{ BOOKS
  \book{
    \bookOutputName \myFname
    \markup { \vspace #1 }
    \bookOutputSuffix "C"
    \header{ composer="C" }
    \score {
      \scoreC
      \layout {
        indent = #0
      }
    }
  }

  \book{
    \bookOutputName \myFname
    \markup { \vspace #1 }
    \bookOutputSuffix "Bb"
    \header{ composer="Bb" }
    \score {
      \scoreBb
      \layout {
        indent = #0
      }
    }
  }
% }}}
