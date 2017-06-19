% INITIALIZATION {{{
\version "2.18.2"

\header {
  title = "Sedi Donka"
  composer = "Bulgarian Traditional"
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
  \key f \major
  \numericTimeSignature
  \time #'(3 2 2) 7/8
  \set Score.markFormatter = #format-mark-box-alphabet
}

struttura = \markup {
  \column {
    \line {
      (\bold{A}, \bold{B}), (\bold{A}, \bold{B}, \bold{C} Alt., \bold{C}, \bold{D}), (\bold{A}, \bold{B}, \bold{C}, \bold{D}), \italic{Coda}
    }
  }
}
% }}}

% PARTE A {{{
temaA={
  \repeat volta 2 {
    \time #'(3 2 2) 7/8
    a8 c, f a16 bes a8 g f| g c, e g16 a g8 f e |
    \time #'(2 2 3 2 2) 11/8
    d e c a c d e f4 f|\break
    \time #'(3 2 2) 7/8
    a8 c, f a16 bes a8 g f| g c, e g16 a g8 f e |
    \time #'(2 2 3 2 2) 11/8
    d e c a c d e d4 d|\break
  }
}

accordiA=\chordmode{
  \repeat volta 2 {
    \set chordChanges = ##t
    \time #'(3 2 2) 7/8
    f4. f2| c4. c2|
    \time #'(2 2 3 2 2) 11/8
    c2 c4. f2:|
    \time #'(3 2 2) 7/8
    f4. f2| c4. c2|
    \time #'(2 2 3 2 2) 11/8
    c2 c4. g2|
  }
}

accordiAfusion=\chordmode{
  \repeat volta 2 {
    \set chordChanges = ##t
    \time #'(3 2 2) 7/8
    f4.:6 fis2:dim7| c4./g a2:m7|
    \time #'(2 2 3 2 2) 11/8
    c2/g ges4.:7.11+ f2:maj7|
    \time #'(3 2 2) 7/8
    f4.:6 fis2:dim7| c4./g a2:m7|
    \time #'(2 2 3 2 2) 11/8
    a2:m7 aes4.:7.11+ g2:6
  }
}

temaAdue={
  \repeat volta 2 {
    \time #'(3 2 2) 7/8
    c8 e, a c16 d c8 bes a| bes e, g bes16 c bes8 a g |
    \time #'(2 2 3 2 2) 11/8
    f g e c e f g a4 a|
    \time #'(3 2 2) 7/8
    c8 e, a c16 d c8 bes a| bes e, g bes16 c bes8 a g |
    \time #'(2 2 3 2 2) 11/8
    f g e c e f a g4 g|
  }
}
% }}}

% {{{ PARTE B
  temaB={
    \repeat volta 2 {
      \time #'(3 2 2) 7/8
      d'8 e c e16 f e8 d c| e f c g'16 a g8 f e |
      \time #'(2 2 3 2 2) 11/8
      d e c a c d e f4 f|\break
      \time #'(3 2 2) 7/8
      d8 e c e16 f e8 d c| e f c g'16 a g8 f e |
      \time #'(2 2 3 2 2) 11/8
      d e c a c d e d4 d|\break
    }
  }

  temaBdue={
    \repeat volta 2 {
      \time #'(3 2 2) 7/8
      f,8 g e g16 a g8 f e| g a e c'16 d c8 a g |
      \time #'(2 2 3 2 2) 11/8
      e g e c e f g a4 a|\break
      \time #'(3 2 2) 7/8
      f8 g e g16 a g8 f e| g a e c'16 d c8 a g |
      \time #'(2 2 3 2 2) 11/8
      f g e c e f g g4 g|\break
    }
  }

  accordiB=\chordmode{
    \set chordChanges = ##t
    \repeat volta 2 {
      \time #'(3 2 2) 7/8
      c4. c2| c4. c2|
      \time #'(2 2 3 2 2) 11/8
      c2 c4. f4 f|
      \time #'(3 2 2) 7/8
      c4. c2| c4. c2|
      \time #'(2 2 3 2 2) 11/8
      c2 c4. g4 g4|
    }
  }

  accordiBfusion=\chordmode{
    \set chordChanges = ##t
    \repeat volta 2 {
      \time #'(3 2 2) 7/8
      c4.:6 b2:7.5-| bes4. a2:m7|
      \time #'(2 2 3 2 2) 11/8
      c2/g ges4.:7.11+ f2:maj7|
      \time #'(3 2 2) 7/8
      c4.:6 b2:7.5-| bes4. a2:m7|
      \time #'(2 2 3 2 2) 11/8
      a2:m7 aes4.:7.11+ g2:6
    }
  }
% }}}

