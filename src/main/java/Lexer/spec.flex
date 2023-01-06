// import section
import Parser.sym;import java_cup.runtime.*;
%%
// declaration section
%class MPLexer
%function next_token
%line
%column
%debug
%eofval{
return new Symbol( sym.EOF);
%eofval}

%{
   public int getLine()
   {
      return yyline;
   }
%}

//states
%state COMMENT
//macros
slovo = [a-zA-Z]
cifra = [0-9]
oc16 = [0-9A-F]
%%
// rules section
\/\/ { yybegin( COMMENT ); }
<COMMENT>~\n { yybegin( YYINITIAL ); }

[\t\n\r ] { ; }
\( { return new Symbol( sym.LP ); }
\) { return new Symbol( sym.RP ); }
\{ { return new Symbol( sym.LV ); }
\} { return new Symbol( sym.RV ); }

//operators
&& { return new   Symbol( sym.AND); }
\|\| { return new Symbol( sym.OR); }
\+ { return new   Symbol( sym.PLUS); }
\* { return new   Symbol( sym.MUL); }
\- { return new   Symbol( sym.MIN); }
\/  { return new  Symbol( sym.DIV); }
\< { return new   Symbol( sym.LESS); }
\<= { return new  Symbol( sym.LESSE); }
\> { return new   Symbol( sym.GREAT); }
\>= { return new  Symbol( sym.GREATE); }
== { return new   Symbol( sym.EQ); }
\!= { return new  Symbol( sym.NEQ); }

//separators
; { return new Symbol( sym.DOTCOMMA); }
, { return new Symbol( sym.COMMA ); }
= { return new Symbol( sym.ASSIGN ); }

//key_words
int {return new Symbol(sym.INT);}
double {return new Symbol(sym.DOUBLE );}
main {return new Symbol(sym.MAIN );}
if {return new Symbol(sym.IF);}
else {return new Symbol(sym.ELSE);}
while {return new Symbol(sym.WHILE);}
printf {return new Symbol(sym.PRINTF);}
scanf {return new Symbol(sym.SCANF);}

//id-s
({slovo} | _)({slovo}|{cifra}| _ )* { return new Symbol(sym.ID); }

//constants
{cifra}+ { return new Symbol( sym.CONST ); }
\${oc16}+ { return new Symbol( sym.CONST); }
0\.{cifra}+(E[+\-]{cifra}+)? { return new Symbol( sym.CONST);}
'[^]' { return new Symbol( sym.CONST); }

//error symbol
. { if (yytext() != null && yytext().length() > 0) System.out.println( "ERROR: " + yytext() ); }
