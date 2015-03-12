/* Created by: Dawn Christine P. Corpuz
    CIE150 HW2
*/
    import processing.serial.*;

Serial myPort;
int val, val1, val2;

void setup()
{
  size(400,300);
  String portName= Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
  textFont(createFont("Calibri", 100));
  textAlign(CENTER);
} 

void draw()
{
  if ( myPort.available() > 6) {  // If data is available,
  if ( myPort.read() == 0xaa) {
    val1 =  (myPort.read()<< 2) | (myPort.read()) ;
  }
  else if ( myPort.read() == 0xbb) {
    val2    =  (myPort.read() << 2) | (myPort.read()) ;
  }
    myPort.clear();
  }
  background(240);          
  
      val = val2*2 + val1;
  fill(0, 120, 130);
  text(val1 + " " + val2, 170, 120);
  
  fill(0, 150, 150);  
  if (val == 0){
      text("Down",170,210);
  }
  else if( val==1){
      text("Left",170,210);
  }
  else if(val == 2){
      text("Right",170,210);
  }
  else if(val ==3){
      text("Up",170,210);
  }

}

/*Arduino Code

int gnd = 10;
int vcc = 11;
void setup() {                
  pinMode(8, INPUT);   //pin B
  pinMode(9, INPUT);   //pin A
  pinMode(10,OUTPUT);  //pin gnd
  pinMode(11,OUTPUT);  //pin Vcc 
  delay(100);
  digitalWrite(10, LOW); //set to gnd
  digitalWrite(11, HIGH); //set to Vcc 
  Serial.begin(9600);   
}

void loop() {
  // first
  int val1= digitalRead(8);
  Serial.write(0xaa);
  Serial.write((val1 >> 2) & 0xff);
  Serial.write(digitalRead(8) & 0x3);
  // second
  int val2= digitalRead(9);
  Serial.write(0xbb);
  Serial.write((val2 >> 2) & 0xff);
  Serial.write(digitalRead(9) & 0x3);
 // delay(100);    
  
}

*/

