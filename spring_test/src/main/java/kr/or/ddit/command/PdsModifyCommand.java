package kr.or.ddit.command;

import com.jsp.dto.PdsVO;

public class PdsModifyCommand extends PdsRegistCommand {

	private String pno;
	private String[] dlelteFile;
	
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public String[] getDlelteFile() {
		return dlelteFile;
	}
	public void setDlelteFile(String[] dlelteFile) {
		this.dlelteFile = dlelteFile;
	}
	@Override
	public PdsVO toPdsVO() {
		PdsVO pds = super.toPdsVO();
		pds.setPno(Integer.parseInt(this.pno));
		
		return pds;
	}
	
	
	
}
