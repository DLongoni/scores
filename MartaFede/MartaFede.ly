% INITIALIZATION {{{
\version "2.18.2"

\header {
  title = "Made in Capo Nord"
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
  \key a \major
  \numericTimeSignature
  \time 4/4
  \set Score.markFormatter = #format-mark-box-alphabet
}
% }}}

% TEMA {{{
temaTema={
    a8 c, f a16 bes a8 g f| g c, e g16 a g8 f e |
    d e c a c d e f4 f|\break
    a8 c, f a16 bes a8 g f| g c, e g16 a g8 f e |
    d e c a c d e d4 d|\break
}

accordiTema=\chordmode{
    a1 | a1 | b1 | b1 |
    cis1:m | cis1:m | d1 | d1 |
}

saxTema={}

trombaTema={}
% }}}

% STROFA {{{
temaStrofa={
    a8 c, f a16 bes a8 g f| g c, e g16 a g8 f e |
    d e c a c d e f4 f|\break
    a8 c, f a16 bes a8 g f| g c, e g16 a g8 f e |
    d e c a c d e d4 d|\break
}

accordiStrofa=\chordmode{
    a1 | a1 | b1 | b1 |
    cis1:m | cis1:m | d1 | d1 |
}

saxStrofa={}

trombaStrofa={}
% }}}

% RITORNELLO {{{
temaRit={
    a8 c, f a16 bes a8 g f| g c, e g16 a g8 f e |
    d e c a c d e f4 f|\break
    a8 c, f a16 bes a8 g f| g c, e g16 a g8 f e |
    d e c a c d e d4 d|\break
}

accordiRit=\chordmode{
    e1 | fis1:m | d1 | e1 |
    a1 | cis1:m | d1 | e1 |
    cis1:m | fis1:m | d1 | e1 |
    a1 | cis1:m | d1 | e1 |
}

saxRit={}

trombaRit={}
% }}}

% MAIN {{{
sax = \relative c'' {
  %\transposition ees
  \global
  \mark \markup{ \box \bold{A1} }
}

trumpetBb = \relative c'' {
  %\transposition bes
  \global
}

guitar = \relative c'' {
  \global
}

chordsPart ={
  \new ChordNames {
}

saxPart = \new Staff \with {
  instrumentName = "saxto"
shortInstrumentName = #"C"
  midiInstrument = "sax"
} \sax

trumpetPart =  \new Staff \with {
  instrumentName = "Tromba"
shortInstrumentName = #"T"
  midiInstrument = "trumpet"
} \trumpetBb

guitarPart = \new Staff \with {
  instrumentName = "Chitarra"
shortInstrumentName = #"G"
  midiInstrument = "guitar"
} { \clef "treble_8" \guitar }
%}}}

% {{{ BOOKS
\book{
  \bookOutputSuffix "Score"
  \struttura
  \score {
    <<
      \chordsPart
      \saxPart
      \trumpetPart
      \guitarPart
    >>
    \layout {
    }
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 150 4)
      }
    }
  }
}

\book{
  \bookOutputSuffix "ClTr"
  \struttura
  \score {
    <<
      \transpose c d { \chordsPart }
      \transpose c d { \saxPart}
      \transpose c d { \trumpetPart}
    >>
  }
}
% }}}
