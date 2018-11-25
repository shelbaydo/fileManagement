package serviceImpl;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daoImpl.FolderDao;
import entity.Folder;
import entity.User;

public class DownloadServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);
		User user = (User)session.getAttribute("currentUser");
		int userId = user.getUserId();
		String folderName = request.getParameter("folderName");
		FolderDao folderDao = new FolderDao();
		Folder folder = folderDao.findFolderByNameAndUserId(folderName, userId);
		int folderId = folder.getFoldId();
		String fileSaveRootPath=this.getServletContext().getRealPath("/upload/"+folderId);
		//�õ�Ҫ���ص��ļ���
        String fileName = request.getParameter("fileName");  //23239283-92489-������.avi
       
        //�õ�Ҫ���ص��ļ�
        File file = new File(fileSaveRootPath + "/" + fileName);
        //����ļ�������
        if(!file.exists()){
            request.setAttribute("message", "��Ҫ���ص���Դ�ѱ�ɾ������");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            
        }
        //������Ӧͷ��������������ظ��ļ�
        response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
        //��ȡҪ���ص��ļ������浽�ļ�������
        FileInputStream in = new FileInputStream(file);
        //���������
        OutputStream out = response.getOutputStream();
        //����������
        byte buffer[] = new byte[1024];
        int len = 0;
        //ѭ�����������е����ݶ�ȡ������������
        while((len=in.read(buffer))>0){
            //��������������ݵ��������ʵ���ļ�����
            out.write(buffer, 0, len);
        }
        //�ر��ļ�������
        in.close();
        //�ر������
        out.close();
	}

}
