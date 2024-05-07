\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{course}
\DeclareOption{syllabus}{\def\@syllabus{}}
\DeclareOption{notes}{\def\@notes{}}
\DeclareOption{book}{\def\@book{}}
\DeclareOption{problemset}{\def\@problemset{}}
\DeclareOption{exam}{\def\@exam{}}
\DeclareOption{isu}{\def\@isu}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\ifdefined\@book
\LoadClass{book}
\let\subparagraph\paragraph
\let\paragraph\subsubsection
\let\subsubsection\subsection
\let\subsection\section
\let\section\chapter
\else
\LoadClass{article}
\fi

% 
% PACKAGES
%
%\RequirePackage{lmodern}
\RequirePackage[cm]{sfmath}
\RequirePackage[labelformat=empty]{caption}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{bm}
\RequirePackage{booktabs}
\RequirePackage{cancel}
\RequirePackage{comment}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{framed}
\RequirePackage{graphicx}
\RequirePackage{imakeidx}
\RequirePackage{hyperref}
\RequirePackage{ifthen}
\RequirePackage{lastpage}                       % count number of pages, provide LastPage
\RequirePackage{mdframed}  
\RequirePackage{placeins}
\RequirePackage{tabularx}
\RequirePackage[breakable,most]{tcolorbox}
\RequirePackage{textcomp}
\RequirePackage{textpos}
%\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{tocloft}
\RequirePackage{url}
\RequirePackage{wrapfig}
\RequirePackage{xr}                             % ability to reference external documents
\RequirePackage{xstring}


