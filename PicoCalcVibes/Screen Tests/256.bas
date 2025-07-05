' PicoCalc 256 Color Screen Test
' Comprehensive color testing application for PicoCalc (320x320)
' 
' Features:
' - 256 smooth color transitions through RGB/CMYK spectrum
' - Real-time color information (RGB, HEX, HSV)
' - Complementary text colors for optimal contrast
' - Professional screen testing capabilities
'
' Controls:
' Left/Right arrows: Change color index
' Up/Down arrows: Change hue shift
' ESC: Exit
'
' Created by Claude (Anthropic AI Assistant)
' December 2024

' Screen dimensions for PicoMite
CONST SCREEN_WIDTH = 320
CONST SCREEN_HEIGHT = 320

' Color variables
DIM color_index
DIM hue_offset
DIM current_color
DIM red_val, green_val, blue_val
DIM key_pressed$
' Color calculation variables
DIM angle, sector, offset
DIM rising, falling, peak
' Display variables
DIM hex_val$, hue_deg, saturation, brightness
DIM text_color, bg_brightness
DIM max_rgb, min_rgb
DIM inv_red, inv_green, inv_blue

' Initialize
color_index = 0
hue_offset = 0
CLS RGB(0, 0, 0)

' Display initial instructions
TEXT 10, 10, "256 Color Test", "LT", 2, 1, RGB(255, 255, 255), RGB(0, 0, 0)
TEXT 10, 40, "Left/Right: Change Color", "LT", 1, 1, RGB(255, 255, 255), RGB(0, 0, 0)
TEXT 10, 60, "Up/Down: Change Hue", "LT", 1, 1, RGB(255, 255, 255), RGB(0, 0, 0)
TEXT 10, 80, "ESC: Exit", "LT", 1, 1, RGB(255, 255, 255), RGB(0, 0, 0)
PAUSE 3000

