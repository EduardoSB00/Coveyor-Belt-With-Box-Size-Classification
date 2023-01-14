#line 1 "C:/Users/Usuario/Documents/Ongoing Classes/Microprocesadores/Proyecto - copia/ProjectNew.c"

sbit LCD_RS at LATB4_bit;
sbit LCD_EN at LATB5_bit;
sbit LCD_D7 at LATB3_bit;
sbit LCD_D6 at LATB2_bit;
sbit LCD_D5 at LATB1_bit;
sbit LCD_D4 at LATB0_bit;


sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB0_bit;




int setpoints (int setpoint, int spmax){
 if (PORTA.B3){
 setpoint = setpoint + 2;
 delay_ms(380);
 }
 if (PORTA.B4){
 setpoint = setpoint - 2;
 delay_ms(380);
 }
 if (setpoint > spmax){
 setpoint = 0;
 }
 if (setpoint < 0){
 setpoint = spmax;
 }
 return setpoint;
}

int setpoints1 (int setpoint, int spmax){
 if (PORTA.B3){
 setpoint = setpoint + 1;
 delay_ms(380);
 }
 if (PORTA.B4){
 setpoint = setpoint - 1;
 delay_ms(380);
 }
 if (setpoint > spmax){
 setpoint = 0;
 }
 if (setpoint < 0){
 setpoint = spmax;
 }
 return setpoint;
}


int menu=0;
int pantalla=0;

char txt[7];

int altura=0;
int distancia=0;
int distancia_anterior = 0;

int velocidad_M=0;
int velocidad=0;

int conteoP=0;
int conteoG=0;

int enco = 0;
int enco_s =0;
int vueltas=0;

int cajaP=0;
int cajaG=0;
int cajaN = 0;

const DSB=35;

