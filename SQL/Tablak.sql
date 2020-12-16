
CREATE TABLE school_types (
    id NUMBER PRIMARY KEY NOT NULL,
    name VARCHAR(20) NOT NULL
);
CREATE TABLE zip_codes (
    zipcode NUMBER(4) PRIMARY KEY NOT NULL,
     city_name VARCHAR(100) NOT NULL
);
CREATE TABLE schools (
    school_id NUMBER PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    zip_code NUMBER(4) NOt NULL,
    address VARCHAR(250) NOT NULL,
    type_id NUMBER NOT NULL,
    FOREIGN KEY (type_id) REFERENCES school_types (id),
    FOREIGN KEY (zip_code) REFERENCES zip_codes (zipcode)
);
CREATE TABLE students_details (
    educational_identity NUMBER(11) PRIMARY KEY NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100) NULL,
    last_name VARCHAR(100) NOT NULL,
    address VARCHAR(250) NOT NULL,
    zip_code NUMBER(4) NOT NULL
  );
CREATE TABLE students (
    
    educational_identity NUMBER(11) NOT NULL PRIMARY KEY,
    school_id NUMBER NULL,

    FOREIGN KEY (school_id) REFERENCES schools (school_id),
 CONSTRAINT fk_students_std_details FOREIGN  KEY (educational_identity) REFERENCES students (educational_identity)

);



