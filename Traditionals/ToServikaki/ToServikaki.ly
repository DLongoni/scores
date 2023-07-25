% {{{ PARAMETRI
  myTitle = "To Servikaki"
  myFname = "ToServikaki"
  myKey = \key fis \minor
  myTime = \time 2/4 
  myTempo =  #(ly:make-moment 70 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2 {
      dis16 e fis e dis8 cis bis16 cis dis cis bis8 a |
      gis16 a bis dis cis bis a gis fis gis a bis cis bis cis r |
      dis16 e fis e dis8 cis bis16 cis dis cis bis8 a |
      gis16 a bis dis cis bis a gis fis8 cis fis r |
    } 
  }

  accordiA = \chordmode{
    \repeat volta 2{
      fis2:m | c:dim7 | cis2:7 | fis2:m |
      fis2:m | c:dim7 | cis2:7 | fis2:m |
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2{
      fis16 eis fis cis bis cis eis fis | gis a fis gis a bis gis a |
      bis cis a bis cis dis bis dis | e dis cis bis cis4 | \break
      e16 dis cis dis cis bis a8 | bis16 dis cis8 cis16 bis cis dis |
      cis bis a bis a gis fis eis | fis gis a bis cis8 cis | \break
      e16 dis cis dis cis bis a8 | bis16 dis cis8 cis16 bis cis dis |
      cis bis a bis a gis fis eis | fis8 cis fis4 |
    }
  }

  accordiB = \chordmode{
      \repeat volta 2{
        fis2:m | fis2:dim7 | c2:dim7 | fis2:m |
        fis2:m | fis2:m | cis2:7 | fis2:m |
        fis2:m | fis2:m | cis2:7 | fis2:m |
      }
    }
% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2{
      e16 dis e cis dis e fis e | g fis g e dis e fis gis | 
      a gis a e g fis e dis | e8 a e4 |
      g16 fis e dis e8 a,8 | g'16 fis e dis e8 a,8 | 
      g'16 fis e dis e dis e fis | g16 fis e dis e8 a,8 | \break
      g'16 fis e dis e dis c b | c b a gis a8 r16 e |
      e fis gis a b c dis e | g fis e dis c b a gis |
      a gis b a a gis gis fis | fis8 cis fis4 |
    }
  }

  accordiC = \chordmode{
    \repeat volta 2{
      a2 | a2 | a2 | a2 |
      a2 | a2 | a2 | a2 |
      a2:dim7 | a2:dim7 | e2:7 | a2:m | fis4:m g:7 | fis2:m | 
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2 {
      cis''8 cis  fis,16 gis a bis | cis bis a gis a gis fis8 |
      cis'8 cis  fis,16 gis a bis | cis bis a gis a gis fis8 |
      cis'8 cis  fis,16 gis a bis | cis bis a gis a gis fis8 |
      fis'16 e dis cis bis a gis a | fis8 cis fis4 |
    } 
  }

  accordiD = \chordmode{
    \repeat volta 2{
        fis2:m | fis2:m | fis2:m | fis2:m |
        fis2:m | fis2:m | cis2:7 | fis2:m |
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
  \temaD \break 
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
    \accordiC
    \accordiD
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
    \bookOutputSuffix "Fis"
    \score {
      \scoreContent 
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4) } }
    }
  }

  \book{
    \bookOutputSuffix "C"
    \score {
      \transpose c ees { \scoreContent }
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4) } }
    }
  }

  \book{
    \bookOutputSuffix "Bb"
    \score { \transpose c f {\scoreContent} }
  }
% }}}
