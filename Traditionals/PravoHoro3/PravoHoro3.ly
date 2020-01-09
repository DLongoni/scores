% {{{ PARAMETRI
  myTitle = "Pravo Horo 3"
  mySubTitle = "Bulgarian"
  myKey = \key d \major
  myTime = \time 2/4 
  myTempo =  #(ly:make-moment 126 4)
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
\paper{
  system-system-spacing =
    #'((basic-distance . 11) 
       (minimum-distance . 10)
       (padding . 0.6)
       (stretchability . 60)) 
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
      fis,8. b16 ais8. b16 | cis d r8 cis8. b16 | ais2 | b8 cis b4 | ais8. g16 \trip g8 fis e | \break
      fis8. b16 ais8. b16 | cis d r8 cis8. b16 | ais2 | b8 cis b4 | ais8. g16 \trip g8 fis e | \break
      \trip fis8 g e \trip g e b' | ais8. g16 \trip g8 fis e | fis2 b8 cis b4 | ais8. g16 \trip g8 fis e | \break
      \trip fis8 g e \trip g e b' | ais8. g16 \trip g8 fis e | fis2 b8 cis b4 | fis4 fis |

    } 
  }

  accordiA = \chordmode{
    \repeat volta 2{
      b2:m | b2:m | fis2 | b2:m | e2:m |
      b2:m | b2:m | fis2 | b2:m | e2:m |
      e2:m | e2:m | fis | b2:m | e2:m |
      e2:m | e2:m | fis | b2:m | fis2 |
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      \trip fis8 g e \trip g e b' | ais8. g16 \trip g8 fis e |
      \trip fis g e \trip g e b' | ais8. g16 \trip g8 fis e |
      \trip fis g e \trip g e b' | ais8. g16 \trip g8 fis g |
      ais8. g16 \trip g8 fis e |
    } 
    \alternative{
      { fis8. cis16 fis8. cis16 | }
      { fis4 fis 4 | }
    }
  }

  accordiB = \chordmode{
    \repeat volta 2{
      e2:m | e2:m | e2:m | e2:m | 
      e2:m | e2:m | e2:m |
    }
    \alternative{
      { e2:m | }
      { e2:m | }
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2 {
      fis'8. fis16 fis4 | fis2 | eis8. d16 cis8. b16 | d8. d16 d4 | d2 | e8.d16 cis8. b16 | \break
      ais8. b16 cis4 | cis2 | eis8. d16 cis8. b16 | \trip ais8 b cis \trip b8 ais g | fis2 | ais8. b16 cis4 | \break
      ais8. b16 cis4 | cis2 | eis8. d16 cis8. b16 | \trip ais8 b cis \trip b8 ais g | fis2 | fis4 fis4 | 

    } 
  }

  accordiC = \chordmode{
    \repeat volta 2{
      fis2 | fis2 | fis2 | b2:m | b2:m | b2:m |
      fis2 | fis2 | e2:m | e2:m | fis2 | fis2 |
      fis2 | fis2 | e2:m | e2:m | fis2 | fis2 |
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2 {
      b8 r \trip b8 cis d | e8. d16 cis8.\trill b16 | \trip ais8 b cis \trip b ais g | \trip fis8 fis fis cis' fis, | \break
      \acciaccatura{ais8} b8 r \trip b8 cis d | e8. d16 cis8.\trill b16 | \trip ais8 b cis \trip b ais g | \trip fis8 fis cis fis4 | \break
    } 
  }

  accordiD = \chordmode{
    \repeat volta 2{
      b2:m | b2:m | e2:m | fis2 |
      b2:m | b2:m | e2:m | fis2 |
    }
  }
% }}}

% {{{ PARTE E
  temaE = {
    \repeat volta 2 {
      \trip ais8 b cis \trip ais b cis | \trip b ais g fis8 cis | \trip ais' b cis \trip b ais g | \trip fis8 fis fis cis' fis, | 
      \trip ais8 b cis \trip ais b cis | \trip b ais g fis8 cis | \trip ais' b cis \trip b ais g |
    } 
    \alternative{
      { \trip fis8 fis cis fis4 | }
      { fis4 fis4 | } 
    }
  }

  accordiE = \chordmode{
    \repeat volta 2{
      fis2 | e4:m fis4 | fis4 e4:m | fis2 |
      fis2 | e4:m fis4 | fis4 e4:m | 
    }
    \alternative{
      { fis2 | }
      { fis2 | }
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
  \temaD 
  \mark \default
  \temaE 
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
