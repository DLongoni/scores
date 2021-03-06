% {{{ PARAMETRI
  \version "2.18.2"
  myTitle = "Lick Bag - Minor 251"
  myTempo =  #(ly:make-moment 190 4)
  \include "LickBagHeader.ly"
% }}}

% {{{ LICK A
  lickA = \LickScore 
  \time 4/4 
  \key f \major 
  {r2 \tuplet 3/2 {c8\2 d e} \tuplet 3/2 {f g a} |
    \tuplet 3/2 {f g a} \tuplet 3/2 {bes c d} \tuplet 3/2 {e f g} a8 r8 |
    c4 bes8 a g f e a | f4 d a f |}
  \chordmode{ e1:m7.5- | a1:7 | d1:m7 | d1:m7 \bar "|." }
  #"Mike Stern"
  #"Autumn Leaves"   
% }}}

% {{{ LICK B
  lickB = \LickScore
    \time 4/4
    \key c \major
    {r8. f'16\1 e'8\4 \glissando d16\4 a16~\1 a16 f8\2 g16~\3 g16 f8\2 aes16\1 | 
    g16\4 f e d c aes g e\4 f\3 d e f a c e a,\3 \glissando |
    b d\1 c\4 e,\1 r4 r2 |}
    \chordmode{ b1:m7.5- | e1:7 | a1:m7 | \bar "|." }
    #"Bireli"
    #"500 miles high"
% }}}

% {{{ LICK C
  lickC = \LickScore
    \time 4/4
    \key c \major
    { 
      \partial 8 e8\0
      gis\4 b d f \tuplet 3/2 {gis8 b d} \tuplet 3/2 {e f gis} | \tuplet 3/2 {f e d} c8 b a g f d |
      e8 c b a gis4 r4 |
    }
    \chordmode{
      \partial 8 r8 |
      e1:7 | e1:7 | a1:m7 | \bar "|."
    }						
    #'"Bireli"
    #'"After You Have Gone"
% }}}

% {{{ LICK D
  lickD = \LickScore
    \time 4/4
    \key g \major
    {
      r8 b\1 e\1 fis\3 g\4 a b c | dis fis g a b c d ees |
      d c b a g4 r4 |
    }
    \chordmode{
      fis1:m7.5- | b1:7 | e1:m7 | \bar "|."
    }
    #'"Bireli"
    #'"After You Have Gone"
% }}}

% {{{ LICK E
  lickE = \LickScore
    \time 4/4
    \key ees \major
    {
      \partial 4 bes''8\4 a\3 | 
      aes\2 ees'\4 r g, r f r ees | d c r b~ b g fis g | 
      d'4~ d8 c b c ees4~ | ees1 |
    }
   \chordmode{
     \partial 4 s4 | d1:m7.5- | g1:7 | c1:m7 | c1:m7 |     
    }
    #"Dexter Gordon"
    #"Blue Bossa"
% }}}

% {{{ LICK G
  lickG = \LickScore
    \time 4/4
    \key ees \major
    {
      bes''8\4 aes g f ees d c\4 bes\2 | b\3 aes g f ees d f d | 
      ees r b c r2 | 
    }
    \chordmode{
      d1:m7.5- | g1:7 | c1:m7 | 
    }
    #"Mike Stern"
    #"Autumn Leaves"
% }}}

% {{{ LICK H
  lickH = \LickScore
    \time 4/4
    \key ees \major
    {
      r2 d'8\1 b c d | ees4 bes' aes bes |
      g f8 ees d4 f8 d | ees4 g f aes | g1 |  
    }
    \chordmode{
      d1:m7.5- | d1:m7.5- | g1:7 | g1:7 | c1:m7 |
    }
    #"Mike Stern"
    #"Autumn Leaves"
% }}}

% {{{ LICK I
  lickI = \LickScore
    \time 4/4
    \key ees \major
    {
      aes8\2 bes c d ees f g aes | bes b d b c d ees g |
      f ees d c b aes4 g8~ | g1 |    
    }
    \chordmode{
      d1:m7.5- | g1:7 | c1:m7 | c1:m7 |        
    }
    #"Mike Stern"
    #"Autumn Leaves"
% }}}

