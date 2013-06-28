* Eclipse, with m2e plugin(Maven 2) installed.
* Mysql Database, Navicat UI(optional for dev)


1.  Codes
  *	Git clone https://github.com/dingyi216/d1.git
  *	Import ”Existing Maven Project” -> d1(where cloned) into Eclipse
  *	Right Click the project-> Maven -> Update Project
2.	Debug Congifuration
  *	Right Click the project 
  *	Run as “Maven build…”
  *	Enter Goal: ” tomcat:run”
  *	Apply
3.	SQL
  *	Create a mysql database as “test”, port: 3306
  *	Load the schema
  *	Sql  admin/password should be entered in jdbc.properties
