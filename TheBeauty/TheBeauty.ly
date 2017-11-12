% DEFINIZIONI {{{
\version "2.18.2"

\header {
  title = "The Beauty I Don't See"
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
  \key a \minor
  \numericTimeSignature
  \time 3/4
  \set Score.markFormatter = #format-mark-box-alphabet
}

toCoda = {
  % the align part
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT  
  \once \override Score.RehearsalMark.break-visibility = #begin-of-line-invisible
  \mark \markup { { \lower #1 "al  " { \musicglyph #"scripts.coda"} } } 
}
%}}}

% PARTE A {{{
tema = {
  a8 b c d e a |
  g e b a b a |
  e'4 d4. c8 |
  d4 c d | \break
  a8 b c d e a |
  g e c a c a |
  e' f8~ f4 c8 g |
  a2. | \break
  e'4. a | fis d | c e | d b | \break
  a8 c \tuplet 3/2 {b c d} e4 |
  d8 f \tuplet 3/2 {e f g} a4 |
  e2.~ | 
  e 2.| 
    \toCoda 
  \break
  a,8 b c d e a |
  \time 2/4
  g e g e |
  \time 3/4
  a,4 r2 | r2. |
}

accordiTema = \chordmode{
  \set chordChanges = ##t
  a2.:m | g2.:6 | f2.:maj7 | bes2.:7.11+ |
  a2.:m | c2.:7 | bes2.:maj7 | f2.:maj7 |
  a2.:7 | b2.:m7 | c2.:maj7 | g2.:6 |
  d2.:m7 | d2.:m7 | c2.:maj7 | c2.:maj7 |
  a2.:m |
  \time 2/4
  f4 e4:7.9- |
  \time 3/4
  a2.:m | a2.:m |
}
% }}}

% CODA {{{
temaCoda = {
  a8 b c d e a |
  \time 1/4
  g f |
  \time 3/4
  e4. a | g d | c ees | d c | \break
  c8 d ees f g c |
  \time 2/4
  bes g bes g | c2 |
}

accordiCoda = \chordmode{
  \set chordChanges = ##t
  a2.:m7 | 
  \time 1/4
  g4:13 |
  \time 3/4
  f2.:maj7 | f2.:maj7 | 
  aes2.:maj7 | aes2.:maj7 | 
  c2.:m7 |
  \time 2/4
  aes4 g4:7 | c2:m7 |
}
% }}}

% SCORE {{{
tema = \relative c' {
  \global 
  \tema
  \bar"||"
  \break
  \mark \markup { \musicglyph #"scripts.coda"}
  \temaCoda
  \bar"|."
}

chordsPart ={
  \new ChordNames {
    \accordiTema
    \accordiCoda
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
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
