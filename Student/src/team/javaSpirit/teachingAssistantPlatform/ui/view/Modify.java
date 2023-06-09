package team.javaSpirit.teachingAssistantPlatform.ui.view;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.SystemColor;
import java.awt.Toolkit;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.border.EmptyBorder;

import team.javaSpirit.teachingAssistantPlatform.ui.event.ModifyActionListener;

/**
 * 
 * <p>
 * Title: Modify
 * </p>
 * <p>
 * Description: 修改密码界面
 * </p>
 * 
 */
public class Modify extends JFrame {
	/** 背景容器 */
	private JPanel bgContentPane;
	/** 用户名 */
	private JTextField username;
	/** 旧密码框 */
	private JPasswordField oldPassword;
	/** 新密码框 */
	private JPasswordField password;
	/** 确认密码框 */
	private JPasswordField conpassword;

	public JPanel getBgContentPane() {
		return bgContentPane;
	}

	public JTextField getUsername() {
		return username;
	}

	public JPasswordField getOldPassword() {
		return oldPassword;
	}

	public JPasswordField getPassword() {
		return password;
	}

	public JPasswordField getConpassword() {
		return conpassword;
	}

	/**
	 * 
	 * <p>
	 * Title: getModify
	 * </p>
	 * <p>
	 * Description:获得当前窗体
	 * </p>
	 * 
	 * @return
	 */
	public Modify getModify() {
		return this;
	}

	/**
	 * 
	 * <p>
	 * Title: setBackground
	 * </p>
	 * <p>
	 * Description:设置背景容器bgContentPane
	 * </p>
	 */
	public void setBackground() {
		// 设置背景图
		bgContentPane = new JPanel() {
			public void paintComponent(Graphics g) {
				super.paintComponent(g);
				ImageIcon ii = new ImageIcon("image/bglogin.png");
				g.drawImage(ii.getImage(), 0, 0, getWidth(), getHeight(), ii.getImageObserver());
			}
		};
		bgContentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		this.setContentPane(bgContentPane);
		// 设置布局方式为绝对定位
		bgContentPane.setLayout(null);
	}

	/**
	 * 
	 * <p>
	 * Title: setLogo
	 * </p>
	 * <p>
	 * Description: 设置logo
	 * </p>
	 */
	public void setLogo() {
		// logo图片
		JLabel logo = new JLabel("");
		logo.setIcon(new ImageIcon("image/logo1.png"));
		logo.setBounds(102, 0, 110, 110);
		bgContentPane.add(logo);
		// logo文字
		JLabel logoword = new JLabel("课堂管理系统学生端");
		logoword.setForeground(SystemColor.activeCaption);
		logoword.setFont(new Font("宋体", Font.BOLD, 18));
		logoword.setHorizontalAlignment(SwingConstants.CENTER);
		logoword.setBounds(50, 120, 200, 22);
		bgContentPane.add(logoword);
	}

	/**
	 * 
	 * <p>
	 * Title: setUsername
	 * </p>
	 * <p>
	 * Description: 设置用户名
	 * </p>
	 */
	public void setUsername() {
		JLabel lblNewLabel = new JLabel("用 户 名");
		lblNewLabel.setForeground(Color.WHITE);
		lblNewLabel.setFont(new Font("宋体", Font.BOLD, 14));
		lblNewLabel.setBounds(48, 164, 65, 20);
		bgContentPane.add(lblNewLabel);
		username = new JTextField();
		username.setBounds(137, 164, 121, 21);
		bgContentPane.add(username);
		username.setColumns(10);
	}

	/**
	 * 
	 * <p>
	 * Title: setOldPassword
	 * </p>
	 * <p>
	 * Description:设置旧密码框
	 * </p>
	 */
	public void setOldPassword() {
		JLabel lblNewLabel_1 = new JLabel("旧 密 码");
		lblNewLabel_1.setForeground(Color.WHITE);
		lblNewLabel_1.setFont(new Font("宋体", Font.BOLD, 14));
		lblNewLabel_1.setBounds(48, 205, 65, 20);
		bgContentPane.add(lblNewLabel_1);
		oldPassword = new JPasswordField();
		oldPassword.setBounds(137, 205, 121, 21);
		bgContentPane.add(oldPassword);
	}

	/**
	 * 
	 * <p>
	 * Title: setPassword
	 * </p>
	 * <p>
	 * Description: 设置密码
	 * </p>
	 */
	public void setPassword() {
		JLabel label_1 = new JLabel("新 密 码");
		label_1.setForeground(Color.WHITE);
		label_1.setFont(new Font("宋体", Font.BOLD, 14));
		label_1.setBounds(48, 247, 65, 20);
		bgContentPane.add(label_1);
		password = new JPasswordField();
		password.setBounds(137, 247, 121, 21);
		bgContentPane.add(password);
	}

	/***
	 * 
	 * <p>
	 * Title: setConPassword
	 * </p>
	 * <p>
	 * Description:确认密码
	 * </p>
	 */
	public void setConPassword() {
		JLabel label = new JLabel("确认密码");
		label.setForeground(Color.WHITE);
		label.setFont(new Font("宋体", Font.BOLD, 14));
		label.setBounds(48, 290, 65, 20);
		bgContentPane.add(label);
		conpassword = new JPasswordField();
		conpassword.setBounds(137, 290, 121, 21);
		bgContentPane.add(conpassword);
	}

	/**
	 * 
	 * <p>
	 * Title: setConfirm
	 * </p>
	 * <p>
	 * Description: 设置确认按钮
	 * </p>
	 */
	public void setConfirm() {
		JButton confirm = new JButton("确  认");
		confirm.setForeground(SystemColor.textInactiveText);
		confirm.setBounds(102, 320, 93, 23);
		confirm.addActionListener(new ModifyActionListener(getModify()));
		bgContentPane.add(confirm);
	}

	/***
	 * 
	 * <p>
	 * Title: init
	 * </p>
	 * <p>
	 * Description:初始化修改密码界面并加入相关组件
	 * </p>
	 */
	public void init() {
		this.setBackground();
		this.setLogo();
		this.setOldPassword();
		this.setUsername();
		this.setPassword();
		this.setConPassword();
		this.setConfirm();
	}

	/**
	 * Create the frame.
	 */
	public Modify() {
		// 设置窗体大小
		this.setBounds(0, 0, 320, 386);
		// 窗体大小不能改变
		this.setResizable(false);
		// 居中显示
		this.setLocationRelativeTo(null);
		// 设置图标
		this.setIconImage(Toolkit.getDefaultToolkit().getImage("image\\logo1.png"));
		// 窗体可见
		this.setVisible(true);
		// 设置关闭状态
		this.addWindowListener(new WindowAdapter() {
			// 关闭窗口时，开启登录窗口
			public void windowClosing(WindowEvent e) {
				super.windowClosing(e);
				Login login = new Login();
				login.init();
			}
		});

	}
}
