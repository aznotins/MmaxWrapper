
public class Markable implements Comparable<Markable> {
	
	int start;
	int end;
	String type;
	String category;
	String rule;
	Integer corefID;
	
	public Markable (int _start, int _end, Integer _corefID, String _cat, String _type, String _rule) {
		start = _start;
		end = _end;
		category = _cat;
		type = _type;
		rule = _rule;
		corefID = _corefID;
	}
	
	/**
	 * Sākumā ir garākie pieminējumi
	 */
	@Override
	public int compareTo(Markable m) {
		return end - start - m.end + m.start;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
}
