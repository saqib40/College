public class practice {
    public static void main(String[] args) {
        int a = 5;
        int b = 2;
        float d = a/b; // implicit TC aka Widening Casting
        System.out.println(d);
        float c = (float)a/b; // type promotion
        System.out.println(c);
    }
}
