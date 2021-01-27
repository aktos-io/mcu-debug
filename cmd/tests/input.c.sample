
    palSetPad(GPIOA, GPIOA_LED_OUT); //// debugger 
    chThdSleepMilliseconds(1000); // debugger: printf "Passed 1 second?\n"


void adcReadCallback1(ADCDriver *adcp, adcsample_t *buffer, size_t n)
{
    (void) adcp;
    (void) n;
    for (uint8_t i = 0; i < ADC_CH_NUM; i++){
        // do something with buffer[i]
      buffer[i]; // debugger: hello world 1
      buffer[i]; //debugger: printf "Analog value: %i\n", buffer[0]
      buffer[i]; // debugger
      buffer[i]; // debugger:
      // debugger: hello world 2
  // debugger
//// debugger
      buffer[i]; //// debugger: skip me 
      buffer[i]; // debugger: print i 
      buffer[i]; // debugger:// print j 

    }
}
