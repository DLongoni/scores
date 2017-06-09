% DEFINIZIONI {{{
\version "2.18.2"

\header {
  title = "Gankino Horo"
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
  \key c \major
  \numericTimeSignature
  \time #'(2 2 3 2 2) 11/8
  \set Score.markFormatter = #format-mark-box-alphabet
}
%}}}

% PARTE A {{{
temaA = {
  \repeat volta 2 {
    d4 \appoggiatura c'8 d4 d d8 d c b a |
    c b a gis gis f a gis4\prall f8 e |\noBreak
    d4\prall e8 f f d a' gis4\prall f8 a|\noBreak
    gis4\prall f8 e e d f e4\prall e| 
  }
}

accordiA = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    d2:m d4.:m d2:m |
    d2:m d4.:m d2:m |
    d2:m d4.:m d2:m |
    d2:m d4.:m e2|
  }
}
% }}}

% PARTE B {{{
temaB = {
  \repeat volta 2 {
    d4\prall e8 f f d a' gis4 f8 e|
    d4\prall d'8 d d c b a gis f e |
    d4\prall e8 f f d a' gis4\prall f8 a|
    gis4\prall f8 e e d f e4\prall e| 
  }
}

accordiB = \chordmode{
  \repeat volta 2{
    d2:m d4.:m d2:m |
    d2:m d4.:m d2:m |
    d2:m d4.:m d2:m |
    d2:m d4.:m e2|
  }
}
% }}}

% PARTE C {{{
temaC = {
  \repeat volta 2 {
    b'8 cis d4 d8 b d cis4\prall a|
    e'8 fis d4 d8 b d cis4\prall a|
    b8 cis d4 d8 b d cis4\prall a|
    b8 a gis a b4 e8 b4\prall b|
  }
}

accordiC = \chordmode{
  \repeat volta 2{
    e2 e4. a2 |
    a2 e4. a2 |
    e2 e4. a2 |
    b2 e4. e2|
  }
}
% }}}

% PARTE D {{{
temaD = {
  \repeat volta 2 {
    a'8 b gis4\prall f8 e d e4\prall e|
    a8 b gis4\prall f8 e d e4\prall e|\noBreak
    a8 b gis4\prall a8 b gis a b gis4\prall|\noBreak
    a8 b gis4\prall f8 e d e4\prall e|
  }
}

accordiD = \chordmode{
  \repeat volta 2{
    e2 d4.:m e2|
    e2 d4.:m e2|
    \once \set chordChanges = ##f
    e2 e4. e2|
    e2 d4.:m e2|
  }
}
% }}}

% PARTE E {{{
temaE = {
  \repeat volta 2 {
    e8 fis g4 g8 e g fis4\prall d|\noBreak
    a'8 b g4 g8 e g fis4\prall d|\noBreak
    e8 fis g4 g8 e g fis4\prall d|\noBreak
  }
  \alternative{
    { e8 d cis d e4 a8 e4\prall e| }
    { e8 d cis d e4 a8 e4\staccato r4| }
  }
}

accordiE = \chordmode{
  \repeat volta 2{
    a2 a4. d2|
    d2 a4. d2|
    a2 a4. d2|
  }
  \alternative{
    {e2 a4. a2|}
    {e2 a4. a2|}
  }
}
% }}}

% SCORE {{{
tema = \relative c {
  \global 
  \mark \default
  \temaA
  \mark \default
  \temaB
  \mark \default
  \temaC
  \mark \default
  \temaD
  \mark \default
  \temaE
  \bar "|."
}

chordsPart ={
  \new ChordNames {
    \accordiA
    \accordiB
    \accordiC
    \accordiD
    \accordiE
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \tema }

\book{
  \bookOutputSuffix "Score"
  \score {
    <<
      \chordsPart
      \temaPart
    >>
    \layout {
      indent = #0
    }
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 120 4)
      }
    }
  }
}

\book{
  \bookOutputSuffix "Bb"
  \score {
    <<
      \transpose c d { \chordsPart }
      \transpose c d { \temaPart}
    >>
    \layout {
      indent = #0
    }
  }
}

\book{
  \bookOutputSuffix "Eb"
  \score {
    <<
      \transpose ees c { \chordsPart }
      \transpose ees c { \temaPart}
    >>
    \layout {
      indent = #0
    }
  }
}
% }}}
