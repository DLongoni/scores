% {{{ PARAMETRI
  myTitle = "Pioggia Fuori"
  mySubTitle = "Luca Pedeferri"
  myKey = \key g \major
  myTime = \time 3/4 
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
\layout {
  indent = #0
  \context { 
    \Staff \RemoveEmptyStaves 
    \override VerticalAxisGroup.remove-first = ##t
  }
}
trip = #(define-music-function (parser location m1 m2 m3) 
  (ly:music? ly:music? ly:music?)
  "Triplets"             
  #{ \tuplet 3/2 { $m1 $m2 $m3 } #})
%}}}

% {{{ PARTE A
  temaA = {
    \partial 4 g8 a |
    \repeat volta 2 {
      b2 c4 | a2 b4 | g2.~ | g2 b8 c | d2 b4 | e2 d4 | d g, r | r2 c8 d | \break
      e2 c4 | b2 d4 | a2.~ | a2 d8 c | b2 g4 | g2 g4 | g2.~ | g2 g8 a |
    } 
  }

  accordiA = \chordmode{
    \partial 4 s4 |
    \repeat volta 2{
      g2. | fis2.:dim7 | e2.:m | e2.:m | g2. | g2.:7 | c2. | ees2.:7 |
      a2.:m7 | aes:7.9+ | des2.:7.5+ | des2.:7.5+ | c2.:maj7 | a2.:m7 | aes2.:maj7 | aes2.:maj7 |
    }
  }

  silenzioA = {
    \partial 4 s4 |
    \repeat volta 2{
      s2. | s2. | s2. | s2. | s2. | s2. | s2. | s2. |
      s2. | s2. | s2. | s2. | s2. | s2. | s2. | s2. | 
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \time 4/4
    \key ees \major
    \repeat volta 2 {
      ees'4 d8 f ees4 d8 f | ees4 d8 f ees4 d8 f | 
      ees4 d8 f ees4 d8 f | ees4 d8 f ees4 d8 des | \break
    } 
  }

  accordiB = \chordmode{
    \repeat volta 2{
      ees1:maj7 | ees1:maj7 | ees1:maj7 | ees1:maj7 |
    }
  }

  silenzioB = \chordmode{
    \repeat volta 2{
      s1 | s1 | s1 | s1 |
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \key c \major
    \repeat volta 2 {
      r4 \trip b8 c d e8. b16~ b4 | r8 a a c g2 |
      c,8 c g' f f e8~ e4 | c8 c g' c, e2 | \break
      r4 \trip b'8 c d e8. b16~ b4 | a8 a a c g2 |
      c,8 c g' f f e8~ e4 | c8 c g' c, e4 b'4 | \break
      c4. b16 c d4 f, | e4. c'16 d \tuplet 3/2 {e4 a,4 c8 d8} |
      b4. c,16 cis a'4 g | g8 f c d e f~ f4 |
    } 
  }

  accordiC = \chordmode{
    \repeat volta 2{
      c2:maj7 bes2:7.11+.9- | f2:maj7 e2:m7 | 
      f2:maj7 e2:m7 | d2:m7 des2:7.9+ |
      c2:maj7 e2:7 | f2:maj7 aes2:maj7 |
      des2:maj7 c2:maj7 | f2:maj7 e4:m7 e4:7 |
      a2:m aes2:dim7 | c2:/g ges:m7.5- |
      e2:m7 ees2:7.5- | d1:m7 |
    }
  }

  bassoC = {
    \repeat volta 2{
      c4 r2 e4 | f r2 e8 ges | f4 r e r | r d des2 |
      c4 r2 e4 | f g aes r | r des c r | r c' b bes |
      a2 aes2 | g ges | r4 e ees r | d r a des |
    }
  }

  trombaC = {
    \repeat volta 2{
      s1 | s1 | s1 | s1 |
      s1 | s1 | s1 | s1 |
      a'2 b' | c'' b' | d'' ees'' | e'' c''8. c''16 r4 | 
    }
  }

  silenzioC = {
    \repeat volta 2{
      s1 | s1 | s1 | s1 |
      s1 | s1 | s1 | s1 |
      s1 | s1 | s1 | s1 |
    }
  }
% }}}

% {{{ PARTE Bridge
  accordiBridge = \chordmode{
    \repeat volta 2{
      c2 c2:/bes | c2:/a c2:/g |
      c2 c2:/bes | c2:/a aes2:maj7 |
    }
  }

  bassoBridge = {
    c'4\staccato r4 bes2 | a g |
    c'4\staccato r4 bes2 | a aes\fermata |
  }

  silenzioBridge = {
    s1 | s1 | s1 | s1 |
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
  \mark \markup{ \box \bold{Bridge} }
  \silenzioBridge
}

bassoPart = \new Staff {
  \clef "bass"
  \silenzioA
  \silenzioB
  \bassoC
  \bassoBridge
}

trombaPart = \new Staff {
  \silenzioA
  \silenzioB
  \trombaC
}


chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
    \accordiC
    \accordiBridge
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

scoreContent = << 
  \chordsPart
  \temaPart
  \trombaPart
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
%z }}}
