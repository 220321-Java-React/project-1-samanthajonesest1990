create table ers_reimbursement_status (
reimb_status_id serial primary key,
reimb_status text);

create table ers_user_roles (
ers_user_role_id serial primary key,
user_role text);

create table ers_reimbursement_type (
reimb_type_id serial primary key,
reimb_type text);

create table ers_users (
ers_user_id serial primary key,
ers_username text,
ers_password text,
user_first_name text,
user_last_name text,
user_email text,
user_role_id_fk int references ers_user_roles(ers_user_role_id)
);

create table ers_reimbursement (
reimb_id serial primary key,
reimb_submitted timestamp,
reimb_resolved timestamp,
reimb_description text,
reimb_receipt text,
reimb_author_fk int references ers_users (ers_user_id),
reimb_resolver_fk int references ers_users (ers_user_id),
reimb_status_id_fk int references ers_reimbursement_status (reimb_status_id),
reimb_type_id_fk int references ers_reimbursement_type (reimb_type_id)
);

INSERT INTO ers_reimbursement_status (reimb_status)
VALUES ('Approved'),
	   ('Denied'),
	   ('Complete');
	   
select * from ers_reimbursement_status 


insert into ers_user_roles (user_role)
values ('Finance Manager'),
		('Employee');
	
select * from ers_user_roles
		
insert into ers_reimbursement_type (reimb_type)
values ('Gift Card'),
('Check'),
('Cash');

select * from ers_reimbursement_type

insert into ers_users (ers_username, ers_password, user_first_name, user_last_name, user_email, user_role_id_fk)
values ('sjones', 'password', 'Samantha', 'Jones', 'samantha@samantha.com', 1),
('ssmith', 'password', 'Shelly', 'Smith', 'shelly@shelly.com', 2),
('ssampson', 'password', 'Sandy', 'Sampson', 'sandy@sandy.com', 2),
('ssims', 'password', 'Sally', 'Sims', 'sally@sally.com', 2);

select * from ers_users

insert into ers_reimbursement (reimb_submitted, reimb_resolved, reimb_description, reimb_receipt, reimb_author_fk, reimb_resolver_fk, reimb_status_id_fk, reimb_type_id_fk )
values ('2022-11-24', '2022-11-27', 'Lodging', 'Yes', 1, 1, 1 , 3),
('2021-01-13', '2021-01-17', 'Travel', 'Yes', 1, 1, 2, 2),
('2013-04-01', '2013-04-06', 'Food', 'Yes', 1, 1, 3 , 1),
('2017-07-16', '2017-07-22', 'Other', 'No', 1 , 1, 1, 3 );

select * from ers_reimbursement