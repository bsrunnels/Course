\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{course}
\DeclareOption{syllabus}{\def\@syllabus{}}
\DeclareOption{notes}{\def\@notes{}}
\DeclareOption{homework}{\def\@homework{}}
\DeclareOption{exam}{\def\@exam{}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

%
% PACKAGES
%
\RequirePackage[cm]{sfmath}
\RequirePackage[labelformat=empty]{caption}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{bm}
\RequirePackage{booktabs}
\RequirePackage{cancel}
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
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{tocloft}
\RequirePackage{url}
\RequirePackage{wrapfig}
\RequirePackage{xr}                             % ability to reference external documents



\RequirePackage[rm]{roboto}
\RequirePackage[T1]{fontenc}

%
% COLORS
%
%\definecolor{uccsgold}{hrml}{#cfb87c}
\definecolor{uccsgold}{HTML}{CFB87C}
\definecolor{uccsgray}{HTML}{ECECEC}

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


\ifdefined\@homework
\newcommand{\hwtitle}[1]{\def\@hwtitle{#1}}
\newcommand{\assigneddate}[1]{\def\@assigneddate{#1}}
\newcommand{\duedate}[2][]{
  \ifthenelse{\equal{#1}{}}{\def\@shortduedate{#2}}{\def\@shortduedate{#1}}
  \def\@duedate{#2}}
\newcommand{\hwnotes}[1]{\def\@hwnotes{#1}}
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
\renewcommand*{\arraystretch}{0.75} % change matrix height
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
% TITLE PAGE CUSTOMIZATION
%
% Miscellaneous
\renewcommand\maketitle
{
  \thispagestyle{none-plain}
  \begin{center}
    {\LARGE \bf \@name} 
  \end{center}
  \noindent\rule{\textwidth}{0.5pt}
}
% Syllabus
\ifdefined\@syllabus
\renewcommand\maketitle
{
  \thispagestyle{syllabus-plain}
  \begin{tcolorbox}[enhanced jigsaw,arc=0pt,boxrule=0pt,borderline west={5pt}{0pt}{uccsgold},colback=uccsgray]
    {\LARGE \bf  \robotoslab \@name} 

    \vspace{10pt}\vspace{5pt}{\LARGE \bf \robotoslab Syllabus}
 \end{tcolorbox}
}
\fi
% Course Notes
\ifdefined\@notes
\renewcommand\maketitle
{
  \thispagestyle{notes-plain}
  \begin{tcolorbox}[enhanced jigsaw,arc=0pt,boxrule=0pt,borderline west={5pt}{0pt}{uccsgold},colback=uccsgray]
    {\LARGE \bf  \robotoslab \@name} 

    \vspace{10pt}{\LARGE \bf \robotoslab Course Notes}

    \ifdefined\@author \vspace{10pt}{\bf \@author} \fi
  \end{tcolorbox}
%  \begin{center}
%    {\LARGE \bf \@name} \\
%    \vspace{5pt}{\LARGE \bf Course Notes}
%  \end{center}
%  \noindent\rule{\textwidth}{0.5pt}
}
\fi
% Homework
\ifdefined\@homework
\renewcommand\maketitle
{
  \thispagestyle{hw-plain}
  \begin{tcolorbox}[enhanced jigsaw,arc=0pt,boxrule=0pt,borderline west={5pt}{0pt}{uccsgold},colback=uccsgray]
    {\LARGE \bf  \robotoslab \@name} 

    \vspace{10pt}{\LARGE \bf \robotoslab \@hwtitle \ifdefined\Solutions\ Solutions \fi}

    \ifdefined\@duedate
    \vspace{0.5cm}
    \ifdefined\@assigneddate{ Assigned: \@assigneddate} \fi 

    \vspace{1pt}{ \bf Due: \@duedate}
    \fi

    \ifdefined\@hwnotes
    \vspace{0.5cm}
    {\@hwnotes}
    \fi    
  \end{tcolorbox}
}
\fi
% Exam
\ifdefined\@exam
\renewcommand\maketitle
{
  \thispagestyle{exam-plain}
  \begin{tcolorbox}[enhanced jigsaw,arc=0pt,boxrule=0pt,borderline west={5pt}{0pt}{uccsgold},colback=uccsgray]
    {\LARGE \bf \robotoslab \@name} 

    \vspace{10pt}{\LARGE \bf \robotoslab \@examname \ifdefined\Solutions\ Solutions \fi}

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

\ifdefined\@homework
\fancypagestyle{hw-plain}
{
  \renewcommand{\headrulewidth}{0pt}
  \rhead{} 
  \chead{} 
  \lhead{}
  \lfoot{\small\@copyright}
  \cfoot{}
  \rfoot{\small\thepage/\pageref{LastPage}}
}
\fancypagestyle{hw-fancy}
{
  \lhead{\small{\bf\@name}\\\@institution}
  \chead{} 
  \rhead{\small
    {\bf \@hwtitle \ifdefined\Solutions\ Solutions \fi} \\ 
    \ifdefined\@shortduedate Due: \@shortduedate\fi} 
  \lfoot{\small\@copyright}
  \cfoot{}
  \rfoot{\small\thepage/\pageref{LastPage}}
}
\pagestyle{hw-fancy}
\tocloftpagestyle{hw-plain}
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
\numberwithin{definition}{section}

%
% EQUATIONS
%
\numberwithin{equation}{section}

%
% LECTURE ENVIRONMENT
%
\newcounter{lecture}
\newcounter{tempsec}\setcounter{tempsec}{888}
\newcounter{tempsubsec}\setcounter{tempsubsec}{888}
\newcounter{tempsubsubsec}\setcounter{tempsubsubsec}{888}
\newenvironment{lecture}[1][]
{
  \clearpage\pagebreak\newpage
  \FloatBarrier 
  \phantomsection
  \setcounter{page}{1}
  \stepcounter{lecture}
  %\pagestyle{notes-fancy}
  \thispagestyle{notes-plain}
  \rhead{\small{\bf Course Notes - Lecture \thelecture} \\ \@webpage}
  \renewcommand\thepage{\thelecture.\arabic{page}}

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
    {\color{white}\Large \bf  \robotoslab Lecture \thelecture}
    \end{minipage}
    \begin{minipage}[c]{13cm}
    {\Large \bf  \robotoslab #1}
    \end{minipage}
  \end{tcolorbox}

  \nopagebreak\par\vspace{1em}\nopagebreak
  \addtocontents{toc}{\protect\pagebreak[1]}
  \addcontentsline{toc}{lecture}{Lecture \thelecture}
  \addtocontents{toc}{\protect\nopagebreak[4]\vspace{-\baselineskip}}
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
}

% 
% EXAMPLE ENVIRONMANT
% 
\newtheorem{example}{Example}
\numberwithin{example}{section}
%\renewenvironment{example}[1][]
%{
%  \vspace{.25cm}
%  \begin{mdframed}[backgroundcolor=gray!80,linewidth=2pt,innertopmargin=4pt,innerbottommargin=2pt,outermargin=0pt,topline=false,bottomline=true,leftline=false,rightline=false]
%    {\bf Example \theexample}\nopagebreak\refstepcounter{example}
%    \ifthenelse{\equal{#1}{}}{}{{\bf: #1}}
%  \end{mdframed}
%  \begin{mdframed}[backgroundcolor=gray!10,linewidth=1pt,outermargin=0pt,topline=false,bottomline=true,leftline=false,rightline=false]
%  }
%  { 
%  \end{mdframed}
%  \vspace{.25cm}
%}
%\newenvironment{example*}[1][]
%{
%  \vspace{.25cm}
%  \begin{mdframed}[backgroundcolor=gray!80,linewidth=2pt,innertopmargin=4pt,innerbottommargin=2pt,outermargin=0pt,topline=false,bottomline=true,leftline=false,rightline=false]
%    {\bf Example \theexample\ Continued}
%  \end{mdframed}\nopagebreak
%  \begin{mdframed}[backgroundcolor=gray!10,linewidth=1pt,outermargin=0pt,topline=false,bottomline=true,leftline=false,rightline=false]
%  }
%  { 
%  \end{mdframed}
%  \vspace{.25cm}
%}
\renewenvironment{example}[1][]
{
  \stepcounter{example}
  \begin{tcolorbox}[breakable,enhanced,colback=gray!10!white,colframe=black,
    coltitle=black,colbacktitle=gray!70,title=\textbf{Example \theexample\ifthenelse{\equal{#1}{}}{}{{\bf: #1}}}]
    \addtocounter{example}{-1}\refstepcounter{example}
  }
  { 
  \end{tcolorbox}
}
\newenvironment{example*}[1][]
{
  \begin{tcolorbox}[breakable,enhanced,colback=gray!10!white,colframe=black,
    coltitle=black,colbacktitle=gray!70,title=\textbf{Example \theexample\ Continued}]
  }
  { 
  \end{tcolorbox}
}

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
  \FloatBarrier{\vspace{1.5em}\bf\large Problem \setcounter{subproblem}{0}\setcounter{equation}{0}\theproblem\ifthenelse{\equal{#1}{}}{}{{\bf: #1}}
  }\nopagebreak\par\vspace{1em}\nopagebreak
}
{
}

%
% SUBPROBLEM ENVIRONMENT
%
\newcounter{subproblem}
\newenvironment{subproblem}
{
  \vspace{-2mm}
  \refstepcounter{subproblem}
  \setcounter{equation}{0}
  \begin{itemize}[style=multiline,labelindent=0pt,leftmargin=40pt]\item[(\theproblem\alph{subproblem})]
}
{
  \end{itemize}\vspace{-2mm}
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



%
% Macros
%

\graphicspath{{figures/}}

\def\currentpath{figures}

\newcommand{\includeproblem}[1]{
  \def\currentpath{#1}
  \graphicspath{{\currentpath/}}
  \refstepcounter{problem}\label{pr:#1}
  \input{\currentpath/problem.tex}
  \def\currentpath{figures}
}
\newcommand{\ID}{\mathtt{I}}

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
\newcommand{\tr}{\operatorname{tr}}
\renewcommand{\div}{\operatorname{div}}
\newcommand{\grad}{\operatorname{grad}}
\newcommand{\curl}{\operatorname{curl}}
\newcommand{\Div}{\operatorname{Div}}
\newcommand{\Grad}{\operatorname{Grad}}
\newcommand{\Curl}{\operatorname{Curl}}

\newtheorem{theorem}{Theorem}
\numberwithin{theorem}{section}
\newtheorem{lemma}{Lemma}
\numberwithin{lemma}{section}
\renewcommand{\sc}{\fontfamily{phv}\fontshape{sc}\selectfont}
\numberwithin{figure}{section}
