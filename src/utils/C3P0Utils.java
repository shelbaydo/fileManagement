package utils;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3P0Utils {

	//�������ӳض���
	private static ComboPooledDataSource ds = new ComboPooledDataSource();
	
	//��ȡ���ӳض���
	public static DataSource getDataSource(){
		return ds;
	}
}
