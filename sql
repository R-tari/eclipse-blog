
drop database if exists blog;

GRANT FILE ON *.* TO 'root'@'localhost';

create database if not exists blog;
use blog;

create table if not exists board
(
	num int not null,
	title varchar(50),
    txt varchar(5000),
  
    primary key  (num)
);

insert into board values
(	
1,
	'새',
    '요거 무슨새인가요?'

	
);

insert into board values
(2,
	'고양이',
    '제 고양이 자랑좀 하겠습니다'
	
    
);

insert into board values
(3,
	'dog',
    '댕댕이멍멍이'
	
);

insert into board values
(4,
	'fox',
    '여우짓이라는 말이 왜 생겼는지 이제 알았습니다.'
	
    
);

insert into board values
(5,
	'나무',
    '바이킹들은 이런 침엽수들로 롱쉽을 만들었다고 합니다.'
    
);

insert into board values
(6,
	'베트남',
    '다낭 가서 바구니배를 타보고 싶어요..'
);





select * from board;

