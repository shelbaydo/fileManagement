package serviceImpl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import daoImpl.FileDao;
import entity.MyFile;
import entity.User;

public class UploadProfile extends HttpServlet {

	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
		 
	} 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session =  request.getSession(true);
		User user = (User)session.getAttribute("currentUser");
		int userId = user.getUserId();
		String savePath = this.getServletContext().getRealPath("/profiles/"+userId+"/profile.jpg");
        File file = new File(savePath);          
        try{
            //ʹ��Apache�ļ��ϴ���������ļ��ϴ����裺
            //1������һ��DiskFileItemFactory����
            DiskFileItemFactory factory = new DiskFileItemFactory();
            //2������һ���ļ��ϴ�������
            ServletFileUpload upload = new ServletFileUpload(factory);
             //����ϴ��ļ�������������
            upload.setHeaderEncoding("UTF-8"); 
            //3���ж��ύ�����������Ƿ����ϴ���������
            if(!ServletFileUpload.isMultipartContent(request)){
                //���մ�ͳ��ʽ��ȡ����
                return;
            }
            //4��ʹ��ServletFileUpload�����������ϴ����ݣ�����������ص���һ��List<FileItem>���ϣ�ÿһ��FileItem��Ӧһ��Form����������
            List<FileItem> list = upload.parseRequest(request);
            for(FileItem item : list){
                //���fileitem�з�װ������ͨ�����������
                if(item.isFormField()){
                    String name = item.getFieldName();
                    //�����ͨ����������ݵ�������������
                    String value = item.getString("UTF-8");
                    //value = new String(value.getBytes("iso8859-1"),"UTF-8");
                }else{//���fileitem�з�װ�����ϴ��ļ�
                    //�õ��ϴ����ļ����ƣ�
                    String filename = item.getName();
                    long size = item.getSize();                    
                    String filetype = null;
                    if(filename==null || filename.trim().equals("")){
                        continue;
                    }
                    //ע�⣺��ͬ��������ύ���ļ����ǲ�һ���ģ���Щ������ύ�������ļ����Ǵ���·���ģ��磺  c:\a\b\1.txt������Щֻ�ǵ������ļ������磺1.txt
                    //�����ȡ�����ϴ��ļ����ļ�����·�����֣�ֻ�����ļ�������
                    filetype = filename.substring(filename.lastIndexOf(".")+1); 
                    //��ȡitem�е��ϴ��ļ���������
                    InputStream in = item.getInputStream();
                    //����һ���ļ������
                    FileOutputStream out = new FileOutputStream(savePath);
                    //����һ��������
                    byte buffer[] = new byte[1024];
                    //�ж��������е������Ƿ��Ѿ�����ı�ʶ
                    int len = 0;
                    //ѭ�������������뵽���������У�(len=in.read(buffer))>0�ͱ�ʾin���滹������
                    while((len=in.read(buffer))>0){
                        //ʹ��FileOutputStream�������������������д�뵽ָ����Ŀ¼(savePath + "\\" + filename)����
                        out.write(buffer, 0, len);
                    }
                    //�ر�������
                    in.close();
                    //�ر������
                    out.close();
                    //ɾ�������ļ��ϴ�ʱ���ɵ���ʱ�ļ�
                    item.delete();                  
                }
            }
            
        }catch (Exception e) {       
            e.printStackTrace();        
        } 
       
        response.sendRedirect("/fileManagement/personalPage/info/pic-info.jsp");
	}

}
