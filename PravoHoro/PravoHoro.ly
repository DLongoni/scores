% DEFINIZIONI {{{
\version "2.18.2"

\header {
  title = "Pravo Horo"
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
  \key d \major
  \numericTimeSignature
  \time 6/8
  \set Score.markFormatter = #format-mark-box-alphabet
}
%}}}

tema = {
  % A
  \mark \default
  \repeat volta 2 {
    d8 fis a cis d4 | d4 cis8 cis b a | b cis4 cis b8 | b a g fis4. | 
    a8 b4 b b8 | b4 a8 a gis b | a4 g8 g e g | fis g gis a4. |
  } \break

  % B
  \mark \default
  \repeat volta 2 {
    a8 b4 b b8 | b4 a8 a gis b | a4 g8 g e g | fis g gis a4. | 
    a8 b4 b b8 | b4 a8 a gis b | a4 g8 g e g | fis4 d8 fis4. |
  } \break

  % C
  \mark \default
  \repeat volta 2 {
    c'8 b a a d, d | c' b a a d, d | c' b a c d4 | a8 c b a d, d |
    c' b a a d, d | c' b a a d, d| c' b a c d4 | a8 c b a4. |
  } \break

  % D
  \mark \default
  \repeat volta 2 {
    d8 b c a c b | a fis fis a4. | d,8 fis gis a c b | a fis fis a4. | 
    d8 b c a c b | a fis fis a4. | d,8 fis gis a c b | a fis fis d4. |
  } \break
}

accordi = \chordmode{
  \set chordChanges = ##t
  % A
  \repeat volta 2{
    d1*6/8 | d1*6/8 | g1*6/8 | a4. d4. | g1*6/8 | g1*6/8 | a1*6/8 | d1*6/8 |
  }
  % B
  \repeat volta 2{
    g1*6/8 | g1*6/8 | a1*6/8 | d1*6/8 | g1*6/8 | g1*6/8 | a1*6/8 | d1*6/8 |
  }
  % C
  \repeat volta 2{
    d1*6/8 | d1*6/8 | d1*6/8 | d1*6/8 | d1*6/8 | d1*6/8 | d1*6/8 | d1*6/8 |
  }
  % D
  \repeat volta 2{
    d1*6/8 | d1*6/8 | g1*6/8 | a4. d4. | d1*6/8 | d1*6/8 | g1*6/8 | a4. d4. |
  }
}

% SCORE {{{
tema = \relative c {
  \global 
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
        tempoWholesPerMinute = #(ly:make-moment 190 4)
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
% }}}
