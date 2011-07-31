import java.awt.AWTException;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.MenuItem;
import java.awt.PopupMenu;
import java.awt.SystemTray;
import java.awt.TrayIcon;
import java.awt.TrayIcon.MessageType;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.awt.image.BufferedImage;

void setup(){
        size(100,100);
      
          
        
        // otestujeme si podporu
        if (SystemTray.isSupported()) {
            // rekneme si o instanci SystemTray
            SystemTray tray = SystemTray.getSystemTray();
            
            // obrazek na ikonku, pro jednoduchost vytvoreny v pameti
            final BufferedImage image = new BufferedImage(32, 32,
                    BufferedImage.TYPE_3BYTE_BGR);
            final Graphics2D graphics = image.createGraphics();
            
            // jednoduche menu
            PopupMenu menu = new PopupMenu();
            menu.add(new MenuItem("Black"));
            menu.add(new CheckboxMenuItem("Check"));
            menu.add(new MenuItem("-"));
            menu.add(new MenuItem("White"));
            menu.add(new MenuItem("Exit"));
            // vytvorime si ikonu
            final TrayIcon icon = new TrayIcon(image, "nápovìda", menu);
            
            // pridame listenery, at se neco deje..
            menu.addActionListener(new ActionListener() {
                // reakce na popup menu - zmena barvy a ukonceni aplikace
                public void actionPerformed(ActionEvent ev) {
                    System.out.println("PopupMenu.actionPerformed: " + ev);
                    if ("Black".equals(ev.getActionCommand())) {
                        setColor(image, graphics, icon, Color.BLACK);
                    } else if ("White".equals(ev.getActionCommand())) {
                        setColor(image, graphics, icon, Color.WHITE);
                    } else if ("Exit".equals(ev.getActionCommand())) {
                        System.out.println("KONEC");
                        System.exit(0);
                    }
                }
                
                private void setColor(final BufferedImage image,
                        final Graphics2D graphics, final TrayIcon icon,
                        final Color colora) {
                    
                    graphics.setColor(colora);
                    graphics.fillRect(0, 0, 31, 31);
                    icon.setImage(image);
                }
            });
            
            icon.addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent ev) {
                    System.out.println("TrayIcon.actionPerformed: " + ev);
                }
            });
            
            icon.addMouseListener(new MouseListener() {
                public void mouseClicked(MouseEvent ev) {
                    System.out.println("mouseClicked: " + ev);
                }
                
                // klinuti levym tlacitkem ukaze zpravu
                public void mousePressed(MouseEvent ev) {
                    System.out.println("mousePressed: " + ev);
                    if (ev.getButton() == MouseEvent.BUTTON1) {
                        icon.displayMessage("System", "rozpoznal uzivatele krystofa peska!",
                                MessageType.NONE); //warning,error,info
                    }
                }
                
                public void mouseReleased(MouseEvent ev) {
                    System.out.println("mouseReleased: " + ev);
                }
                
                public void mouseEntered(MouseEvent ev) {
                    System.out.println("mouseEntered: " + ev);
                }
                
                public void mouseExited(MouseEvent ev) {
                    System.out.println("mouseExited: " + ev);
                }
            });
            
            icon.addMouseMotionListener(new MouseMotionListener() {
                public void mouseDragged(MouseEvent ev) {
                    System.out.println("mouseDragged: " + ev);
                }
                
                public void mouseMoved(MouseEvent ev) {
                    System.out.println("mouseMoved: " + ev);
                }
            });
            
            try {
                // pridame ikonu na tray
                tray.add(icon);
            } catch (AWTException e) {
                System.out.println("Pridani se nepodarilo: " + e);
            }
        } else
            System.out.println("SystemTray neni podporovan");
    }
