import java.io.File;
import java.io.IOException;

public class createFile {
    public static void main(String[] args) {
        try {
            File Fo = new File("myName.txt");
            if(Fo.createNewFile())
            {
                System.out.println("File " + Fo.getName() + " is created successfully");
            }
            else
            {
                System.out.println("File already exists in the directory");
            }
        } catch (IOException e) {
            System.err.println("An unexpected error occured");
            e.printStackTrace();
        }
    } 
}
