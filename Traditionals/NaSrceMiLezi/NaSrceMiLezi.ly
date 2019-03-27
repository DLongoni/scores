% {{{ PARAMETRI
  myTitle = "Na Srce mi Lezi"
  mySubTitle = "Serbian"
  myKey = \key g \major
  myTime = \time #'(2 2 2 3) 9/8
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

% {{{ MAIN
tema = {
  \mark \default
  \repeat volta 2 {
    \new Voice <<
      {d8 g16 g fis8 e d e d4 b8 | d c16 d c b a8 b c d e d| d g16 g fis8 e d e d4 b8 |}
      {b8 e16 e d8 c b c b4 g8 | b a16 b a g fis8 g a b c b | b e16 e d8 c b c b4 g8|}
    >>
  }
  \alternative{
    {
      \new Voice <<
        {d'8 c16 d c b a8 b b16 g b g b8 b16 g|}
        {b8 a16 b a g fis8 g g16 d g d g8 g16 d|}
      >>
    } 
    {
      \new Voice <<
        {d'8 c16 d c b a8 b4 b8 r4 | }
        {b8 a16 b a g fis8 g4 g8 r4 |}
      >>
    }
  }\bar"||" \break

  \mark \default

  \new Voice <<
    {d'4 d e d4. | d4 c b8 a b4 c8 | d4 d e d4. | e8 d c b b4~ b4. | }
    {b4 b c b4. | b4 a g8 fis g4 a8 | b4 b c b4. | c8 b a g g4~ g4. | }
  >>\break

  \repeat volta 2{
    \new Voice <<
      {e'4 e8 e e4 e8 d c | d4 e fis8 e d4 b8 | c4 d e d4. | e8 d c b b4~ b4. |}
      {c4 c8 c c4 c8 b a | b4 c4 d8 c b4 g8 | a4 b c b4. | c8 b a g g4~ g4. |}
    >>
  }
}

accordi = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    g1*9/8 | d2 g4 g4. | g1*9/8 |
  }
  \alternative{
    {d2 g4 g4.|}
    {d2 g4 g4.|}
  }

  g2 c4 g4.| d2 d4 g4. | g2 c4 g4. | d2 g4 g4.:7 |

  \repeat volta 2{
    c1*9/8 | d2 d4 g4. | d2:7 d4:7 g4. | d2:7 g4 g4.:7 |
  }
}
% }}}

% LYRICS {{{
testoCompleto=\markup {
  \vspace #2
  \fill-line {
    \column {
      \hspace #1
      \line{ Na srce mi lezi, mila mamo, Na srce mi lezi, }
      \line{ Aj, na srce mi lezi, mila mamo, Edna luta zmija. }
      \vspace #1
      \line{ Ne mi bila zmija, mila mamo, Ne mi bila zmija, }
      \line{ Aj, ne mi bila zmija, mila mamo, Tuku kara sevda. }
      \vspace #1
      \line{ Sevdinite oci, mila mamo, Sevdinite oci, }
      \vspace #1
      \line{ Sevdinite veli, mila mamo, Sevdinite ve|i, }
      \line{ Aj, Sevdinite veli, mila mamo, Morski pijavici. }
      \vspace #1
      \line{ Sevdinata snaga, mila mamo, Sevdinata snaga, }
      \line{ Aj, Sevdinata snaga, mila mamo, Tenka polovina. }
    }
  }
}
% }}}

% SCORE {{{
tema = \relative c' {
  \tema
}

chordsPart ={
  \new ChordNames {
    \accordi
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
