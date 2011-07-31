
void setup(){
 size(200,200);
  background(0); 
  colorMode(ARGB);
  
 Panel p = new Panel();
               
		Font f;
		String osname = System.getProperty("os.name","");
		if (!osname.startsWith("Windows")) {
			f = new Font("Arial",Font.BOLD,9);
		} else {
			f = new Font("Verdana",Font.BOLD,9);
		}
		p.setFont(f);
		p.add(new Button("open"));

		Color transparent = new Color (0, 0, 0, 0);   
		p.setBackground(transparent);
		
		add("North",p);


}

void draw(){
 background(0); 
  
}




		
	
	public boolean action(Event evt, Object arg) {
		if (arg.equals("open")) {
			System.out.println("OPEN CLICKED");
			
			int arrlen = 10000;
			byte[] infile = new byte[arrlen];
			Frame parent = new Frame();
			FileDialog fd = new FileDialog(parent, "Please choose a file:",
			    FileDialog.LOAD);
			fd.show();
			String selectedItem = fd.getFile();
			if (selectedItem == null) {
				// no file selected
			} else {
				File ffile = new File( fd.getDirectory() + File.separator +
				                     fd.getFile());
				// read the file
				System.out.println("reading file " + fd.getDirectory() +
				                        File.separator + fd.getFile() );
				try {
					FileInputStream fis = new FileInputStream(ffile); 
					BufferedInputStream bis = new BufferedInputStream(fis);
					DataInputStream dis = new DataInputStream(bis);
					try {
						int filelength = dis.read(infile);
						String filestring = new String(infile, 0,
						                           filelength);
						System.out.println("FILE CONTENT=" + filestring);
					} catch(IOException iox) {
						System.out.println("File read error...");
						iox.printStackTrace();
					}
				} catch (FileNotFoundException fnf) {
					System.out.println("File not found...");
					fnf.printStackTrace();
				}
			}		
			
		} else return false;
		return true;
	}

