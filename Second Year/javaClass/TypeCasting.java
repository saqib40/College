/*
 * So there are two types of typecastings in java, widening TC and narrow TC
 */

public class TypeCasting {
    public static void main(String[] args) {
        // widening TC
        int x = 4;
        double y = x;
        System.out.println(y);

        // narrow TC
        double myDouble = 9.78d;
        int myInt = (int) myDouble;
        System.out.println(myInt);
    }
}
