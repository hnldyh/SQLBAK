net use \\192.168.1.1\SQL_bak "password" /user:"bak"
robocopy d:\SQL_bak\  \\192.168.1.1\SQL_bak\ /MIR /mot:1 
