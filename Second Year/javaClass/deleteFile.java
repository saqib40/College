import java.io.File;
public class deleteFile {
    public static void main(String[] args) {
        File fo = new File("myName.txt");
        if(fo.delete())
        {
            System.out.println(fo.getName()+"file is deleted successfully");
        }
        else
        {
            System.err.println("unexpected error occurred");
        }
    }
}
