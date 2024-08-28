import java.io.File;
public class fileInfo {
    public static void main(String[] args) {
        File Fo = new File("myName.txt");
        if (Fo.exists())
        {
            System.out.println("the absolute path of file is " + Fo.getAbsolutePath());
            System.out.println("Is file writable? " + Fo.canWrite());
            System.out.println("Is file readble? " + Fo.canRead());
            System.out.println("Size of file in bytes is " + Fo.length());
        }
        else
        {
            System.out.println("The file doesn't exist");
        }
    }
}
