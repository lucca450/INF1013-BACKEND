
insert into users values(nextval('users_id_seq'),'Users','Dubois-Nadeau','Pierre-olivier','pierro_kool@hotmail.com','8199959353','355 rue d''adrano',null,'polo','$2a$10$zj88Ey.Qp5mm/pMABrY3j.rvYN6HDTrY2G0SZdY/DOKd6zGN3G0Oq','A',true,true);
insert into users values(nextval('users_id_seq'),'User','Bellemare','Vincent','pierro_kool@hotmail.com','8199132020','321 rue bellevin',null,'madbrother','$2a$10$gSSOEgt6rZbrB46DAklrRuf8oX4Ia4/EaXkdDPlc/kzKBNXNWllBq','I',true,true);
insert into users values(nextval('users_id_seq'),'User','Possa Silva','Lucca','pierro_kool@hotmail.com','8196932092','320 rue des roses',null,'luca','$2a$10$pZuB9112GtYJeWdd1jz5VegWzd9CdsVBgrNv2xkhEHsgY1JzEjAfq','A',true,true);
insert into users values(nextval('users_id_seq'),'User','Lajoie','Émile','pierro_kool@hotmail.com','8196932095','350 rue de la joie',null,'Ender','$2a$10$iGbHP64AI4N6tJad0ak3RO3LAaxYXvU17wFkVQtljyi1jwxYW9Eky','I',false,true);

insert into emergency_contact values(nextval('emergency_contact_id_seq'),null,'Smith','John','8190002222','Frère');
insert into emergency_contact values(nextval('emergency_contact_id_seq'),null,'Smith','Elisabeth','8190002222','Soeur');
insert into emergency_contact values(nextval('emergency_contact_id_seq'),null,'Dubois-Nadeau','Pierre-olivier','8196948324','Proche');
insert into emergency_contact values(nextval('emergency_contact_id_seq'),null,'Dubois','Lyne','8196934031','Mère');

insert into followed_by values(nextval('followed_by_id_seq'),'User','Colin','Protou','9333333333','protou@hotmail.com','','Urgentologue');
insert into followed_by values(nextval('followed_by_id_seq'),'Doctor','Lapointe','Yvan','8199959252','yvantlapointe@hotmail.com','8882224523',null);
insert into followed_by values(nextval('followed_by_id_seq'),'EmergencyContact','Possa Silva','Lucca','8195418324','','','');
insert into followed_by values(nextval('followed_by_id_seq'),'OtherPerson','Paquin','Thérèse','8199959453','','','BS');

insert into person values(nextval('person_id_seq'),'Person','Bloe','Joe','1990-01-22 19:00:00','0','1000 rue des forges','8195554455','123456789','Diabète',1,'2019-01-20 19:00:00','2019-12-04 19:00:00',1,1,1,'2019-06-19 20:00:00','2019-06-23 20:00:00',1,'20',1,true,'2021-04-13 20:00:00','2021-04-15 20:00:00',true,'2021-01-18 19:00:00','2021-02-14 19:00:00',8,12,3,1,1,true);
insert into person values(nextval('person_id_seq'),'Person','Marcel','Plante','1970-03-04 19:00:00','2','200 rue saint-jean','5142229992','987654321','Aucun',2,'2021-03-31 20:00:00','2021-06-03 20:00:00',2,2,2,'2021-03-31 20:00:00','2021-08-12 20:00:00',2,'10',2,false,null,null,false,null,null,10,20,1,2,2,true);
insert into person values(nextval('person_id_seq'),'Person','Boucher','Linette','1995-01-07 19:00:00','1','200 rue saint-jean','4508886666','527895432','Diabète, Cancer',3,'2021-03-31 20:00:00','2021-04-12 20:00:00',11,4,5,'2021-04-08 20:00:00','2021-05-20 20:00:00',4,'5',1,true,'2021-04-07 20:00:00','2021-07-22 20:00:00',false,null,null,10,20,2,3,3,true);
insert into person values(nextval('person_id_seq'),'Person','Dubois','Roger','1950-03-31 19:00:00','0','500 rue de la jeunesse','4185347751','531253245','Aucun',4,'2021-03-08 19:00:00','2021-03-31 20:00:00',5,3,4,'2021-04-01 20:00:00','2021-04-21 20:00:00',5,'19',1,false,null,null,true,'2021-04-07 20:00:00','2021-04-29 20:00:00',10,20,3,4,4,true);

insert into meeting values(nextval('meeting_id_seq'),'Meeting', 'Meeting de Joe bloe par Vincent Bellemare','Cest un bon suivi','Regarder son dossier médicale',1,3);
insert into meeting values(nextval('meeting_id_seq'),'Meeting','Rencontre de Marcel avec Pierre-Olivier Dubois-Nadeau','Cest très important','Disctuer avec lui de ses problèmes',2,1);
insert into meeting values(nextval('meeting_id_seq'),'Meeting','Rencontre de Linette avec Lucca','Cest un bon suivi','Le but reste à déterminer',3,2);
insert into meeting values(nextval('meeting_id_seq'),'Meeting','Rencontre de Roger avec Pierre-Olivier Dubois-Nadeau','Reste à voir','Se rencontrer pour discuter',4,1);



