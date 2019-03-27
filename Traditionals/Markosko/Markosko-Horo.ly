% DEFINIZIONI {{{
\version "2.18.2"

\header {
  title = "Markosko Horo"
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
  \key bes \major
  \numericTimeSignature
  \time #'(2 2 2) 6/8
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
  \repeat volta 2 {
    d,8 ees fis g r bes | a r r4 ees'8 d | ees d r4 d,8 ees | fis a bes a r4 |
    r4 fis8 aes g fis | r ees' d r ees d | g ees c g r4 | r2. | 
    aes'8 g ees d b r | aes c b aes g c | fis, d r2 | d'8 ees fis g a bes |
    bes a g ees r4 | r4 a8 a g fis | fis r r2 | r2. |
    
  }
}

accordi = \chordmode{
  \repeat volta 2 {
    \set chordChanges = ##t
    g2.*6:m | c2.*4:m | d2.*2 | ees2.*2 | d2.*2 |
  }
}
% }}}

% SCORE {{{
tema = \relative c' {
  \global 
  \tema
  \bar "||"
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
      }
    }
  }
}
% }}}
