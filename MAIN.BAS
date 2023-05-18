TYPE Position
        x AS INTEGER
        y AS INTEGER
END TYPE

DECLARE SUB printRow (row$, textPosition AS Position)
DECLARE FUNCTION selectAndPrintChar (char$, startPos AS Position)
DECLARE FUNCTION printChar (asciiArt$(), startPos AS Position)
REM $INCLUDE: 'ALPHABET.BI'

textHeight% = 2
DIM startPos(textHeight%) AS Position

'** Data *************************

text$(0) = "Ruhrpott"
text$(1) = "Metaller"

startPos(0).x = 3
startPos(1).x = 7
startPosY% = 4

COLOR 10 'Light green

'*********************************

CLS

FOR numRow% = 0 TO textHeight% - 1
        startPos(numRow%).y = startPosY% + charHeight * numRow%
        CALL printRow(text$(numRow%), startPos(numRow%))
NEXT numRow%

SLEEP

FUNCTION printChar (asciiArt$(), startPos AS Position)
        'Save the y position because it is passed by refference
        startPosY% = startPos.y

        FOR asciiArtRowNumber% = 0 TO charHeight - 1
            LOCATE startPos.y, startPos.x
            PRINT asciiArt$(asciiArtRowNumber%)
            startPos.y = startPos.y + 1
        NEXT
       
        'Write the y position back
        startPos.y = startPosY%

        printChar = LEN(asciiArt$(0))
END FUNCTION

SUB printRow (row$, startPos AS Position)
        widthText% = LEN(row$)
        FOR numChar% = 0 TO widthText% - 1
                char$ = MID$(row$, numChar% + 1, 1)
                widthChar% = selectAndPrintChar(char$, startPos)
                startPos.x = startPos.x + widthChar% + 2
        NEXT
END SUB

FUNCTION selectAndPrintChar (char$, startPos AS Position)
        SELECT CASE char$
             CASE "a"
                widthChar% = printChar(lowercaseA(), startPos)
             CASE "e"
                widthChar% = printChar(lowercaseE(), startPos)
             CASE "h"
                widthChar% = printChar(lowercaseH(), startPos)
             CASE "l"
                widthChar% = printChar(lowercaseL(), startPos)
             CASE "M"
                widthChar% = printChar(uppercaseM(), startPos)
             CASE "o"
                widthChar% = printChar(lowercaseO(), startPos)
             CASE "p"
                widthChar% = printChar(lowercaseP(), startPos)
             CASE "R"
                widthChar% = printChar(uppercaseR(), startPos)
             CASE "r"
                widthChar% = printChar(lowercaseR(), startPos)
             CASE "o"
                widthChar% = printChar(lowercaseO(), startPos)
             CASE "u"
                widthChar% = printChar(lowercaseU(), startPos)
             CASE "t"
                widthChar% = printChar(lowercaseT(), startPos)
             CASE ELSE
                widthChar% = 0
        END SELECT
        selectAndPrintChar = widthChar%
END FUNCTION

