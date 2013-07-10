import java.io.BufferedWriter;
import java.util.Collection;


public class Utils {
	
	static String attr(String s, String desc) {
		System.err.println("\t" + desc + " : " + s);
		return s;
	}
	
    public static String implode(Collection<String> c, String glueString){
        StringBuilder s = new StringBuilder();
        for( String ss : c ) {
            s.append(ss);
            s.append(glueString);
        }
        if (c.size() > 0) {
            s.deleteCharAt(s.length()-1);
        }
        return s.toString();
    }
	
    public static void toWriter (BufferedWriter writer, String text) {
        try {
            writer.write(text);
        }
        catch (java.io.IOException ex) {
            ex.printStackTrace();
        }
    }
}
