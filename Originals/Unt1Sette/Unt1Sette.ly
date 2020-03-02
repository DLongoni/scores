% {{{ PARAMETRI
  myTitle = "Senza titolo in 7"
  myKey = \key f \major
  myTime = \time 7/8 
  myTempo =  #(ly:make-moment 60 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"

\header {
  title = \myTitle
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
  \myKey
  \numericTimeSignature
  \myTime
  \set Score.markFormatter = #format-mark-box-alphabet
}
\layout { indent = #0 }
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2{
      a4 c8 r8 d16 e d f r e | d16 e d8 c r bes16 a c bes r a |
      f16 g f8 e r f16 e g f r c | d2~ d4. | r2 r4. |
    }
  }

  temaAdue = {
    \repeat volta 2{
      d4 f8 r8 g16 a bes c r a | g16 a g8 f r f16 e f g r a |
      bes16 c bes8 a r a16 g e c r bes | a2~ a4. | r2 r4. |
    }
  }

  ritmicaA = {
    \repeat volta 2{
      d8 d f d c e16 c~ c8 | d8 d f d c e16 c~ c8 | d8 d f d c e16 c~ c8 |
      d8 d f d c e16 c~ c8 | d8 d f d c e16 c~ c8 |
    }
  }

  accordiA = \chordmode{
    \repeat volta 2{
      d2:m7 d8:m7 c4 | d2:m7 d8:m7 c4 | d2:m7 d8:m7 c4 |
      d2:m7 d8:m7 c4 | d2:m7 d8:m7 c4 |
    }
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
}

temaDue = \relative c' {
  \temaAdue \break
}

ritmica = \relative c' {
  \ritmicaA 
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

temaDuePart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \temaDue }

scoreContent = << 
  \chordsPart
  \temaPart
  \temaDuePart
  \ritmica
>>
%}}}

% {{{ BOOKS
  \book{
    \bookOutputSuffix "C"
    \score {
      \scoreContent
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 90 4) } }
    }
  }
% }}}
