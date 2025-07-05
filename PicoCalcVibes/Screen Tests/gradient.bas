' PicoMite Evolving Gradient Display
' Full screen gradient that evolves over time
' Press any key to exit

' Screen dimensions for PicoMite
CONST SCREEN_WIDTH = 320
CONST SCREEN_HEIGHT = 320

' Animation variables
DIM time_offset
DIM x, y
DIM norm_x, norm_y
DIM red_val, green_val, blue_val

' Initialize
time_offset = 0
CLS RGB(0, 0, 0)

' Main animation loop
DO
    ' Generate gradient for each pixel
    FOR y = 0 TO SCREEN_HEIGHT - 1
        FOR x = 0 TO SCREEN_WIDTH - 1
            ' Calculate normalized coordinates (0 to 1)
            norm_x = x / (SCREEN_WIDTH - 1)
            norm_y = y / (SCREEN_HEIGHT - 1)
            
            ' Create evolving gradient using sine waves
            ' Red varies horizontally with time
            red_val = INT(127.5 + 127.5 * SIN(norm_x * 6.28318 + time_offset))
            
            ' Green varies vertically with phase offset
            green_val = INT(127.5 + 127.5 * SIN(norm_y * 6.28318 + time_offset + 2.094))
            
            ' Blue varies diagonally with different phase
            blue_val = INT(127.5 + 127.5 * SIN((norm_x + norm_y) * 3.14159 + time_offset + 4.188))
            
            ' Clamp values to valid range
            IF red_val < 0 THEN red_val = 0
            IF red_val > 255 THEN red_val = 255
            IF green_val < 0 THEN green_val = 0
            IF green_val > 255 THEN green_val = 255
            IF blue_val < 0 THEN blue_val = 0
            IF blue_val > 255 THEN blue_val = 255
            
            ' Set pixel color
            PIXEL x, y, RGB(red_val, green_val, blue_val)
        NEXT x
        
        ' Check for key press every row for responsive exit
        IF INKEY$ <> "" THEN EXIT DO
    NEXT y
    
    ' Update animation time
    time_offset = time_offset + 0.08
    IF time_offset > 6.28318 THEN time_offset = 0
    
    ' Small pause for smooth animation
    PAUSE 20
    
    ' Check for key press
    IF INKEY$ <> "" THEN EXIT DO
LOOP

' Clean exit
CLS RGB(0, 0, 0)
END
