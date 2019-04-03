% {{{ PARAMETRI
  myTitle = "Lick Bag - Minor 251"
  myTempo =  #(ly:make-moment 190 4)
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
  myStaffSize = #2
  fonts = #(make-pango-font-tree
  "FontAwesome"
  "FontAwesome"
  "FontAwesome"
  (/ myStaffSize 2))  
  
  scoreTitleMarkup = \markup { 
    \column {
      \fill-line {
        \fontsize #2.5 \italic \fromproperty #'header:piece
        \fromproperty #'header:opus
      }
    }
  }
  
%    markup-system-spacing =
%    #'((basic-distance . 0)
%       (padding . 0))
    
%    score-markup-spacing =
%    #'((basic-distance . 0)
%       (padding . 0))
}

global = {
  \numericTimeSignature
  \set Score.markFormatter = #format-mark-box-alphabet
}
\layout { 
  \override Score.RehearsalMark.self-alignment-X = #LEFT
  \set chordChanges = ##t
  indent = #0
  \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #2

}
%}}}

% {{{ LICK A
  temaA = {
    \time 4/4
    \key f \major
    r2 \tuplet 3/2 {c8\2 d e} \tuplet 3/2 {f g a} |
    \tuplet 3/2 {f g a} \tuplet 3/2 {bes c d} \tuplet 3/2 {e f g} a8 r8 |
    c4 bes8 a g f e a | f4 d a f |
  }
  

  accordiA = \new ChordNames{ 
    \chordmode{
      e1:m7.5- | a1:7 | d1:m7 | d1:m7 \bar "|."
    }
  }

  lickA = \score {
    \header{ piece="1. Mike Stern, Autumn Leaves"}
    << 
        \relative c' {\temaA}
        \accordiA
    >>    
  }
% }}}

% {{{ LICK B
  temaB = {
    \time 4/4
    \key c \major
    r8. f16\1 e'8\4 \glissando d16\4 a16~\1 a16 f8\2 g16~\3 g16 f8\2 aes16 | 
    g16 f e d c aes g e\4 f\3 d e f a c e a,\3 \glissando |
    b d\1 c\4 e,\1 r4 r2 |
  }
  

  accordiB = \new ChordNames{ 
    \chordmode{
      b1:m7.5- | e1:7 | a1:m7 | \bar "|."
    }
  }

  lickB = \score {
    \header{ piece="2. Bireli, 500 miles high"}
    << 
        \relative c'' {\temaB}
        \accordiB
    >>    
  }
% }}}

% {{{ LICK C
  temaC = {
    \time 4/4
    \key c \major
    \partial 8 e8\0
    gis\4 b d f \tuplet 3/2 {gis8 b d} \tuplet 3/2 {e f gis} | \tuplet 3/2 {f e d} c8 b a g f d |
    e8 c b a gis4 r4 |
  }
  

  accordiC = \new ChordNames{ 
    \chordmode{
      \partial 8 r8 |
      e1:7 | e1:7 | a1:m7 | \bar "|."
    }
  }

  lickC = \score {
    \header{ piece="3. Bireli, After You Have Gone"}
    << 
        \relative c' {\temaC}
        \accordiC
    >>    
  }
% }}}

% {{{ LICK D
  temaD = {
    \time 4/4
    \key g \major
    r8 b\1 e\1 fis\3 g\4 a b c | dis fis g a b c d ees |
    d c b a g4 r4 |
  }
  

  accordiD = \new ChordNames{ 
    \chordmode{
      fis1:m7.5- | b1:7 | e1:m7 | \bar "|."
    }
  }

  lickD = \score {
    \header{ piece="4. Bireli, After You Have Gone"}
    << 
        \relative c' {\temaD}
        \accordiD
    >>    
  }
% }}}

