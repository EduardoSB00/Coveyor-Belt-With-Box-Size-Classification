sbit LCD_RS at LATB4_bit;
sbit LCD_EN at LATB5_bit;
sbit LCD_D7 at LATB3_bit;
sbit LCD_D6 at LATB2_bit;
sbit LCD_D5 at LATB1_bit;
sbit LCD_D4 at LATB6_bit;


sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB6_bit;

int medicion=0;
char txt[7];

void main() {

LCD_INIT();
LCD_CMD(_LCD_CURSOR_OFF);

ADC_INIT();

while(1){

 medicion=-0.1048*ADC_READ(4)+72.774;
 IntToStr(medicion,txt);
 LCD_OUT(1,1,txt);

 }


}