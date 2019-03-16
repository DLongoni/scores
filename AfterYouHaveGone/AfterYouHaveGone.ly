% {{{ PARAMETRI
  myTitle = "After You Have Gone"
  mySubTitle = "Birely Lagrene Solo"
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
%}}}

% {{{ TEMA
  temaSolo = {
    g'8. fis32 f32 e4 e b | b8 a g a~ a2 | 
    g'8. \tuplet 3/2 16 {fis32 f32 e} ees4 ees c | c4 g8 a~ a2 |
    r2 r8 a8 fis g | b d fis g b d e f | 
    fis c cis e d b gis e | d b gis f e es d ees16 d |
    cis8 e g4 b4~ b8 b8~ | b4 a8 g a b r4 | 
    r8 c,8 ees fis bes c ees fis | \ottava #1 a c ees fis b4 r4 |
    r8 fis~ fis a~ a e g16 gis r8 | \ottava #0 r8 e, f e' d c a f | 
    e ees d r8 a' ais cis b | gis f cis b g f d c |
    b8 c e g b c e g | b16 a b8~ b a a4 r4 | 
    r8 a,, c ees g bes c ees | g a c ees d c b d |
    b g d b ais'16 b ais8 e a16 bes | a8 e gis16 a gis8 e g16 gis g8 e,, |
    gis b d f \tuplet 3/2 {gis8 b d} \tuplet 3/2 {e f gis} |
    \tuplet 3/2 {f e d} c8 b a g f e |
    d c b a gis b a b | c b a gis b d f g |
    e c b a c a bes a | c4 r4 r2 |
    r8 b e fis g a b d | e fis g a b c d ees |
    d c b a g dis e fis | g a bes b, a' g fis e |
    d16 e d8 b8 c d8 r r d | e d b c d8 r r d |
    r d des c b c e g | ais b d4 fis,8 d bes fis |
    d b c e g4 r4 | r1 | r1 | r1 | % non concludo perchè brutto
  }
% }}}

% {{{ ACCORDI
  accordiA = \chordmode{
    c1 | c1: | c1:m | c1:m | g1 | g1 | e1:7 | e1:7 | \break
    a1:7 | a1:7 | d1:7 | d1:7 | g1 | g1 | g1:7 | g1:7 | \break
    c1 | c1: | c1:m | c1:m | g1 | g1 | e1:7 | e1:7 | \break
    a1:m | e1:7 | a1:m | c1:m | g1 | b1:7 | e1:m7 | a1:7 | \break
    g1 | e1:7 | a1:m7 | d1:7 | g1 | g1 | g1:7 | g1:7 | \break
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \temaSolo \break
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    % \accordiA
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
% }}}
