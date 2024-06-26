CREATE TABLE users
(
    user_id  INT PRIMARY KEY,
    username VARCHAR(45),
    password VARCHAR(255)
);

CREATE TABLE addresses
(
    address_id INT PRIMARY KEY,
    street     VARCHAR(45),
    city       VARCHAR(45),
    state      VARCHAR(45),
    zip        INT
);

CREATE TABLE office_managers
(
    manager_id INT PRIMARY KEY,
    firstname  VARCHAR(45),
    lastname   VARCHAR(45),
    phone      VARCHAR(45)
);

CREATE TABLE patients
(
    patient_id         INT PRIMARY KEY,
    firstname          VARCHAR(45),
    lastname           VARCHAR(45),
    phone              VARCHAR(45),
    email              VARCHAR(45),
    mailing_address_id INT,
    dob                DATE
);

CREATE TABLE dentists
(
    dentist_id        INT PRIMARY KEY,
    firstname         VARCHAR(45),
    lastname          VARCHAR(45),
    phone             VARCHAR(45),
    email             VARCHAR(45),
    specialization_id INT
);

CREATE TABLE specializations
(
    specialization_id INT PRIMARY KEY,
    title             VARCHAR(45)
);

CREATE TABLE surgery_locations
(
    surgery_location_id INT PRIMARY KEY,
    phone               VARCHAR(45),
    address_id          INT
);

CREATE TABLE appointments
(
    appointment_id      INT PRIMARY KEY,
    description         VARCHAR(255),
    date_time           DATE,
    patient_id          INT,
    dentist_id          INT,
    surgery_location_id INT
);


CREATE TABLE bills
(
    bill_id        INT PRIMARY KEY,
    date           DATE,
    amount         DECIMAL,
    patient_id     INT,
    appointment_id INT
);

SELECT * FROM dentists ORDER BY lastname;

SELECT a.*, p.* FROM appointments a JOIN patients p ON a.patient_id = p.patient_id
         WHERE dentist_id= :dentist_id;

SELECT * FROM appointments WHERE surgery_location_id= :surgery_location_id;

SELECT * FROM appointments WHERE patient_id= :patient_id AND date_time= :date_time;