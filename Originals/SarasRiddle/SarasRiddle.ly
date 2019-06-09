% {{{ PARAMETRI
  myTitle = "Sara's Riddle"
  myKey = \key bes \major
  myTime = \time 9/8 
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
\layout {
  \context { 
    \Staff \RemoveEmptyStaves 
    \override VerticalAxisGroup.remove-first = ##t
  }
}
%}}}

% {{{ PARTE A
  temaA = {
    \partial 4. c'4 a8 |
    \repeat volta 2{
      bes4.~ bes4 a8 g8 e des |
      c4 d8 ees4 g8 f4.~ | f2. g4 a8 | bes2. bes4 g8 | 
      aes4.~ aes4 g8 f8 ges f | des2. ees4. | c2.~ c4. | c2.  c'4 a8 |
    }
  }

  silenzioA = {
    \partial 4. s4. |
    s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 | 
    s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 |
  }

  accordiA = \chordmode{
    \partial 4. s4. |
    \repeat volta 2{
      bes1*9/8:maj7 | aes1*9/8:6 | bes1*9/8:6 | g1*9/8:m7 |
      bes1*9/8:m7 | ges1*9/8:7 | f1*9/8:6 | f1*9/8:6 |
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2{
      \time 9/8
      g8 d bes' g4 f16 g16 f8 d c~ |
      c8 g bes c d e f4 d8 |
      g8 d bes' g4 f16 g16 f8 d c~ |
      \time 6/8
      c8 e c a8 g8 g8 |
    }
  }

  temaBdue = {
    \time 9/8
    \repeat volta 2{
      bes'8 g d' bes4 a16 bes16 a8 f e~ |
      e8 f g a c bes a4 f8 |
      bes8 g d' bes4 a16 bes16 a8 f e~ |
      \time 6/8
      e8 g e a8 g g |
    }
  }

  bassoB = {
    \repeat volta 2{
      g,2. bes,4. | c4. d2. |
      g,2. d4. | 
      \time 6/8
      c2. |
    }
  }

  ritmicaB = {
    \repeat volta 2{
      r8 <bes' d''>8 r8 <bes' d''>8 r4 r8 <bes' d''>8 r8 |
      <c'' e''>8 r4 r8 <d'' f''>8 r8 <d'' f''>8 r4 |
      r8 <bes' d''>8 r8 <bes' d''>8 r4 r8 <bes' d''>8 r8 |
      \time 6/8
      <c'' e''>8 r4 r8 <c'' e''>8 r8 |
    }
  }

  accordiB = \chordmode{
    g1*9/8:m7 | c4.:9 d2.:m7 |
    g1*9/8:m7 | c2.:9 |
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \mark \default
  \temaB \break
}

temaDue = \relative c' {
  \silenzioA
  \temaBdue 
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
  }
}

ritmicaPart = \new Staff {
  \silenzioA
  \ritmicaB
}

bassoPart = \new Staff {
  \clef "bass"
  \silenzioA
  \bassoB
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

temaPartDue = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \temaDue }

scoreContent = << 
  \chordsPart
  \temaPart
  \temaPartDue
  \ritmicaPart
  \bassoPart
>>
%}}}

% {{{ BOOKS
  \book{
    \bookOutputSuffix "C"
    \score {
      \scoreContent
      \layout { indent = #0 }
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 90 4) } }
    }
  }
% }}}
