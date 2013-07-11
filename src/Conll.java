import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;


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
    
    public void addToken(ConllToken ct) {
    	assert(ct.id == getSize());
    	document.add(ct);
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
    
}
