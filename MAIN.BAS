DECLARE SUB printRow (row$, startPosX%, startPosY%)
DECLARE FUNCTION selectAndPrintChar (char$, startPosX%, startPosY%)
DECLARE FUNCTION printChar (asciiArt$(), startPosX%, startPosY%)
REM $INCLUDE: 'ALPHABET.BI'

'** Data *************************

startPosX% = 1
startPosY% = 3
heightText% = 2
textToPrint$(0) = "Ruhrpott"
textToPrint$(1) = "Metaller"

'*********************************

CLS
COLOR 10 'Light green

FOR numRow% = 0 TO heightText% - 1
        startPosY% = startPosY% + heightChar * numRow%
        CALL printRow(textToPrint$(numRow%), (startPosX%), startPosY%)
NEXT numRow%

SLEEP

FUNCTION printChar (asciiArt$(), startPosX%, startPosY%)
        FOR asciiArtRowNumber% = 0 TO heightChar - 1
            LOCATE startPosY%, startPosX%
            PRINT asciiArt$(asciiArtRowNumber%)
            startPosY% = startPosY% + 1
        NEXT

        printChar = LEN(asciiArt$(0))
END FUNCTION

SUB printRow (row$, startPosX%, startPosY%)
        widthText% = LEN(row$)
        FOR numChar% = 0 TO widthText% - 1
                char$ = MID$(row$, numChar% + 1, 1)
                widthChar% = selectAndPrintChar(char$, startPosX%, startPosY%)
                startPosX% = startPosX% + widthChar% + 1
        NEXT
END SUB

FUNCTION selectAndPrintChar (char$, startPosX%, startPosY%)
        SELECT CASE char$
             CASE "h"
                widthChar% = printChar(lowercaseH(), startPosX%, (startPosY%))
             CASE "o"
                widthChar% = printChar(lowercaseO(), startPosX%, (startPosY%))
             CASE "p"
                widthChar% = printChar(lowercaseP(), startPosX%, (startPosY%))
             CASE "R"
                widthChar% = printChar(uppercaseR(), startPosX%, (startPosY%))
             CASE "r"
                widthChar% = printChar(lowercaseR(), startPosX%, (startPosY%))
             CASE "o"
                widthChar% = printChar(lowercaseO(), startPosX%, (startPosY%))
             CASE "u"
                widthChar% = printChar(lowercaseU(), startPosX%, (startPosY%))
             CASE "t"
                widthChar% = printChar(lowercaseT(), startPosX%, (startPosY%))
             CASE ELSE
                widthChar% = 0
        END SELECT
        selectAndPrintChar = widthChar%
END FUNCTION

