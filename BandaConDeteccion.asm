
_setpoints:

;ProjectNew.c,20 :: 		int setpoints (int setpoint, int spmax){
;ProjectNew.c,21 :: 		if (PORTA.B3){
	BTFSS       PORTA+0, 3 
	GOTO        L_setpoints0
;ProjectNew.c,22 :: 		setpoint =  setpoint + 2;
	MOVLW       2
	ADDWF       FARG_setpoints_setpoint+0, 1 
	MOVLW       0
	ADDWFC      FARG_setpoints_setpoint+1, 1 
;ProjectNew.c,23 :: 		delay_ms(380);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       219
	MOVWF       R12, 0
	MOVLW       255
	MOVWF       R13, 0
L_setpoints1:
	DECFSZ      R13, 1, 1
	BRA         L_setpoints1
	DECFSZ      R12, 1, 1
	BRA         L_setpoints1
	DECFSZ      R11, 1, 1
	BRA         L_setpoints1
;ProjectNew.c,24 :: 		}
L_setpoints0:
;ProjectNew.c,25 :: 		if (PORTA.B4){
	BTFSS       PORTA+0, 4 
	GOTO        L_setpoints2
;ProjectNew.c,26 :: 		setpoint =  setpoint - 2;
	MOVLW       2
	SUBWF       FARG_setpoints_setpoint+0, 1 
	MOVLW       0
	SUBWFB      FARG_setpoints_setpoint+1, 1 
;ProjectNew.c,27 :: 		delay_ms(380);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       219
	MOVWF       R12, 0
	MOVLW       255
	MOVWF       R13, 0
L_setpoints3:
	DECFSZ      R13, 1, 1
	BRA         L_setpoints3
	DECFSZ      R12, 1, 1
	BRA         L_setpoints3
	DECFSZ      R11, 1, 1
	BRA         L_setpoints3
;ProjectNew.c,28 :: 		}
L_setpoints2:
;ProjectNew.c,29 :: 		if (setpoint > spmax){
	MOVLW       128
	XORWF       FARG_setpoints_spmax+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_setpoints_setpoint+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__setpoints115
	MOVF        FARG_setpoints_setpoint+0, 0 
	SUBWF       FARG_setpoints_spmax+0, 0 
L__setpoints115:
	BTFSC       STATUS+0, 0 
	GOTO        L_setpoints4
;ProjectNew.c,30 :: 		setpoint = 0;
	CLRF        FARG_setpoints_setpoint+0 
	CLRF        FARG_setpoints_setpoint+1 
;ProjectNew.c,31 :: 		}
L_setpoints4:
;ProjectNew.c,32 :: 		if (setpoint < 0){
	MOVLW       128
	XORWF       FARG_setpoints_setpoint+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__setpoints116
	MOVLW       0
	SUBWF       FARG_setpoints_setpoint+0, 0 
L__setpoints116:
	BTFSC       STATUS+0, 0 
	GOTO        L_setpoints5
;ProjectNew.c,33 :: 		setpoint = spmax;
	MOVF        FARG_setpoints_spmax+0, 0 
	MOVWF       FARG_setpoints_setpoint+0 
	MOVF        FARG_setpoints_spmax+1, 0 
	MOVWF       FARG_setpoints_setpoint+1 
;ProjectNew.c,34 :: 		}
L_setpoints5:
;ProjectNew.c,35 :: 		return setpoint;
	MOVF        FARG_setpoints_setpoint+0, 0 
	MOVWF       R0 
	MOVF        FARG_setpoints_setpoint+1, 0 
	MOVWF       R1 
;ProjectNew.c,36 :: 		}
L_end_setpoints:
	RETURN      0
; end of _setpoints

_setpoints1:

