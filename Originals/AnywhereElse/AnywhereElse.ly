% {{{ PARAMETRI
  myTitle = "Anywhere Else"
  myFname = "AnywhereElse"
  mySubTitle = "Serbian"
  myKey = \key g \major
  myTime = \time 4/4 
  myTempo =  #(ly:make-moment 140 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 3 {
      g4. d'8~ d4 r8 b | \trip fis4 g d' \trip f, c' d | 
      gis,4. d'8~ d4 r8 b | \trip a4 c d \trip g, c d |
      fis,4. d'8~ d4 r8 c | \trip aes4 des ees \trip f8~ f des r8 bes16 aes |
    } 
    \alternative{
      { g2 r8 ees'8~ ees4 | d8 bes r aes r fis8~ fis4 | }
      { g2 r8 ees'8~ ees4~ | ees4 r4 c8 bes r aes8 | g1 | }
      { g2 r8 ees'8~ ees4~ | ees4 r4 c8 bes r aes8 | g1 | }
    }
  }

  bassoA = {
    \repeat volta 3 {
      g8 r16 g16 r8 b8~ b4 r4 | r8 b8~ b16 fis8. ees4 r4 |
      e8 r16 e16 r8 gis8~ gis4 r4 | r8 a8~ a16 e8. f4 r4 |
      d16 d r8 r8 d16 d r4 fis4 | des4. f8 bes4 r |
    } 
    \alternative{
      { ees,8 r16 ees16 r8 g8~ g4 r4 | e8. bes'16 r8 a8 aes4 ges4 | }
      { ees8 r16 ees16 r8 g8~ g4 r4 | e4. b8 aes4 c16 des r8 | ees4 r4 r2 | }
      { s1 | s1 | s1 | }
    }
  }

  ritmicaA = {
    \repeat volta 3 {
      r8 d16 e r d b r d8 r r4 | r8 d16 e r d b r d8 r16 d16 r4 |
      r8 d16 e r d b r d8 r r4 | r8 d16 e r d b r d16 r16 e16 d16 r4 |
      r8 d16 e r d b r d8 r r4 | r8 des16 ees r des bes r des8 r r4 | 
    } 
    \alternative{
      { r8 des16 ees r des bes r des16 r ees des r4 | 
      gis,16 gis r ais r c r ges~ ges4 r4 | }
      { r8 des'16 ees r des bes r des16 r ees des r4 | 
      g,16 g r bes r c r8 r16 bes r c ees c bes r |
      g8 r r4 r2 | }
      { s1 | s1 | s1 | }
    }
  }

  fisaA = {
    \repeat volta 3 {
      \trip fis8( g fis \trip g fis g \trip fis8 g fis \trip g fis g) | 
      \trip fis8( g fis \trip g fis g) \trip f8( g f \trip g f g) |
      \trip fis8( gis fis \trip gis fis gis \trip fis8 gis fis \trip gis fis gis) |
      \trip g8( a g \trip a g a) \trip f8( g f \trip g f g) |
      \trip e8( fis e \trip fis e fis \trip e8 fis e \trip fis e fis) |
      \trip f8( ges f \trip ges f ges \trip f8 ges f \trip ges f ges) |
    } 
    \alternative{
      {
      \trip g8( aes g \trip aes g aes \trip g8 aes g \trip aes g aes) |
      \trip fis8( gis fis \trip gis fis gis \trip fis8 gis fis \trip gis fis gis) |
}
      {
      \trip ees8( f ees \trip f ees f \trip ees8 f ees \trip f ees f) |
      \trip dis8( e dis \trip e dis e) \trip ees( f ees \trip f ees f) |
      \trip d( ees d \trip ees d ees d4) r4 |
}
      { s1 | s1 | s1 | }
    }
  }

  accordiA = \chordmode{
    \repeat volta 3 {
      g1 | b2:m ees2:maj7 | e1:7 | a2:m f2 | 
      d1:7 | des2 bes2:m |
    }
    \alternative{
      { ees1 | e2:7.11+ aes2:7 | }
      { ees1 | e2:m7+ aes2:maj7 | ees1 | }
      { ees1 | e2:m7+ aes2:7 | g1 | }
    }
  }
% }}}

% {{{ Special to A
  temaObbUnoA = {
    g8 r16 f aes f r g r b r d r des r c~ |
    c b32 c b16 g aes b c b d8. c16 ees8. des16 |
    \time 5/4
    e dis cis b bes bes r bes r bes r bes r2 |
    \time 4/4
  }

  temaObbDueA = {
    g,8 r16 f aes f r g r b r d r des r c~ |
    c b32 c b16 g aes b c b bes8. gis16 a8. bes16 |
    \time 5/4
    cis a bes g fis fis r fis r fis r fis r2 |
    \time 4/4
  }

  temaObbTreA = {
    g8 r16 f aes f r g r b r d r des r c~ |
    c b32 c b16 g aes g ges f e8. f16 des8. bes16 |
    \time 5/4
    a bes cis e c c r c r c r c r2 |
    \time 4/4
  }

  accordiObbA = \chordmode{
    s1 | s2 bes4:7 ees4:7 |
    \time 5/4
    a4:7 d1:7 | 
    \time 4/4
  }


  silenzioObbA = {
    s1 | s1 |
    \time 5/4
    s1*5/4 |
    \time 4/4
  }

% }}}

% {{{ Special to B
  temaObbUnoB = {
    g8 r16 f aes f r g r b r d r des r c~ |
    c b32 c b16 g aes b c b d8. c16 ees8. des16 |
    \time 3/4
    e dis cis b bes bes r bes r bes r bes~ |
    \time 4/4
    bes4 d2 fis4 | gis1 |
  }

  temaObbDueB = {
    g8 r16 f aes f r g r b r d r des r c~ |
    c b32 c b16 g aes b c b bes8. gis16 a8. bes16 |
    \time 3/4
    cis a bes g fis fis r fis r fis r fis~ |
    \time 4/4
    fis1~ | fis |
  }

  temaObbTreB = {
    g'8 r16 f aes f r g r b r d r des r c~ |
    c b32 c b16 g aes g ges f e8. f16 des8. bes16 |
    \time 3/4
    a bes cis e c c r c r c r c~ |
    \time 4/4
    c1~ | c |
  }

  silenzioObbB = {
    s1 | s1 |
    \time 3/4
    s1*3/4 |
    \time 4/4
    s1 | s1 |
  }

  accordiObbB = \chordmode{
    s1 | s2 bes4:7 ees4:7 |
    \time 3/4
    a4:7 d2:7 | 
    \time 4/4
    d1:7 | d1:7.11+ |
  }

% }}}

% {{{ PARTE B
  temaB = \repeat volta 2 {
    r16 f r f32 fes ees16 c aes f16~ f4 r16 aes r f |
    g4 r16 f aes f g bes b d g bes r aes | d,4 r16 f r ees c2 | r1 | \break
    r16 c' r c32 ces bes16 g ees c~ c4 r16 ees r c | 
  }
  \alternative{
    { d4 r16 c ees c d f fis a d a r c | b1 | r1 | }
    { d,4 r16 c ees c d f fis a d a r g | }
  }

  armoniaB = {
    \repeat volta 2{
      <c' f,~>1 | <b f~>1 | <bes f>2. r4 |
      <bes g>4 <c a>4 <d bes>4 \grace{<fis cis>16} <g d>4 | <f c>1 |
    }
    \alternative{
      { r1 | r2. <d a>4 | <b fis>2 <c e,>2 | }
      { r1 | }
    }
  }

  bassoB = \repeat volta 2 {
     des8 r8 aes'8 r8 des,16 des r des r8 c | des8 r16 g g r8 des16 des8 r r ces |
     c8 r g'8 r8 c,16 c r c r8 d | ees8 r16 g g r8 ees16 ees8 r r g, |
     aes8 r8 ees'8 r8 aes,16 aes r aes r8 g | 
  }
  \alternative{
     { aes8 r16 d16 d r8 aes16 aes8 r r ges | 
     g8 r d' r g,16 g r g r8 fis | g8 r16 d' d r8 g,16 g8 r8 r4 | }
     { aes8 r16 d16 d r8 aes16 aes8 r r8. g16 | }
  }

  silenzioB = \repeat volta 2 { s1 | s1 | s1 | s1 | s1 | }
  \alternative {
    { s1 | s1 | s1 | }
    { s1 | }
  }

  accordiB = \chordmode{
    \repeat volta 2 {
      des1:maj7.9.11+ | des1:7.11+ | c1:m | ees1 |
      aes1:maj7.9.11+ | 
    }
    \alternative{
      {aes1:7.11+ | g1 | g1 | }
      {aes1:7.11+ | }
    } 
}
% }}}

% {{{ Coda
  temaCoda = {
    g,8 r16 f aes f r g r b r d r des r c~ |
    c b32 c b16 g aes b c b d8. c16 ees8. des16 |
    e dis cis b bes aes r b r d r f~ f4~ |
    f1 |
  }

  temaCodaDue = {
    g8 r16 f aes f r g r b r d r des r c~ |
    c b32 c b16 g aes b c b bes8. gis16 a8. bes16 |
    cis a bes g fis fis r f r gis r gis~ gis4~ |
    gis1 |
  }

  temaCodaTre = {
    g'8 r16 f aes f r g r b r d r des r c~ |
    c b32 c b16 g aes g ges f e8. f16 des8. bes16 |
    a bes cis e c bes r d r c r b~ b4~ |
    b1 |
  }

  silenzioCoda = {
    s1 | s1 |
    s1 | s1 |
  }
% }}}

% {{{ Obbligato Old (fine Bb7)
%   temaObbUno = {
%     g'8 r16 f aes f r g r b r d r des r c~ |
%     c c b g aes b c b d8. cis16 ees8. c16 |
%     ees d c a aes aes r aes r aes r aes r4 |
%   }
%
%   temaObbDue = {
%     g8 r16 f aes f r g r b r d r des r c~ |
%     c c b g aes b c b b8. gis16 bes8. g16 |
%     a g f ees d d r d r d r d r4 |
%   }
%
%   temaObbTre = {
%     g'8 r16 f aes f r g r b r d r des r c~ |
%     c c b g aes g aes g f8. f16 g8. ees16 |
%     f ees d b bes bes r bes r bes r bes r4 |
%   }
%
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \mark \markup{ \box \bold{"Special to A"} }
  \temaObbUnoA \break
  \mark \markup{ \box \bold{"Special to B"} }
  \temaObbUnoB \break
  \mark \default
  \temaB \break
  \bar "||"
  \mark \markup{ \box \bold{"Coda"} }
  \temaCoda
  \bar "|."
}

bass = \relative c' {
  \bassoA
  \silenzioObbA
  \silenzioObbB
  \bassoB
}

fisa = \relative c' {
  \fisaA
  \temaObbDueA
  \temaObbDueB
  \armoniaB
  \temaCodaDue
}

ritmica = \relative c' {
  \ritmicaA
  \temaObbTreA
  \temaObbTreB
  \silenzioB
  \temaCodaTre
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiObbA
    \accordiObbB
    \accordiB
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

bassPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "bass"
  shortInstrumentName = "B"
} { \clef "bass" \global \bass }

fisaPart = \new Staff \with {
  instrumentName = ""
  shortInstrumentName = "F"
} { \clef "treble_8" \global \fisa }

ritmicaPart = \new Staff \with {
  instrumentName = ""
  shortInstrumentName = "F"
} { \clef "treble_8" \global \ritmica }

scoreContent = << 
  \chordsPart
  \temaPart
  \fisaPart
  \ritmicaPart
  \bassPart
>>

scoreContentTheme = <<
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

  \book{
    \bookOutputName \myFname
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContentTheme} }
  }
% }}}