\ifdefined\@isu
\RequirePackage{palatino}
%\RequirePackage{nimbussans}
%\RequirePackage{nimbussans}
\RequirePackage[T1]{fontenc}
\newcommand{\titlefont}[1]{\bf #1}
\definecolor{uccsgold}{HTML}{C8102E}
\definecolor{uccsgray}{HTML}{F1BE48}
\definecolor{isured}{HTML}{C8102E}
\definecolor{isugold}{HTML}{F1BE48}
\definecolor{isudarkgold}{HTML}{8B5B29}
\definecolor{isukhaki}{HTML}{CAC7A7}
\definecolor{isudarkred}{HTML}{7c2529}
\newtcolorbox[use counter=example]{ISUHeaderBox}[3][]{%
  enhanced jigsaw,
  arc=0pt,
  colframe=isugold,
  colback=black!10,
  boxrule=3pt,
  top=20mm,
  fontupper=\color{black},
  enlarge top by=\baselineskip/2+1mm,
  enlarge left by=0mm,
  sharp corners,
  width=\linewidth-3mm,
  fontupper=\normalsize,label={#3},
  shadow={3mm}{-3mm}{0mm}{fill=black!50,opacity=1.0},
  overlay unbroken and first={%
    \node[rectangle,
    fill=isured,
    inner sep=2mm,
    inner xsep=6mm,
    anchor=west,
    font=\LARGE]
    at ([xshift=-6mm,yshift=-10mm]frame.north west)
    {\strut\textbf{\LARGE \color{isugold} \scalebox{0.8}[1.0]{\MakeUppercase{#2} }}};
  },
  frame code={% fake shadow - right now an exact duplicate to ensure sizes match
    \node[rectangle,
    fill=black!25,
    inner sep=2mm,
    inner xsep=6mm,
    anchor=west,
    font=\LARGE]
    at ([xshift=-3mm,yshift=-13mm]frame.north west)
    {\strut\textbf{\LARGE\scalebox{0.8}[1.0]{ \ } }};
  },
  #1}%
\else
\RequirePackage[rm]{roboto}
\RequirePackage[T1]{fontenc}
\newcommand{\titlefont}[1]{\robotoslab #1}
\definecolor{uccsgold}{HTML}{CFB87C}
\definecolor{uccsgray}{HTML}{ECECEC}
\fi

%
% COLORS
%
%\definecolor{uccsgold}{hrml}{#cfb87c}

%
% These three lines fix an error introduced with titlesec when upgrading LaTeX 
% where the (sub)(sub)(sections) appeared without numbers. This fix was added
% on April 11 2017 per instructions here:
% http://tex.stackexchange.com/questions/299969/titlesec-loss-of-section-numbering-with-the-new-update-2016-03-15
%
\RequirePackage{etoolbox}
\patchcmd{\ttlh@hang}{\parindent\z@}{\parindent\z@\leavevmode}{}{}
\patchcmd{\ttlh@hang}{\noindent}{}{}{}


%
% METADATA MACROS 
%
\def\@name{}       \newcommand{\name}[1]{\def\@name{#1}}
\def\@institution{}\newcommand{\institution}[1]{\def\@institution{#1}}
\def\@webpage{}    \newcommand{\webpage}[1]{\def\@webpage{#1}}
\def\@copyright{}  \renewcommand{\copyright}[1]{\def\@copyright{#1}}


\ifdefined\@problemset
\newcommand{\pstitle}[1]{\def\@pstitle{#1}}
\newcommand{\assigneddate}[1]{\def\@assigneddate{#1}}
\newcommand{\duedate}[2][]{
  \ifthenelse{\equal{#1}{}}{\def\@shortduedate{#2}}{\def\@shortduedate{#1}}
  \def\@duedate{#2}}
\newcommand{\psnotes}[1]{\def\@psnotes{#1}}
\fi

\ifdefined\@exam
\newcommand{\examname}[1]{\def\@examname{#1}}
\newcommand{\givendate}[2][]{
  \ifthenelse{\equal{#1}{}}{\def\@shortgivendate{#2}}{\def\@shortgivendate{#1}}
  \def\@givendate{#2}}
\newcommand{\instructions}[1]{\def\@instructions{#1}}
\newcommand{\results}[1]{\def\@results{#1}}
\newcommand{\examnotes}[1]{\def\@examnotes{#1}}
\fi


%
% UNIVERSAL FORMATTING SETTINGS
%
% Page layout
\setlength{\headheight}{25pt}
\setlength{\topmargin}{-0.44in}
\setlength{\oddsidemargin}{-15pt}
\setlength{\evensidemargin}{-15pt}
\setlength{\marginparsep}{5pt}
\setlength{\marginparwidth}{45pt}
\setlength{\textheight}{625pt}
\setlength{\textwidth}{500pt}
\setlength{\footskip}{30pt}
% Sans Serif Font
\renewcommand{\familydefault}{\sfdefault}
\renewcommand*{\arraystretch}{1} % change matrix height
% Page rule styling
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
% Table of contents customization
\setlength{\cftbeforesecskip}{2pt}\setlength{\cftbeforesubsecskip}{2pt}\setlength{\cftbeforesubsubsecskip}{2pt}
\cftsetpnumwidth{2em} % fix so that long page numbers don't overflow to the right
\cftsetindents{subsection}{1cm}{1cm}
\cftsetindents{subsubsection}{4.5cm}{1cm}
% Paragraph flow
\widowpenalties 1 1000 % no page breaks in the middle of paragraphs
\setlength\parindent{0cm}
% Default MDFrame -- no borders
\mdfsetup{skipabove=0pt,skipbelow=0pt} 
% Hyperlink setup
\hypersetup{pdfborder={0 0 0}}

%
% CLEARDOUBLEPAGE
%
\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{%
  \clearpage
  {\pagestyle{empty}\origdoublepage}%
  \addtocounter{page}{-1}
}
\let\cleardoublepage\clearemptydoublepage


%
% TITLE PAGE CUSTOMIZATION
%
% Syllabus
\ifdefined\@syllabus
\renewcommand\maketitle
{
  \thispagestyle{syllabus-plain}
  \ifdefined\@isu
  \begin{ISUHeaderBox}{SYLLABUS - \@date}{fancy:title}
    {\color{isured}\LARGE \textbf{\@name}}

    \vspace{10pt}{\large \textbf{\@author}}

    \vspace{10pt}{\large Department of Aerospace Engineering \\ Iowa State University}
  \end{ISUHeaderBox}
  \else
  \begin{tcolorbox}[enhanced jigsaw,arc=0pt,boxrule=0pt,borderline west={5pt}{0pt}{uccsgold},colback=\uccsgray]
    {\LARGE \titlefont{\bf \@name}} 

    \vspace{10pt}\vspace{5pt}{\LARGE \titlefont{\color{isudarkgold}Syllabus}}
  \end{tcolorbox}
  \fi
}
\fi
% Course Notes
\ifdefined\@notes
\ifdefined\@book
\title{\@name}
\else
\renewcommand\maketitle
{
  \thispagestyle{notes-plain}
  \ifdefined\@isu
  \begin{ISUHeaderBox}{COURSE NOTES}{fancy:title}
    {\color{isured}\LARGE \textbf{\@name}}

    \vspace{10pt}{\large \textbf{\@author}}

    \vspace{10pt}{\large Department of Aerospace Engineering \\ Iowa State University}
  \end{ISUHeaderBox}
  \vspace{1cm}
  \else
  \begin{tcolorbox}[enhanced jigsaw,arc=0pt,boxrule=0pt,borderline west={5pt}{0pt}{uccsgold},colback=uccsgray]
    {\LARGE \titlefont{\@name}} 

    \vspace{10pt}{\LARGE \titlefont{Course Notes}}

    \ifdefined\@author \vspace{10pt}{\bf \@author} \fi
  \end{tcolorbox}
  \fi
}
\fi
\fi
% Problem Set
\ifdefined\@problemset
\renewcommand\maketitle
{
  \thispagestyle{ps-plain}
  \ifdefined\@isu
    \begin{ISUHeaderBox}{\@pstitle \ifdefined\Solutions\ Solutions\fi}{fancy:title}
    {\color{isured}\LARGE \textbf{\@name}}

    \vspace{10pt}{\large \color{black}\textbf{\@author}}

    \ifdefined\@duedate
    \ifdefined\@assigneddate{ \color{black} Assigned: \@assigneddate} \fi 

    \vspace{1pt}{ \color{black} \bf Due: \@duedate}
    \fi

    \ifdefined\@psnotes
    \vspace{0.5cm}
    {\color{black}\@psnotes}
    \fi    

  \end{ISUHeaderBox}\vspace{1cm}
  \else
  \begin{tcolorbox}[enhanced jigsaw,arc=0pt,boxrule=0pt,borderline west={5pt}{0pt}{uccsgold},colback=uccsgray]
    {\LARGE \titlefont{\@name}} 

    \vspace{10pt}{\LARGE \titlefont{\@pstitle \ifdefined\Solutions\ Solutions \fi}}

    \ifdefined\@duedate
    \vspace{0.5cm}
    \ifdefined\@assigneddate{ Assigned: \@assigneddate} \fi 

    \vspace{1pt}{ \bf Due: \@duedate}
    \fi

    \ifdefined\@psnotes
    \vspace{0.5cm}
    {\@psnotes}
    \fi    
  \end{tcolorbox}
  \fi
}
\fi
% Exam
\ifdefined\@exam
\renewcommand\maketitle
{
  \thispagestyle{exam-plain}
  \begin{tcolorbox}[enhanced jigsaw,arc=0pt,boxrule=0pt,borderline west={5pt}{0pt}{uccsgold},colback=uccsgray]
    {\LARGE \titlefont{\@name}} 

    \vspace{10pt}{\LARGE \titlefont{\@examname \ifdefined\Solutions\ Solutions \fi}}

    \ifdefined\@givendate
    \vspace{0.5cm}
    {\large \@givendate} \\ 
    \fi

    \ifdefined\@examnotes
    \vspace{0.5cm}
    {\large \@examnotes}
    \fi
  \end{tcolorbox}
  \ifdefined\Solutions
  \ifdefined\@results \vfill\@results\vfill \newpage \fi
  \else
  \ifdefined\@instructions \vfill\@instructions\vfill \newpage \fi 
  \fi
}
\fi



%
% HEADER / FOOTER CUSTOMIZATION
%
\fancypagestyle{none-fancy}
{
  \lhead{\small{\bf \@name}\\\@institution}
  \chead{}
  \rhead{\small\\ \@webpage}
  \lfoot{\small\@copyright}
  \cfoot{}\rfoot{\small\thepage}
}
\fancypagestyle{none-plain}
{
  \renewcommand{\headrulewidth}{0pt}
  \rhead{} 
  \chead{} 
  \lhead{}
  \lfoot{\small\@copyright}
  \cfoot{}
  \rfoot{\small\thepage}
}
\pagestyle{none-fancy}

\ifdefined\@notes 
\fancypagestyle{notes-fancy}
{
  \lhead{\small{\bf\@name}\\\@institution}
  \chead{}
  \rhead{\small{\bf Course Notes}\\ \@webpage}
  \lfoot{\small\@copyright}
  \cfoot{}\rfoot{\small\thepage}
}
\fancypagestyle{notes-plain}
{
  \renewcommand{\headrulewidth}{0pt}
  \rhead{} 
  \chead{} 
  \lhead{}
  \lfoot{\small\@copyright}
  \cfoot{}
  \rfoot{\small\thepage}
}
\pagestyle{notes-fancy}
\tocloftpagestyle{notes-plain}
\fi

\ifdefined\@problemset
\fancypagestyle{ps-plain}
{
  \renewcommand{\headrulewidth}{0pt}
  \rhead{} 
  \chead{} 
  \lhead{}
  \lfoot{\small\@copyright}
  \cfoot{}
  \rfoot{\small\thepage/\pageref{LastPage}}
}
\fancypagestyle{ps-fancy}
{
  \lhead{\small{\bf\@name}\\\@institution}
  \chead{} 
  \rhead{\small
    {\bf \@pstitle \ifdefined\Solutions\ Solutions \fi} \\ 
    \ifdefined\@shortduedate Due: \@shortduedate\fi} 
  \lfoot{\small\@copyright}
  \cfoot{}
  \rfoot{\small\thepage/\pageref{LastPage}}
}
\pagestyle{ps-fancy}
\tocloftpagestyle{ps-plain}
\fi

\ifdefined\@exam
\fancypagestyle{exam-plain}
{
  \renewcommand{\headrulewidth}{0pt}
  \rhead{} 
  \chead{} 
  \lhead{}
  \lfoot{\small\@copyright}
  \cfoot{}
  \rfoot{\small\thepage/\pageref{LastPage}}
}
\fancypagestyle{exam-fancy}
{
  \lhead{\small{\bf\@name}\\\@institution}
  \chead{} 
  \rhead{\small
    {\bf\@examname \ifdefined\Solutions\ Solutions \fi} \\ 
    \ifdefined\@shortgivendate\@shortgivendate\fi} 
  \lfoot{\small\@copyright}
  \cfoot{}
  \rfoot{\small\thepage/\pageref{LastPage}}
}
\pagestyle{exam-fancy}
\tocloftpagestyle{exam-plain}
\fi

\ifdefined\@syllabus
\fancypagestyle{syllabus-plain}
{
  \renewcommand{\headrulewidth}{0pt}
  \rhead{} 
  \chead{} 
  \lhead{}
  \lfoot{\small\@copyright}
  \cfoot{}
  \rfoot{\small\thepage}
}
\fancypagestyle{syllabus-fancy}
{
  \lhead{\small{\bf \@name}\\\@institution}
  \chead{} 
  \rhead{\small
    {\bf Syllabus - \@date}\\ 
    \@webpage} 
  \lfoot{\small\@copyright}
  \cfoot{}
  \rfoot{\small\thepage}
}
\pagestyle{syllabus-fancy}
\fi



%
% DEFINITIONS
%
\newtheorem{definition}{Definition}
\ifdefined\@book
\numberwithin{definition}{chapter}
\else
\numberwithin{definition}{section}
\fi

%
% EQUATIONS
%
\ifdefined\@book
\numberwithin{equation}{chapter}
\else
\numberwithin{equation}{section}
\fi

%
% LECTURE ENVIRONMENT
%
\ifdefined\@notes
\newcounter{lecture}
\newcounter{tempsec}\setcounter{tempsec}{888}
\newcounter{tempsubsec}\setcounter{tempsubsec}{888}
\newcounter{tempsubsubsec}\setcounter{tempsubsubsec}{888}
\ifdefined\@book
\newenvironment{lecture}[1][]{}{}
\newcommand\Lecture[1]{}
\newcommand\End{}
\else
\newenvironment{lecture}[1][]
{
  \cleardoublepage
  \FloatBarrier 
  \phantomsection
  \setcounter{page}{1}
  \stepcounter{lecture}
  %\pagestyle{notes-fancy}
  \thispagestyle{notes-plain}
  \rhead{\small{\bf Course Notes - Lecture \thelecture} \\ \@webpage}
  \renewcommand\thepage{\thelecture.\arabic{page}}

  \ifdefined\@isu
  {
    \Large\titlefont{Lecture \thelecture}:
    \titlefont{#1}
  }
  \begin{tcolorbox}[
    enhanced jigsaw,
    left=0pt,
    arc=0pt,
    boxrule=0pt,
    sharp corners,
    width=1cm,
    height=0cm,
    colback=white,
    borderline south={3pt}{0pt}{isugold},
    ]%
  \end{tcolorbox}
  \else
  \begin{tcolorbox}[
    enhanced jigsaw,
    arc=0pt,
    boxrule=1pt,
    borderline west={3.5cm}{0pt}{black},
    borderline west={3pt}{3.5cm}{uccsgold},
    borderline north={1pt}{0pt}{black},
    borderline south={1pt}{0pt}{black},
    colback=uccsgray]
    \begin{minipage}[c]{3.5cm}
    {\color{white}\Large \titlefont{Lecture \thelecture}}
    \end{minipage}
    \begin{minipage}[c]{13cm}
    {\Large \titlefont{#1}}
    \end{minipage}
  \end{tcolorbox}
  \fi

  \nopagebreak\par\vspace{1em}\nopagebreak
  \addtocontents{toc}{\protect\pagebreak[1]}
  \addcontentsline{toc}{lecture}{Lecture \thelecture}
  \addtocontents{toc}{\protect\nopagebreak[4]\vspace{-\baselineskip}}
  \def\inalecture{}
}{

  \ifthenelse{\value{tocdepth}=2 \AND \value{tempsec}=\value{section} \AND \value{tempsubsec}=\value{subsection}}
  {\addtocontents{toc}{\protect\nopagebreak[4]\vspace{\baselineskip}}}{}

  \ifthenelse{\value{tocdepth}=3 \AND \value{tempsec}=\value{section} \AND \value{tempsubsec}=\value{subsection} \AND \value{tempsubsubsec}=\value{subsubsection}}
  {\addtocontents{toc}{\protect\nopagebreak[4]\vspace{\baselineskip}}}{}

  \setcounter{tempsec}{\arabic{section}}
  \setcounter{tempsubsec}{\arabic{subsection}}
  \setcounter{tempsubsubsec}{\arabic{subsubsection}}
  \renewcommand\thepage{\thelecture.\arabic{page}}
  \clearpage
  \let\inalecture\relax
}
\newcommand\Lecture[1]{
  \ifdef{\inalecture}{\end{lecture}}{}\begin{lecture}[#1]
}
\newcommand\End{\ifdef{\inalecture}{\end{lecture}}{}}
\fi
\fi

% 
% EXAMPLE ENVIRONMANT
% 
%\newtheorem{example}{Example}
%\newcounter{example}
\newcommand{\listexamplename}{\bf \Large Examples}
\newlistof{example}{exp}{\listexamplename}
\ifdefined\@book
\numberwithin{example}{chapter}
\else
\numberwithin{example}{section}
\fi
\newenvironment{example}[1][]
{
  \def\insideexample{}
  \def\solution{\tcblower}
  \stepcounter{example}
  \addcontentsline{exp}{example}{{\bf Example \theexample}: #1}
  \begin{tcolorbox}[breakable,enhanced,colback=gray!10!white,colframe=black,
    coltitle=black,colbacktitle=gray!70,title=\textbf{Example \theexample\ifthenelse{\equal{#1}{}}{}{{\bf: #1}}}]
    \addtocounter{example}{-1}\refstepcounter{example}
  }
  { 
  \end{tcolorbox}
  \let\insideexample\undefined
}
\newenvironment{example*}[1][]
{
  \def\insideexample{}
  \def\solution{\tcblower}
  \begin{tcolorbox}[breakable,enhanced,colback=gray!10!white,colframe=black,
    coltitle=black,colbacktitle=gray!70,title=\textbf{Example \theexample\ Continued}]
  }
  { 
  \end{tcolorbox}
  \let\insideexample\undefined
}

%
% SIDENOTE ENVIRONMENT
%
\newenvironment{sidenote}{\begin{tcolorbox}[breakable,enhanced,arc=0pt,boxrule=0pt,borderline west={5pt}{0pt}{darkgray}]}{\end{tcolorbox}}


\newcounter{problem}

%
% PROBLEM ENVIRONMENT
%
\newenvironment{problem}[1][]
{
  \pagebreak[3]
  \setenumerate[0]{label=(\alph*)}
  \numberwithin{equation}{problem}
  \numberwithin{figure}{problem}
  \renewcommand{\theequation}{\theproblem\alph{subproblem}.\arabic{equation}}
  \addcontentsline{toc}{subsection}{\theproblem: #1}
  \FloatBarrier{\vspace{1.5em}\bf\large Problem \setcounter{subproblem}{0}\setcounter{subproblem_all}{0}\setcounter{equation}{0}\theproblem\ifthenelse{\equal{#1}{}}{}{{\bf: #1}}
  }\nopagebreak\par\vspace{1em}\nopagebreak
}
{
}

%
% SUBPROBLEM ENVIRONMENT
%
\newcounter{subproblem}
\newcounter{subproblem_all}
\newenvironment{subproblem}
{
  \newboolean{useproblem}
  \setboolean{useproblem}{false}
  \refstepcounter{subproblem_all}
  \ifdefined\includedsubproblems
  \IfSubStr{\includedsubproblems}{\arabic{subproblem_all}}{\setboolean{useproblem}{true}}
  \else
  \setboolean{useproblem}{true}
  \fi

  \ifuseproblem
  \vspace{-2mm}
  \refstepcounter{subproblem}
  \setcounter{equation}{0}
  \begin{itemize}[style=multiline,labelindent=0pt,leftmargin=40pt]\item[(\theproblem\alph{subproblem})]
    \else
    \comment
  \fi
}
{
  \ifuseproblem
  \end{itemize}\vspace{-2mm}
  \else
  \endcomment
  \fi
}

%
% SOLUTION ENVIRONMENT
%
\define@key{mykeys}{width}{\def\envwidth{#1}}%
\NewEnviron{solution}[1][]{
  \setkeys{mykeys}{width=\linewidth,#1}
    \ifdefined\Solutions
    \begin{subequations}
    \renewcommand{\theequation}{$^*$\theproblem\alph{subproblem}.\arabic{equation}}
    \begin{tcolorbox}[width=\envwidth,breakable,enhanced]
      %\begin{mdframed}[userdefinedwidth=0.5\linewidth,backgroundcolor=gray!20,linewidth=1pt,outermargin=0pt,skipabove=2pt,topline=false,bottomline=false,leftline=false,rightline=false]
      \noindent {\bf Solution} \\
      \BODY
    %\end{mdframed}
    \end{tcolorbox}
    \renewcommand{\theequation}{\theproblem\alph{subproblem}.\arabic{equation}} 
  \end{subequations}
  \addtocounter{equation}{-1}
  \fi
}


\ifdefined\@notes
\ifdefined\@book
\else
\cftsetindents{section}{2.3cm}{0.7cm}
\cftsetindents{subsection}{3.2cm}{1.0cm}
\newlength{\@lectocoffset}
\setlength{\@lectocoffset}{2pt}
\newcommand*\l@lecture[2]{%
  \vspace{\@lectocoffset}
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip 1.5em
      \hskip -\leftskip
      \small\color{gray}\fontfamily{phv}\fontseries{b}\fontshape{sc}\selectfont#1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss }\par\vspace{-\@lectocoffset}
    \endgroup
  }
\fi
\fi



%
% Macros
%

\graphicspath{{figures/}}

\def\currentpath{figures}

\def\includeproblem{\@ifnextchar[{\@with}{\@without}}
\def\@with[#1]#2{
  \def\includedsubproblems{#1}
  \def\currentpath{#2}
  \graphicspath{{\currentpath/}}
  \refstepcounter{problem}\label{pr:#2}
  \input{\currentpath/problem.tex}
  \def\currentpath{figures}
  \let\includedsubproblems\undefined
}
\def\@without#1{
  \def\currentpath{#1}
  \graphicspath{{\currentpath/}}
  \refstepcounter{problem}\label{pr:#1}
  \input{\currentpath/problem.tex}
  \def\currentpath{figures}
}
\newcommand{\ID}{\mathbf{I}}

\newcommand{\documentproblem}[1]{
  \def\currentpath{#1}
  \graphicspath{{\currentpath/}}
  \refstepcounter{problem}\label{pr:#1}
  \input{\currentpath/problem.tex}
  \par{\bf Tag:} \texttt{\detokenize{#1}}
  \def\currentpath{figures}
}

\newcommand{\Fig}[1]{{\begin{center} \normalsize \input \currentpath/#1 \end{center}}}

\newcommand{\bmx}[1]{\begin{bmatrix}#1\end{bmatrix}}
\newcommand{\tr}{\text{tr}}
\renewcommand{\div}{\text{div}}
\newcommand{\grad}{\text{grad}}
\newcommand{\curl}{\text{curl}}
\newcommand{\Div}{\text{Div}}
\newcommand{\Grad}{\text{Grad}}
\newcommand{\Curl}{\text{Curl}}
\renewcommand{\det}{\text{det}}

\newtheorem{theorem}{Theorem}
\ifdefined\@book
\numberwithin{theorem}{chapter}
\else
\numberwithin{theorem}{section}
\fi
\newtheorem{lemma}{Lemma}
\ifdefined\@book
\numberwithin{lemma}{chapter}
\else
\numberwithin{lemma}{section}
\fi
\renewcommand{\sc}{\fontfamily{phv}\fontshape{sc}\selectfont}
\ifdefined\@book
\numberwithin{figure}{chapter}
\else
\numberwithin{figure}{section}
\fi

\renewenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\Large\textbf{\indexname}\vspace{1cm}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{notes-fancy}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