% PARTE C {{{
temaC={
  \time #'(3 2 2) 7/8
  fis' 8 ees c d16 ees d c d4 | fis 8 ees c d16 ees ees d d4 |
  \time #'(2 2 3 2 2) 11/8
  d8 ees fis g a bes g a16 bes a g a4|\break
  \time #'(3 2 2) 7/8
  fis 8 ees c d16 ees d c d4 | fis 8 ees c d16 ees ees d d4 |
  \time #'(2 2 3 2 2) 11/8
  g8 fis ees d c ees c d4 d|\break
}

temaCdue={
  \time #'(3 2 2) 7/8
  a8 fis ees fis16~ fis g~ g fis4| fis8 a ees fis16~ fis g~ g fis4|
  \time #'(2 2 3 2 2) 11/8
  fis8 g a bes c d bes c16 d c bes a4|
  \time #'(3 2 2) 7/8
  a8 fis ees fis16~ fis g~ g fis4| fis8 a ees fis16~ fis g~ g fis4|
  \time #'(2 2 3 2 2) 11/8
  bes8 a g fis ees g ees fis4 fis|
}

accordiC=\chordmode{
  \set chordChanges = ##t
  \time #'(3 2 2) 7/8
  d4. d2| d4. d2|
  \time #'(2 2 3 2 2) 11/8
  d2 ees4. d2|
  \time #'(3 2 2) 7/8
  d4. d2| d4. d2|
  \time #'(2 2 3 2 2) 11/8
  d2 ees4. d2|
}

alternativeRhythm={
  \time #'(3 2 2) 7/8
  c4.-.  r4 c4-. | r4. c4-. r4|
  \time #'(2 2 3 2 2) 11/8
  r8 c8-. r4 r4 c8-. r4 r4|\break
}
% }}}

% PARTE D {{{
temaD={
  \repeat volta 2 {
    \time #'(3 2 2) 7/8
    c'8 d c c bes a g| bes c bes a g fis g|
    \time #'(2 2 3 2 2) 11/8
    a bes \tuplet 3/2 {a16 bes a} g8 a a g fis g a4|\break
    \time #'(3 2 2) 7/8
    c8 d c c bes a g| bes c bes a g fis g|
    \time #'(2 2 3 2 2) 11/8
    a8 a g fis g fis ees  d4 d|\break
  }
}

temaDdue={
  \repeat volta 2 {
    \time #'(3 2 2) 7/8
    ees8 f ees ees d c bes| d ees d d c bes a|
    \time #'(2 2 3 2 2) 11/8
    c d \tuplet 3/2 {c16 d c} bes8 c c bes a bes c4|
    \time #'(3 2 2) 7/8
    ees8 f ees ees d c bes| d ees d d c bes a|
    \time #'(2 2 3 2 2) 11/8
    c c bes a bes a g fis4 fis|
  }
}

accordiD=\chordmode{
  \set chordChanges = ##t
  \repeat volta 2 {
    \time #'(3 2 2) 7/8
    c4.:m c2:m| g4.:m g2:m|
    \time #'(2 2 3 2 2) 11/8
    d2 c4.:m d2|
    \time #'(3 2 2) 7/8
    c4.:m c2:m| g4.:m g2:m|
    \time #'(2 2 3 2 2) 11/8
    d2 c4.:m d2|
  }
}
% }}}

