import java.io.FileWriter;
import java.io.IOException;
public class writeFile {
    public static void main(String[] args) {
        try {
            FileWriter Fw = new FileWriter("myName.txt");
            Fw.write("Hii what's up");
            Fw.close();
            System.out.println("Writeup successfull");
        } catch (IOException e) {
            System.err.println("Unexpected error");
            e.printStackTrace();
        }
    }
}