void main() {





 TRISA = 0xff;
 ANSELA = 0;

 TRISC = 0;
 TRISD.B0 = 0;
 TRISD.B1 = 1;
 ANSELD.B1 = 0;

 LCD_INIT();
 ADC_INIT();


 LCD_CMD(_LCD_CURSOR_OFF);

while(1){



 while (menu==0){
 pantalla=0;
 PORTD.B0=0;

 LCD_OUT(1,1,"MENU PRINCIPAL");
 LCD_OUT(2,1,"A. B.");

 if(PORTA.B0){
 menu=1;
 delay_ms(380);
 }

 if(PORTA.B1){
 menu=2;
 delay_ms(380);
 }

 }
 LCD_CMD(_LCD_CLEAR);


 while (menu==1){
 LCD_OUT(1,1,"SET ALTURA");
 altura = setpoints1 (altura,20);
 IntToStr (altura,txt);
 LCD_OUT(2,1,txt);

 if(PORTA.B0){
 menu=0;
 delay_ms(380);
 }

 }
 LCD_CMD(_LCD_CLEAR);


 while (menu==2){


 while (pantalla==0){
 enco_s=enco*6;

 PORTD.B0 = 1;
 LCD_OUT(1,1,"Vueltas");

 vueltas=enco_s/12;
 IntToStr(vueltas,txt);
 LCD_OUT(2,1,txt);

 if(PORTD.B1){
 enco++;
 }
 distancia= DSB-(-0.1048*ADC_READ(4)+72.774);


 if(distancia<=altura && distancia>3 && cajaP==0){
 cajaP=1;
 conteoP++;
 cajaN=0;
 }

 if(distancia<=altura && distancia<=3 && cajaN==0){
 cajaP=0;
 cajaG=0;
 cajaN=1;

 PORTC.B0=1;
 delay_ms(1);
 PORTC.B0=0;
 delay_ms(19);
 PORTC.B0=1;
 delay_ms(1);
 PORTC.B0=0;
 delay_ms(19);
 PORTC.B0=1;
 delay_ms(1);
 PORTC.B0=0;
 delay_ms(19);
 PORTC.B0=1;
 delay_ms(1);
 PORTC.B0=0;
 delay_ms(19);
 PORTC.B0=1;
 delay_ms(1);
 PORTC.B0=0;
 delay_ms(19);
 PORTC.B0=1;
 delay_ms(1);
 PORTC.B0=0;
 delay_ms(19);
 }

 if(distancia>altura && cajaG==0){
 cajaG=1;
 cajaN=0;
 conteoG++;

 PORTC.B0=1;
 delay_ms(2);
 PORTC.B0=0;
 delay_ms(18);
 PORTC.B0=1;
 delay_ms(2);
 PORTC.B0=0;
 delay_ms(18);
 PORTC.B0=1;
 delay_ms(2);
 PORTC.B0=0;
 delay_ms(18);
 PORTC.B0=1;
 delay_ms(2);
 PORTC.B0=0;
 delay_ms(18);
 PORTC.B0=1;
 delay_ms(2);
 PORTC.B0=0;
 delay_ms(18);
 PORTC.B0=1;
 delay_ms(2);
 PORTC.B0=0;
 delay_ms(18);
 }

 if(PORTA.B4){
 pantalla=1;
 delay_ms(380);
 }

 if(PORTA.B0){

 PORTC.B2=0;
 menu=0;
 altura=0;
 velocidad=0;
 velocidad_M=0;
 conteoP=0;
 conteoG=0;
 enco=0;
 vueltas=0;
 pantalla=10;
 delay_ms(380);
 }

 delay_ms(1300);
 }
 LCD_CMD(_LCD_CLEAR);

 while (pantalla==1){
 PORTD.B0 = 1;

 LCD_OUT(1,1,"Altos: ");
 IntToStr(conteoG,txt);
 LCD_OUT_CP(txt);

 LCD_OUT(2,1,"Bajos: ");
 IntToStr(conteoP,txt);
 LCD_OUT_CP(txt);

 if(PORTD.B1){
 enco++;
 }

 distancia= DSB-(-0.1048*ADC_READ(4)+72.774);

 if(distancia<=altura && distancia>3 && cajaP==0){
 cajaP=1;
 cajaN=0;
 conteoP++;
 }

 if(distancia<=altura && distancia<=3 && cajaN==0){
 cajaP=0;
 cajaG=0;
 cajaN=1;

 PORTC.B0=1;
 delay_ms(1);
 PORTC.B0=0;
 delay_ms(19);
 PORTC.B0=1;
 delay_ms(1);
 PORTC.B0=0;
 delay_ms(19);
 PORTC.B0=1;
 delay_ms(1);
 PORTC.B0=0;
 delay_ms(19);
 PORTC.B0=1;
 delay_ms(1);
 PORTC.B0=0;
 delay_ms(19);
 PORTC.B0=1;
 delay_ms(1);
 PORTC.B0=0;
 delay_ms(19);
 PORTC.B0=1;
 delay_ms(1);
 PORTC.B0=0;
 delay_ms(19);
 }

 if(distancia>altura && cajaG==0){
 cajaG=1;
 cajaN=0;
 conteoG++;

 PORTC.B0=1;
 delay_ms(2);
 PORTC.B0=0;
 delay_ms(18);
 PORTC.B0=1;
 delay_ms(2);
 PORTC.B0=0;
 delay_ms(18);
 PORTC.B0=1;
 delay_ms(2);
 PORTC.B0=0;
 delay_ms(18);
 PORTC.B0=1;
 delay_ms(2);
 PORTC.B0=0;
 delay_ms(18);
 PORTC.B0=1;
 delay_ms(2);
 PORTC.B0=0;
 delay_ms(18);
 PORTC.B0=1;
 delay_ms(2);
 PORTC.B0=0;
 delay_ms(18);
 }

 if(PORTA.B4){
 pantalla=0;
 delay_ms(380);
 }

 if(PORTA.B0){
 menu=0;
 altura=0;
 velocidad=0;
 velocidad_M=0;
 conteoP=0;
 conteoG=0;
 enco=0;
 vueltas=0;
 pantalla=10;
 delay_ms(380);
 }

 delay_ms(1300);
 }
 LCD_CMD(_LCD_CLEAR);

 }
 LCD_CMD(_LCD_CLEAR);
 }
}