% {{{ LICK J
  lickJ = \LickScore
    \time 4/4
    \key ees \major
    {
      r4 d8\1 ees f g aes bes | c ees d f aes bes b c~ | c1 |    
    }
    \chordmode{
    d1:m7.5- | g1:7 | c1:m7 |        
    }
    #"Mike Stern"
    #"Autumn Leaves"
% }}}

% {{{ LICK K
  lickK = \LickScore
    \time 4/4
    \key ees \major
    {
      r8 g'\3 bes\1 g aes c ees g | bes g ees b ees b ees d~ |
      d f d ees~ ees2 | 
    }
    \chordmode{
      d1:m7.5- | g1:7 | c1:m7 |        
    }
    #"Bill Evans"
    #"Autumn Leaves"
% }}}

% {{{ LICK L 
  lickL = \LickScore
    \time 4/4
    \key ees \major
    {
      \partial 8 ees8\2 |
      g\1 aes~ aes4 \tuplet 3/2 {g ees b} | d8 b c d ees ees4 c8 |
      b c~ c2 r4 |
    }
    \chordmode{
      \partial 8 s8 |
      d1:m7.5- | g1:7 | c1:m7 |        
    }
    #"Bill Evans"
    #"Autumn Leaves"
% }}}

% {{{ LICK M
  lickM = \LickScore
    \time 4/4
    \key ees \major
    {
      r8 c'\2 ees\1 c fis r f fis | r aes a aes ges f ees d | f r r2. | 
    }
    \chordmode{
      d1:m7.5- | g1:7 | c1:m7 |        
    }
    #"Bill Evans"
    #"Autumn Leaves"
% }}}

% {{{ LICK N
  lickN = \LickScore
    \time 4/4
    \key ees \major
    {
      r4 aes''8\4 g\3 ges f ees d | ges ees f d ees c\1 g\1 r | } \chordmode{ g1:7 | c1:m7 | }
    #"Bill Evans"
    #"Autumn Leaves"
% }}}

% {{{ LICK O
  lickO = \LickScore
    \time 4/4
    \key ees \major
    {
      r8 c''\4 \tuplet 3/2 {aes\1 f\3 c\2} bes' g aes g |
      f ees d c b aes g ees | 
      r g' ees c ges' d f fes | ees d c ees, r2 |
    }
    \chordmode{
      d1:m7.5- | g1:7 | c1:m7 | c1:m7 |    
    }
    #"Bill Evans"
    #"Autumn Leaves"
% }}}