;ProjectNew.c,38 :: 		int setpoints1 (int setpoint, int spmax){
;ProjectNew.c,39 :: 		if (PORTA.B3){
	BTFSS       PORTA+0, 3 
	GOTO        L_setpoints16
;ProjectNew.c,40 :: 		setpoint =  setpoint + 1;
	INFSNZ      FARG_setpoints1_setpoint+0, 1 
	INCF        FARG_setpoints1_setpoint+1, 1 
;ProjectNew.c,41 :: 		delay_ms(380);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       219
	MOVWF       R12, 0
	MOVLW       255
	MOVWF       R13, 0
L_setpoints17:
	DECFSZ      R13, 1, 1
	BRA         L_setpoints17
	DECFSZ      R12, 1, 1
	BRA         L_setpoints17
	DECFSZ      R11, 1, 1
	BRA         L_setpoints17
;ProjectNew.c,42 :: 		}
L_setpoints16:
;ProjectNew.c,43 :: 		if (PORTA.B4){
	BTFSS       PORTA+0, 4 
	GOTO        L_setpoints18
;ProjectNew.c,44 :: 		setpoint =  setpoint - 1;
	MOVLW       1
	SUBWF       FARG_setpoints1_setpoint+0, 1 
	MOVLW       0
	SUBWFB      FARG_setpoints1_setpoint+1, 1 
;ProjectNew.c,45 :: 		delay_ms(380);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       219
	MOVWF       R12, 0
	MOVLW       255
	MOVWF       R13, 0
L_setpoints19:
	DECFSZ      R13, 1, 1
	BRA         L_setpoints19
	DECFSZ      R12, 1, 1
	BRA         L_setpoints19
	DECFSZ      R11, 1, 1
	BRA         L_setpoints19
;ProjectNew.c,46 :: 		}
L_setpoints18:
;ProjectNew.c,47 :: 		if (setpoint > spmax){
	MOVLW       128
	XORWF       FARG_setpoints1_spmax+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_setpoints1_setpoint+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__setpoints1118
	MOVF        FARG_setpoints1_setpoint+0, 0 
	SUBWF       FARG_setpoints1_spmax+0, 0 
L__setpoints1118:
	BTFSC       STATUS+0, 0 
	GOTO        L_setpoints110
;ProjectNew.c,48 :: 		setpoint = 0;
	CLRF        FARG_setpoints1_setpoint+0 
	CLRF        FARG_setpoints1_setpoint+1 
;ProjectNew.c,49 :: 		}
L_setpoints110:
;ProjectNew.c,50 :: 		if (setpoint < 0){
	MOVLW       128
	XORWF       FARG_setpoints1_setpoint+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__setpoints1119
	MOVLW       0
	SUBWF       FARG_setpoints1_setpoint+0, 0 
L__setpoints1119:
	BTFSC       STATUS+0, 0 
	GOTO        L_setpoints111
;ProjectNew.c,51 :: 		setpoint = spmax;
	MOVF        FARG_setpoints1_spmax+0, 0 
	MOVWF       FARG_setpoints1_setpoint+0 
	MOVF        FARG_setpoints1_spmax+1, 0 
	MOVWF       FARG_setpoints1_setpoint+1 
;ProjectNew.c,52 :: 		}
L_setpoints111:
;ProjectNew.c,53 :: 		return setpoint;
	MOVF        FARG_setpoints1_setpoint+0, 0 
	MOVWF       R0 
	MOVF        FARG_setpoints1_setpoint+1, 0 
	MOVWF       R1 
;ProjectNew.c,54 :: 		}
L_end_setpoints1:
	RETURN      0
; end of _setpoints1

_main:

;ProjectNew.c,82 :: 		void main() {
;ProjectNew.c,88 :: 		TRISA = 0xff;
	MOVLW       255
	MOVWF       TRISA+0 
;ProjectNew.c,89 :: 		ANSELA = 0;
	CLRF        ANSELA+0 
;ProjectNew.c,91 :: 		TRISC = 0;
	CLRF        TRISC+0 
;ProjectNew.c,92 :: 		TRISD.B0 = 0;
	BCF         TRISD+0, 0 
;ProjectNew.c,93 :: 		TRISD.B1 = 1;
	BSF         TRISD+0, 1 
;ProjectNew.c,94 :: 		ANSELD.B1 = 0;
	BCF         ANSELD+0, 1 
;ProjectNew.c,96 :: 		LCD_INIT();
	CALL        _Lcd_Init+0, 0
;ProjectNew.c,97 :: 		ADC_INIT();
	CALL        _ADC_Init+0, 0
;ProjectNew.c,100 :: 		LCD_CMD(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProjectNew.c,102 :: 		while(1){
L_main12:
;ProjectNew.c,106 :: 		while (menu==0){ //Menu Principal
L_main14:
	MOVLW       0
	XORWF       _menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main121
	MOVLW       0
	XORWF       _menu+0, 0 
L__main121:
	BTFSS       STATUS+0, 2 
	GOTO        L_main15
;ProjectNew.c,107 :: 		pantalla=0;
	CLRF        _pantalla+0 
	CLRF        _pantalla+1 
;ProjectNew.c,108 :: 		PORTD.B0=0;
	BCF         PORTD+0, 0 
;ProjectNew.c,110 :: 		LCD_OUT(1,1,"MENU PRINCIPAL");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_ProjectNew+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_ProjectNew+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProjectNew.c,111 :: 		LCD_OUT(2,1,"A. B.");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_ProjectNew+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_ProjectNew+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProjectNew.c,113 :: 		if(PORTA.B0){
	BTFSS       PORTA+0, 0 
	GOTO        L_main16
;ProjectNew.c,114 :: 		menu=1;
	MOVLW       1
	MOVWF       _menu+0 
	MOVLW       0
	MOVWF       _menu+1 
;ProjectNew.c,115 :: 		delay_ms(380);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       219
	MOVWF       R12, 0
	MOVLW       255
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	DECFSZ      R11, 1, 1
	BRA         L_main17
;ProjectNew.c,116 :: 		}
L_main16:
;ProjectNew.c,118 :: 		if(PORTA.B1){
	BTFSS       PORTA+0, 1 
	GOTO        L_main18
;ProjectNew.c,119 :: 		menu=2;
	MOVLW       2
	MOVWF       _menu+0 
	MOVLW       0
	MOVWF       _menu+1 
;ProjectNew.c,120 :: 		delay_ms(380);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       219
	MOVWF       R12, 0
	MOVLW       255
	MOVWF       R13, 0
L_main19:
	DECFSZ      R13, 1, 1
	BRA         L_main19
	DECFSZ      R12, 1, 1
	BRA         L_main19
	DECFSZ      R11, 1, 1
	BRA         L_main19
;ProjectNew.c,121 :: 		}
L_main18:
;ProjectNew.c,123 :: 		}
	GOTO        L_main14
L_main15:
;ProjectNew.c,124 :: 		LCD_CMD(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProjectNew.c,127 :: 		while (menu==1){ //Establecer altura de clasificacion
L_main20:
	MOVLW       0
	XORWF       _menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main122
	MOVLW       1
	XORWF       _menu+0, 0 
L__main122:
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
;ProjectNew.c,128 :: 		LCD_OUT(1,1,"SET ALTURA");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_ProjectNew+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_ProjectNew+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProjectNew.c,129 :: 		altura = setpoints1 (altura,20);
	MOVF        _altura+0, 0 
	MOVWF       FARG_setpoints1_setpoint+0 
	MOVF        _altura+1, 0 
	MOVWF       FARG_setpoints1_setpoint+1 
	MOVLW       20
	MOVWF       FARG_setpoints1_spmax+0 
	MOVLW       0
	MOVWF       FARG_setpoints1_spmax+1 
	CALL        _setpoints1+0, 0
	MOVF        R0, 0 
	MOVWF       _altura+0 
	MOVF        R1, 0 
	MOVWF       _altura+1 
;ProjectNew.c,130 :: 		IntToStr (altura,txt);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProjectNew.c,131 :: 		LCD_OUT(2,1,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProjectNew.c,133 :: 		if(PORTA.B0){
	BTFSS       PORTA+0, 0 
	GOTO        L_main22
;ProjectNew.c,134 :: 		menu=0;
	CLRF        _menu+0 
	CLRF        _menu+1 
;ProjectNew.c,135 :: 		delay_ms(380);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       219
	MOVWF       R12, 0
	MOVLW       255
	MOVWF       R13, 0
L_main23:
	DECFSZ      R13, 1, 1
	BRA         L_main23
	DECFSZ      R12, 1, 1
	BRA         L_main23
	DECFSZ      R11, 1, 1
	BRA         L_main23
;ProjectNew.c,136 :: 		}
L_main22:
;ProjectNew.c,138 :: 		}
	GOTO        L_main20
L_main21:
;ProjectNew.c,139 :: 		LCD_CMD(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProjectNew.c,142 :: 		while (menu==2){ //Puesto en Marcha
L_main24:
	MOVLW       0
	XORWF       _menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main123
	MOVLW       2
	XORWF       _menu+0, 0 
L__main123:
	BTFSS       STATUS+0, 2 
	GOTO        L_main25
;ProjectNew.c,145 :: 		while (pantalla==0){
L_main26:
	MOVLW       0
	XORWF       _pantalla+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main124
	MOVLW       0
	XORWF       _pantalla+0, 0 
L__main124:
	BTFSS       STATUS+0, 2 
	GOTO        L_main27
;ProjectNew.c,146 :: 		enco_s=enco*6;
	MOVF        _enco+0, 0 
	MOVWF       R0 
	MOVF        _enco+1, 0 
	MOVWF       R1 
	MOVLW       6
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       _enco_s+0 
	MOVF        R1, 0 
	MOVWF       _enco_s+1 
;ProjectNew.c,148 :: 		PORTD.B0 = 1;
	BSF         PORTD+0, 0 
;ProjectNew.c,149 :: 		LCD_OUT(1,1,"Vueltas");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_ProjectNew+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_ProjectNew+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProjectNew.c,151 :: 		vueltas=enco_s/12;
	MOVLW       12
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _enco_s+0, 0 
	MOVWF       R0 
	MOVF        _enco_s+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       _vueltas+0 
	MOVF        R1, 0 
	MOVWF       _vueltas+1 
;ProjectNew.c,152 :: 		IntToStr(vueltas,txt);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProjectNew.c,153 :: 		LCD_OUT(2,1,txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProjectNew.c,155 :: 		if(PORTD.B1){
	BTFSS       PORTD+0, 1 
	GOTO        L_main28
;ProjectNew.c,156 :: 		enco++;
	INFSNZ      _enco+0, 1 
	INCF        _enco+1, 1 
;ProjectNew.c,157 :: 		}
L_main28:
;ProjectNew.c,158 :: 		distancia= DSB-(-0.1048*ADC_READ(4)+72.774);
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
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       12
	MOVWF       R2 
	MOVLW       132
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _distancia+0 
	MOVF        R1, 0 
	MOVWF       _distancia+1 
;ProjectNew.c,161 :: 		if(distancia<=altura && distancia>3 && cajaP==0){
	MOVLW       128
	XORWF       _altura+1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main125
	MOVF        R0, 0 
	SUBWF       _altura+0, 0 
L__main125:
	BTFSS       STATUS+0, 0 
	GOTO        L_main31
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _distancia+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main126
	MOVF        _distancia+0, 0 
	SUBLW       3
L__main126:
	BTFSC       STATUS+0, 0 
	GOTO        L_main31
	MOVLW       0
	XORWF       _cajaP+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main127
	MOVLW       0
	XORWF       _cajaP+0, 0 
L__main127:
	BTFSS       STATUS+0, 2 
	GOTO        L_main31
L__main113:
;ProjectNew.c,162 :: 		cajaP=1;
	MOVLW       1
	MOVWF       _cajaP+0 
	MOVLW       0
	MOVWF       _cajaP+1 
;ProjectNew.c,163 :: 		conteoP++;
	INFSNZ      _conteoP+0, 1 
	INCF        _conteoP+1, 1 
;ProjectNew.c,164 :: 		cajaN=0;
	CLRF        _cajaN+0 
	CLRF        _cajaN+1 
;ProjectNew.c,165 :: 		}
L_main31:
;ProjectNew.c,167 :: 		if(distancia<=altura && distancia<=3 && cajaN==0){
	MOVLW       128
	XORWF       _altura+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _distancia+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main128
	MOVF        _distancia+0, 0 
	SUBWF       _altura+0, 0 
L__main128:
	BTFSS       STATUS+0, 0 
	GOTO        L_main34
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _distancia+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main129
	MOVF        _distancia+0, 0 
	SUBLW       3
L__main129:
	BTFSS       STATUS+0, 0 
	GOTO        L_main34
	MOVLW       0
	XORWF       _cajaN+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main130
	MOVLW       0
	XORWF       _cajaN+0, 0 
L__main130:
	BTFSS       STATUS+0, 2 
	GOTO        L_main34
L__main112:
;ProjectNew.c,168 :: 		cajaP=0;
	CLRF        _cajaP+0 
	CLRF        _cajaP+1 
;ProjectNew.c,169 :: 		cajaG=0;
	CLRF        _cajaG+0 
	CLRF        _cajaG+1 
;ProjectNew.c,170 :: 		cajaN=1;
	MOVLW       1
	MOVWF       _cajaN+0 
	MOVLW       0
	MOVWF       _cajaN+1 
;ProjectNew.c,172 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,173 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main35:
	DECFSZ      R13, 1, 1
	BRA         L_main35
	DECFSZ      R12, 1, 1
	BRA         L_main35
	NOP
	NOP
;ProjectNew.c,174 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,175 :: 		delay_ms(19);
	MOVLW       50
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_main36:
	DECFSZ      R13, 1, 1
	BRA         L_main36
	DECFSZ      R12, 1, 1
	BRA         L_main36
	NOP
;ProjectNew.c,176 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,177 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main37:
	DECFSZ      R13, 1, 1
	BRA         L_main37
	DECFSZ      R12, 1, 1
	BRA         L_main37
	NOP
	NOP
;ProjectNew.c,178 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,179 :: 		delay_ms(19);
	MOVLW       50
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_main38:
	DECFSZ      R13, 1, 1
	BRA         L_main38
	DECFSZ      R12, 1, 1
	BRA         L_main38
	NOP
;ProjectNew.c,180 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,181 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main39:
	DECFSZ      R13, 1, 1
	BRA         L_main39
	DECFSZ      R12, 1, 1
	BRA         L_main39
	NOP
	NOP
;ProjectNew.c,182 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,183 :: 		delay_ms(19);
	MOVLW       50
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_main40:
	DECFSZ      R13, 1, 1
	BRA         L_main40
	DECFSZ      R12, 1, 1
	BRA         L_main40
	NOP
;ProjectNew.c,184 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,185 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main41:
	DECFSZ      R13, 1, 1
	BRA         L_main41
	DECFSZ      R12, 1, 1
	BRA         L_main41
	NOP
	NOP
;ProjectNew.c,186 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,187 :: 		delay_ms(19);
	MOVLW       50
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_main42:
	DECFSZ      R13, 1, 1
	BRA         L_main42
	DECFSZ      R12, 1, 1
	BRA         L_main42
	NOP
;ProjectNew.c,188 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,189 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main43:
	DECFSZ      R13, 1, 1
	BRA         L_main43
	DECFSZ      R12, 1, 1
	BRA         L_main43
	NOP
	NOP
;ProjectNew.c,190 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,191 :: 		delay_ms(19);
	MOVLW       50
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_main44:
	DECFSZ      R13, 1, 1
	BRA         L_main44
	DECFSZ      R12, 1, 1
	BRA         L_main44
	NOP
;ProjectNew.c,192 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,193 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main45:
	DECFSZ      R13, 1, 1
	BRA         L_main45
	DECFSZ      R12, 1, 1
	BRA         L_main45
	NOP
	NOP
;ProjectNew.c,194 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,195 :: 		delay_ms(19);
	MOVLW       50
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_main46:
	DECFSZ      R13, 1, 1
	BRA         L_main46
	DECFSZ      R12, 1, 1
	BRA         L_main46
	NOP
;ProjectNew.c,196 :: 		}
L_main34:
;ProjectNew.c,198 :: 		if(distancia>altura && cajaG==0){
	MOVLW       128
	XORWF       _altura+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _distancia+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main131
	MOVF        _distancia+0, 0 
	SUBWF       _altura+0, 0 
L__main131:
	BTFSC       STATUS+0, 0 
	GOTO        L_main49
	MOVLW       0
	XORWF       _cajaG+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main132
	MOVLW       0
	XORWF       _cajaG+0, 0 
L__main132:
	BTFSS       STATUS+0, 2 
	GOTO        L_main49
L__main111:
;ProjectNew.c,199 :: 		cajaG=1;
	MOVLW       1
	MOVWF       _cajaG+0 
	MOVLW       0
	MOVWF       _cajaG+1 
;ProjectNew.c,200 :: 		cajaN=0;
	CLRF        _cajaN+0 
	CLRF        _cajaN+1 
;ProjectNew.c,201 :: 		conteoG++;
	INFSNZ      _conteoG+0, 1 
	INCF        _conteoG+1, 1 
;ProjectNew.c,203 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,204 :: 		delay_ms(2);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_main50:
	DECFSZ      R13, 1, 1
	BRA         L_main50
	DECFSZ      R12, 1, 1
	BRA         L_main50
	NOP
;ProjectNew.c,205 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,206 :: 		delay_ms(18);
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_main51:
	DECFSZ      R13, 1, 1
	BRA         L_main51
	DECFSZ      R12, 1, 1
	BRA         L_main51
	NOP
	NOP
;ProjectNew.c,207 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,208 :: 		delay_ms(2);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_main52:
	DECFSZ      R13, 1, 1
	BRA         L_main52
	DECFSZ      R12, 1, 1
	BRA         L_main52
	NOP
;ProjectNew.c,209 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,210 :: 		delay_ms(18);
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_main53:
	DECFSZ      R13, 1, 1
	BRA         L_main53
	DECFSZ      R12, 1, 1
	BRA         L_main53
	NOP
	NOP
;ProjectNew.c,211 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,212 :: 		delay_ms(2);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_main54:
	DECFSZ      R13, 1, 1
	BRA         L_main54
	DECFSZ      R12, 1, 1
	BRA         L_main54
	NOP
;ProjectNew.c,213 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,214 :: 		delay_ms(18);
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_main55:
	DECFSZ      R13, 1, 1
	BRA         L_main55
	DECFSZ      R12, 1, 1
	BRA         L_main55
	NOP
	NOP
;ProjectNew.c,215 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,216 :: 		delay_ms(2);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_main56:
	DECFSZ      R13, 1, 1
	BRA         L_main56
	DECFSZ      R12, 1, 1
	BRA         L_main56
	NOP
;ProjectNew.c,217 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,218 :: 		delay_ms(18);
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_main57:
	DECFSZ      R13, 1, 1
	BRA         L_main57
	DECFSZ      R12, 1, 1
	BRA         L_main57
	NOP
	NOP
;ProjectNew.c,219 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,220 :: 		delay_ms(2);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_main58:
	DECFSZ      R13, 1, 1
	BRA         L_main58
	DECFSZ      R12, 1, 1
	BRA         L_main58
	NOP
;ProjectNew.c,221 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,222 :: 		delay_ms(18);
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_main59:
	DECFSZ      R13, 1, 1
	BRA         L_main59
	DECFSZ      R12, 1, 1
	BRA         L_main59
	NOP
	NOP
;ProjectNew.c,223 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,224 :: 		delay_ms(2);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_main60:
	DECFSZ      R13, 1, 1
	BRA         L_main60
	DECFSZ      R12, 1, 1
	BRA         L_main60
	NOP
;ProjectNew.c,225 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,226 :: 		delay_ms(18);
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_main61:
	DECFSZ      R13, 1, 1
	BRA         L_main61
	DECFSZ      R12, 1, 1
	BRA         L_main61
	NOP
	NOP
;ProjectNew.c,227 :: 		}
L_main49:
;ProjectNew.c,229 :: 		if(PORTA.B4){
	BTFSS       PORTA+0, 4 
	GOTO        L_main62
;ProjectNew.c,230 :: 		pantalla=1;
	MOVLW       1
	MOVWF       _pantalla+0 
	MOVLW       0
	MOVWF       _pantalla+1 
;ProjectNew.c,231 :: 		delay_ms(380);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       219
	MOVWF       R12, 0
	MOVLW       255
	MOVWF       R13, 0
L_main63:
	DECFSZ      R13, 1, 1
	BRA         L_main63
	DECFSZ      R12, 1, 1
	BRA         L_main63
	DECFSZ      R11, 1, 1
	BRA         L_main63
;ProjectNew.c,232 :: 		}
L_main62:
;ProjectNew.c,234 :: 		if(PORTA.B0){
	BTFSS       PORTA+0, 0 
	GOTO        L_main64
;ProjectNew.c,236 :: 		PORTC.B2=0;
	BCF         PORTC+0, 2 
;ProjectNew.c,237 :: 		menu=0;
	CLRF        _menu+0 
	CLRF        _menu+1 
;ProjectNew.c,238 :: 		altura=0;
	CLRF        _altura+0 
	CLRF        _altura+1 
;ProjectNew.c,239 :: 		velocidad=0;
	CLRF        _velocidad+0 
	CLRF        _velocidad+1 
;ProjectNew.c,240 :: 		velocidad_M=0;
	CLRF        _velocidad_M+0 
	CLRF        _velocidad_M+1 
;ProjectNew.c,241 :: 		conteoP=0;
	CLRF        _conteoP+0 
	CLRF        _conteoP+1 
;ProjectNew.c,242 :: 		conteoG=0;
	CLRF        _conteoG+0 
	CLRF        _conteoG+1 
;ProjectNew.c,243 :: 		enco=0;
	CLRF        _enco+0 
	CLRF        _enco+1 
;ProjectNew.c,244 :: 		vueltas=0;
	CLRF        _vueltas+0 
	CLRF        _vueltas+1 
;ProjectNew.c,245 :: 		pantalla=10;
	MOVLW       10
	MOVWF       _pantalla+0 
	MOVLW       0
	MOVWF       _pantalla+1 
;ProjectNew.c,246 :: 		delay_ms(380);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       219
	MOVWF       R12, 0
	MOVLW       255
	MOVWF       R13, 0
L_main65:
	DECFSZ      R13, 1, 1
	BRA         L_main65
	DECFSZ      R12, 1, 1
	BRA         L_main65
	DECFSZ      R11, 1, 1
	BRA         L_main65
;ProjectNew.c,247 :: 		}
L_main64:
;ProjectNew.c,249 :: 		delay_ms(1300);
	MOVLW       14
	MOVWF       R11, 0
	MOVLW       49
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_main66:
	DECFSZ      R13, 1, 1
	BRA         L_main66
	DECFSZ      R12, 1, 1
	BRA         L_main66
	DECFSZ      R11, 1, 1
	BRA         L_main66
	NOP
;ProjectNew.c,250 :: 		}
	GOTO        L_main26
L_main27:
;ProjectNew.c,251 :: 		LCD_CMD(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProjectNew.c,253 :: 		while (pantalla==1){
L_main67:
	MOVLW       0
	XORWF       _pantalla+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main133
	MOVLW       1
	XORWF       _pantalla+0, 0 
L__main133:
	BTFSS       STATUS+0, 2 
	GOTO        L_main68
;ProjectNew.c,254 :: 		PORTD.B0 = 1;
	BSF         PORTD+0, 0 
;ProjectNew.c,256 :: 		LCD_OUT(1,1,"Altos: ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_ProjectNew+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_ProjectNew+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProjectNew.c,257 :: 		IntToStr(conteoG,txt);
	MOVF        _conteoG+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _conteoG+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProjectNew.c,258 :: 		LCD_OUT_CP(txt);
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;ProjectNew.c,260 :: 		LCD_OUT(2,1,"Bajos: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_ProjectNew+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_ProjectNew+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ProjectNew.c,261 :: 		IntToStr(conteoP,txt);
	MOVF        _conteoP+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _conteoP+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;ProjectNew.c,262 :: 		LCD_OUT_CP(txt);
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;ProjectNew.c,264 :: 		if(PORTD.B1){
	BTFSS       PORTD+0, 1 
	GOTO        L_main69
;ProjectNew.c,265 :: 		enco++;
	INFSNZ      _enco+0, 1 
	INCF        _enco+1, 1 
;ProjectNew.c,266 :: 		}
L_main69:
;ProjectNew.c,268 :: 		distancia= DSB-(-0.1048*ADC_READ(4)+72.774);
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
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       12
	MOVWF       R2 
	MOVLW       132
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _distancia+0 
	MOVF        R1, 0 
	MOVWF       _distancia+1 
;ProjectNew.c,270 :: 		if(distancia<=altura && distancia>3 && cajaP==0){
	MOVLW       128
	XORWF       _altura+1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main134
	MOVF        R0, 0 
	SUBWF       _altura+0, 0 
L__main134:
	BTFSS       STATUS+0, 0 
	GOTO        L_main72
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _distancia+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main135
	MOVF        _distancia+0, 0 
	SUBLW       3
L__main135:
	BTFSC       STATUS+0, 0 
	GOTO        L_main72
	MOVLW       0
	XORWF       _cajaP+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main136
	MOVLW       0
	XORWF       _cajaP+0, 0 
L__main136:
	BTFSS       STATUS+0, 2 
	GOTO        L_main72
L__main110:
;ProjectNew.c,271 :: 		cajaP=1;
	MOVLW       1
	MOVWF       _cajaP+0 
	MOVLW       0
	MOVWF       _cajaP+1 
;ProjectNew.c,272 :: 		cajaN=0;
	CLRF        _cajaN+0 
	CLRF        _cajaN+1 
;ProjectNew.c,273 :: 		conteoP++;
	INFSNZ      _conteoP+0, 1 
	INCF        _conteoP+1, 1 
;ProjectNew.c,274 :: 		}
L_main72:
;ProjectNew.c,276 :: 		if(distancia<=altura && distancia<=3 && cajaN==0){
	MOVLW       128
	XORWF       _altura+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _distancia+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main137
	MOVF        _distancia+0, 0 
	SUBWF       _altura+0, 0 
L__main137:
	BTFSS       STATUS+0, 0 
	GOTO        L_main75
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _distancia+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main138
	MOVF        _distancia+0, 0 
	SUBLW       3
L__main138:
	BTFSS       STATUS+0, 0 
	GOTO        L_main75
	MOVLW       0
	XORWF       _cajaN+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main139
	MOVLW       0
	XORWF       _cajaN+0, 0 
L__main139:
	BTFSS       STATUS+0, 2 
	GOTO        L_main75
L__main109:
;ProjectNew.c,277 :: 		cajaP=0;
	CLRF        _cajaP+0 
	CLRF        _cajaP+1 
;ProjectNew.c,278 :: 		cajaG=0;
	CLRF        _cajaG+0 
	CLRF        _cajaG+1 
;ProjectNew.c,279 :: 		cajaN=1;
	MOVLW       1
	MOVWF       _cajaN+0 
	MOVLW       0
	MOVWF       _cajaN+1 
;ProjectNew.c,281 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,282 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main76:
	DECFSZ      R13, 1, 1
	BRA         L_main76
	DECFSZ      R12, 1, 1
	BRA         L_main76
	NOP
	NOP
;ProjectNew.c,283 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,284 :: 		delay_ms(19);
	MOVLW       50
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_main77:
	DECFSZ      R13, 1, 1
	BRA         L_main77
	DECFSZ      R12, 1, 1
	BRA         L_main77
	NOP
;ProjectNew.c,285 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,286 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main78:
	DECFSZ      R13, 1, 1
	BRA         L_main78
	DECFSZ      R12, 1, 1
	BRA         L_main78
	NOP
	NOP
;ProjectNew.c,287 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,288 :: 		delay_ms(19);
	MOVLW       50
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_main79:
	DECFSZ      R13, 1, 1
	BRA         L_main79
	DECFSZ      R12, 1, 1
	BRA         L_main79
	NOP
;ProjectNew.c,289 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,290 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main80:
	DECFSZ      R13, 1, 1
	BRA         L_main80
	DECFSZ      R12, 1, 1
	BRA         L_main80
	NOP
	NOP
;ProjectNew.c,291 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,292 :: 		delay_ms(19);
	MOVLW       50
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_main81:
	DECFSZ      R13, 1, 1
	BRA         L_main81
	DECFSZ      R12, 1, 1
	BRA         L_main81
	NOP
;ProjectNew.c,293 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,294 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main82:
	DECFSZ      R13, 1, 1
	BRA         L_main82
	DECFSZ      R12, 1, 1
	BRA         L_main82
	NOP
	NOP
;ProjectNew.c,295 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,296 :: 		delay_ms(19);
	MOVLW       50
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_main83:
	DECFSZ      R13, 1, 1
	BRA         L_main83
	DECFSZ      R12, 1, 1
	BRA         L_main83
	NOP
;ProjectNew.c,297 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,298 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main84:
	DECFSZ      R13, 1, 1
	BRA         L_main84
	DECFSZ      R12, 1, 1
	BRA         L_main84
	NOP
	NOP
;ProjectNew.c,299 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,300 :: 		delay_ms(19);
	MOVLW       50
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_main85:
	DECFSZ      R13, 1, 1
	BRA         L_main85
	DECFSZ      R12, 1, 1
	BRA         L_main85
	NOP
;ProjectNew.c,301 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,302 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main86:
	DECFSZ      R13, 1, 1
	BRA         L_main86
	DECFSZ      R12, 1, 1
	BRA         L_main86
	NOP
	NOP
;ProjectNew.c,303 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,304 :: 		delay_ms(19);
	MOVLW       50
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_main87:
	DECFSZ      R13, 1, 1
	BRA         L_main87
	DECFSZ      R12, 1, 1
	BRA         L_main87
	NOP
;ProjectNew.c,305 :: 		}
L_main75:
;ProjectNew.c,307 :: 		if(distancia>altura && cajaG==0){
	MOVLW       128
	XORWF       _altura+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _distancia+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main140
	MOVF        _distancia+0, 0 
	SUBWF       _altura+0, 0 
L__main140:
	BTFSC       STATUS+0, 0 
	GOTO        L_main90
	MOVLW       0
	XORWF       _cajaG+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main141
	MOVLW       0
	XORWF       _cajaG+0, 0 
L__main141:
	BTFSS       STATUS+0, 2 
	GOTO        L_main90
L__main108:
;ProjectNew.c,308 :: 		cajaG=1;
	MOVLW       1
	MOVWF       _cajaG+0 
	MOVLW       0
	MOVWF       _cajaG+1 
;ProjectNew.c,309 :: 		cajaN=0;
	CLRF        _cajaN+0 
	CLRF        _cajaN+1 
;ProjectNew.c,310 :: 		conteoG++;
	INFSNZ      _conteoG+0, 1 
	INCF        _conteoG+1, 1 
;ProjectNew.c,312 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,313 :: 		delay_ms(2);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_main91:
	DECFSZ      R13, 1, 1
	BRA         L_main91
	DECFSZ      R12, 1, 1
	BRA         L_main91
	NOP
;ProjectNew.c,314 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,315 :: 		delay_ms(18);
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_main92:
	DECFSZ      R13, 1, 1
	BRA         L_main92
	DECFSZ      R12, 1, 1
	BRA         L_main92
	NOP
	NOP
;ProjectNew.c,316 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,317 :: 		delay_ms(2);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_main93:
	DECFSZ      R13, 1, 1
	BRA         L_main93
	DECFSZ      R12, 1, 1
	BRA         L_main93
	NOP
;ProjectNew.c,318 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,319 :: 		delay_ms(18);
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_main94:
	DECFSZ      R13, 1, 1
	BRA         L_main94
	DECFSZ      R12, 1, 1
	BRA         L_main94
	NOP
	NOP
;ProjectNew.c,320 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,321 :: 		delay_ms(2);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_main95:
	DECFSZ      R13, 1, 1
	BRA         L_main95
	DECFSZ      R12, 1, 1
	BRA         L_main95
	NOP
;ProjectNew.c,322 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,323 :: 		delay_ms(18);
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_main96:
	DECFSZ      R13, 1, 1
	BRA         L_main96
	DECFSZ      R12, 1, 1
	BRA         L_main96
	NOP
	NOP
;ProjectNew.c,324 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,325 :: 		delay_ms(2);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_main97:
	DECFSZ      R13, 1, 1
	BRA         L_main97
	DECFSZ      R12, 1, 1
	BRA         L_main97
	NOP
;ProjectNew.c,326 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,327 :: 		delay_ms(18);
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_main98:
	DECFSZ      R13, 1, 1
	BRA         L_main98
	DECFSZ      R12, 1, 1
	BRA         L_main98
	NOP
	NOP
;ProjectNew.c,328 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,329 :: 		delay_ms(2);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_main99:
	DECFSZ      R13, 1, 1
	BRA         L_main99
	DECFSZ      R12, 1, 1
	BRA         L_main99
	NOP
;ProjectNew.c,330 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,331 :: 		delay_ms(18);
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_main100:
	DECFSZ      R13, 1, 1
	BRA         L_main100
	DECFSZ      R12, 1, 1
	BRA         L_main100
	NOP
	NOP
;ProjectNew.c,332 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;ProjectNew.c,333 :: 		delay_ms(2);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_main101:
	DECFSZ      R13, 1, 1
	BRA         L_main101
	DECFSZ      R12, 1, 1
	BRA         L_main101
	NOP
;ProjectNew.c,334 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;ProjectNew.c,335 :: 		delay_ms(18);
	MOVLW       47
	MOVWF       R12, 0
	MOVLW       191
	MOVWF       R13, 0
L_main102:
	DECFSZ      R13, 1, 1
	BRA         L_main102
	DECFSZ      R12, 1, 1
	BRA         L_main102
	NOP
	NOP
;ProjectNew.c,336 :: 		}
L_main90:
;ProjectNew.c,338 :: 		if(PORTA.B4){
	BTFSS       PORTA+0, 4 
	GOTO        L_main103
;ProjectNew.c,339 :: 		pantalla=0;
	CLRF        _pantalla+0 
	CLRF        _pantalla+1 
;ProjectNew.c,340 :: 		delay_ms(380);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       219
	MOVWF       R12, 0
	MOVLW       255
	MOVWF       R13, 0
L_main104:
	DECFSZ      R13, 1, 1
	BRA         L_main104
	DECFSZ      R12, 1, 1
	BRA         L_main104
	DECFSZ      R11, 1, 1
	BRA         L_main104
;ProjectNew.c,341 :: 		}
L_main103:
;ProjectNew.c,343 :: 		if(PORTA.B0){
	BTFSS       PORTA+0, 0 
	GOTO        L_main105
;ProjectNew.c,344 :: 		menu=0;
	CLRF        _menu+0 
	CLRF        _menu+1 
;ProjectNew.c,345 :: 		altura=0;
	CLRF        _altura+0 
	CLRF        _altura+1 
;ProjectNew.c,346 :: 		velocidad=0;
	CLRF        _velocidad+0 
	CLRF        _velocidad+1 
;ProjectNew.c,347 :: 		velocidad_M=0;
	CLRF        _velocidad_M+0 
	CLRF        _velocidad_M+1 
;ProjectNew.c,348 :: 		conteoP=0;
	CLRF        _conteoP+0 
	CLRF        _conteoP+1 
;ProjectNew.c,349 :: 		conteoG=0;
	CLRF        _conteoG+0 
	CLRF        _conteoG+1 
;ProjectNew.c,350 :: 		enco=0;
	CLRF        _enco+0 
	CLRF        _enco+1 
;ProjectNew.c,351 :: 		vueltas=0;
	CLRF        _vueltas+0 
	CLRF        _vueltas+1 
;ProjectNew.c,352 :: 		pantalla=10;
	MOVLW       10
	MOVWF       _pantalla+0 
	MOVLW       0
	MOVWF       _pantalla+1 
;ProjectNew.c,353 :: 		delay_ms(380);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       219
	MOVWF       R12, 0
	MOVLW       255
	MOVWF       R13, 0
L_main106:
	DECFSZ      R13, 1, 1
	BRA         L_main106
	DECFSZ      R12, 1, 1
	BRA         L_main106
	DECFSZ      R11, 1, 1
	BRA         L_main106
;ProjectNew.c,354 :: 		}
L_main105:
;ProjectNew.c,356 :: 		delay_ms(1300);
	MOVLW       14
	MOVWF       R11, 0
	MOVLW       49
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_main107:
	DECFSZ      R13, 1, 1
	BRA         L_main107
	DECFSZ      R12, 1, 1
	BRA         L_main107
	DECFSZ      R11, 1, 1
	BRA         L_main107
	NOP
;ProjectNew.c,357 :: 		}
	GOTO        L_main67
L_main68:
;ProjectNew.c,358 :: 		LCD_CMD(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProjectNew.c,360 :: 		}
	GOTO        L_main24
L_main25:
;ProjectNew.c,361 :: 		LCD_CMD(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ProjectNew.c,362 :: 		}
	GOTO        L_main12
;ProjectNew.c,363 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
