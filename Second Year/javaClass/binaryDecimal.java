import java.util.ArrayList;

public class binaryDecimal {
    // binary to decimal
    public static int binary2Decimal(String myBinary)
    {
        int decimal = 0;
        int length = myBinary.length();
        for (int i = 0; i < length; i++) {
            // Get the digit (0 or 1) from the binary string
            int digit = Character.getNumericValue(myBinary.charAt(i));
            // Calculate the value of the digit at its position and add it to the total
            decimal += digit * Math.pow(2, length - 1 - i);
        }
        return decimal;
    }
    // decimal to binary
    public static int decimal2Binary(int myDecimal)
    {
        // consistent division algorithm
        ArrayList<Integer> myArray = new ArrayList<Integer>();
        while(myDecimal > 0)
        {
            int remainder = myDecimal%2;
            myArray.add(remainder);
            myDecimal /= 2;
        }
        // print from the end
        int n = myArray.size();
        for(int i=n-1; i>=0; i--)
        {
            System.out.print(myArray.get(i));
        }
        return 0;
    }
    public static void main(String[] args) {
        decimal2Binary(5);
    }
}
