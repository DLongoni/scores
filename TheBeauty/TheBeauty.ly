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
temaA = {
  \repeat volta 2{
    a8^\markup{ \italic {swing feel} }
    b c d e a |
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
}

accordiA = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
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
}
% }}}

% PARTE B {{{
temaB = {
  \repeat volta 2{
    \time 3/4
    a8^\markup{ \italic {straight feel} }
    a4 c4. | a8 a4 g4. |
    r4 d'8 e d e | 
    \time 2/4 c8 c a4 |
    \time 3/4
    a8 a4 c4. | a8 a g2 |
    e8 e4 g4. | e8 e d2 |
  }
}

accordiB = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    \time 3/4
    a2.:m7 | a2.:m7 |
    f2.:maj7 |
    \time 2/4 f2:maj7 |
    \time 3/4
    a2.:m7 | a2.:m7 |
    g2.:6 | g2.:6 |
  }
}
% }}}

% PARTE Bdue {{{
temaBdue = {
  \repeat volta 2{
    \time 3/4
    a'8^\markup{ \italic {swing feel} }
    a4 c4. | a8 a4 g4. |
    r4 d'8 e d e | 
    \time 2/4 c8 c a4 |
    \time 4/4
    a8 a4 c4. a8 a |
    \time 2/4
    g2 |
    \time 4/4
    e8 e4 g4. e8 e |
    \time 2/4
    d2 |
  }
}

accordiBdue = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    a2.:m7 | a2.:m7 |
    d2.:7 |
    \time 2/4 d2:7 |
    \time 4/4
    a1:m7 | 
    \time 2/4
    a2:m7 |
    \time 4/4
    g1:6 | 
    \time 2/4
    g2:6 |
  }
}
% }}}

% CODA {{{
temaCoda = {
  \time 3/4
  a'8 b c d e a |
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
  \time 3/4
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
  \mark \default
  \temaA
  \break
  \mark \default
  \temaB
  \break
  \mark \markup{ \box \bold{B2} }
  \temaBdue
  \break
  \mark \markup { \musicglyph #"scripts.coda"}
  \temaCoda
  \bar"|."
}

chordsPart ={
  \new ChordNames {
    \accordiA
    \accordiB
    \accordiBdue
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
% }}}