% {{{ LICK E
  temaE = {
    \time 4/4
    \key ees \major
    \partial 4 bes8\4 a\3 | 
    aes\2 ees'\4 r g, r f r ees | d c r b~ b g fis g | d'4~ d8 c b c ees4~ | ees1 |
  }

  accordiE = \new ChordNames{ \chordmode{
    \partial 4 s4 | d1:m7.5- | g1:7 | c1:m7 | c1:m7 |     
  }}

  lickE = \score {
    \header{ piece="5. Dexter Gordon, Blue Bossa"}
    << 
        \relative c''' {\temaE}
        \accordiE
    >>    
  }
% }}}

% {{{ LICK G
  temaG = {
    \time 4/4
    \key ees \major
    bes8\4 aes g f ees d c\4 bes\2 | b\3 aes g f ees d f d | ees r b c r2 | 
  }

  accordiG = \new ChordNames{ \chordmode{
    d1:m7.5- | g1:7 | c1:m7 | 
    \bar "|."
  }}

  lickG = \score {
    \header{ piece="6. Mike Stern, Autumn Leaves"}
    << 
        \relative c''' {\temaG}
        \accordiG
    >>    
  }
% }}}

% {{{ LICK H
  temaH = {
    \time 4/4
    \key ees \major
    r2 d8\1 b c d | ees4 bes' aes bes | g f8 ees d4 f8 d | ees4 g f aes | g1 |  
  }

  accordiH = \new ChordNames{ \chordmode{
    d1:m7.5- | d1:m7.5- | g1:7 | g1:7 | c1:m7 |
    \bar "|."
  }}

  lickH = \score {
    \header{ piece="7. Mike Stern, Autumn Leaves"}
    << 
        \relative c'' {\temaH}
        \accordiH
    >>    
  }
% }}}

% {{{ LICK I
  temaI = {
    \time 4/4
    \key ees \major
    aes8\2 bes c d ees f g aes | bes b d b c d ees g | f ees d c b aes4 g8~ | g1 |    
  }

  accordiI = \new ChordNames{ \chordmode{
    d1:m7.5- | g1:7 | c1:m7 | c1:m7 |        
    \bar "|."
  }}

  lickI = \score {
    \header{ piece="8. Mike Stern, Autumn Leaves"}
    << 
        \relative c' {\temaI}
        \accordiI
    >>    
  }
% }}}

% {{{ LICK J
  temaJ = {
    \time 4/4
    \key ees \major
    r4 d8\1 ees f g aes bes | c ees d f aes bes b c~ | c1 |    
  }

  accordiJ = \new ChordNames{ \chordmode{
    d1:m7.5- | g1:7 | c1:m7 |        
    \bar "|."
  }}

  lickJ = \score {
    \header{ piece="9 Stern, Autumn Leaves"}
    << 
        \relative c' {\temaJ}
        \accordiJ
    >>    
  }
% }}}

% {{{ LICK K
  temaK = {
    \time 4/4
    \key ees \major
    r8 g\3 bes\1 g aes c ees g | bes g ees b ees b ees d~ | d f d ees~ ees2 | 
  }

  accordiK = \new ChordNames{ \chordmode{
    d1:m7.5- | g1:7 | c1:m7 |        
    \bar "|."
  }}

  lickK = \score {
    \header{ piece="10. Bill Evans, Autumn Leaves"}
    << 
        \relative c'' {\temaK}
        \accordiK
    >>    
  }
% }}}

% {{{ LICK L 
  temaL = {
    \time 4/4
    \key ees \major
    \partial 8 ees8\2 |
    g\1 aes~ aes4 \tuplet 3/2 {g ees b} | d8 b c d ees ees4 c8 | b c~ c2 r4 |
  }

  accordiL = \new ChordNames{ \chordmode{
    \partial 8 s8 |
    d1:m7.5- | g1:7 | c1:m7 |        
    \bar "|."
  }}

  lickL = \score {
    \header{ piece="11. Bill Evans, Autumn Leaves"}
    << 
        \relative c'' {\temaL}
        \accordiL
    >>    
  }
% }}}