% CODA {{{

temaCoda={
  \time #'(3 2 2) 7/8
  a''8 c, f a16 bes a8 g f| g c, e g16 a g8 f e |
  \time #'(2 2 3 2 2) 11/8
  d e c a c d e f4 f|
  \time #'(3 2 2) 7/8
  a8 c, f a16 bes a8 g f| g c, e g16 a g8 f e |
  f bes, d f16 g f8 e d| e a, cis e16 f e8 d cis|\break
  d a d f16 g f8 e d| des aes des f16 g f8 ees des|
  \time #'(2 2 3 2 2) 11/8
  c e c a c d e d4 d|
}

temaCodaDue={
  \time #'(3 2 2) 7/8
  c8 e, a c16 d c8 bes a| bes e, g bes16 c bes8 a g |
  \time #'(2 2 3 2 2) 11/8
  f g e c e f g a4 a|\break
  \time #'(3 2 2) 7/8
  c8 e, a c16 d c8 bes a| bes e, g bes16 c bes8 a g |
  a d, e a16 bes a8 g f| g cis, e g16 a g8 f e|\break
  d a d f16 g f8 e d| des aes des f16 g f8 ees des|
  \time #'(2 2 3 2 2) 11/8
  e g e c e f a g4 g|
}

accordiCoda=\chordmode{
  \set chordChanges = ##t
  \time #'(3 2 2) 7/8
  f4. f2| c4. c2|
  \time #'(2 2 3 2 2) 11/8
  c2 c4. f2:|
  \time #'(3 2 2) 7/8
  f4.~ f2 | c4.~ c2 |
  bes4.~ bes2 | a4.~ a2|
  d4.:m d2:m | des4. des2 |
  \time #'(2 2 3 2 2) 11/8
  c2 aes4.:7.11+ g4 g4 |
}

temaCodaTre={
  \time #'(3 2 2) 7/8
  R1*7/8|R1*7/8|
  \time #'(2 2 3 2 2) 11/8
  R1*11/8|
  \time #'(3 2 2) 7/8
  R1*7/8|R1*7/8|
  r4 f''8\p\< a4 f8 bes | e,4.~ e8 f16 g a8 g16 e\f|
  f4.\prall a4 g8 e | f4.~\prall f8 des16 ees f8 ees16 des |
  \time #'(2 2 3 2 2) 11/8
  c8 e c a c d e d4 d|
}
% }}}

% MAIN {{{

pausa = {
  \time #'(3 2 2) 7/8
  R1*2*7/8|
  \time #'(2 2 3 2 2) 11/8
  R1*11/8|
  \time #'(3 2 2) 7/8
  R1*2*7/8|
  \time #'(2 2 3 2 2) 11/8
  R1*11/8|\break
}

tema = \relative c'' {
  \mark \default
  \new Voice <<
    \temaA
    \temaAdue
  >>
  \mark \default
  \new Voice <<
    \temaB
    \temaBdue
  >>
  \mark \default
  \new Voice <<
    \temaC
    \temaCdue
  >>
  \mark \default
  \new Voice <<
    \temaD
    \temaDdue
  >>
  \mark \markup{Coda}
  <<
    \new Voice <<
      \temaCoda
      \temaCodaDue
    >>
    \new Staff { \temaCodaTre}
  >>
  \bar "|."
}

chordsPartFusion ={
  \new ChordNames {
    \accordiAfusion
    \accordiBfusion
  }
}

chordsPart ={
  \new ChordNames {
    \accordiA
    \accordiB
    \accordiC
    \accordiD
    \accordiCoda
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

scoreContent = << 
  \chordsPartFusion
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
    \score{ 
      \new DrumStaff{ \alternativeRhythm }
      \header {piece = "Alt. Rhythm"}
    }
  }

  \book{
    \struttura
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
    \score{ 
      \new DrumStaff{ \alternativeRhythm }
      \header {piece = "Alt. Rhythm"}
    }
  }

  \book{
    \struttura
    \bookOutputSuffix "Eb"
    \score { \transpose ees c { \scoreContent } }
    \score{ 
      \new DrumStaff{ \alternativeRhythm }
      \header {piece = "Alt. Rhythm"}
    }
  }
% }}}
