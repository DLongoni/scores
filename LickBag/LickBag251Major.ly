% {{{ PARAMETRI
  myTitle = "Lick Bag - Major 251"
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
  myStaffSize = #20
  fonts = #(make-pango-font-tree
  "FontAwesome"
  "FontAwesome"
  "FontAwesome"
  (/ myStaffSize 20))  
  
  scoreTitleMarkup = \markup { 
    \column {
      \fill-line {
        \fontsize #2.5 \italic \fromproperty #'header:piece
        \fromproperty #'header:opus
      }
    }
  }
  
    markup-system-spacing =
    #'((basic-distance . 2)
       (padding . 2))
    
    score-markup-spacing =
    #'((basic-distance . 0)
       (padding . 4))
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
    \key c \major
    r4 \tuplet 3/2 {e8 f g} \tuplet 3/2 {a b c} \tuplet 3/2 {d e f} | 
    \tuplet 3/2 {g a g} \tuplet 3/2 {f e d} \tuplet 3/2 {c b a} \tuplet 3/2 {g ges f} | e2 r2 |
  }
  

  accordiA = \new ChordNames{ 
    \chordmode{
      d1:m7 | g1:13 | c1:maj7 | \bar "|."
    }
  }

  lickA = \score {
    \header{ piece="1. Unknown, Blue Bossa"}
    << 
        \relative c' {\temaA}
        \accordiA
    >>    
  }
% }}}

% {{{ LICK B
  temaB = {
    \time 4/4
    \key a \major
    \partial 4. d8 e f |
    fis c cis e d b gis e | d b gis f e es d ees16 d | cis4 r4 r2 |
  }
  

  accordiB = \new ChordNames{ 
    \chordmode{
      \partial 4. s4. |
      e1:7 | e1:7 | a1 | \bar "|."
    }
  }

  lickB = \score {
    \header{ piece="2. Bireli, After You Have Gone"}
    << 
        \relative c''' {\temaB}
        \accordiB
    >>    
  }
% }}}

% {{{ LICK C
  temaC = {
    \time 4/4
    \key g \major
    r2 r8 c,8 ees fis | bes c ees fis \ottava #1 a c ees fis | b2 r2 |
  }
  

  accordiC = \new ChordNames{ 
    \chordmode{
      d1:7 | d1:7 | g1 | \bar "|."
    }
  }

  lickC = \score {
    \header{ piece="3. Bireli, After You Have Gone"}
    << 
        \relative c'' {\temaC}
        \accordiC
    >>    
  }
% }}}

% {{{ LICK D
  temaD = {
    \time 4/4
    \key c \major
    r2 a'8 ais cis b | gis f cis b g f d c | b4 r4 r2 |
  }
  

  accordiD = \new ChordNames{ 
    \chordmode{
      g1:7 | g1:7 | c1 | \bar "|."
    }
  }

  lickD = \score {
    \header{ piece="4. Bireli, After You Have Gone"}
    << 
        \relative c'' {\temaD}
        \accordiD
    >>    
  }
% }}}

% {{{ LICK E
  temaE = {
    \time 4/4
    \key g \major
    \partial 4. d des c |
    b c e g ais b d4 | fis,8 d bes fis d b c e | g4 r4 r2 | 
  }
  

  accordiE = \new ChordNames{ 
    \chordmode{
      \partial 4. s4. |
      a1:m7 | d1:7 | g1 | \bar "|."
    }
  }

  lickE = \score {
    \header{ piece="5. Bireli, After You Have Gone"}
    << 
        \relative c'' {\temaE}
        \accordiE
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
  }
% }}}
