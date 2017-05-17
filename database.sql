use test;
create table commentary(
	aid int,
    title varchar(30),
    content varchar(3000),
    writer varchar(50),
	themeId int,
    createTime varchar(10)
);
insert into commentary values (0, 'title', 'content', 'writer', 0);
create table news(
	aid int,
    title varchar(30),
    content varchar(3000),
    writer varchar(50),
    createTime varchar(10)
);
insert into news values (0, 'title', 'content', 'writer');
create table theme(
	themeId int,
    title varchar(30),
    content varchar(100),
    writer varchar(50)
);
insert into theme values 
(0, 
'国务院：激发社会领域投资活力 引导企业有效利用多层次资本市场', 
'扎实有效放宽行业准入<br/>进一步扩大投融资渠道<br/>认真落实土地税费政策<br/>大力促进融合创新发展<br/>加强监管优化服务', 
'李千'
);
update commentary set themeId=0;