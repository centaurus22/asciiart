DECLARE SUB printRow (row$, startPosX%, startPosY%)
DECLARE SUB printCharakter (charakter$, startPosX%, startPosY%)
REM $INCLUDE: 'ALPHABET.BI'

'** Data *************************

startPosX% = 0
startPosY% = 3
heightText% = 2
textToPrint$(0) = "Ruhrpott"
textToPrint$(1) = "Metaller"

'*********************************

FOR numRow% = 0 TO heightText% - 1
        startPosY% = startPosY% + heightCharakter * numRow%
        CALL printRow(textToPrint$(numRow%), startPosX%, startPosY%)
NEXT numRow%

SUB printCharakter (charakter$, startPosX%, startPosY%)
        PRINT charakter$
END SUB

SUB printRow (row$, startPosX%, startPosY%)
        widthText% = LEN(row$)
        FOR numCharakter% = 0 TO widthText% - 1
                startPosX% = startPosX% + numCharakter * widthCharakter
                charakter$ = MID$(row$, numCharakter% + 1, 1)
                CALL printCharakter(charakter$, startPosX%, startPosY%)
        NEXT numCharakter%
END SUB

