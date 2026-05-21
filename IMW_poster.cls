\ProvidesClass{IMW_poster}
\LoadClass{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The documentation for the options for this class can be found in the %
% accompanying IMW_poster_template file.                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[portrait]{geometry}
\RequirePackage{multicol}
\RequirePackage{xkeyval}
\RequirePackage{etoolbox}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{tikz}
\usetikzlibrary{calc}
% Required to arbitraily scale fonts
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
% Required to fix math operator sizes
\RequirePackage{fixcmex}
% Required to make math font the default sans serif font (later: Lelo)
\RequirePackage{fix-cm}
\RequirePackage{sfmath}
% Required to make importing Lelo robust
\RequirePackage{iftex}
% % Required to fix ligatures
\RequirePackage{microtype}
\DisableLigatures{encoding=T1}

\ifLuaTeX
\protected\def\pdfmapline {\pdfextension mapline }
\fi

% Add Lelo to pdfLatex map file
\pdfmapline{+Lelo-Regular < T1-WGL4.enc << Lelo-Regular.otf}
\pdfmapline{+Lelo-Italic < T1-WGL4.enc << Lelo-RegularItalic.otf}
\pdfmapline{+Lelo-Bold < T1-WGL4.enc << Lelo-Bold.otf}
\pdfmapline{+Lelo-BoldItalic < T1-WGL4.enc << Lelo-BoldItalic.otf}

% Initialize new booleans and sizes
\newif\ifposter@bottomright
\newif\ifposter@bigsem
\newlength\borderlinewidth
%\setlength\borderlinewidth{4pt}

% Paper Sizes
\DeclareOption{a0}{\geometry{a0paper}}
\DeclareOption{a1}{\geometry{a1paper}}
\DeclareOption{a2}{\geometry{a2paper}}
\DeclareOption{a3}{\geometry{a3paper}}
\DeclareOption{a4}{\geometry{a4paper, mag=353, truedimen}}

% Font Sizes (Adaped from the Sciposter Package)
\DeclareOption{14pt}{
    \renewcommand{\tiny}{\fontsize{8.3}{10}\selectfont}
    \renewcommand{\scriptsize}{\fontsize{8.3}{10}\selectfont}
    \renewcommand{\footnotesize}{\fontsize{10}{12}\selectfont}
    \renewcommand{\small}{\fontsize{12}{14}\selectfont}
    \renewcommand{\normalsize}{\fontsize{14.4}{18}\selectfont}   
    \renewcommand{\large}{\fontsize{17.28}{22}\selectfont}
    \renewcommand{\Large}{\fontsize{20.74}{25}\selectfont}
    \renewcommand{\LARGE}{\fontsize{24.88}{30}\selectfont}
    \renewcommand{\huge}{\fontsize{29.86}{37}\selectfont}
    \renewcommand{\Huge}{\fontsize{35.83}{45}\selectfont}
    \renewcommand{\veryHuge}{\fontsize{43}{54}\selectfont}
    \renewcommand{\VeryHuge}{\fontsize{51.6}{64}\selectfont}
    \renewcommand{\VERYHuge}{\fontsize{61.92}{77}\selectfont}

    \setlength\smallskipamount{3.5pt plus 1pt minus 1pt}
    \setlength\medskipamount{7.5pt plus 2pt minus 2pt}
    \setlength\bigskipamount{15pt plus 5pt minus 5pt}
    \setlength\abovecaptionskip{14pt}
    \setlength\belowcaptionskip{0pt}
    \setlength\abovedisplayskip{14pt plus 4pt minus 9 pt}
    \setlength\abovedisplayshortskip{0pt plus 4pt}
    \setlength\belowdisplayshortskip{7pt plus 5pt minus 4pt}
    \setlength\borderlinewidth{3pt}
}
\DeclareOption{17pt}{
    \renewcommand{\tiny}{\fontsize{8.3}{10}\selectfont}
    \renewcommand{\scriptsize}{\fontsize{10}{12}\selectfont}
    \renewcommand{\footnotesize}{\fontsize{12}{14}\selectfont}
    \renewcommand{\small}{\fontsize{14.4}{18}\selectfont}   
    \renewcommand{\normalsize}{\fontsize{17.28}{22}\selectfont}
    \renewcommand{\large}{\fontsize{20.74}{25}\selectfont}
    \renewcommand{\Large}{\fontsize{24.88}{30}\selectfont}
    \renewcommand{\LARGE}{\fontsize{29.86}{37}\selectfont}
    \renewcommand{\huge}{\fontsize{35.83}{45}\selectfont}
    \renewcommand{\Huge}{\fontsize{43}{54}\selectfont}
    \renewcommand{\veryHuge}{\fontsize{51.6}{64}\selectfont}
    \renewcommand{\VeryHuge}{\fontsize{61.92}{77}\selectfont}
    \renewcommand{\VERYHuge}{\fontsize{74.3}{93}\selectfont}
    
    \setlength\smallskipamount{4.5pt plus 2pt minus 2pt}
    \setlength\medskipamount{9pt plus 3pt minus 3pt}
    \setlength\bigskipamount{18pt plus 6pt minus 6pt}
    \setlength\abovecaptionskip{17pt}
    \setlength\belowcaptionskip{0pt}
    \setlength\abovedisplayskip{17pt plus 4pt minus 11 pt}
    \setlength\abovedisplayshortskip{0pt plus 4pt}
    \setlength\belowdisplayshortskip{8pt plus 5pt minus 4pt}
    \setlength\borderlinewidth{3pt}
}
\DeclareOption{20pt}{
    \renewcommand{\tiny}{\fontsize{10}{12}\selectfont}
    \renewcommand{\scriptsize}{\fontsize{12}{14}\selectfont}
    \renewcommand{\footnotesize}{\fontsize{14.4}{18}\selectfont}   
    \renewcommand{\small}{\fontsize{17.28}{22}\selectfont}
    \renewcommand{\normalsize}{\fontsize{20.74}{25}\selectfont}
    \renewcommand{\large}{\fontsize{24.88}{30}\selectfont}
    \renewcommand{\Large}{\fontsize{29.86}{37}\selectfont}
    \renewcommand{\LARGE}{\fontsize{35.83}{45}\selectfont}
    \renewcommand{\huge}{\fontsize{43}{54}\selectfont}
    \renewcommand{\Huge}{\fontsize{51.6}{64}\selectfont}
    \renewcommand{\veryHuge}{\fontsize{61.92}{77}\selectfont}
    \renewcommand{\VeryHuge}{\fontsize{74.3}{93}\selectfont}
    \renewcommand{\VERYHuge}{\fontsize{89.16}{112}\selectfont}
  
    \setlength\smallskipamount{5pt plus 2pt minus 2pt}
    \setlength\medskipamount{10pt plus 3pt minus 3pt}
    \setlength\bigskipamount{20pt plus 7pt minus 7pt}
    \setlength\abovecaptionskip{20pt}
    \setlength\belowcaptionskip{0pt}
    \setlength\abovedisplayskip{20pt plus 5pt minus 13 pt}
    \setlength\abovedisplayshortskip{0pt plus 5pt}
    \setlength\belowdisplayshortskip{10pt plus 6pt minus 5pt}
    \setlength\borderlinewidth{4pt}
}
\DeclareOption{25pt}{
    \renewcommand{\tiny}{\fontsize{12}{14}\selectfont}
    \renewcommand{\scriptsize}{\fontsize{14.4}{18}\selectfont}   
    \renewcommand{\footnotesize}{\fontsize{17.28}{22}\selectfont}
    \renewcommand{\small}{\fontsize{20.74}{25}\selectfont}
    \renewcommand{\normalsize}{\fontsize{24.88}{30}\selectfont}
    \renewcommand{\large}{\fontsize{29.86}{37}\selectfont}
    \renewcommand{\Large}{\fontsize{35.83}{45}\selectfont}
    \renewcommand{\LARGE}{\fontsize{43}{54}\selectfont}
    \renewcommand{\huge}{\fontsize{51.6}{64}\selectfont}
    \renewcommand{\Huge}{\fontsize{61.92}{77}\selectfont}
    \newcommand{\veryHuge}{\fontsize{74.3}{93}\selectfont}
    \newcommand{\VeryHuge}{\fontsize{89.16}{112}\selectfont}
    \newcommand{\VERYHuge}{\fontsize{107}{134}\selectfont}
    
    \setlength\smallskipamount{6pt plus 2pt minus 2pt}
    \setlength\medskipamount{12pt plus 4pt minus 4pt}
    \setlength\bigskipamount{24pt plus 8pt minus 8pt}
    \setlength\abovecaptionskip{25pt}
    \setlength\belowcaptionskip{0pt}
    \setlength\abovedisplayskip{25pt plus 6pt minus 15 pt}
    \setlength\abovedisplayshortskip{0pt plus 6pt}
    \setlength\belowdisplayshortskip{13pt plus 7pt minus 6pt}
    \setlength\borderlinewidth{4pt}
}
\DeclareOption{30pt}{
    \renewcommand{\tiny}{\fontsize{14.4}{18}\selectfont}   
    \renewcommand{\scriptsize}{\fontsize{17.28}{22}\selectfont}
    \renewcommand{\footnotesize}{\fontsize{20.74}{25}\selectfont}
    \renewcommand{\small}{\fontsize{24.88}{30}\selectfont}
    \renewcommand{\normalsize}{\fontsize{29.86}{37}\selectfont}
    \renewcommand{\large}{\fontsize{35.83}{45}\selectfont}
    \renewcommand{\Large}{\fontsize{43}{54}\selectfont}
    \renewcommand{\LARGE}{\fontsize{51.6}{64}\selectfont}
    \renewcommand{\huge}{\fontsize{61.92}{77}\selectfont}
    \renewcommand{\Huge}{\fontsize{74.3}{93}\selectfont}
    \renewcommand{\veryHuge}{\fontsize{89.16}{112}\selectfont}
    \renewcommand{\VeryHuge}{\fontsize{107}{134}\selectfont}
    \renewcommand{\VERYHuge}{\fontsize{107}{134}\selectfont}
   
    \setlength\smallskipamount{8pt plus 2pt minus 2pt}
    \setlength\medskipamount{14pt plus 5pt minus 5pt}
    \setlength\bigskipamount{29pt plus 9pt minus 9pt}
    \setlength\abovecaptionskip{25pt}
    \setlength\belowcaptionskip{0pt}
    \setlength\abovedisplayskip{25pt plus 6pt minus 15 pt}
    \setlength\abovedisplayshortskip{0pt plus 6pt}
    \setlength\belowdisplayshortskip{13pt plus 7pt minus 6pt}
    \setlength\borderlinewidth{4pt}
}

\DeclareOption{bottomright}{\poster@bottomrighttrue}
\DeclareOption{BiGSEM}{\poster@bigsemtrue}

\DeclareOptionX{department}[economics]{\def\poster@department{#1}}
\DeclareOptionX{departmentlang}[english]{\def\poster@departmentlang{#1}}

\DeclareOptionX{institute}[IMW]{\def\poster@institute{#1}}
\DeclareOptionX{institutelang}[none]{\def\poster@institutelang{#1}}

\DeclareOptionX{organization}[CUDE]{\def\poster@organization{#1}}
\DeclareOptionX{organizationlang}[none]{\def\poster@organizationlang{#1}}

\DeclareOptionX{structurecolor}{\def\poster@structurecolor{#1}}

\ExecuteOptions{a0, 25pt}
\ExecuteOptionsX{
    department=economics, departmentlang=english, 
    institute=DOT, institutelang=english,
    organization=BiGSEM, organizationlang=none
}

\ProcessOptionsX
\ProcessOptions\relax

\ifposter@bigsem
    \ExecuteOptionsX{organization=BiGSEM}
\fi

%%%%%%%%%%%%%%%%%%%%%%%
%% Color Definitions %%
%%%%%%%%%%%%%%%%%%%%%%%
% Define colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{red}{HTML}{E30026}
\definecolor{blue}{HTML}{0784C8}
\definecolor{yellow}{HTML}{F8D42A}
\definecolor{orange}{HTML}{F59A01}
\definecolor{magenta}{HTML}{CA2D78}
\definecolor{green}{HTML}{4EAF30}
\definecolor{violet}{HTML}{BB7BB3}
\definecolor{pink}{HTML}{CA2D78}
\definecolor{cyan}{HTML}{22BADE}

% Bielefeld Uni/WiWi colors
\definecolor{universitygreen}{HTML}{008956}
\definecolor{universitylightgreen}{HTML}{14F5B4}
\definecolor{posterpurple}{HTML}{73789B}
\definecolor{econlightblue}{HTML}{50AFEF}
\definecolor{econverylightblue}{HTML}{79C2E2}
\definecolor{econveryverylightblue}{HTML}{A4D6F2}
\definecolor{econalmostwhiteblue}{HTML}{D0EAF9}

% Official Color Definitions
\definecolor{biologygreen}{HTML}{92B168}
\definecolor{chemistrypurple}{HTML}{A08CAA}
\definecolor{educationorange}{HTML}{F08C50}
\definecolor{historyblue}{HTML}{7DB4BE}
\definecolor{healthred}{HTML}{DC5A5A}
\definecolor{literatureblue}{HTML}{8FA3B9}
\definecolor{mathyellow}{HTML}{DCAA41}
\definecolor{medicineblue}{HTML}{145F7D}
\definecolor{physicsgreen}{HTML}{649696}
\definecolor{psycologyred}{HTML}{8C3250}
\definecolor{lawgray}{HTML}{8C8C96}
\definecolor{sociologyyellow}{HTML}{BFD02F}
\definecolor{techblue}{HTML}{558CA0}
\definecolor{econblue}{HTML}{74799B}


% IMW color and related colors
\definecolor{imwblue}{HTML}{3c3c5a}
\definecolor{imwlightblue}{HTML}{385DC9}
\definecolor{imwyellow}{HTML}{C9BD24}
\colorlet{cudecolor}{econblue}
\definecolor{bigsemblue}{HTML}{3AA7DF}

\colorlet{structurecolor}{econblue}
\ifposter@bigsem
    \colorlet{structurecolor}{bigsemblue}
\fi

\ifdef{\poster@structurecolor}{
    \colorlet{structurecolor}{\poster@structurecolor}
}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Define abstract and bottomright options %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefine \abstract
\def\abstract@text{}
\renewcommand{\abstract}[1]{\gdef\abstract@text{#1}}
\newcommand{\insertabstract}{\abstract@text}

% Initialize bottomright text
\def\poster@bottomright@text{}
\newcommand\bottomright[1]{\gdef\poster@bottomright@text{#1}}
\newcommand{\insertbottomright}{\poster@bottomright@text}

%%%%%%%%%%%%%%%%%%%%%%%%%
%% Define logo options %%
%%%%%%%%%%%%%%%%%%%%%%%%%
% Define custom page style for logo
% Define global logo height
\newlength\logoheight
\setlength\logoheight{0.05\paperheight}
\geometry{includehead, headheight=\logoheight}

% Define logo specific heights to differentiate between logos with
% and without language text
\newlength\departmentlogoheight
\setlength\departmentlogoheight\logoheight

\newlength\institutelogoheight
\setlength\institutelogoheight\logoheight

\newlength\organizationlogoheight
\setlength\organizationlogoheight\logoheight

% Define logo commands for header
\ifdefstring{\poster@departmentlang}{none}{%
  \setlength\departmentlogoheight{0.8\logoheight}
  \ExecuteOptionsX{department=none}
}{}%

\newcommand{\departmentlogo}{%
    \raisebox{\dimexpr0.5\logoheight-0.5\departmentlogoheight}{%
    \includegraphics[height=\departmentlogoheight]{%
        logos/departments/\poster@department/\poster@department_logo_\poster@departmentlang%
    }}%
}%


\ifdefstring{\poster@institutelang}{none}{%
    \setlength\institutelogoheight{0.8\logoheight}%
}{}%

\newcommand{\institutelogo}{%
    \raisebox{\dimexpr0.5\logoheight-0.5\institutelogoheight}{%
    \includegraphics[height=\institutelogoheight]{%
        logos/institutes/\poster@institute/\poster@institute_logo_\poster@institutelang%
    }}%
}%


\ifdefstring{\poster@organizationlang}{none}{%
    \setlength\organizationlogoheight{0.8\logoheight}%
}{}%

\newcommand{\organizationlogo}{%
    \raisebox{\dimexpr0.5\logoheight-0.5\organizationlogoheight}{%
    \includegraphics[height=\organizationlogoheight]{%
        logos/organizations/\poster@organization/\poster@organization_logo_\poster@organizationlang%
    }}%
}%

% Define new page style to put logos in header
\def\ps@poster{%
    \let\@oddfoot\@empty%
    \def\@oddhead{%
        \departmentlogo%
        \hfil%
        \institutelogo%
        \hfil%
        \organizationlogo%
    }%
}

% Redefine maketitle
\def\maketitle{%
    {\VeryHuge\bfseries\color{structurecolor}\@title\par}%
    \vskip 1em%
    {\large
    \lineskip .5em%
    \begin{tabular}[t]{l}%
        \@author
    \end{tabular}\par}%
    \vskip 0.01\paperheight%
}

% Redefine \section and \subsection
\renewcommand\section{\@startsection{section}{1}{\z@}%
                                    {-1ex}%
                                    {0.3ex \@plus.2ex}%
                                    {\normalfont\Large\bfseries%
                                    \color{structurecolor}}}%
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                       {-1ex}%
                                       {0.3ex \@plus .2ex}%
                                       {\normalfont\large\bfseries%
                                       \color{structurecolor}}}%
\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname\hskip0.5em}%

% No indent, set margins and change default font to sans serif
\newlength\postermargin
\setlength\postermargin{0.05\paperheight}

\setlength\parindent{0pt}
\geometry{hmargin=\postermargin,
          vmargin={\postermargin, 0.5\postermargin},
          headsep=0.02\paperheight}
\renewcommand{\familydefault}{lelo}

% Renew multicol specific commands
\setlength\columnsep{0.03\textwidth}
\setlength\columnseprule{0pt}
\renewcommand{\columnseprulecolor}{\color{structurecolor}}

% Make figure and table environments non-floating
\def\fps@figure{H}
\def\fps@table{H}
\captionsetup{labelfont={color=structurecolor}}

% Set up page
\AfterEndPreamble{
    \pagestyle{poster}
    \maketitle
    \ifposter@bottomright
        \begin{tikzpicture}[remember picture, overlay]
            \draw let \p3=(current page.south east) in node [above left, name=QR] 
            at (\x3-\postermargin, \y3+0.02\paperheight) {
                \insertbottomright
            };
            \draw [color=structurecolor, line width=\borderlinewidth] let 
            \p1=(current page.south east), \p2=(QR.north east) in 
            (\paperwidth,0)--(-0.015\paperwidth,0)--
            (-0.015\paperwidth, \y1+0.02\paperheight)--
            ($(QR.south west) - (0.05\postermargin,0) $)--
            ($(QR.north west) + (-0.05\postermargin, 0.05\postermargin)$)--
            (\x1+0.01\paperwidth,\y2+0.05\postermargin);
        \end{tikzpicture}
    \else
        \begin{tikzpicture}[remember picture, overlay]
            \draw [color=structurecolor, line width=\borderlinewidth] let 
            \p1=(current page.south east) in 
            (\paperwidth,0)--(-0.015\paperwidth,0)--
            (-0.015\paperwidth, \y1+0.02\paperheight)--
            (\x1+0.01\paperwidth,\y1+0.02\paperheight);
        \end{tikzpicture}
    \fi
    \vspace{-0.5\baselineskip}
    \begin{multicols*}{3}    
    [
        \vskip2.5ex
        \section*{Abstract}
        \textit{\insertabstract}
        \vspace{0.02\paperheight}
    ]
}

\AtEndDocument{
    \end{multicols*}
}