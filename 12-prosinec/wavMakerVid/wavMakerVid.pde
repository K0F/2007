import processing.video.*;
import processing.opengl.*;
int count = 500;
int step = 13;
PImage src;
Movie mov;

int num = 2;
byte[] buffer;
int index;
float amplitude;
double sample, sample2;

String name = "jaSpic.mov";

void setup(){
	frameRate(1);
	mov = new Movie(this, name);
	size(45*3,36*3,OPENGL);
	num = 720*576;
	buffer = new byte[num];
	println(num);
	System.arraycopy(waveHeader, 0, buffer, 0, waveHeader.length);
	amplitude = 80;
	mov.play();
	src = new PImage(720,576);
}

void draw(){
	for(int frame = 0;frame < mov.duration()*25;frame++){
		image(mov,0,0,width,height);
		src = mov;
		src.loadPixels();
		src.updatePixels();
		
		for(index=0;index<num-waveHeader.length;index++) {			
			sample = brightness(color(src.pixels[index]));
			if (sample < 0) sample = 255 - (sample * -1);
			buffer[waveHeader.length+index] = (byte)(sample);			
		}
		
		geraWave(frame);
		
	}
	this.exit();
}

void geraWave(int _fram){
	saveBytes("out/listenTheFotography_"+_fram+".wav", buffer);
	println(_fram+" done!");
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
