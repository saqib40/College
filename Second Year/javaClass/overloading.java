public class overloading {
    // to illustrate constructor overloading
    double width,height,depth;
    // now constructor functions which can be of any number cause there's method overloading in JAVA
    public overloading(double w, double h, double d)
    {
        width=w;
        height=h;
        depth=d;
    }
    //with no parameter
    public overloading() {
        width=height=depth=0;
    }
    //with one parameter
    public overloading(double len) {
        width=height=depth=len;
    }
    double volume() // it's a method not a constructor
    {
        return width*height*depth;
    }
    //Driver code
    public static void main(String[] args) {
        overloading myOverloading1 = new overloading(10,20,15);
        overloading myOverloading2 = new overloading();
        overloading myCube = new overloading(7);

        double myVol = myOverloading1.volume();
        System.out.println("Volume being of 1 as " + myVol);

        myVol = myOverloading2.volume();
        System.out.println("Volume being of 2 as " + myVol);

        myVol = myCube.volume();
        System.out.println("Volume being of cube as " + myVol);
    }
}