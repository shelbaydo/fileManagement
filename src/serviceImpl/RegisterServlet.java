package serviceImpl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;

import entity.User;

public class RegisterServlet extends HttpServlet { 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 this.doPost(request, response);
	} 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 
		 request.setCharacterEncoding("utf-8");
		 HttpSession session = request.getSession(true);
		 String username = request.getParameter("username");
		 String phone = request.getParameter("phone");
		 String password = request.getParameter("password");
		 String smsCode = request.getParameter("verifyCode");
		 request.setAttribute("username", username);
		 request.setAttribute("phone", phone);
		 request.setAttribute("password", password);
		 if(smsCode.equals((String)session.getAttribute("code"))){
			 User user = new User();
			 user.setUsername(username);	 
			 user.setPhone(phone);	 
			 user.setPassword(password);
			 UserService userService = new UserService();
			 if(userService.add(user)){
				 user = userService.findUserByPhone(phone);
				 int userId = user.getUserId();
				 String savePath = this.getServletContext().getRealPath("/profiles/"+userId+"/profile.jpg");
				 String picPath = this.getServletContext().getRealPath("/defaultProfile/defaultProfile.jpg");
				 File picFile = new File(picPath);
				 File file = new File(savePath);
			        //�ж��ϴ��ļ��ı���Ŀ¼�Ƿ����
			        if (!file.exists() && !file.isDirectory()) {
			            //����Ŀ¼
			            file.mkdir();
			        }		 
				  FileUtils.copyFile(picFile, file); 				
				 request.setAttribute("RegisterResult", "ע��ɹ�");
				 response.setHeader("refresh", "1;url='/fileManagement/index.jsp'");
				 request.getRequestDispatcher("/home/register.jsp").forward(request, response);
				 
			 }else{
				 response.setHeader("refresh", "1;url='/fileManagement/index.jsp'");
				 request.setAttribute("RegisterResult", "�Բ���ע��ʧ�ܣ���������Ŭ����������");
				 request.getRequestDispatcher("/home/register.jsp").forward(request, response);				
			 }
		 }else{
			 request.setAttribute("RegisterResult", "��֤���������");
			 
			 request.getRequestDispatcher("/home/register.jsp").forward(request, response);
		 }
		 
	}
	public void copyFile(String oldPath, String newPath) { 
		try { 
			File newfile = new File(newPath);
	        //�ж���Ŀ¼�Ƿ����
	        if (!newfile.exists() && !newfile.isDirectory()) {
	            //����Ŀ¼
	            newfile.mkdir();
	        }
			int bytesum = 0; 
			int byteread = 0; 
			File oldfile = new File(oldPath); 
			if (oldfile.exists()) { //�ļ�����ʱ 
				InputStream inStream = new FileInputStream(oldfile); //����ԭ�ļ� 
				FileOutputStream fs = new FileOutputStream(newfile); 
				byte[] buffer = new byte[1444]; 
				int length; 
				while ( (byteread = inStream.read(buffer)) != -1) { 
					bytesum += byteread; //�ֽ��� �ļ���С 
					
					fs.write(buffer, 0, byteread); 
				} 
				inStream.close(); 
			} 
		} 
		catch (Exception e) { 
			System.out.println("���Ƶ����ļ���������"); 
			e.printStackTrace(); 

		} 

	} 


}
