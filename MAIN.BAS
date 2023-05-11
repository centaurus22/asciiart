DECLARE SUB printRow (row$, startPosX%, startPosY%)
DECLARE FUNCTION selectAndPrintChar (char$, startPosX%, startPosY%)
DECLARE FUNCTION printChar (asciiArt$())
REM $INCLUDE: 'ALPHABET.BI'

'** Data *************************

startPosX% = 0
startPosY% = 3
heightText% = 2
textToPrint$(0) = "Ruhrpott"
textToPrint$(1) = "Metaller"

'*********************************

FOR numRow% = 0 TO heightText% - 1
        startPosY% = startPosY% + heightChar * numRow%
        CALL printRow(textToPrint$(numRow%), startPosX%, startPosY%)
NEXT numRow%

FUNCTION printChar (asciiArt$())
        FOR asciiArtRowNumber% = 0 TO heightChar - 1
            PRINT asciiArt$(asciiArtRowNumber%)
        NEXT

        printChar = LEN(asciiArt$(0))
END FUNCTION

SUB printRow (row$, startPosX%, startPosY%)
        widthText% = LEN(row$)
        FOR numChar% = 0 TO widthText% - 1
                startPosX% = startPosX% + widthChar
                char$ = MID$(row$, numChar% + 1, 1)
                witdhChar = selectAndPrintChar(char$, startPosX%, startPosY%)
        NEXT
END SUB

FUNCTION selectAndPrintChar (char$, startPosX%, startPosY%)
        SELECT CASE char$
             CASE "R"
                widthChar% = printChar(uppercaseR())
             CASE ELSE
                widthChar% = 0
        END SELECT

        selectAndPrintChar = widthChar%
END FUNCTION

