% {{{ PARAMETRI
  myTitle = "Sara's Riddle"
  myKey = \key bes \major
  myTime = \time 3/4 
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
\layout {
  \context { 
    \Staff \RemoveEmptyStaves 
    \override VerticalAxisGroup.remove-first = ##t
  }
}
%}}}

% {{{ PARTE A
  temaA = {
    \partial 4 c'8 a |
    \repeat volta 2{
      bes4. \tuplet 3/2 {a16 bes a} \tuplet 3/2 {g8 e des} |
      c8 d ees g f4~ | f2 g8 a | bes2 bes8 g | 
      aes4. g8 \tuplet 3/2 {f8 ges f} | des2 ees4 | c2.~ | c2  c'8 a |
    }
  }

  silenzioA = {
    \partial 4 s4 |
    s2. | s2. | s2. | s2. | 
    s2. | s2. | s2. | s2. |
  }

  accordiA = \chordmode{
    \partial 4 s4 |
    \repeat volta 2{
      bes2.:maj7 | aes2.:6 | bes2.:6 | g2.:m7 |
      bes2.:m7 | ges2.:7 | f2.:6 | f2.:6 |
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \time 9/8
    \repeat volta 2{
      g8 d bes' g4 f16 g16 f8 d c~ |
      c8 g bes c d e f4 d8 |
    }
  }

  temaBdue = {
    \time 9/8
    \repeat volta 2{
      bes'8 g d' bes4 a16 bes16 a8 f e~ |
      e4 f8 a c bes a4 f8 |
    }
  }

  accordiB = \chordmode{
    g1*9/8:m7 | c4. d2.:m7 |
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \temaB \break
}

temaDue = \relative c' {
  \silenzioA
  \temaBdue 
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

temaPartDue = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \temaDue }

scoreContent = << 
  \chordsPart
  \temaPart
  \temaPartDue
>>
%}}}

% {{{ BOOKS
  \book{
    \bookOutputSuffix "C"
    \score {
      \scoreContent
      \layout { indent = #0 }
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 90 4) } }
    }
  }
% }}}
