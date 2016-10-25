import processing.serial.*; //<>//


Serial mySerialPort;       // Create object from Serial class
String serialPortData;     // Data received from the serial port

int time;                  // timer for synchronization of sensors
int wait = 5000;

int sensorsValues[] = {0, 0, 0, 0, 0, 0}; //values of sensors
int sensorsMinValues[] = {0,0,0,0,0,0};

int positionsX[] = { 10, 200, 400, 10,200, 400};
int positionsY[] = { 10, 10, 10, 200, 200, 2000};

int colours [] = {50, 70, 100, 150, 200, 250};

void setup() {
  size(600, 800);
  background(255);

  time = millis();

  mySerialPort = new Serial(this, Serial.list()[2], 9600);
  mySerialPort.bufferUntil('\n');  
}

void draw() {
  
  //println(sensorsMinValues);

  if (millis() - time >= wait) {
    for (int i = 0; i < 6; i++) {
      if (sensorsValues[i] < sensorsMinValues[i]) {
        
      }else{
      
      }
    }
  }
}

void serialEvent(Serial mySerialPort) {
  
  String inString = mySerialPort.readStringUntil('\n');
  
   if (inString != null) {
    
    inString = trim(inString); 
    
    int[] serialDataArduino = int(split(inString, ",")); 
    
    //println(serialDataArduino);
    
    if (serialDataArduino.length >=6) {
  
      for (int i = 0; i<6; i++) {
        sensorsValues[i] = serialDataArduino[i];
       }
       
       int j = 0;
       
       for (int i = 6; i<12; i++) {
        sensorsMinValues[j] = serialDataArduino[i];
        j += 1;
       }
    
       j = 0;
       
       println(sensorsMinValues);
   }
  }
}