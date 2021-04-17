CREATE TABLE if not exists departure_reason
(
    id bigserial primary key,
    interface_name character varying,
    name character varying
);

insert into departure_reason values(1,'DepartureReason','Emploi');
insert into departure_reason values(2,'DepartureReason','Retour aux études');
insert into departure_reason values(3,'DepartureReason','Problèmes de santé mentale');
insert into departure_reason values(4,'DepartureReason','Problèmes de santé physique');
insert into departure_reason values(5,'DepartureReason','Déménagement');
insert into departure_reason values(6,'DepartureReason','Fin de contrat/projet');
insert into departure_reason values(7,'DepartureReason','Décès');
insert into departure_reason values(8,'DepartureReason','Autres');

/***** doctor *****/

CREATE TABLE if not exists doctor
(
    id bigserial primary key,
    interface_name character varying,
    lname character varying,
    fname character varying,
    phone character varying,
    fax character varying,
    email character varying
);

/***** education_level *****/

CREATE TABLE if not exists education_level
(
    id bigserial primary key,
    interface_name character varying,
    name character varying
);

insert into education_level values(1,'EducationLevel','Aucun diplôme');
insert into education_level values(2,'EducationLevel','Études secondaires');
insert into education_level values(3,'EducationLevel','Études professionnelles');
insert into education_level values(4,'EducationLevel','Études collégiales');
insert into education_level values(5,'EducationLevel','Études universitaires');

/***** emergency_contact *****/

CREATE TABLE if not exists emergency_contact
(
    id bigserial primary key,
    interface_name character varying,
    lname character varying,
    fname character varying,
    phone character varying,
    relation character varying
);

/***** followed_by *****/

CREATE TABLE if not exists followed_by
(
    id bigserial primary key,
    interface_name character varying,
    lname character varying,
    fname character varying,
    phone character varying,
    email character varying,
    fax character varying,
    organism character varying
);

/***** other_person *****/

CREATE TABLE if not exists other_person
(
    id bigserial primary key,
    interface_name character varying,
    lname character varying,
    fname character varying,
    phone character varying,
    organism character varying
);
/***** reference *****/

CREATE TABLE if not exists reference
(
    id bigserial primary key,
    interface_name character varying,
    name character varying
);

insert into reference values(1,'Reference','Aucune');
insert into reference values(2,'Reference','CIUSSS');
insert into reference values(3,'Reference','SIV');
insert into reference values(4,'Reference','SI');
insert into reference values(5,'Reference','Organismes communautaires');
insert into reference values(6,'Reference','Centre local d’emploi');
insert into reference values(7,'Reference','SEMO');
insert into reference values(8,'Reference','Personne elle-même');
insert into reference values(9,'Reference','Ami');
insert into reference values(10,'Reference','Famille');
insert into reference values(11,'Reference','Autres');

/***** residence_type *****/

CREATE TABLE if not exists residence_type
(
    id bigserial primary key,
    interface_name character varying,
    name character varying
);

insert into residence_type values(1,'ResidenceType','Appartement');
insert into residence_type values(2,'ResidenceType','Famille d''accueil');
insert into residence_type values(3,'ResidenceType','Logement supervisé');
insert into residence_type values(4,'ResidenceType','Autres');

/***** sector *****/

CREATE TABLE if not exists sector
(
    id bigserial primary key,
    interface_name character varying,
    name character varying
);

insert into sector values(1,'Sector','sous-traitance');
insert into sector values(2,'Sector','récupération-recyclage');
insert into sector values(3,'Sector','vente de produits artistiques');

/***** status *****/

CREATE TABLE if not exists status
(
    id bigserial primary key,
    interface_name character varying,
    name character varying
);

insert into status values(1,'Status','Clientèle');
insert into status values(2,'Status','Employés réguliers');

/***** work_city *****/

CREATE TABLE if not exists work_city
(
    id bigserial primary key,
    interface_name character varying,
    name character varying
);


insert into work_city values(1,'WorkCity','Trois-Rivières');
insert into work_city values(2,'WorkCity','Shawinigan');
insert into work_city values(3,'WorkCity','Louiseville');
insert into work_city values(4,'WorkCity','St-Tite');

/***** users *****/

CREATE TABLE if not exists users
(
    id bigserial primary key,
    interface_name character varying(50),
    lname character varying(50),
    fname character varying(50),
    email character varying(100),
    phone character varying(14),
    address character varying(100),
    organism character varying(100),
    username character varying(40),
    password character varying(200),
    role character(1) COLLATE pg_catalog."default",
    active boolean,
    first_connexion boolean
 );

/***** person *****/

CREATE TABLE if not exists person
(
    id bigserial primary key,
    interface_name character varying,
    lname character varying,
    fname character varying,
    birthday timestamp without time zone,
    sexe character varying,
    address character varying,
    phone character varying,
    nas int,
    health_issues character varying,
    work_city_id bigint,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    reference_id bigint,
    residence_type_id bigint,
    educational_level_id bigint,
    program_start_date timestamp without time zone,
    program_end_date timestamp without time zone,
    departure_reason_id bigint,
    hours_per_day double precision,
    status_id bigint,
    roaming_tracking boolean,
    roaming_start_date timestamp without time zone,
    roaming_end_date timestamp without time zone,
    community_work boolean,
    community_start_date timestamp without time zone,
    community_end_date timestamp without time zone,
    hourly_rate double precision,
    transport_fees double precision,
    responsible_intervenant_id bigint,
    emergency_contact_id bigint,
    followed_by_id bigint,
    active boolean,
    CONSTRAINT fk_person_work_city
    FOREIGN KEY(work_city_id)
    REFERENCES work_city(id),

    CONSTRAINT fk_person_reference
    FOREIGN KEY(reference_id)
    REFERENCES reference (id),

    CONSTRAINT fk_person_residence_type
    FOREIGN KEY(residence_type_id)
    REFERENCES residence_type (id),

    CONSTRAINT fk_person_education_level
    FOREIGN KEY(educational_level_id)
    REFERENCES education_level(id),

    CONSTRAINT fk_person_departure_reason
    FOREIGN KEY(departure_reason_id)
    REFERENCES departure_reason(id),

    CONSTRAINT fk_person_status
    FOREIGN KEY(status_id)
    REFERENCES status(id),

    CONSTRAINT fk_person_intervenant
    FOREIGN KEY(responsible_intervenant_id)
    REFERENCES users(id),

    CONSTRAINT fk_person_emergency_contact
    FOREIGN KEY(emergency_contact_id)
    REFERENCES emergency_contact(id),

    CONSTRAINT fk_person_followed_by
    FOREIGN KEY(followed_by_id)
    REFERENCES followed_by(id)
);


/***** Meeting *****/

CREATE TABLE if not exists meeting
(
    id bigserial primary key,
    interface_name character varying,
    notes character varying,
    followup character varying,
    goals character varying,
    id_person bigint,
    id_intervenant bigint,
    CONSTRAINT fk_meeting_person
    FOREIGN KEY(id_person)
    REFERENCES person(id),
    CONSTRAINT fk_meeting_intervenant
    FOREIGN KEY(id_intervenant)
    REFERENCES users(id)
    );


