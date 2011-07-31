import processing.opengl.*;
import pitaru.sonia_v2_9.*;
import JMyron.*;

int w = 96;
int h = 72;

int count = 500;
int step = 13;

PImage src;
Sample sam;
JMyron c;
int[] obraz;

int num = 2;
byte[] buffer;
int[] tmp;
int index;
float amplitude;
double sample, sample2;

String name = "jaSpic.mov";

void setup(){
	size(w,h,OPENGL);
	frameRate(25);

	frame.setTitle("diode ReaDer by kof");
	cursor(CROSS);

	c = new JMyron();
	c.start(w,h);
	c.findGlobs(0);

	num = w*h;
	buffer = new byte[num];
	println(num);

	System.arraycopy(waveHeader, 0, buffer, 0, waveHeader.length);
	amplitude = 80;

	src = new PImage(w,h);
	tmp = new int[w*h];

	Sonia.start(this,44100);
	sam = new Sample(w*h);
	sam.play();
	sam.repeat();

	println("");
	println("READY TO GO!");
}

void draw(){
	
	src.pixels = imag();
	
	for(index=0;index<num-waveHeader.length;index++) {
		sample = brightness(color(src.pixels[index]));
		if (sample < 0) sample = 255 - (sample * -1);
		buffer[waveHeader.length+index] = (byte)(sample);
	}
	geraWave2();
}

int[] imag(){
	c.update();
	tmp = c.image();
	return tmp;
}

void geraWave(int _fram){
	saveBytes("out/listenTheFotography_"+_fram+".wav", buffer);
	println(_fram+" done!");
}

void geraWave2(){
	for(int i = 0;i<buffer.length;i++){
		sam = buffer;
	}
}

void movieEvent(Movie m) {
	m.read();
}

static byte waveHeader[] = {
                                   (byte)0x52, (byte)0x49, (byte)0x46, (byte)0x46, (byte)0x8a, (byte)0x00, (byte)0x00, (byte)0x00, (byte)0x57,
                                   (byte)0x41, (byte)0x56, (byte)0x45, (byte)0x66, (byte)0x6d, (byte)0x74, (byte)0x20, (byte)0x10, (byte)0x00,
                                   (byte)0x00, (byte)0x00, (byte)0x01, (byte)0x00, (byte)0x01, (byte)0x00, (byte)0x44, (byte)0xac, (byte)0x00,
                                   (byte)0x00, (byte)0x88, (byte)0x58, (byte)0x01, (byte)0x00, (byte)0x02, (byte)0x00, (byte)0x10, (byte)0x00,
                                   (byte)0x64, (byte)0x61, (byte)0x74, (byte)0x61, (byte)0x8A, (byte)0x58, (byte)0x01, (byte)0x00
                           };
