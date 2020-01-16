% {{{ PARAMETRI
  myTitle = "Pajdusko Horo"
  mySubTitle = "Bulgarian"
  myKey = \key a \major
  myTime = \time #'(2 3) 5/8 
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
    \repeat volta 2 {
      a4\prall a8 b cis | d e fis e d | cis4\prall a8 b cis | d e, d' cis b | \break
      cis4\prall b8 a gis | a4\prall a8 e e | a4\prall a8 b cis | d e fis e d | \break
      cis4\prall a8 b cis | d e, d' cis b | cis4\prall b8 a gis | a e a4\prall r8 |
    } 
  }

  accordiA = \chordmode{
    \repeat volta 2{
      a1*5/8 | d1*5/8 | a1*5/8 | b1*5/8:m |
      e1*5/8:7 | a1*5/8 | a1*5/8 | d1*5/8 |
      a1*5/8 | b1*5/8:m | e1*5/8:7 | a1*5/8 |
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      e'8 fis gis4\trill fis8 | fis4\prall  fis\trill e8 | 
      gis4\prall  e\trill d8 | cis8 b cis4\trill a8 | \break
      cis8 d e4\trill d8 | d8 cis e fis4\trill | 
      fis8 e d cis b | cis d e4\trill a,8 | \break
      fis'4\mordent gis\prall  fis8 | fis4\mordent fis\trill e8 | 
      gis4\mordent e\trill d8 | cis8 d cis4\trill a8 | \break
      cis8 d e4\trill d8 | d8 cis e fis4\trill | fis8 e d cis b | cis a cis4 r8 |
    } 
  }

  accordiB = \chordmode{
    \repeat volta 2{
      e1*5/8 | a1*5/8 | e1*5/8 | a1*5/8 |
      e1*5/8 | a1*5/8 | d4 e4. | a1*5/8 |
      d1*5/8 | b1*5/8:m | e1*5/8 | a1*5/8 |
      fis1*5/8:7 | b1*5/8:m | e1*5/8:7 | a1*5/8 |
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2 {
      cis8 d e4\trill d8 | d cis e fis4\trill | fis8 e d cis b | cis d e fis gis | \break
      a gis a4\trill gis8 | gis e gis4\prall fis8 | e4\prall d8 cis b | cis a cis4\prall r8 |
    } 
  }

  accordiC = \chordmode{
    \repeat volta 2{
      a1*5/8 | b1*5/8:m | e1*5/8 | a1*5/8 |
      fis1*5/8:m | d1*5/8 | e1*5/8 | a1*5/8 |
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2 {
      a'8 gis a4\prall gis8 | gis e gis4\prall fis8 | e4\prall d8 cis b | cis d e fis gis | \break
      a4\prall a4\prall gis8 | gis e gis4\prall fis8 | e4\prall d8 cis b |
    } 
    \alternative{
      { cis8 d e4\trill e8 | }
      { cis8 a cis4 r8^\markup{ \italic{Fine}} | }
    }
  }

  accordiD = \chordmode{
    \repeat volta 2{
      d1*5/8 | e1*5/8 | e1*5/8:7 | a1*5/8 |
      fis1*5/8:m | d1*5/8 | e1*5/8 |
    }
    \alternative{
      { a1*5/8 | }
      { 
        \set chordChanges = ##f
        a1*5/8 | 
        \set chordChanges = ##t
      }
    }
  }
% }}}

% {{{ PARTE E
  temaE = {
    \repeat volta 2 {
      cis4\trill cis8 d e | fis4\prall fis\prall e8 | 
      gis e fis4\trill e8 | e4\trill d8 cis b | \break
      cis8 d e4\prall d8 | fis4 e8 fis gis | 
      e4\trill d8 cis b | cis d e4\trill a,8 | \break
      cis4\trill cis8 d e | fis4\mordent fis\prall e8 | 
      gis e fis4\trill e8 | e4\trill d8 cis b | \break
      cis8 d e4 d8 | fis4\mordent e8\prall fis gis | 
      e4\trill d8 cis b | cis a cis4 r8 |
    } 
  }

  accordiE = \chordmode{
    \repeat volta 2{
      a1*5/8 | d1*5/8 | e1*5/8 | a1*5/8 |
      a1*5/8 | e1*5/8 | e1*5/8:7 | a1*5/8 |
      a1*5/8 | d1*5/8 | e1*5/8 | a1*5/8 |
      a1*5/8 | e1*5/8 | e1*5/8:7 | a1*5/8 |
    }
  }
% }}}

% {{{ PARTE F
  temaF = {
    \key d \major
    \repeat volta 2 {
      a4\trill a8 cis e | g fis e fis g | g a fis4\trill e8 | g8 fis8 e a, a | \break
      a4\trill a8 cis e | g fis e fis g | a e g4\trill e8 |
    } 
    \alternative{
      { g8 fis e a, a| }
      { g8 fis e r4| }
    }
  }

  accordiF = \chordmode{
    \repeat volta 2{
      a1*5/8 | a1*5/8 | a1*5/8 | a1*5/8 |
      a1*5/8 | a1*5/8 | a1*5/8 |
    }
    \alternative{
      { a1*5/8 | }
      { a1*5/8 | }
    }
  }
% }}}

% {{{ PARTE G
  temaG = {
    \repeat volta 2 {
      a'8 fis g4\trill e8 | g fis e dis e | cis4\trill a8 cis e | g fis e a, a | \break
      a'8 fis g4\trill e8 | g fis e dis e | cis4\trill a8 cis e | g fis e r4 |
    } 
  }

  accordiG = \chordmode{
    \repeat volta 2{
      a1*5/8 | a1*5/8 | a1*5/8 | a1*5/8 |
      a1*5/8 | a1*5/8 | a1*5/8 | a1*5/8 |
    }
  }
% }}}

% {{{ PARTE H
  temaH = {
    \repeat volta 2 {
      b4\prall d8 cis b | b4\prall c8 b a | b4\prall d8 cis b | cis a b4\prall fis8 | \break
      b4\prall d8 cis b | cis d e fis4\prall | fis8 e d cis b |
    } 
    \alternative{
      { cis a b4\prall fis8 | }
      { cis'8 a b4 r8 | }
    }
  }

  accordiH = \chordmode{
    \repeat volta 2{
      b1*5/8:m | b1*5/8:m | b1*5/8:m | a4 b4.:m |
      b1*5/8:m | a1*5/8 | d1*5/8 |
    }
    \alternative{
      { e4:m b4.:m |}
      { e4:m b4.:m |}
    }
  }
% }}}

% {{{ PARTE I
  temaI = {
    \repeat volta 2 {
      b4\prall d8 cis b | cis4\trill cis8 b a | b4\mordent c8 b a | c a b4 fis8 | \break
      b4\prall d8 cis b | cis4\trill cis8 b a | b4 c8 b a |
    } 
    \alternative{
      { c8 a b4\prall fis8 | }
      { c'8 a b4 r8^\markup{ \italic{D.C. al Fine}} | }
    }
  }

  accordiI = \chordmode{
    \repeat volta 2{
      b1*5/8:m | a1*5/8 | a1*5/8:m | b1*5/8:m |
      b1*5/8:m | a1*5/8 | a1*5/8:m |
    }
    \alternative{
      { b1*5/8:m |}
      { b1*5/8:m |}
    }
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \mark \default
  \temaB \break
  \mark \default
  \temaC \break
  \mark \default
  \temaD \pageBreak
  \mark \default
  \temaE \break
  \mark \default
  \temaF \break
  \mark \default
  \temaG \break
  \mark \default
  \temaH \break
  \mark \default
  \temaI \break
  \bar "|."
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
    \accordiC
    \accordiD
    \accordiE
    \accordiF
    \accordiG
    \accordiH
    \accordiI
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
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 190 4) } }
    }
  }

  \book{
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
  }
% }}}
