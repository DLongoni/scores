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
\layout { indent = #0 }
%}}}

% {{{ PARTE A
  temaA = {
    \partial 4 c'8 a |
    \repeat volta 2{
      bes4. \tuplet 3/2 {a16 bes a} \tuplet 3/2 {g8 e des} |
      c8 d ees g f4~ | f2 bes4 | bes2 bes8 a | 
      aes4. g16 f ges8 f | des2 ees4 | c2.~ | c2  c'8 a |
    }
  }

  accordiA = \chordmode{
    \partial 4 s4 |
    \repeat volta 2{
      bes2.:maj7 | aes2.:6 | aes2.:6 | g2.:m7 |
      bes2.:m7 | ges2.:7 | f2.:6 | f2.:6 |
    }
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
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
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 90 4) } }
    }
  }
% }}}