PImage vorlage; 
PImage ergebnis;

void setup() {
 size(640, 480);
 vorlage = loadImage("blume.jpg"); // Lädt das Bild
 ergebnis = createImage(640,480,RGB);
 filter();
}

void draw() {
 image(ergebnis,0,0);
 image(vorlage,0,0,128,96); // zeigt das Bild an
}

void filter()
{
  vorlage.loadPixels();             // Lädt die Pixel des Bildes in das Pixelarray
  for (int i = 0; i < vorlage.pixels.length; i++) {
    color c = vorlage.pixels[i];
    // Ermittelt die r,g,b-Werte des Bildes
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    
    // Manipuliert die Werte
    g = 0; // Nimmt alle Grüntöne raus
    
    
    // Sorgt dafür dass die Werte zwischen 0 und 255 liegen
    r = constrain(r,0,255);
    g = constrain(g,0,255);
    b = constrain(b,0,255);
    
    // Erzeugt die neue Farbe
    color cneu = color(r,g,b);
    ergebnis.pixels[i] = cneu; 
  }
  ergebnis.updatePixels();
}