% {{{ LICK Q
  lickQ = \LickScore
    \time 4/4
    \key ees \major
    {
      \partial 8 c'8 |
      b c aes' c, b c aes' r |
      r b, \tuplet 3/2 {a b g'} \tuplet 3/2 {b, a b} g' r|
      r a, \tuplet 3/2 {g a f'} \tuplet 3/2 {a, g a} f' r |
      r d ees f ees d c r |
    }
    \chordmode{
      \partial 8 s8 | 
      d1:m7.5- | g1:7 | c1:m7 | c1:m7 |
    }
    #""
    #""
% }}}

% {{{ LICK R
  lickR = \LickScore
    \time 4/4
    \key ees \major
    {
      r4 r8 aes' f' ees d c | b4 aes8 f d4 b | c1 |
    }
    \chordmode{
      d1:m7.5- | g1:7 | c1:m7 |    
    }
    #""
    #""
% }}}

% {{{ LICK S
  lickS = \LickScore
    \time 4/4
    \key ees \major
    {
      r8 d' \tuplet 3/2 {ees f g} aes4 \tuplet 3/2 {g8 aes g} | ees4 c c r |
    }
    \chordmode{
      g1:7 | c1:m7 |    
    }
    #""
    #""
% }}}

% {{{ LICK T
  lickT = \LickScore
    \time 4/4
    \key ees \major
    {
      \partial 8 g''8 | 
      aes g f ees d c b aes' | g2 r2 |
    }
    \chordmode{
      \partial 8 s8 |
      g1:7 | c1:m7 |
    }
    #""
    #""
% }}}

% {{{ LICK U
  lickU = \LickScore
    \time 4/4
    \key ees \major
    {
      r8 c\3 ees\1 g\1 c\1 d ees c | d r a c b r g ges |
      f ees'~ ees4 d8 c b d | c g ees d c2 |
    }
    \chordmode{
      d1:m7.5- | g1:7 | c1:m7 | c1:m7 |    
    }
    #"Django"
    #"Minor Swing"
% }}}

% {{{ LICK V
  lickV = \LickScore
    \time 4/4
    \key ees \major
    {
      r4 \tuplet 3/2 {d'8\1 ees\2 f\3} g4.\1 f8 | ees d c b f'4. g,8 |
      f4 ees c8 d ees aes | g ees c4 ees2 |
    }
    \chordmode{
      d1:m7.5- | g1:7 | g1:7 | c1:m7 |    
    }
    #"Django"
    #"Minor Swing"
% }}}

% {{{ LICK W
  lickW = \LickScore
    \time 4/4
    \key ees \major
    {
      r4 r8 aes''\3 aes\3 g\2 g\2 ges\1 | ges\1 f\3 f ees ees d d c |
      c b b aes aes g g g | c,2 r2 |
    }
    \chordmode{
      d1:m7.5- | g1:7 | g1:7 | c1:m7 | 
    }
    #"Django"
    #"Minor Swing"
% }}}

% {{{ LICK X
  lickX = \LickScore
    \time 4/4
    \key ees \major
    {
      r2 g''8\1 aes16\2 g\1 f8\3 g\2 | b\1 c b aes g f ees c | d4 ees8 c8~ c2 |
    }
    \chordmode{
      g1:7 | g1:7 | c1:m7 |    
    }
    #""
    #""
% }}}

% {{{ LICK Y
  lickY = \LickScore
    \time 4/4
    \key ees \major
    {
      r4 ees8 c d bes' aes4 | ees8 c d aes'~ aes4 r8 f |
      g ees f d ees f g bes | d1 |    
    }
    \chordmode{
      d1:m7.5- | g1:7 | g1:7 | c1:m7 |
    }
    #""
    #""
% }}}

% {{{ LICK Z
  lickZ = \LickScore
    \time 4/4
    \key ees \major
    {
      r8 ees'8~ ees d f4. ees8 | ees4 d8 g~ g4. f8 |
      ees f d f c d ees f | \tuplet 3/2 {g aes g} f ees d c b aes | g1 |  
    }

    \chordmode{
      d1:m7.5- | d1:m7.5- | g1:7 | g1:7 | c1:m7 |
    }
    #""
    #""
% }}}

% {{{ LICK AA
  lickAA = \LickScore
    \time 4/4
    \key ees \major
    {
      r2 r8 aes'16 g f8 g | aes bes c ees d c b d |
      ees aes g f ees4 ees8 ees | bes' b g ees d c r4 | 
    }
    \chordmode{
      d1:m7.5- | g1:7 | g1:7 | c1:m7 |    
    }
    #""
    #""
% }}}

% {{{ LICK AB
  lickAB = \LickScore
    \time 4/4
    \key ees \major
    {
      r2 r8 ees'4. | d4 d d d | d8 ees16 d c8 d g4. d8 | f4 ees8 ees~ ees g, fis g | d'4 c8 c8~ c2 | 
    }
    \chordmode{
      f1:m7 | d1:m7.5- | g1:7 | c1:m7 | c1:m7 |    
    }
    #"Dexter Gordon"
    #"Blue Bossa"
% }}}

% {{{ LICK AC
  lickAC = \LickScore
    \time 4/4
    \key ees \major
    {
      r2 g'8 f e f bes g aes bes b4 d | g d8 f ees4 g, | c1 |
    }
    \chordmode{
      d1:m7.5- | g1:7 | c1:m7 | c1:m7 |       
    }
    #"Dexter Gordon"
    #"Blue Bossa"
% }}}

% {{{ LICK AD
  lickAD = \LickScore
    \time 4/4
    \key ees \major
    {
      g'4 a b c | d ees8 d~ d c~ c d | r ees d c d r a4~ | a1 |
    }
    \chordmode{
      d1:m7.5- | g1:7 | c1:maj7 | c1:maj7 | 
    }
    #"Dexter Gordon"
    #"Blue Bossa"
% }}}

% {{{ LICK AE
  lickAE = \LickScore
    \time 4/4
    \key ees \major
    {
      r4 r8 g' aes4 aes' | g4. aes8~ aes2 |
      g8 fis g fis f e f e | ees d ees d des c des b | c1 |    
    }
    \chordmode{
      d1:m7.5- | g1:7 | c1:maj7 | c1:maj7 | ees1:m7 |
    }
    #"Dexter Gordon"
    #"Blue Bossa"
% }}}

% {{{ LICK AF
  lickAF = \LickScore
    \time 4/4
    \key g \minor
    {
      r2 r8 c8 ees fis | bes c ees fis \ottava #1 a c ees fis | bes2 r2 |
    }
    \chordmode{
      d1:7 | d1:7 | g1:m7 |
    }
    #"Bireli"
    #"After You Have Gone"
% }}}

% {{{ LICK AH
  lickAH = \LickScore
    \time 4/4
    \key bes \major
    { 
      r2 fis'8 a ees fis | c ees a, c \trip fis, a c ees fis | d1 |
    }
    \chordmode{
      d1:7 | d1:7 | g1:m | 
    }						
    #"Libro Manouche"
    #""
% }}}

% {{{ LICK AI
  lickAI = \LickScore
    \time 4/4
    \key bes \major
    { 
      a8 c ees g fis ees c cis | d fis a c ees fis a aes |
      \trip g a g e d bes g ges f | e1 |
    }
    \chordmode{
      d1:7 | d1:7 | g1:m6 | g1:m6 |
    }						
    #"Libro Manouche"
    #""
% }}}

% {{{ LICK AJ
  lickAJ = \LickScore
    \time 4/4
    \key bes \major
    { 
      d8 ees g c ees g a c | 
      \trip ees f ees c a fis ees c a | g1 |

    }
    \chordmode{
      d1:7 | d1:7 | g1:m6 |
    }						
    #"Libro Manouche"
    #""
% }}}

% {{{ LICK AK
  lickAK = \LickScore
    \time 4/4
    \key bes \major
    { 
      a8 c ees g a c ees g |
      \trip fis g fis ees c a fis ees a, | g1 |


    }
    \chordmode{
      d1:7 | d1:7 | g1:m6 |
    }						
    #"Libro Manouche"
    #""
% }}}

% {{{ LICK AL
  lickAL = \LickScore
    \time 4/4
    \key f \major
    { 
      \partial 8 a8 
      cis e g bes cis e g f | e d c b a g f e | d1 |
    }
    \chordmode{
      \partial 8 s8 
      a1:7 | a1:7 | d1 | 
    }						
    #"Libro Manouche"
    #""
% }}}

% {{{ LICK AM
  lickAM = \LickScore
    \time 4/4
    \key c \major
    { 
      \trip f'8 g f e d c b d c | b a gis f e d c b |
      a b c e a c b e | a2 r2 |
    }
    \chordmode{
      e1:7 | e1:7 | a1:m6 | a1:m6 |
    }						
    #"Libro Manouche"
    #""
% }}}

% {{{ LICK AN
  lickAN = \LickScore
    \time 4/4
    \key g \major
    { 
      \trip c''8 d c b a g fis a g |
      fis e dis c b a g fis |
      \trip e fis e dis c b bes a c |
      dis fis a c dis g fis dis |
      e2 r2 |
    }
    \chordmode{
      b1:7 | b1:7 | b1:7 | b1:7 |
      e1:m6 |
    }						
    #"Libro Manouche"
    #""
% }}}

% {{{ LICK AO
  lickAO = \LickScore
    \time 4/4
    \key a \major
    { 
      \ottava #1
      c'8 dis fis a gis fis dis e | f gis b d cis b a gis |
      fis cis a g fis g a cis | fis g a cis fis4 r4 |
    }
    \chordmode{
      gis1:7 | cis1:7 | fis1:m | fis1:m |
    }						
    #"Libro Manouche"
    #""
% }}}

% {{{ LICK AP
  lickAP = \LickScore
    \time 4/4
    \key bes \major
    { 
      ees8 g bes des f g bes c |
      \trip d ees d c a fis d c a | g4 r r2 |
    }
    \chordmode{
      ees1:7 | d1:7 | g1:m |
    }						
    #"Libro Manouche"
    #""
% }}}

% {{{ BOOKS
\includeLocal "ScoreCompleto251Minor.ly"
% }}}
