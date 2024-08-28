public class objClass {
    public static class MyClass {
        String name;
        MyClass(String a)
        {
            this.name = a;
        }
        @Override
        public String toString() // overriding the root class method
        {
            return "My String is : " + name;
        }
    }
    public static void main(String[] args) {
        MyClass myObj = new MyClass("Saqib");
        System.out.println(myObj.name);
        System.out.println(myObj.toString());
    }
}
