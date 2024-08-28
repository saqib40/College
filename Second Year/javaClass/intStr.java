public class intStr {
    public static void main(String[] args) {
        // convert string to integer
        String myString = "50";
        System.out.println("The string value is: " + myString);
        int correspondingInt = Integer.parseInt(myString);
        System.out.println("The corresponding integer value is: " + correspondingInt);

        // convert integer to string
        int myInt = 50;
        System.out.println("The integer value is: " + myInt);
        String correspondString = String.valueOf(myInt);
        System.out.println("The corresponding string value is: " + correspondString);
    }
}