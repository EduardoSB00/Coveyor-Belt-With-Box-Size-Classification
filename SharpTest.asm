
_main:

;SharpTest.c,19 :: 		void main() {
;SharpTest.c,21 :: 		LCD_INIT();
	CALL        _Lcd_Init+0, 0
;SharpTest.c,22 :: 		LCD_CMD(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SharpTest.c,24 :: 		ADC_INIT();
	CALL        _ADC_Init+0, 0
;SharpTest.c,26 :: 		while(1){
L_main0:
;SharpTest.c,28 :: 		medicion=-0.1048*ADC_READ(4)+72.774;
	MOVLW       4
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       98
	MOVWF       R4 
	MOVLW       161
	MOVWF       R5 
	MOVLW       214
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       74
	MOVWF       R4 
	MOVLW       140
	MOVWF       R5 
	MOVLW       17
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _medicion+0 
	MOVF        R1, 0 
	MOVWF       _medicion+1 
;SharpTest.c,29 :: 		IntToStr(medicion,txt);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;SharpTest.c,30 :: 		LCD_OUT(1,1,txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SharpTest.c,32 :: 		}
	GOTO        L_main0
;SharpTest.c,35 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
