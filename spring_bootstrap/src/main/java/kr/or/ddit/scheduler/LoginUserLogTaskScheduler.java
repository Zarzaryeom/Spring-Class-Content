package kr.or.ddit.scheduler;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.dto.LoginUserLogVO;
import kr.or.ddit.service.LoginUserLogService;

public class LoginUserLogTaskScheduler {

	
	private LoginUserLogService logService;
	private String savePath="c:\\log";
	private String fileName="login_user_log.csv";

	public void setLoginUserLogService(LoginUserLogService logService) {
		this.logService = logService;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public void loginUserLogToDataBase() throws Exception{
		FileReader reader = new FileReader(savePath+File.separator+fileName);
		BufferedReader in = new BufferedReader(reader);
		
		String textLine = null;
		List<LoginUserLogVO> logList = new ArrayList<LoginUserLogVO>();
		
		try {
			while((textLine = in.readLine()) != null) {
				String[] logData = textLine.replace("[login:user]", "").split(",");
				
				LoginUserLogVO logVO = new LoginUserLogVO();
				logVO.setId(logData[0]);
				logVO.setPhone(logData[1]);
				logVO.setEmail(logData[2]);
				logVO.setIpAddress(logData[3]);
				logVO.setIndate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(logData[4]));
				
				logList.add(logVO);
			}
		} finally {
			if(reader != null) reader.close();
			if(in != null) in.close();
		}
		logService.write(logList);
	}
	
}
