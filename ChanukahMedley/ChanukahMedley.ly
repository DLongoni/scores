% DEFINIZIONI {{{
\version "2.18.2"

\header {
  title = "Chanukah Medley"
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
  \key f \major
  \numericTimeSignature
  \time 2/4
  \set Score.markFormatter = #format-mark-box-alphabet
}
\layout { indent = #0 }
%}}}

% {{{ Oy Chanukah
  temaA = {
    \partial 8 d8
    a8 a a a | d a a a | a4 g8 f | g4 f | a8 a a a | d a a a | a4 g8 f | g4 f |\break
    \repeat volta 2{
      f8 g a g | f4 f8 f | g4 f8 e |
    }
    \alternative
    {
      {f2|}
      {d4 d|}
    }
    a'4 a | a d, | a' a | a d, | a' a8 a | bes4 a8 g | a2 | r2 |
    \break
    \repeat volta 2{
      a4 a8 a | bes4 a8 g | a4 a8 a | bes4 a8 g |
    }
    \alternative{
      {f4 f8 f | g4 f8 g | a2 | r2 |}
      {f4 f8 f | g4 f8 e | d2 | r2 |}
    }
    \bar "||"
  }

  accordiA = \chordmode{
    \set chordChanges = ##t
    \partial 8 s8
    d2:m | d2:m | d2:m | a4 d4:m | d2:m | d2:m | f2 | a4 d4:m |
    \repeat volta 2{
      f2 | f2 | a2 |
    }
    \alternative
    {
      { d2:m |}
      {\once \set chordChanges = ##f d2:m |}
    }
    \bar "||"
    d2:m | d2:m | d2:m | d2:m | d2:m | g2:m | d2:m | a2 |
    \repeat volta 2{
      d2:m | g2:m | d2:m | g2:m |
    }
    \alternative{
      {d2:m | a2 | d2:m | a2 |}
      {f2 | a2 | d2:m | d2:m |}
    }
  }
% }}}

% {{{ Mi Y'mael
  temaB ={
    \repeat volta 2{
      f,8 f16 c f8 g | a a16 f g8 bes | a4 c4 | a c | f,8 f16 c f8 g | a a16 f g8 bes | f4 d4 | f2 |
    }
    \break
    \repeat volta 2 {c'2~ | c4 r4 | c8 e d c | b g b d |}
    c2~ | c4 r4 | \break
    a8 c b a | g a b c | c2~ | c4 r4 | a8 c b a | g f g a | f2~ | f4 r4 |
    \bar "||"
  }

  accordiB = \chordmode{
    \set chordChanges = ##t
    \repeat volta 2{
      f2 | f4 bes4 | f4 c4 | f4 c4 | f2 | f4 bes4 | f4 bes4 | f2 |
    }
    \repeat volta 2 {c2:m | c2:m | c2:m | g2 |}
    c2:m | c2:m | f2:m | c | f2:m | f2:m | f2:m | c2 | f2:m | f2:m |
  }
%}}}

% {{{ Dreydel
  temaC ={
    \partial 8 c8
    f,8 f g g | a f4 a8 | c8 c bes a | g4. c8 | g g a a | bes8 g4 g8 | c bes a g | f4. a8 |
    c8 a c a | c a4 a8 | c8 c bes a | c4 r8 g8 | bes8 g bes8 g | bes8 g4 g8 | c8 bes a g | f4 r4 |
    \bar "||"
  }

  accordiC = \chordmode{
    \set chordChanges = ##t
    \partial 8 s8
    f4 c4 | f2 | bes2 | c2 | g2:m | g2:m | c2 | f2|
    f2 | f2 | bes2 | c2 | g2:m | g2:m | c2 | f2 |
  }
%}}}

% {{{ Sivivon
  temaD ={
    d,8 d e4 | f8 f e4 | a8 a g16 f e g | f8 f e4 | d8 d e4 | f8 f g4 | a8 a a a, | d8 d d4 |
    \repeat volta 2{
      g8 g g bes | a8 a f16 e d8 | cis8 cis a cis | 
    }
    \alternative{
      {d8. e16 f e d8 |}
      {d8 d d4}
    }
    \bar "||"
  }

  accordiD = \chordmode{
    \set chordChanges = ##t
    d4:m a4 | f4 a4 | d4:m g4:m | f4 a4 | d4:m a4 | f4 g4:m | a2 | d2:m |
    \repeat volta 2{
      g2:m | d2:m | a2 |
    }
    \alternative{
      {d2:m|}
      {d2:m|}
    }
  }
%}}}

% SCORE {{{
temaPartA = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \relative c' {\global \temaA }}

chordsPartA ={
  \new ChordNames {
    \accordiA
  }
}

temaPartB = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \relative c' {\global \temaB }}

chordsPartB ={
  \new ChordNames {
    \accordiB
  }
}

temaPartC = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \relative c' {\global \temaC }}

chordsPartC ={
  \new ChordNames {
    \accordiC
  }
}

temaPartD = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \relative c' {\global \temaD }}

chordsPartD ={
  \new ChordNames {
    \accordiD
  }
}

\book{
  \bookOutputSuffix "C"
  \score{ 
    <<
      \chordsPartA
      \temaPartA
    >>
    \header {piece = "Oy Chanukah"}
  }

  \score{ 
    <<
      \chordsPartB
      \temaPartB
    >>
    \header {piece = "Mi Y'mael"}
  }

  \score{ 
    <<
      \chordsPartC
      \temaPartC
    >>
    \header {piece = "Dreydel"}
  }

  \score{ 
    <<
      \chordsPartD
      \temaPartD
    >>
    \header {piece = "Sivivon"}
  }
}

\book{
  \bookOutputSuffix "Bb"
  \score{ 
    <<
      \transpose c d { \chordsPartA }
      \transpose c d { \temaPartA }
    >>
    \header {piece = "Oy Chanukah"}
  }

  \score{ 
    <<
      \transpose c d { \chordsPartB }
      \transpose c d { \temaPartB }
    >>
    \header {piece = "Mi Y'mael"}
  }

  \score{ 
    <<
      \transpose c d { \chordsPartC }
      \transpose c d { \temaPartC }
    >>
    \header {piece = "Dreydel"}
  }

  \score{ 
    <<
      \transpose c d { \chordsPartD }
      \transpose c d { \temaPartD }
    >>
    \header {piece = "Sivivon"}
  }
}

\book{
  \bookOutputSuffix "Eb"
  \score{ 
    <<
      \transpose ees c { \chordsPartA }
      \transpose ees c { \temaPartA }
    >>
    \header {piece = "Oy Chanukah"}
  }

  \score{ 
    <<
      \transpose ees c { \chordsPartB }
      \transpose ees c { \temaPartB }
    >>
    \header {piece = "Mi Y'mael"}
  }

  \score{ 
    <<
      \transpose ees c { \chordsPartC }
      \transpose ees c { \temaPartC }
    >>
    \header {piece = "Dreydel"}
  }

  \score{ 
    <<
      \transpose ees c { \chordsPartD }
      \transpose ees c { \temaPartD }
    >>
    \header {piece = "Sivivon"}
  }
}