% {{{ LICK M
  temaM = {
    \time 4/4
    \key ees \major
    r8 c\2 ees\1 c fis r f fis | r aes a aes ges f ees d | f r r2. | 
  }

  accordiM = \new ChordNames{ \chordmode{
    d1:m7.5- | g1:7 | c1:m7 |        
    \bar "|."
  }}

  lickM = \score {
    \header{ piece="12. Bill Evans, Autumn Leaves"}
    << 
        \relative c'' {\temaM}
        \accordiM
    >>    
  }
% }}}

% {{{ LICK N
  temaN = {
    \time 4/4
    \key ees \major
    r4 aes8\4 g\3 ges f ees d | ges ees f d ees c\1 g\1 r | 
  }

  accordiN = \new ChordNames{ \chordmode{
    g1:7 | c1:m7 | 
    \bar "|."
  }}

  lickN = \score {
    \header{ piece="13. Bill Evans, Autumn Leaves"}
    << 
        \relative c''' {\temaN}
        \accordiN
    >>    
  }
% }}}

% {{{ LICK O
  temaO = {
    \time 4/4
    \key ees \major
    r8 c\4 \tuplet 3/2 {aes\1 f\3 c\2} bes' g aes g | f ees d c b aes g ees | 
    r g' ees c ges' d f fes | ees d c ees, r2 |
  }

  accordiO = \new ChordNames{ \chordmode{
    d1:m7.5- | g1:7 | c1:m7 | c1:m7 |    
    \bar "|."
  }}

  lickO = \score {
    \header{ piece="14. Bill Evans, Autumn Leaves"}
    << 
        \relative c''' {\temaO}
        \accordiO
    >>    
  }
% }}}

