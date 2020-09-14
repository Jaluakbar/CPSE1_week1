#include "hwlib.hpp"

extern "C" void uart_put_char( char c ){
   hwlib::cout << c;
}

extern "C" char letter_case_conv( char c ){
   char diff = 'a' - 'A';
   if (c >= 'a' && c <= 'z'){
      return (c - diff);
   }else if (c >= 'A' && c <= 'Z'){
      return(c + diff);
   }else{
      return c;
   }
}

extern "C" void print_asciz( const char * s );


extern "C" void application();


int main( void ){	
   
   namespace target = hwlib::target;   
    
   // wait for the PC console to start
   hwlib::wait_ms(2000);

   application();
}