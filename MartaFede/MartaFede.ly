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
accordiTema=\chordmode{
  s1 | a1 | cis1:m | b1:m | a1 |
  a1 | cis1:m | d1 | a1 |
}

saxTema={
  r4 r8 gis' gis8. gis8. fis8 \bar"||"| e4. gis8 a8. gis fis8 | e4 r4 r8 cis e e |
  d4 r8 cis d a gis a8~ | a4 r8 gis' gis8. gis8. fis8 |\break
  e4. gis8 a8. gis fis8 | e4 r4 r8 cis e e |
  d4 r8 e e fis4 e8~ | e4 r4 r2 |\break
}

trombaTema={
  r4 r8 e cis'8. cis8. b8 \bar"||"| a4. e8 cis'8. b a8 | gis4 r4 r8 e gis a |
  fis4 r8 e fis cis b cis8~| cis4 r8 e cis'8. cis8. b8 |
  a4. e8 cis'8. b a8 | gis4 r4 r8 e gis a |
  fis4 r8 cis'8 cis b4 a8~ | a4 r4 r2 |
}

pausaTema={R1*9}
  % }}}

  % STROFA {{{
  temaStrofa={
    e8 e4 fis4 fis a8~ | a8 a4 fis8 fis4 e4 |
    fis4 e8 dis4 e fis8~ | fis4 fis8 dis e4 dis |\break
    r4 r8 gis8 e e e dis | cis4 r8 b a b cis4 |
    e8 fis d4 r2 | r2 r4 r8 e |\break
  }

  accordiStrofa=\chordmode{
    a1 | a1 | b1 | b1 |
    cis1:m | cis1:m | d1 | d1 |
  }

  saxStrofa={
    r1|r1|r1|r1|
    r1|r1|r2 r8 b cis b | fis' d4 cis d b8~ |
    b8 cis4. r2| r1| r1 | r1|
    r1|r1| r1 | b16 d8 cis16~ cis16 fis8 e16~ e8 d8 d cis |
  }

  trombaStrofa={
    r1|r1|r1|r1|
    r1|r1|r2 r8 d, e d | a' fis4 e fis e8~ |
    e2 r2| r1| r1 | r1|
    r1|r1| r1 | d16 fis8 e16~ e16 a8 gis16~ gis8 fis8 fis e |
  }

  pausaStrofa={R1*8}
% }}}

% RITORNELLO {{{
temaRit={
  gis8. gis gis8 gis gis fis gis | a8. fis16~ fis4 r8 fis8 fis e |
  d4 d8 d d4 d8 fis | e e e e e4 d8 cis | 
  a4 r8 a'8 a gis fis gis | a8. fis16~ fis4 r8 e fis e|
  fis4 d d d8 fis | gis4 e r4 r8 gis8 |
  gis8. gis gis8 gis gis fis gis | a8. fis16~ fis4 r8 fis8 fis e |
  d4 d8 d d4 d8 fis | e e e e e4 d8 cis | 
  a4 r8 a'8 a gis fis gis | a8. fis16~ fis4 r4 fis8 e |
  d4 d8 d d4 d8 fis | e8 e e e e4 d8 cis | a2 r2|
}

accordiRit=\chordmode{
  e1 | fis1:m | d1 | e1 |
  a1 | fis1:m | d1 | e1 |
  cis1:m | fis1:m | d1 | e1 |
  a1 | fis1:m | d1 | e1 | a1 |
}

saxRit={
  e2 r2| r1| r1| r1|
  r1|r1|r1|r1|
  r1|r1|r1|r1|
  r1|r1|r1|r1|r4 r8 gis gis8. gis8. fis8|
}

trombaRit={
  gis2 r2| r1| r1| r1|
  r1|r1|r1|r1|
  r1|r1|r1|r1|
  r1|r1|r1|r1|r4 r8 e cis'8. cis8. b8 |
}
      % }}}

      % MAIN {{{
      sax = \relative c'' {
        %\transposition ees
        \global
        \mark \markup{ \box \bold{A1} }
        \saxTema
        \saxStrofa
        \saxRit
      }

      trumpetBb = \relative c'' {
        %\transposition bes
        \global
        \trombaTema
        \trombaStrofa
        \trombaRit
      }

      guitar = \relative c' {
        \global
        \pausaTema
        \temaStrofa
        \temaStrofa
        \temaRit
      }

      chordsPart ={
        \new ChordNames {
          \accordiTema
          \accordiStrofa
          \accordiStrofa
          \accordiRit
        }}

        saxPart = \new Staff \with {
          instrumentName = "Sax"
          shortInstrumentName = #"S"
          midiInstrument = "sax"
        } \sax

        trumpetPart =  \new Staff \with {
          instrumentName = "Tromba"
          shortInstrumentName = #"T"
          midiInstrument = "trumpet"
        } \trumpetBb

        guitarPart = \new Staff \with {
          instrumentName = "Voce"
          shortInstrumentName = #"V"
          midiInstrument = "guitar"
        } { \clef "treble_8" \guitar }
      %}}}

      % {{{ BOOKS
        \book{
          \bookOutputSuffix "Score"
          \score {
            <<
              \chordsPart
              \trumpetPart
              \saxPart
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

        % \book{
        %   \bookOutputSuffix "ClTr"
        %   \score {
        %     <<
        %       \transpose c d { \chordsPart }
        %       \transpose c d { \trumpetPart}
        %       \transpose c a { \saxPart}
        %     >>
        %   }
        % }
      % }}}