% {{{ LICK P
  temaP = {
    \time 4/4
    \key ees \major
    r8 d\1 \tuplet 3/2 {aes' c ees} d ees f r | f g aes bes b cis\4 d\4 r | 
    r aes,\4 \tuplet 3/2 {c\3 ees\1 f} ees f g bes | d c\1 \tuplet 3/2 {g\1 ees\1 c\3} bes' a aes g | f ees d c b4 g|
  }

  accordiP = \new ChordNames{ \chordmode{
    d1:m7.5- | d1:m7.5- | g1:7 | g1:7 | c1:m7 |
    \bar "|."
  }}

  lickP = \score {
    \header{ piece="15. Bill Evans, Autumn Leaves"}
    << 
        \relative c' {\temaP}
        \accordiP
    >>    
  }
% }}}

% {{{ LICK Q
  temaQ = {
    \time 4/4
    \key ees \major
    \partial 8 c8 |
    b c aes' c, b c aes' r | r b, \tuplet 3/2 {a b g'} \tuplet 3/2 {b, a b} g' r|
    r a, \tuplet 3/2 {g a f'} \tuplet 3/2 {a, g a} f' r | r d ees f ees d c r |
  }

  accordiQ = \new ChordNames{ \chordmode{
    \partial 8 s8 | 
    d1:m7.5- | g1:7 | c1:m7 | c1:m7 |
    \bar "|."
  }}

  lickQ = \score {
    \header{ piece="16."}
    << 
        \relative c'' {\temaQ}
        \accordiQ
    >>    
  }
% }}}

% {{{ LICK R
  temaR = {
    \time 4/4
    \key ees \major
    r4 r8 aes f' ees d c | b4 aes8 f d4 b | c1 |
  }

  accordiR = \new ChordNames{ \chordmode{
    d1:m7.5- | g1:7 | c1:m7 |    
    \bar "|."
  }}

  lickR = \score {
    \header{ piece="18."}
    << 
        \relative c'' {\temaR}
        \accordiR
    >>    
  }
% }}}

% {{{ LICK S
  temaS = {
    \time 4/4
    \key ees \major
    r8 d \tuplet 3/2 {ees f g} aes4 \tuplet 3/2 {g8 aes g} | ees4 c c r |
  }

  accordiS = \new ChordNames{ \chordmode{
    g1:7 | c1:m7 |    
    \bar "|."
  }}

  lickS = \score {
    \header{ piece="19."}
    << 
        \relative c'' {\temaS}
        \accordiS
    >>    
  }
% }}}

% {{{ LICK T
  temaT = {
    \time 4/4
    \key ees \major
    \partial 8 g8 | 
    aes g f ees d c b aes' | g2 r2 |
  }

  accordiT = \new ChordNames{ \chordmode{
    \partial 8 s8 |
    g1:7 | c1:m7 |
    \bar "|."
  }}

  lickT = \score {
    \header{ piece="20."}
    << 
        \relative c''' {\temaT}
        \accordiT
    >>    
  }
% }}}

% {{{ LICK U
  temaU = {
    \time 4/4
    \key ees \major
    r8 c ees g c d ees c | d r a c b r g ges | f ees'~ ees4 d8 c b d | c g ees d c2 |
  }

  accordiU = \new ChordNames{ \chordmode{
    d1:m7.5- | g1:7 | c1:m7 | c1:m7 |    
    \bar "|."
  }}

  lickU = \score {
    \header{ piece="21."}
    << 
        \relative c' {\temaU}
        \accordiU
    >>    
  }
% }}}

% {{{ LICK V
  temaV = {
    \time 4/4
    \key ees \major
    r4 \tuplet 3/2 {d8 ees f} g4. f8 | ees d c b f'4. g,8 | f4 ees c8 d ees aes | g ees c4 ees2 |
  }

  accordiV = \new ChordNames{ \chordmode{
    d1:m7.5- | g1:7 | g1:7 | c1:m7 |    
    \bar "|."
  }}

  lickV = \score {
    \header{ piece="21."}
    << 
        \relative c'' {\temaV}
        \accordiV
    >>    
  }
% }}}

% {{{ LICK W
  temaW = {
    \time 4/4
    \key ees \major
    r4 r8 aes aes g g ges | ges f f ees ees d d c | c b b aes aes g g g | c,2 r2 |
  }

  accordiW = \new ChordNames{ \chordmode{
    d1:m7.5- | g1:7 | g1:7 | c1:m7 | 
    \bar "|."
  }}

  lickW = \score {
    \header{ piece="22."}
    << 
        \relative c''' {\temaW}
        \accordiW
    >>    
  }
% }}}

% {{{ LICK X
  temaX = {
    \time 4/4
    \key ees \major
    r2 g8 aes16 g f8 g | b c b aes g f ees c | d4 ees8 c8~ c2 |
  }

  accordiX = \new ChordNames{ \chordmode{
    g1:7 | g1:7 | c1:m7 |    
    \bar "|."
  }}

  lickX = \score {
    \header{ piece="23."}
    << 
        \relative c''' {\temaX}
        \accordiX
    >>    
  }
% }}}

% {{{ LICK Y
  temaY = {
    \time 4/4
    \key ees \major
    r4 ees8 c d bes' aes4 | ees8 c d aes'~ aes4 r8 f | g ees f d ees f g bes | d1 |    
  }

  accordiY = \new ChordNames{ \chordmode{
    d1:m7.5- | g1:7 | g1:7 | c1:m7 |
    \bar "|."
  }}

  lickY = \score {
    \header{ piece="24."}
    << 
        \relative c' {\temaY}
        \accordiY
    >>    
  }
% }}}

% {{{ LICK Z
  temaZ = {
    \time 4/4
    \key ees \major
    r8 ees8~ ees d f4. ees8 | ees4 d8 g~ g4. f8 | ees f d f c d ees f | \tuplet 3/2 {g aes g} f ees d c b aes | g1 |  
  }

  accordiZ = \new ChordNames{ \chordmode{
    d1:m7.5- | d1:m7.5- | g1:7 | g1:7 | c1:m7 |
    \bar "|."
  }}

  lickZ = \score {
    \header{ piece="25."}
    << 
        \relative c'' {\temaZ}
        \accordiZ
    >>    
  }
% }}}

% {{{ LICK AA
  temaAA = {
    \time 4/4
    \key ees \major
    r2 r8 aes'16 g f8 g | aes bes c ees d c b d | ees aes g f ees4 ees8 ees | bes' b g ees d c r4 | 
  }

  accordiAA = \new ChordNames{ \chordmode{
    d1:m7.5- | g1:7 | g1:7 | c1:m7 |    
    \bar "|."
  }}

  lickAA = \score {
    \header{ piece="26."}
    << 
        \relative c' {\temaAA}
        \accordiAA
    >>    
  }
% }}}

% {{{ LICK AB
  temaAB = {
    \time 4/4
    \key ees \major
    r2 r8 ees'4. | d4 d d d | d8 ees16 d c8 d g4. d8 | f4 ees8 ees~ ees g, fis g | d'4 c8 c8~ c2 | 
  }

  accordiAB = \new ChordNames{ \chordmode{
    f1:m7 | d1:m7.5- | g1:7 | c1:m7 | c1:m7 |    
    \bar "|."
  }}

  lickAB = \score {
    \header{ piece="27. Dexter Gordon, Blue Bossa"}
    << 
        \relative c' {\temaAB}
        \accordiAB
    >>    
  }
% }}}

% {{{ LICK AC
  temaAC = {
    \time 4/4
    \key ees \major
    r2 g8 f e f bes g aes bes b4 d | g d8 f ees4 g, | c1 |
  }

  accordiAC = \new ChordNames{ \chordmode{
    d1:m7.5- | g1:7 | c1:m7 | c1:m7 |       
    \bar "|."
  }}

  lickAC = \score {
    \header{ piece="28. Dexter Gordon, Blue Bossa"}
    << 
        \relative c'' {\temaAC}
        \accordiAC
    >>    
  }
% }}}

% {{{ LICK AD
  temaAD = {
    \time 4/4
    \key ees \major
    g4 a b c | d ees8 d~ d c~ c d | r ees d c d r a4~ | a1 |
  }

  accordiAD = \new ChordNames{ \chordmode{
    d1:m7.5- | g1:7 | c1:maj7 | c1:maj7 | 
    \bar "|."
  }}

  lickAD = \score {
    \header{ piece="29. Dexter Gordon, Blue Bossa"}
    << 
        \relative c'' {\temaAD}
        \accordiAD
    >>    
  }
% }}}

% {{{ LICK AE
  temaAE = {
    \time 4/4
    \key ees \major
    r4 r8 g aes4 aes' | g4. aes8~ aes2 | g8 fis g fis f e f e | ees d ees d des c des b | c1 |    
  }

  accordiAE = \new ChordNames{ \chordmode{
    d1:m7.5- | g1:7 | c1:maj7 | c1:maj7 | ees1:m7 |
    \bar "|."
  }}

  lickAE = \score {
    \header{ piece="30. Dexter Gordon, Blue Bossa"}
    << 
        \relative c'' {\temaAE}
        \accordiAE
    >>    
  }
% }}}

% {{{ BOOKS
  \book{
    \bookOutputSuffix "C"    
    \lickA
    \lickB
    \lickC
    \lickD
    \lickE
    \lickG
    \lickH
    \lickI
    \lickJ
    \lickK
    \lickL
    \lickM
    \lickN
    \lickO
    \lickP
    \lickQ
    \lickR
    \lickS
    \lickT
    \lickU
    \lickV
    \lickW
    \lickX
    \lickY
    \lickZ
    \lickAA
    \lickAB
    \lickAC
    \lickAD
    \lickAE
  }
% }}}
