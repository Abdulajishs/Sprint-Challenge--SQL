-- CREATE TABLE organisation (
--     orgid INT auto_increment PRIMARY KEY,
--     name VARCHAR(200) NOT NULL
-- );


-- SELECT * FROM organisation

-- CREATE TABLE channel (
--     chnlid INT auto_increment primary key,
--     name varchar(200) not null,
--     orgid INT,
--     foreign key (orgid) references organisation(orgid) on delete cascade on update cascade
-- )

-- SELECT * FROM channel

-- CREATE TABLE user (
--     userid INT auto_increment primary key,
--     name varchar(200) not null,
--     chnlid INT not null,
--     foreign key (chnlid) references channel(chnlid) on delete  cascade on update cascade
-- )

-- SELECT * FROM user

-- CREATE TABLE message(
--     msgid INT auto_increment primary key,
--     post_time timestamp default current_timestamp,
--     content text not null,
--     userid int not null,
--     chnlid int not null,
--     foreign key (userid) references user(userid) on delete cascade on update cascade,
--     foreign key (chnlid) references channel(chnlid) on delete cascade on update cascade
-- )

-- SELECT * FROM  message


-- CREATE TABLE user_channel (
--     userid INT NOT NULL ,
--     chnlid INT NOT NULL ,
--     primary key (userid,chnlid),
--     foreign key (userid) references user(userid) on delete cascade on update cascade,
--     foreign key (chnlid) references channel(chnlid) on delete cascade on update cascade
-- )

-- SELECT * FROM user_channel

-- INSERT INTO organisation (name)
-- VALUES (
--     ('Lambda School')
-- )

-- SELECT  * FROM organisation

-- INSERT INTO user (name)
--     VALUES
--         ('Alice'),
--         ('Bob'),
--         ('Chris')

-- SELECT * FROM user

-- INSERT  INTO channel (name,orgid)
-- VALUES
--     ('#general',1),
--     ('#random',1)


-- INSERT INTO message (content,userid,chnlid)
-- VALUES 
--     ('Hello everyone in general by Alice', 1, 1), 
--     ('Hey, this is Bob in general', 2, 1),
--     ('General message from Alice', 1, 1),
    
--     ('Hello everyone in random by Alice', 1, 2), 
--     ('Random message by Alice', 1, 2),           
--     ('Hi, this is Chris in random', 3, 2),       
--     ('Random message from Chris', 3, 2),         
    
--     ('Please share details in general', 2, 1),  
--     ('Sure, let’s connect in random', 3, 2),
--     ('Alice here, happy to connect!', 1, 2); 

-- INSERT INTO user_channel (userid,chnlid)
-- VALUES
--     (1,1),
--     (1,2),
--     (2,1),
--     (3,2)


-- SELECT * FROM organisation

-- SELECT name FROM channel

-- SELECT c.name FROM channel c
-- JOIN organisation o ON o.orgid = c.orgid
-- WHERE o.name = 'Lambda School'

-- SELECT m.content,u.name as username,c.name as channelname,m.post_time FROM message m
-- JOIN channel c ON c.chnlid = m.chnlid
-- JOIN user u on u.userid = m.userid
-- WHERE c.name = '#general'
-- ORDER BY m.post_time DESC

    
-- SELECT u.name as username,c.name as channelname
-- FROM user_channel uc
-- join channel c ON c.chnlid = uc.chnlid
-- join user u on u.userid = uc.userid
-- WHERE u.userid = 1

-- SELECT u.name as username, c.name as channelname
-- FROM user_channel uc
-- join user u ON uc.userid = u.userid
-- join channel c ON uc.chnlid = c.chnlid
-- WHERE c.name = '#general'

-- SELECT  u.name as user, m.content as content, c.name as channelname
-- FROM message m
-- JOIN user u ON u.userid = m.userid
-- JOIN channel c on c.chnlid = m.chnlid
-- WHERE u.name = 'Alice'

-- SELECT m.content as messages, c.name as channelname, u.name as username
-- FROM message m
-- join channel c ON c.chnlid = m.chnlid
-- join user u ON u.userid = m.userid
-- WHERE c.name = "#random" AND u.name = "Bob"

-- SELECT u.name as UserName, count(m.userid = u.userid) as MessageCount
-- FROM message m
-- join user u on u.userid = m.userid
-- GROUP BY u.name

-- SELECT u.name as User, c.name as Channel, count(m.msgid) as MessageCount
-- FROM message m
-- JOIN user u ON u.userid = m.userid
-- JOIN channel c ON c.chnlid = m.chnlid
-- GROUP BY u.name,c.name
-- ORDER BY c.name,u.name


-- What SQL keywords or concept would you use if you wanted to automatically delete 
-- all messages by a user if that user were deleted from the user table?
-- ON DELETE CASCADE