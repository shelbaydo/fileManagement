package dao;

import java.util.List;

public interface Dao {
	
	List<Object> findAll();
	List<Object> findObjectsById(int id);
	Boolean modifyObject(Object o);
	Object findObjectById(int id);
	Boolean deleteObjectById(int id);
	Boolean addObject(Object o);
}
