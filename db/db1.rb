require 'mysql'  
   
#my = Mysql.new(hostname, username, password, databasename)  
con = Mysql.new('localhost', 'root', 'root', 'ekkitab_books')  
rs = con.query('select * from admin_user')  
rs.each_hash { |h| puts h['firstname']}  
con.close  
