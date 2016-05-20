create table test.user(
	ID int(8) not null auto_increment,
    Name varchar(25) not null,
    Age int not null,
    isAdmin  boolean not null,
    CreatedDate date not null,
    primary key(ID));
    
    