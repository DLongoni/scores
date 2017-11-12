% DEFINIZIONI {{{
\version "2.18.2"

\header {
  title = "Don't Be Lazy"
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

toCoda = {
  % the align part
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT  
  \once \override Score.RehearsalMark.break-visibility = #begin-of-line-invisible
  \mark \markup { { \lower #1 "al  " { \musicglyph #"scripts.coda"} } } 
}
%}}}

% PARTE A {{{
temaA = {
  \repeat volta 2 {
    cis,8. fis16~ fis4. cis'4 b8 | e16 e r16 e e8 fis cis4 r4 |
    r4 b8 d a8. fis16 r4 | b16 b r b b8 d a8. fis16 r4 |
    r4 b8 cis gis8. fis16 r4 | 
    \time 3/4
    b16 b r b b8 d gis,8 fis |
  }
}

temaAdue = {
  \repeat volta 2 {
    s1 | a'16 a s a a8 b fis4 s4 |
    s1 | s1 |
    s4 fis8 a e8. d16 s4 | 
    \time 3/4
    fis16 fis s fis fis8 a e8 d |
  }
}

bassoA = {
  \repeat volta 2 {
    fis,2 cis'2 | e4 b a2 |
    b8 r d e fis r b, r | d r e fis cis fis r4 |
    b,8 r d e cis r b r | 
    \time 3/4
    cis8 r b r e cis |
  }
}

accordiA = \chordmode{
  \repeat volta 2 {
    \set chordChanges = ##t
    fis2:sus2 cis2:sus4 | e4:m7 e4:m7/b a2:6 |
    b2:m7 fis2:m9 | b2:m7 fis2:m9 | 
    b2:m7 e2:9 | 
    \time 3/4
    b2:m7 cis4:m7 | 
  }
}
% }}}

% PARTE B {{{
temaB = {
  \repeat volta 2 {
    d,2 fis 4 a | cis b a fis | gis2 \tuplet 3/2 {b4 bes fis} | 
    dis'2 fis4 f | ais,2 dis4 cis |
  }
  \alternative{
    {
      f,2 b4 bes |
      \time 2/4 
      r4 cis,4 |
    }
    {
      \time 4/4
      f2 b8. a16~ a4~ | 
      \time 2/4
      a4 r8 cis,8 |
    }
  }
}

bassoB = {
  \repeat volta 2 {
    s1 | s1 | s1 | s1 | s1 |
  }
  \alternative{
    {s1 |\time 2/4 s2|}
    {\time 4/4 s1 |\time 2/4 s2|}
  }
}

accordiB = \chordmode{
  \repeat volta 2 {
    d1:maj9 | d2:maj9 a2:7.11+ | aes2:m7 b2:maj7/g | 
    fis1:6 | b1:maj7 |
  }
  \alternative{
    {bes1:m7 | \time 2/4 a2:7 |}
    {\time 4/4 bes2:m7 bes8.:m7 cis16:7.9+ cis4:7.9+ |\time 2/4 cis2:7.9+|}
  }
}
% }}}

% PARTE C {{{
temaC = {
  \repeat volta 2 {
    e'16 fis e cis e fis a b cis b cis b~ b a8 gis16~ |
    gis8 e8~ e4 r4 e8 fis | cis8. b16 r4 e16 e r e e8 fis |
    \time 2/4 cis8. b16 r4 |
  }
}

bassoC = {
  \repeat volta 2 {
    fis,2 cis'4. gis8 | a4. gis8 a4 cis | d2 e4 cis | \time 2/4 b gis |
  }
}

accordiC = \chordmode{
  \repeat volta 2 {
    fis2:m7 cis2:m7 |a1:maj7 | d2:maj7 cis2:m7 | \time 2/4 b2:m7 |
  }
}
% }}}

% SCORE {{{
tema = \relative c' {
  \global 
  \mark \default
  \new Voice <<
    \temaA
    \temaAdue
  >>
  \mark \default
  \time 4/4
  \temaB
  \bar "||"
  \break
  \mark \default
  \temaC
}

basso = \relative c {
  \global 
  \bassoA
  \bassoB
  \bassoC
}

chordsPart ={
  \new ChordNames {
    \accordiA
    \accordiB
    \accordiC
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \tema }

bassPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "tuba"
} { \clef bass \basso }

\book{
  \bookOutputSuffix "Score"
  \score {
    <<
      \chordsPart
      \temaPart
      \bassPart
    >>
    \layout {
      indent = #0
    }
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 80 4)
      }
    }
  }
}

\book{
  \bookOutputSuffix "Bb"
  \score {
    <<
      \transpose c d { \chordsPart }
      \transpose c d { \temaPart}
    >>
    \layout {
      indent = #0
    }
  }
}
% }}}
