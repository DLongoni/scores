% {{{ PARAMETRI
  myTitle = "Autumn Leaves"
  myFname = "AutumnLeaves"
  mySubTitle = ""
  myKey = \key g \major
  myTime = \time 4/4 
  myTempo =  #(ly:make-moment 190 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  vociAuno = \relative c''{
    \repeat volta 2{
      \new Voice <<
        { g1 | fis | fis | e | e | dis | }
        { e1 | d | d | c | c | b | }
        { c1 | c | b | b | a | a | }
        { a1 | a | g | g | fis | fis | }
       >>
     }
    \alternative{
      {
        \new Voice <<
          { d'2 d | e f | }  
          { b,2 b | d d | }  
          { g,2 a | b b | } 
          { e,2 fis | fis gis |} 
         >>
      }
      {
        \new Voice <<
          { d'1 | d | } 
          { b1 | b | }  
          { g1 | g | } 
          { e1 | e | } 
         >>
      }
    }
  }

  accordiAuno = \chordmode{
    \repeat volta 2{
      a1:m7 | d1:7 | g1:maj7 | c1:maj7 |
      f1:m7.5- | b1:7 | 
    }
    \alternative{
      { e1:m | e1:m | }
      { e1:m | e1:m | }
    }
  }
% }}}

% {{{ PARTE B
  vociBuno = {
      \new Voice <<
        { c1 | b | b | b | a | a | g | g | a | b | d2 des | d des | c1 | dis | d | d | }
        { a1 | a | g | g | g | fis | fis | fis | fis | a | b2 b | c ces | b1 | b | b | b | }
        { fis1 | fis | e | e | e | d | d | d | e | fis | g2 g | a a | g1 | a | g | g | } 
        { e1 | dis | d | d | c | c | b | b | c | dis | e2 ees | f2 f | e1 | fis | e | e | }
       >>
     }

  accordiB = \chordmode{
    f1:m7.5- | b1:7.9- | e1:m | e1:m | 
    a1:m7 | d1:7 | g1:maj7 | g1:maj7 | \break
    f1:m7.5- | b1:7.9- | e2:m7 ees2:7 | d2:m7 des2:7 |
    c1:maj7 | b1:7.9- | e1:m | e1:m |
  }
% }}}

% {{{ PARTE A due
  vociAdue = \relative c''{
    \repeat volta 2{
      \new Voice <<
        { e,1 | e | d | d | c | c | }
        { b1 | b | a | a | g | g | }
        { fis1 | fis | e | e | d | dis | }
        { c1 | c | b | b | a | a | }
       >>
     }
    \alternative{
        \new Voice <<
          { c'2 cis | d d | }
          { g,2 g | gis ais | }
          { e2 e | e f | }
          { b,2 b | b b | }
         >>
      }
      {
        \new Voice <<
          { d'1 | d1 | }
          { g,1 | g | }
          { e1 | e | }
          { b1 | b | }
         >>
      }
    }

  accordiAdue = \chordmode{
    \repeat volta 2{
      a1:m7 | d1:7 | g1:maj7 | c1:maj7 |
      f1:m7.5- | b1:7 | 
    }
    \alternative{
      { e1:m | e1:m | }
      { e1:m | e1:m | }
    }
    }
% }}}

% SCORE {{{
ArmUno = \relative c' {
  \mark \default
  \vociAuno \bar "||" \break
  \mark \default
  \vociBuno \break \bar "||"
  \mark \markup{ \box \bold{A2} }
  \mark \default
  \vociAdue \bar "|." \break
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiAuno
    \accordiB
    \accordiAdue
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \ArmUno }

scoreContent = << 
  \chordsPart
  \temaPart
>>
%}}}

% {{{ BOOKS
  \book{
    \bookOutputName \myFname
    \bookOutputSuffix "C"
    \score {
      \scoreContent
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 190 4) } }
    }
  }
% }}}
