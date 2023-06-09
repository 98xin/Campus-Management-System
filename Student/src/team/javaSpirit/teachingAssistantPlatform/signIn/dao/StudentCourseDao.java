package team.javaSpirit.teachingAssistantPlatform.signIn.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import team.javaSpirit.teachingAssistantPlatform.entity.ClassCourse;
import team.javaSpirit.teachingAssistantPlatform.entity.Record;
import team.javaSpirit.teachingAssistantPlatform.entity.Students;
import team.javaSpirit.teachingAssistantPlatform.entity.Studentstatus;
import team.javaSpirit.teachingAssistantPlatform.entity.Teacher;
import team.javaSpirit.teachingAssistantPlatform.entity.Times;
import team.javaSpirit.teachingAssistantPlatform.util.HibernateUtil;

public class StudentCourseDao {
	/**
	 * <p>
	 * Title: getStudentById
	 * </p>
	 * <p>
	 * Description: 通过学号，查询学生对象。
	 * </p>
	 * 
	 * @param sid 学号
	 * @return 学生对象
	 */
	public Students getStudentById(String sid) {
		Session session = HibernateUtil.getSession();
		Students s = session.get(Students.class, sid);
		session.close();
		return s;
	}
	
	/**
	 * <p>
	 * Title: getTeacherByName
	 * </p>
	 * <p>
	 * Description: 通过姓名，查询教师。
	 * </p>
	 * 
	 * @param name 教师姓名
	 * @return 教师对象
	 */
	public Teacher getTeacherByName(String name) {
		Session session = HibernateUtil.getSession();
		Query q = session.createQuery("from Teacher where tname=?");
		q.setParameter(0, name);
		Teacher teacher = (Teacher) q.uniqueResult();
		session.close();
		return teacher;
	}
	
