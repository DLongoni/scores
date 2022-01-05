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

% {{{ Obbligato
  temaObbUno = {
    g'8 r16 f aes f r g r b r d r des r c~ |
    c c b g aes b c b d8. cis16 ees8. c16 |
    ees d c a aes aes r aes r aes r aes r4 |
  }

  temaObbDue = {
    g8 r16 f aes f r g r b r d r des r c~ |
    c c b g aes b c b b8. gis16 bes8. g16 |
    a g f ees d d r d r d r d r4 |
  }

  temaObbTre = {
    g'8 r16 f aes f r g r b r d r des r c~ |
    c c b g aes g aes g f8. f16 g8. ees16 |
    f ees d b bes bes r bes r bes r bes r4 |
  }

% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \temaObbUno
  \bar "|."
}

bass = \relative c' {
  \bassoA
}

fisa = \relative c' {
  \fisaA
  \temaObbDue
}

ritmica = \relative c' {
  \ritmicaA
  \temaObbTre
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
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
    \score { \transpose c d {\scoreContent} }
  }
% }}}
