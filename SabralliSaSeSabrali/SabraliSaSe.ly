% {{{ PARAMETRI
  myTitle = "Sabrali Sa Se, Sabrali"
  mySubTitle = "Bulgarian"
  myKey = \key d \major
  myTime = \time #'(3 2 2 2 3 2 2) 16/8
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

% TEMA UNO {{{
temaUno = {
  % A
  \mark \markup{ \box \bold{A} }
  b8 e e e4 e8 d fis4 fis8 d d b2 | cis8 d b cis4 a a b4. b4 r4 |
  \bar"||" \break

  % B1
  \mark \markup{ \box \bold{B1} }
  b8 e e e4 e8 d fis4 fis8 d d b2 | cis8 d b cis4 a a b4. b4 r4 |
  \bar"||" \break

  % B2
  \mark \markup{ \box \bold{B2} }
  b8 e e e4 e8 d fis4 fis8 d d b2 | cis8 d b cis4 a a b4. b4 r4 |
  \bar"||" \break

  % B3
  \mark \markup{ \box \bold{B3} }
  b8 e e e4 e8 d fis4 fis8 d d b2 | cis8 d b cis4 a a b4. b4 r4 |
  \bar"||" \break

  % C1
  \mark \markup{ \box \bold{C1} }
  \repeat volta 2{
    cis8 d b cis4 a8 e8 a4 d4. e8 d cis b | cis8 d b cis4 a8 e a4 b4. b4 r4 |
  }
  \break

  % C2
  \mark \markup{ \box \bold{C2} }
  cis8 d b cis4 a8 e8 a4 d4. e8 d cis b | cis8 d b cis4 a8 e a4 b4. b4 r4 |
  cis8 d b cis4 a8 e8 a4 d4. e8 d cis b | cis8 d b cis4 a8 e a4 b4. b2 |

  \bar"|."
}
% }}}

% TEMA DUE {{{
temaDue = {
  % A
  b8 b b b4 b b b4.~ b4~ b4 | b8 b b b4 a4 a a4. b4 r4|

  % B1
  b8 b b b4 b b b4.~ b4~ b4 | b8 b b b4 a8 e8 a4 a4. b4 r4|

  % B2
  b8 b b b4 b b b4.~ b4~ b4 | b8 b b b4 a4 a a4. b4 r4|

  % B3
  b8 b b b4 b b a4 a8 b2 | g8 g4 g g e fis4. fis4 r4 |

  % C1
  \repeat volta 2{
    a4.~ a2 a4 b4. b2 | a4.~ a2 a4 b4. b4 r4 |
  }

  % C2
  e,4.~ e2 e4 e4. e2 | e4.~ e2 e4 e4. fis4 r4 |
  e4.~ e2 e4 e4. e2 | e4.~ e2 e4 g4 fis8 fis2 |
}
% }}}

% TEMA TRE {{{
temaTre = {
  % A
  s1*16/8 | s4. s4 a8 e e4 e4. fis4 s4|

  % B1
  fis8 g g g4 g a a4. g2 | g8 fis e e4 e e fis4. fis4 s4 |

  % B2
  b8 a8 a a4 a b b4. fis2 | g8 fis fis e4 e e fis4. b4 s4 |

  % B3
  b8 a a a4 a g d4. d2 | g8 fis4 e4 e4 e4 fis4. fis4 s4 |

  % C1
  \repeat volta 2{
    e4.~ e2 e4 e4. e2 | e4. ~ e2 e4 e4. fis4 s4 |
  }

  % C2
  a,4.~ a2 a4 b4. b2 | a4.~ a2 a4 b4. b4 s4 |
  a4.~ a2 a4 b4. b2 | a4.~ a2 a4 e'4 d8 b2 |
}
% }}}

% LYRICS {{{
testoCompleto=\markup { }
% }}}

% SCORE {{{
temaUnoPart = \relative c' {
  \global 
  \temaUno
}

temaDuePart = \relative c'' {
  \global 
  <<  \temaDue \\ \temaTre >>
}

temaUnoPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
  \override VerticalAxisGroup.default-staff-staff-spacing =
  #'((padding . 0))
} { \clef "treble_8" \temaUnoPart }

scoreContent = << 
  \temaUnoPart
  \temaDuePart
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
    \testoCompleto
  }

  \book{
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
    \testoCompleto
  }

  \book{
    \bookOutputSuffix "Eb"
    \score { 
      \transpose ees c { 

        \scoreContent 

      } 
    }
    \testoCompleto
  }
% }}}