' Main loop
DO
    ' Calculate RGB values based on color index and hue offset
    ' Create smooth blend through RGB and CMYK color space
    ' This creates a color wheel with 256 steps
    
    ' Convert color index to angle (0-255 maps to 0-360 degrees)
    angle = color_index * 1.40625  ' 360/256 = 1.40625
    sector = INT(angle / 60)  ' Which 60-degree sector (0-5)
    offset = angle - (sector * 60)  ' Position within sector
    
    ' Calculate base RGB values using HSV-like color wheel
    peak = 255
    rising = INT((offset / 60) * 255)
    falling = 255 - rising
    
    IF sector = 0 THEN
        ' Red to Yellow (Red=255, Green rising, Blue=0)
        red_val = peak
        green_val = rising
        blue_val = 0
    ELSEIF sector = 1 THEN
        ' Yellow to Green (Red falling, Green=255, Blue=0)
        red_val = falling
        green_val = peak
        blue_val = 0
    ELSEIF sector = 2 THEN
        ' Green to Cyan (Red=0, Green=255, Blue rising)
        red_val = 0
        green_val = peak
        blue_val = rising
    ELSEIF sector = 3 THEN
        ' Cyan to Blue (Red=0, Green falling, Blue=255)
        red_val = 0
        green_val = falling
        blue_val = peak
    ELSEIF sector = 4 THEN
        ' Blue to Magenta (Red rising, Green=0, Blue=255)
        red_val = rising
        green_val = 0
        blue_val = peak
    ELSE
        ' Magenta to Red (Red=255, Green=0, Blue falling)
        red_val = peak
        green_val = 0
        blue_val = falling
    ENDIF
    
    ' Apply hue offset to shift the entire color spectrum
    red_val = red_val + hue_offset
    green_val = green_val + hue_offset
    blue_val = blue_val + hue_offset
    
    ' Clamp values to 0-255 range
    IF red_val < 0 THEN red_val = 0
    IF red_val > 255 THEN red_val = 255
    IF green_val < 0 THEN green_val = 0
    IF green_val > 255 THEN green_val = 255
    IF blue_val < 0 THEN blue_val = 0
    IF blue_val > 255 THEN blue_val = 255
    
    ' Create color and fill screen
    current_color = RGB(red_val, green_val, blue_val)
    CLS current_color
    
    ' Calculate additional color information
    ' Convert RGB to HEX
    hex_val$ = "#" + HEX$(red_val, 2) + HEX$(green_val, 2) + HEX$(blue_val, 2)
    
    ' Calculate hue in degrees (0-360)
    hue_deg = INT(angle)
    IF hue_deg >= 360 THEN hue_deg = hue_deg - 360
    
    ' Calculate brightness (0-100%)
    brightness = INT(((red_val + green_val + blue_val) / 3) * 100 / 255)
    
    ' Calculate saturation (simplified)
    max_rgb = red_val
    IF green_val > max_rgb THEN max_rgb = green_val
    IF blue_val > max_rgb THEN max_rgb = blue_val
    min_rgb = red_val
    IF green_val < min_rgb THEN min_rgb = green_val
    IF blue_val < min_rgb THEN min_rgb = blue_val
    
    IF max_rgb = 0 THEN
        saturation = 0
    ELSE
        saturation = INT(((max_rgb - min_rgb) * 100) / max_rgb)
    ENDIF
    
    ' Calculate opposite/complement color for maximum contrast
    ' Invert each RGB component (255 - original value)
    inv_red = 255 - red_val
    inv_green = 255 - green_val
    inv_blue = 255 - blue_val
    text_color = RGB(inv_red, inv_green, inv_blue)
    
    ' Display comprehensive color information
    TEXT 10, 10, "PicoCalc Color Test", "LT", 2, 1, text_color, current_color
    TEXT 10, 40, "Index: " + STR$(color_index) + "/255", "LT", 1, 1, text_color, current_color
    TEXT 10, 60, "Hue Shift: " + STR$(hue_offset), "LT", 1, 1, text_color, current_color
    TEXT 10, 80, "RGB: " + STR$(red_val) + "," + STR$(green_val) + "," + STR$(blue_val), "LT", 1, 1, text_color, current_color
    TEXT 10, 100, "HEX: " + hex_val$, "LT", 1, 1, text_color, current_color
    TEXT 10, 120, "Hue: " + STR$(hue_deg) + "°", "LT", 1, 1, text_color, current_color
    TEXT 10, 140, "Sat: " + STR$(saturation) + "%", "LT", 1, 1, text_color, current_color
    TEXT 10, 160, "Bright: " + STR$(brightness) + "%", "LT", 1, 1, text_color, current_color
    
    ' Display screen test info
    TEXT 10, 190, "Screen: 320x320 pixels", "LT", 1, 1, text_color, current_color
    TEXT 10, 210, "Total pixels: 102,400", "LT", 1, 1, text_color, current_color
    
    ' Display controls reminder
    TEXT 10, 240, "Left/Right: Change Color", "LT", 1, 1, text_color, current_color
    TEXT 10, 260, "Up/Down: Shift Hue", "LT", 1, 1, text_color, current_color
    TEXT 10, 280, "ESC: Exit", "LT", 1, 1, text_color, current_color
    
    ' Wait for key press
    DO
        key_pressed$ = INKEY$
        IF key_pressed$ <> "" THEN EXIT DO
        PAUSE 10
    LOOP
    
    ' Process key input
    IF key_pressed$ = CHR$(27) THEN
        ' ESC key - exit
        EXIT DO
    ELSEIF key_pressed$ = CHR$(130) THEN
        ' Left arrow - decrease color index
        color_index = color_index - 1
        IF color_index < 0 THEN color_index = 255
    ELSEIF key_pressed$ = CHR$(131) THEN
        ' Right arrow - increase color index
        color_index = color_index + 1
        IF color_index > 255 THEN color_index = 0
    ELSEIF key_pressed$ = CHR$(128) THEN
        ' Up arrow - increase hue offset
        hue_offset = hue_offset + 8
        IF hue_offset > 127 THEN hue_offset = -128
    ELSEIF key_pressed$ = CHR$(129) THEN
        ' Down arrow - decrease hue offset
        hue_offset = hue_offset - 8
        IF hue_offset < -128 THEN hue_offset = 127
    ENDIF
LOOP

' Clean exit
CLS RGB(0, 0, 0)
TEXT 10, 10, "256 Color Test Complete!", "LT", 2, 1, RGB(255, 255, 255), RGB(0, 0, 0)
PAUSE 2000
CLS
END
