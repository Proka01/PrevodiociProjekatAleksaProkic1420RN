package Lexer;

public class DummySym {
    public final static int EOF = 0;
    public final static int LP = 1;
    public final static int RP = 2;
    public final static int LV = 3;
    public final static int RV = 4;

    //operators
    public final static int AND = 5;
    public final static int OR = 6;
    public final static int PLUS = 7;
    public final static int MUL = 8;
    public final static int MIN = 9;
    public final static int DIV = 10;
    public final static int LESS = 11;
    public final static int LESSE = 12;
    public final static int GREAT = 13;
    public final static int GREATE = 14;
    public final static int EQ = 15;
    public final static int NEQ = 16;

    //separators
    public final static int DOTCOMMA = 17;
    public final static int COMMA = 18;

    //key_words
    public final static int MAIN = 19;
    public final static int INT = 20;
    public final static int DOUBLE = 21;
    public final static int IF = 22;
    public final static int ELSE = 23;
    public final static int WHILE = 24;
    public final static int PRINTF = 25;
    public final static int SCANF = 26;


    //id-s
    public final static int ID = 27;

    //constants
    public final static int CONST = 28;

}
