import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale.Category;


class Conll {
	private List<ConllToken> document;
	
	Conll() {
		document = new ArrayList<ConllToken>();
	}
	
	public int getSize() {
		return document.size();
	}
	
	public ConllToken getToken(int index) {
		return document.get(index);
	}
	
    public void readConll(String fileName) throws NumberFormatException, IOException {
    	BufferedReader conll_in = new BufferedReader(new InputStreamReader(new FileInputStream(fileName), "UTF8"));
        String s;
        int sent_id = -1;
        int token_id = -1;        
        
        while ((s = conll_in.readLine()) != null)  {
            if (s.trim().length() > 0) {
                String[] fields = s.split("\t");
                
                String word = fields[1];
                String lemma = fields[2];
                String full_tag = fields[4];	
                int position = Integer.parseInt(fields[0]);
                
                if (position == 1) {
                	sent_id++;
                }
                token_id++;
                
                ConllToken token = new ConllToken(this, token_id, sent_id, fields);
                if (position == 1) token.setSentStart();
                document.add(token);
            }
            
        }
        conll_in.close();
	}
    
    public void readNeAnnotation(String fileName) throws NumberFormatException, IOException {
    	BufferedReader conll_in = new BufferedReader(new InputStreamReader(new FileInputStream(fileName), "UTF8"));
        String s;
        int sent_id = -1;
        int token_id = -1;        
        boolean sent_start = true;
        while ((s = conll_in.readLine()) != null)  {
            if (s.trim().length() > 0) {
                String[] fields = s.split("\t");
                
                String word = fields[0];
                String lemma = fields[2];
                String full_tag = fields[3];	
                String category = fields[4];
                
                
                if (category.equals("LAIKS")) category = "time";
                else if (category.equals("PRODUKTI")) category = "product";
                else if (category.equals("PERSONA")) category = "person";
                else if (category.equals("ORGANIZACIJA")) category = "organization";
                else if (category.equals("CITI")) category = "other";
                else if (category.equals("LOKACIJA")) category = "location";
                else if (category.equals("PRODUKTI")) category = "product";
                else if (category.equals("NOTIKUMS")) category = "event";
                else if (category.equals("O"));
                else System.err.println("Unnsupported category: " + category);
                
                
                if (word.equals("<g/>")) continue;
                
                if (word.equals("<p/>")) {
                	sent_id++;
                	sent_start = true;
                	continue;
                }
                token_id++;
                
                ConllToken token = new ConllToken(this, token_id, sent_id, word, category);
                token.category = category;
                if (sent_start)  {
                	token.setSentStart();
                	sent_start = false;
                }
                document.add(token);
                if (full_tag.equals("zs")) {
                	sent_id++;
                	sent_start = true;
                }
            }
            
        }
        conll_in.close();
        
        setMarkableBorders();
	}
    
    public void setMarkableBorders() {
    	String lastCategory = "O";
    	for (int i = 0; i < getSize(); i++) {
    		ConllToken t = getToken(i);
    		if (i-1 >= 0 && !lastCategory.equals("O") && !t.category.equals(lastCategory)) getToken(i-1).cat_end = true;
    		if (t.sent_start) lastCategory = "O";
    		if (!t.category.equals(lastCategory) && !t.category.equals("O")) {
    			t.cat_start = true;
    		}
    		lastCategory = t.category;
    	}
    	if (getSize() > 0 && !getToken(getSize()-1).category.equals("O")) {
    		getToken(getSize()-1).cat_end = true;
    	}
    }
    

    /**
     * Pieņem, ka atzīmē tikai ārējo lielāko entītiju un tās savā starpā daļēji 
     * nepārklājas un pēdējais frāzes vārds nav citas frāzes sastāvdaļa
     * 
     * @param startIndex
     * @param endIndex
     * @param category
     */
    public void setMention(int startIndex, int endIndex, String category) {
    	if (!getToken(endIndex).defaultCategory()) return;
    	for (int i = startIndex; i <= endIndex; i++) {
    		ConllToken ct = getToken(i);
    		ct.category = category;
    		ct.cat_start = false;
    		ct.cat_end = false;    		
    	}
    	getToken(startIndex).cat_start = true;
    	getToken(endIndex).cat_end = true;
    }
    
    
    public String getMarkable(int startIndex, int endIndex) {
    	String res = "";
    	for (int i = startIndex; i <= endIndex; i++) {
    		ConllToken ct = getToken(i);
    		res += ct.word + " ";
    	}
    	return res;
    }
}
