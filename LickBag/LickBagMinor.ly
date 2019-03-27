% {{{ PARAMETRI
  myTitle = "Lick Bag - Minor"
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
    \key bes \major
    r8. d16 r16 c bes d, f a g f e d c b | bes d a aes g d' bes d' r2 |
  }
  

  accordiA = \new ChordNames{ 
    \chordmode{
      g1:m7 | g1:m7 | \bar "|."
    }
  }

  lickA = \score {
    \header{ piece="1. Bireli, 500 miles high"}
    << 
        \relative c'' {\temaA}
        \accordiA
    >>    
  }
% }}}

% {{{ LICK B
  temaB = {
    \time 4/4
    \key c \major
    r4 r8. e16 c b a d b c e g | b r a e r4 r16 e a b c d e g | gis2 r2 |
  }

  accordiB = \new ChordNames{ 
    \chordmode{
      a1:m7 | a1:m7 | fis1:m7.5- | \bar "|." 
    }
  }

  lickB = \score {
    \header{ piece="2. Bireli, 500 miles high"}
    << 
        \relative c' {\temaB}
        \accordiB
    >>
  }
% }}}

% {{{ LICK C
  temaC = {
    \time 4/4
    \key ees \major
    r2 r16 d f aes c ees g bes | g ees c bes r a aes f' aes bes32 aes g16 ges f ees d ces |
    bes aes b d f aes \tuplet 3/2 {bes d g} f8. ees16 d c bes g | f ees d c bes aes g f ees c8. c8 r8 |
  }

  accordiC = \new ChordNames{ 
    \chordmode{
      f1:m7 | f1:m7 | c1:m11 | c1:m11 | \bar "|."
    }
  }

  lickC = \score {
    \header{ piece="3. Bireli, 500 miles high"}
    << 
        \relative c' {\temaC}
        \accordiC
    >>
  }
% }}}

% {{{ LICK D
  temaD = {
    \time 4/4
    \key ees \major
    r8 a c ees g bes c ees | g a c ees d c b d | b g d b r2 |
  }

  accordiD = \new ChordNames{ 
    \chordmode{
      c1:m7 | c1:m7 | g1 | \bar "|."
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

% {{{ BOOKS
  \book{
    \bookOutputSuffix "C"    
    \lickA
    \lickB
    \lickC
    \lickD
  }
% }}}
