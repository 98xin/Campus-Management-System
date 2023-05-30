package team.javaSpirit.teachingAssistantPlatform.ui.event;

import java.awt.Cursor;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import team.javaSpirit.teachingAssistantPlatform.common.Constant;
import team.javaSpirit.teachingAssistantPlatform.course.service.CourseServiceImpl;
import team.javaSpirit.teachingAssistantPlatform.studentSignIn.service.StudentSignInServiceImpl;
import team.javaSpirit.teachingAssistantPlatform.ui.view.Index;
import team.javaSpirit.teachingAssistantPlatform.upload.service.ShareResourceServiceImpl;
import team.javaSpirit.teachingAssistantPlatform.util.ExcelUtil;

public class DownLoadListener implements MouseListener {
	private Index index;
	private StudentSignInServiceImpl ss;
	public DownLoadListener(Index index) {
		this.index=index;
	}
	public DownLoadListener(Index index, StudentSignInServiceImpl ss) {
		this.index=index;
		this.ss = ss;
	}
	public DownLoadListener() {
	}
	@Override
	public void mouseClicked(MouseEvent e) {
		//excel标题
		CourseServiceImpl cs = new CourseServiceImpl();
		String cname = cs.findCname(Constant.cid);
		String title = cname + "-学生签到信息表";
		//excel列头信息
		String[] rowsName = { "学号", "姓名", "签到状态"};
		//学生签到的情况
		List<Object[]> signStu = ss.SignInStudent();
		List<Object[]> dataList = new ArrayList<Object[]>();
		dataList = signStu;
		
		//给文件命名
		Date date = new Date();
		SimpleDateFormat dateFormat= new SimpleDateFormat("yyyyMMdd_hh");
		String fileName = dateFormat.format(date) + "_" + Constant.cid + ".xls";
		//调用poi的工具类
		ExcelUtil ex = new ExcelUtil(title, rowsName, dataList);
		OutputStream out;
	    try {
	    	out = new FileOutputStream(fileName);
	        ex.export(out);
	        out.flush();
		    out.close();
		    JOptionPane.showMessageDialog(null, "导出成功", "提示", JOptionPane.PLAIN_MESSAGE);
	    } catch (Exception e1) {
	        e1.printStackTrace();
	        JOptionPane.showMessageDialog(null, "导出失败", "提示", JOptionPane.PLAIN_MESSAGE);
	    }
	    
	    return;
	}

	@Override
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		this.index.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
	}

	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		this.index.setCursor(Cursor.getPredefinedCursor(Cursor.DEFAULT_CURSOR));
	}
}
