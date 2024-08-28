public class superExample {
    public static class Animal {
        Animal() {
            System.out.println("Hii this is a superclass constructor");
        }
        void eat() {
            System.out.println("Hii this is superclass method");
        }
        String name = "Superclass variable";
    }
    public static class Dog extends Animal {
        Dog() {
            super(); // calling superclass constructor, making sure Animal object is created before Dog obj
            System.out.println("Hii this is childclass constructor");
            System.out.println(super.name);
            super.eat();
        }
    }
    public static void main(String[] args) {
        Dog ginny = new Dog();
    }
}
