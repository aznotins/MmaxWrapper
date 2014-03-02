import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class ConllToken {
	
	Conll conll;  
    int sent_id;
    int id;
    
    List<String> fields;
    
    int position;
    String word;
    String lemma;
    String tag;
    String fullTag;
    String morphoFeatures;
    Integer syntax;
    String dep;
    
    boolean sent_start;
    
    static final String default_category = "O";
    String category = default_category;
    boolean cat_start = false;
    boolean cat_end = false;
    
    List<Markable> mentionStart = new ArrayList<Markable>();
    List<Markable> mentionEnd = new ArrayList<Markable>();
    
    /**
     * 
     * @param _conll
     * @param _id
     * @param _sent_id
     * @param _fields
     */
    public ConllToken(Conll _conll, int _id, int _sent_id, String[] _fields) {
    	conll = _conll;
    	id = _id;
    	sent_id = _sent_id;
    	position = Integer.parseInt(_fields[0]);
    	word = _fields[1];
    	lemma = _fields[2];
    	tag = _fields[3];
    	fullTag = _fields[4];
    	morphoFeatures = _fields[5];
    	if (_fields.length > 6) syntax = Integer.parseInt(_fields[6]);
    	fields = new ArrayList(Arrays.asList(_fields));
    	if (_fields.length > 8) dep = _fields[7]; // from maltparser
    }
    
    /**
     * Simple format
     * @param _conll
     * @param _id
     * @param _sent_id
     * @param word
     * @param category
     */
    public ConllToken(Conll _conll, int _id, int _sent_id, String _word, String _category) {
    	conll = _conll;
    	id = _id;
    	sent_id = _sent_id;
    	fields = new ArrayList();
    	word = _word;
    	category = _category;
    }
    
    public ConllToken(Conll _conll, int _id) {
    	conll = _conll;
    	id = _id;
    	fields = new ArrayList<String>();
    }
    
    public void setSentStart() {
    	sent_start = true;
    }
    
    public void addField(String s) {
    	fields.add(s);
    }
    
    public String getField(int index) {
    	return fields.get(index);
    }
    
    public int getId() {
    	return id;
    }
   
    public int getSentId() {
    	return sent_id;
    }
    
    public boolean isSentStart() {
    	if (sent_start) return true;
    	return false;
    }
    
    public boolean isSentEnd() {
    	if (id == conll.getSize()-1 || conll.getToken(id+1).sent_id != sent_id) return true;
    	return false;
    }
    
    public boolean defaultCategory() {
    	if (category.equals(default_category)) return true;
    	return false;
    }
}
