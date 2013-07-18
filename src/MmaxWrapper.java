import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.lang3.StringEscapeUtils;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class MmaxWrapper {
	
	/**
	 * Arguments
	 */
	static String importConll = "";
	static String exportConll = "";
	
	static String mmaxPath = "";
	static String project = "";
	static String forNer = "";
	static String importWebNe = "";
	
	
	static String MMAX_STRING = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
			"<mmax_project>\n" +
			"<words>%s_words.xml</words>\n" +
			"<keyactions></keyactions>\n" +
			"<gestures></gestures>\n" +
			"</mmax_project>\n";
	
	static String WORDS_HEADER_STRING = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
			"<!DOCTYPE words SYSTEM \"words.dtd\">\n" +
			"<words>";
	
	static String MENTION_HEADER_STRING = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
			"<!DOCTYPE markables SYSTEM \"markables.dtd\">\n" +
			"<markables xmlns=\"www.eml.org/NameSpaces/coref\">\n";
	
	static String SENTENCE_HEADER_STRING = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
			"<!DOCTYPE markables SYSTEM \"markables.dtd\">\n" +
			"<markables xmlns=\"www.eml.org/NameSpaces/sentence\">\n";
	

    public void createProjectFile(String fileName) throws IOException{
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileName),"UTF-8"));
        writer.write(String.format(MMAX_STRING, project));
        writer.flush();
        writer.close();
    }
    
    public void exportWords(Conll conll, String fileName) throws IOException {
     	BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileName),"UTF-8"));
        Utils.toWriter(writer, WORDS_HEADER_STRING);
        for (int token_i = 0; token_i < conll.getSize(); token_i++) {
        	ConllToken token = conll.getToken(token_i);
        	String word = token.word;
        	Utils.toWriter(writer, "<word id=\"word_"+(token_i+1)+"\">"+StringEscapeUtils.escapeXml(word) + "</word>\n");
        }
        Utils.toWriter(writer, "</words>");
        writer.flush();
        writer.close();
    }
    
    public void exportMentions(Conll conll, String fileName) throws IOException {
     	BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileName),"UTF-8"));
        Utils.toWriter(writer, MENTION_HEADER_STRING);
        
        int intervalStart = 0;
        int intervalEnd = 0;
        int id = 0;
        for (int i = 0; i < conll.getSize(); i++) {
        	ConllToken t = conll.getToken(i);
        	if (t.cat_start) intervalStart = t.id;
        	if (t.cat_end) {
        		intervalEnd = t.id;
        		id++;
        		String span = "";
    			if (intervalStart == intervalEnd) span = "word_"+(intervalStart+1);
    			else span = "word_"+(intervalStart+1)+".."+"word_"+(intervalEnd+1);
    			String coref_class = "empty";
    			String category = t.category;
    			//System.out.println(category + "\t" + conll.getMarkable(intervalStart, intervalEnd));
    			Utils.toWriter(writer, "<markable id=\"markable_"+(id)+"\" span=\""+span+"\" coref_class=\""+coref_class+"\" category=\""+category+"\" mmax_level=\"coref\"  rule=\"none\"  type=\"none\"/>\n");
        	}
        }
        Utils.toWriter(writer, "</markables>");
        writer.flush();
        writer.close();
    }
    
    public void createMarkableLevel(String fileName) throws IOException {
     	BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileName),"UTF-8"));
        Utils.toWriter(writer, MENTION_HEADER_STRING);
        Utils.toWriter(writer, "</markables>");
        writer.flush();
        writer.close();
    }
    
    public void exportSentences(Conll conll, String fileName) throws IOException {
     	BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileName),"UTF-8"));
        Utils.toWriter(writer, SENTENCE_HEADER_STRING);
        
        int start = 0;
        int end;
        int sent_id = 0;
        for (int token_i = 0; token_i < conll.getSize(); token_i++) {
        	ConllToken token = conll.getToken(token_i);
        	if (token.isSentStart()) {
        		start = token.id+1;
        	}
        	if (token.isSentEnd()) {
        		end = token_i+1;
                sent_id++;
                String span = "word_"+start;
                if (end != start) span += "..word_"+end;
                start = end + 1;
                Utils.toWriter(writer, "<markable mmax_level=\"sentence\" id=\"markable_"+sent_id+"\" span=\""+span+"\" />\n");
        	}
        }
        Utils.toWriter(writer, "</markables>");
        writer.flush();
        writer.close();
    }
    
    
    public void exportTokens(Conll conll, String fileName) throws IOException {
    	BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileName),"UTF-8"));
    	for (int token_i = 0; token_i < conll.getSize(); token_i++) {
	    	ConllToken token = conll.getToken(token_i);
	    	if (token.isSentStart() && token.id != 0) {
	    		writer.write("\n");
	    	}
	    	writer.write(Utils.implode(token.fields, "\t") + "\n");
    	}
    	writer.flush();
    	writer.close();
    }
    
    
    public void exportForNer(Conll conll, String fileName) throws IOException {
    	BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileName),"UTF-8"));
    	String eol = System.getProperty("line.separator");        
        for (int token_i = 0; token_i < conll.getSize(); token_i++) {
        	StringBuilder s = new StringBuilder();
        	ConllToken ct = conll.getToken(token_i);
        	s.append(ct.position); s.append("\t");
            s.append(ct.word.replace(" ",  "_")); s.append("\t");
            s.append(ct.lemma.replace(" ",  "_")); s.append("\t");
            s.append(ct.tag); s.append("\t");
            s.append(ct.fullTag); s.append("\t");
            s.append(ct.morphoFeatures); s.append("\t");
            if (ct.category.equals("other")) {
            	s.append("O\t_\t_\t");
            } else {
            	s.append(ct.category); s.append("\t");
            	String ct_start = ct.cat_start?"START":"_";
                s.append(ct_start); s.append("\t");
                String ct_end = ct.cat_end?"END":"_";
                s.append(ct_end); s.append("\t");
            }
            s.append(ct.tag.charAt(0)); s.append("\t");
            s.append(eol);
            if (ct.isSentEnd()) s.append(eol);
            writer.write(s.toString());
    	}
    	writer.flush();
    	writer.close();
    }
    
    
    public void readWordLevel(Conll conll, String fileName) throws SAXException, IOException, ParserConfigurationException {
    	File mmax_file = new File(fileName);
        DocumentBuilder dBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();

        org.w3c.dom.Document doc = dBuilder.parse(mmax_file);
        NodeList markables = doc.getElementsByTagName("word");
        
        for (int i = 0; i < markables.getLength(); i++) {
            org.w3c.dom.Node markable = markables.item(i);            
            String word = markable.getFirstChild().getNodeValue();
            String ids = markable.getAttributes().getNamedItem("id").getNodeValue();
            int id = Integer.parseInt(ids.substring(5))-1;
            ConllToken ct = new ConllToken(conll, id);
            ct.word = word;
        }
    }
    
    public void addSenteceLevel(Conll conll, String fileName) throws SAXException, IOException, ParserConfigurationException {
    	File mmax_file = new File(fileName);
        DocumentBuilder dBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();

        org.w3c.dom.Document doc = dBuilder.parse(mmax_file);
        NodeList markables = doc.getElementsByTagName("markable");
        
        for (int i = 0; i < markables.getLength(); i++) {
        	org.w3c.dom.Node markable = markables.item(i);   
        	String span = markable.getAttributes().getNamedItem("span").getNodeValue();
            
            String[] intervals = span.split(",");
            String[] interval = intervals[0].split("\\.\\.");
            int start = Integer.parseInt(interval[0].substring(5)) - 1 ;
            
            conll.getToken(start).setSentStart();
        }
    }
    
    public void addMarkableLevel(Conll conll, String fileName) throws ParserConfigurationException, SAXException, IOException {
    	File mmax_file = new File(fileName);
        DocumentBuilder dBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();

        org.w3c.dom.Document doc = dBuilder.parse(mmax_file);
        NodeList markables = doc.getElementsByTagName("markable");
        
        for (int i = 0; i < markables.getLength(); i++) {
        	org.w3c.dom.Node markable = markables.item(i);   
        	String span = markable.getAttributes().getNamedItem("span").getNodeValue();
        	String category = markable.getAttributes().getNamedItem("category").getNodeValue();
        	
        	String[] intervals = span.split(",");
            String[] interval = intervals[0].split("\\.\\.");
            int start = Integer.parseInt(interval[0].substring(5)) - 1 ;
            int end = start;
            if (interval.length > 1) {
                end = Integer.parseInt(interval[1].substring(5)) - 1;
            }
            
            conll.setMention(start, end, category);
        }
    }
    
	
	public static void main(String[] args) throws Exception {
		
		for (int i = 0; i < args.length; i++) {			
			if (args[i].equalsIgnoreCase("-conll")) importConll = Utils.attr(args[i+1], "-conll");
			if (args[i].equalsIgnoreCase("-exportConll")) exportConll = Utils.attr(args[i+1], "-exportConll");
			if (args[i].equalsIgnoreCase("-mmaxPath")) mmaxPath = Utils.attr(args[i+1], "-mmaxPath");
			if (args[i].equalsIgnoreCase("-project")) project = Utils.attr(args[i+1], "-project");
			if (args[i].equalsIgnoreCase("-ner")) forNer = Utils.attr("true", "-ner");
			if (args[i].equalsIgnoreCase("-importWebNE")) importWebNe = Utils.attr(args[i+1], "-importWebNE");
			
			if (args[i].equalsIgnoreCase("-h") || args[i].equalsIgnoreCase("--help") || args[i].equalsIgnoreCase("-?")) {
				System.out.println("MMAX2 wrapper");
				System.out.println("\n\t-conll : base conll data");
				System.out.println("\n\t-importWebNE : annotated data from web annotation tool");
				System.out.println("\n\t-exportConll : added extra annotation columns");
				System.out.println("\n\t-mmaxPath : path to mmax project");
				System.out.println("\n\t-project : project name");
				System.out.println("\n\t-ner : flag wheter to use function exportForNer()");
				System.out.flush();
				System.exit(0);
			}
		}
		
		MmaxWrapper mw = new MmaxWrapper();
		if (exportConll.length() > 0) {			
			String words = mmaxPath+project+"_words.xml";
	        String coref_level = mmaxPath+project+"_coref_level.xml";
	        String sentence_level = mmaxPath+project+"_sentence_level.xml";
	        
	        Conll conll = new Conll();
	        if (importConll.length() > 0) {
	        	conll.readConll(importConll);
	        } else {
	        	mw.readWordLevel(conll, words);
		        mw.addSenteceLevel(conll, sentence_level);
	        }
	        mw.addMarkableLevel(conll, coref_level);
	        if (forNer.length() > 0) {
	        	mw.exportForNer(conll, exportConll);	        	
	        } else {
	        	mw.exportTokens(conll, exportConll);
	        }
		} else if (importConll.length() > 0 || importWebNe.length() > 0) {
	        String words = mmaxPath+project+"_words.xml";
	        String coref_level = mmaxPath+project+"_coref_level.xml";
	        String sentence_level = mmaxPath+project+"_sentence_level.xml";
	        String project_file = mmaxPath+project+".mmax";
	        
	        Conll conll = new Conll();
	        if (importConll.length() > 0) conll.readConll(importConll);
	        else if (importWebNe.length() > 0) conll.readNeAnnotation(importWebNe);
	        mw.createProjectFile(project_file);
	        mw.exportWords(conll, words);
	        //mw.createMarkableLevel(coref_level);
	        mw.exportMentions(conll, coref_level);
	        mw.exportSentences(conll, sentence_level);
		}
    }
}