	/**
	 * <p>Title: setImageById</p>
	 * <p>Description: 第一次签到，保存图片/p>
	 * @param sid 学生学号
	 * @param image 图片路径
	 */
	public void setImageById(String sid,String image) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		Students s=session.get(Students.class, sid);
		s.setImage(image);
		tx.commit();
		session.close();
	}
	
	/**
	 * <p>Title: getImageById</p>
	 * <p>Description: 获取人脸图片/p>
	 * @param sid 学生学号
	 * @return image 图片路径
	 */
	public String getImageById(String sid) {
		Session session = HibernateUtil.getSession();
		Query q = session.createQuery("select image from Students where sid=?");
		q.setParameter(0, sid);
		String s = (String) q.uniqueResult();
		session.close();
		return s;
	}

	/**
	 * <p>
	 * Title: getClassCourseBycid
	 * </p>
	 * <p>
	 * Description: 通过课程班级号，查班级课程
	 * </p>
	 * 
	 * @param cid 课程班级号
	 * @return 课程班级对象
	 */
	public ClassCourse getClassCourseBycid(int cid) {
		Session session = HibernateUtil.getSession();
		ClassCourse cc = session.get(ClassCourse.class, cid);
		session.close();
		return cc;
	}

	/**
	 * <p>
	 * Title: allCourse
	 * </p>
	 * <p>
	 * Description: 通过学号，查询本学生所上的所有课程号。
	 * </p>
	 * 
	 * @param sid 学号
	 * @return 所有的课程号
	 */
	public List<Integer> allCourseBysid(String sid) {
		Session session = HibernateUtil.getSession();
		Query q = session.createQuery("select classin.class_id from StudentClass where student.sid=?");
		q.setParameter(0, sid);
		List<Integer> list = q.list();
		session.close();
		return list;
	}

	/**
	 * <p>
	 * Title: allTimeBycid
	 * </p>
	 * <p>
	 * Description: 通过课程号，查到这门课的具体上课时间。
	 * </p>
	 * 
	 * @param class_id 课程班级id
	 * @return 所有的时间
	 */
	public List<Times> allTimeBycid(int class_id) {
		Session session = HibernateUtil.getSession();
		Query q = session.createQuery("from Times where classin.class_id=?");
		q.setParameter(0, class_id);
		List<Times> list = q.list();
		session.close();
		return list;
	}

	/**
	 * <p>
	 * Title: getStartTime
	 * </p>
	 * <p>
	 * Description: 返回开学日期。
	 * </p>
	 * 
	 * @return
	 */
	public Date getStartTime() {
		Session session = HibernateUtil.getSession();
		Query q = session.createQuery("select time_begin from Term where status=1");
		Date date = (Date) q.uniqueResult();
		session.close();
		return date;
	}

	/**
	 * <p>
	 * Title: getBeginTime
	 * </p>
	 * <p>
	 * Description: 通过节数id,查找相对应的上课的开始时间。
	 * </p>
	 * 
	 * @param node_id id
	 * @return 上课的开始时间
	 */
	public String getBeginTime(int node_id) {
		Session session = HibernateUtil.getSession();
		Query q = session.createQuery("select start_time from NodeNumber where node_id=?");
		q.setParameter(0, node_id);
		String s = (String) q.uniqueResult();
		session.close();
		return s;
	}

	/**
	 * <p>
	 * Title: getEndTime
	 * </p>
	 * <p>
	 * Description: 通过节数id,查找相对应的上课的结束时间。
	 * </p>
	 * 
	 * @param node_id 节数id
	 * @return 上课的结束时间
	 */
	public String getEndTime(int node_id) {
		Session session = HibernateUtil.getSession();
		Query q = session.createQuery("select end_time from NodeNumber where node_id=?");
		q.setParameter(0, node_id);
		String s = (String) q.uniqueResult();
		session.close();
		return s;
	}

	/**
	 * <p>
	 * Title: insertRecord
	 * </p>
	 * <p>
	 * Description: 插入一条签到数据。
	 * </p>
	 * 
	 * @param r 签到表的对象
	 */
	public void insertRecort(Students sid, ClassCourse cid, String image) {
		Session session = HibernateUtil.getSession();
		Record record = new Record();
		Transaction tx = session.beginTransaction();
		record.setStudent(sid);
		record.setState(1);
		record.setDate(new Date());
		record.setClassin(cid);
		record.setImage(image);
		session.save(record);
		tx.commit();
		session.close();
	}

	/**
	 * Title: getStudentStatus Description: 得到学生签到状态。
	 * 
	 * @param sid 学号
	 * @return 学生签到状态
	 */
	public int getStudentStatus(String sid) {
		Session session = HibernateUtil.getSession();
		Query q = session.createQuery("select record_status from Studentstatus where sid=?");
		q.setParameter(0, sid);
		int status = (int) q.uniqueResult();
		session.close();
		return status;
	}

	/**
	 * <p>
	 * Title: findCname
	 * </p>
	 * <p>
	 * Description: 通过课程号，找到课程班级名
	 * </p>
	 * 
	 * @param cid 课程班级号
	 * @return 课程班级名
	 */
	public String findCname(int cid) {
		Session session = HibernateUtil.getSession();
		Query q = session.createQuery("select class_name from ClassCourse where class_id=?");
		q.setParameter(0, cid);
		String s = (String) q.uniqueResult();
		session.close();
		return s;
	}

	/**
	 * <p>
	 * Title: changeStudentStatus
	 * </p>
	 * <p>
	 * Description: 签到成功，修改状态，正常签到为1，迟到为2
	 * </p>
	 * 
	 * @param sid 学号
	 */
	public void changeStudentStatus(String sid, int status) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		Studentstatus studentstatus = session.get(Studentstatus.class, sid);
		studentstatus.setRecord_status(status);
		tx.commit();
		session.close();
	}
	

	
	/**
	 * <p>
	 * Title: getAdminClassId
	 * </p>
	 * <p>
	 * Description: 通过sid,查找相对应的c_a_id。
	 * </p>
	 * 
	 * @param sid
	 * @return c_a_id
	 */
	public int getAdminClassId(String sid) {
		Session session = HibernateUtil.getSession();
		Query q = session.createQuery("select classAdministrantion.c_a_id from Students where sid=?");
		q.setParameter(0, sid);
		int s = (int) q.uniqueResult();
		session.close();
		return s;
	}
	
	/**
	 * <p>
	 * Title: getAdminClassName
	 * </p>
	 * <p>
	 * Description: 通过c_a_id,查找相对应的名字。
	 * </p>
	 * 
	 * @param c_a_id
	 * @return name
	 */
	public String getAdminClassName(int c_a_id) {
		Session session = HibernateUtil.getSession();
		Query q = session.createQuery("select name from ClassAdministration where c_a_id=?");
		q.setParameter(0, c_a_id);
		String s = (String) q.uniqueResult();
		session.close();
		return s;
	}

}
