% {{{ PARAMETRI
  myTitle = "Boing"
  mySubTitle = ""
  myKey = \key c \major
  myTime = \time 4/4 
  myTempo =  #(ly:make-moment 190 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"

\header {
  title = \myTitle
  composer = \mySubTitle
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
trip = #(define-music-function (parser location m1 m2 m3) 
  (ly:music? ly:music? ly:music?)
  "Triplets"             
  #{ \tuplet 3/2 { $m1 $m2 $m3 } #})
%}}}

% {{{ PARTE A
  temaA = {
      r8 c b c d r16 c b8 c | 
      g8 r <e g c>4 <fis b dis>4 <fis a dis>4 |
      r8 c' b c d r16 c b8 c | 
      g8 r <e a c>4 <fis a dis>4 <e g e'>4 |
      fis4 g <f a des> <e a c> | 
      fis8 e g gis <fis a e'>4. <g b d>8 |
      <a d fis>2 r2 |
  }

  accordiA = \chordmode{
    s1 | s1 | s1 | s1 | s1 | s1 | s1 |
  }

  bassoA = {
    c1 | c8. a'16 g8. c16 b4 a |
    c,1 | c8. a'16 g8. c16 b4 c |
    r2 b,4 c | r8 c d cis e4. g8 | b,2 r2 |
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \bar "|."
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
  }
}

bassoPart = \new Staff {
  \clef "bass"
  \global
  \relative c {\bassoA}
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

scoreContent = << 
  \chordsPart
  \temaPart
  \bassoPart
>>
%}}}

% {{{ BOOKS
  \book{
    \bookOutputSuffix "C"
    \score {
      \scoreContent
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 190 4) } }
    }
  }

  \book{
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
  }
% }}}
