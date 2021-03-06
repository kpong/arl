-- Generated by Oracle SQL Developer Data Modeler 4.0.3.853
--   at:        2015-04-21 14:17:35 CDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g

DROP TABLE ARL_employee CASCADE CONSTRAINTS ;

DROP TABLE ARL_member CASCADE CONSTRAINTS ;

DROP TABLE ARL_notilist CASCADE CONSTRAINTS ;

DROP TABLE m2m_memlist CASCADE CONSTRAINTS ;



CREATE TABLE ARL_employee
  (
    emp_id            INTEGER NOT NULL ,
    name              VARCHAR2 (255) ,
    status            VARCHAR2 (10) ,
    lab               VARCHAR2 (255) ,
    division          VARCHAR2 (255) ,
    ARL_member_mem_id INTEGER
  ) ;
  ALTER TABLE ARL_employee ADD CONSTRAINT ARL_employee_PK PRIMARY KEY ( emp_id ) ;

CREATE TABLE ARL_member
  (
    mem_id               INTEGER NOT NULL ,
    type                 VARCHAR2 (255) ,
    ARL_employee_emp_id  INTEGER ,
    ARL_notilist_noti_id INTEGER
  ) ;
  ALTER TABLE ARL_member ADD CONSTRAINT ARL_member_PK PRIMARY KEY ( mem_id ) ;

CREATE TABLE ARL_notilist
  (
    noti_id           INTEGER NOT NULL ,
    name              VARCHAR2 (255) ,
    status            VARCHAR2 (10) ,
    description       VARCHAR2 (4000) ,
    division          VARCHAR2 (10) ,
    ext_view_name     VARCHAR2 (255) ,
    creation_date     DATE ,
    stat_eff_date     DATE ,
    ARL_member_mem_id INTEGER
  ) ;
  ALTER TABLE ARL_notilist ADD CONSTRAINT ARL_notilist_PK PRIMARY KEY ( noti_id ) ;

CREATE TABLE m2m_memlist
  (
    ARL_member_mem_id    INTEGER ,
    ARL_notilist_noti_id INTEGER
  ) ;

ALTER TABLE ARL_employee ADD CONSTRAINT ARL_employee_ARL_member_FK FOREIGN KEY ( ARL_member_mem_id ) REFERENCES ARL_member ( mem_id ) ;

ALTER TABLE ARL_member ADD CONSTRAINT ARL_member_ARL_employee_FK FOREIGN KEY ( ARL_employee_emp_id ) REFERENCES ARL_employee ( emp_id ) ;

ALTER TABLE ARL_member ADD CONSTRAINT ARL_member_ARL_notilist_FK FOREIGN KEY ( ARL_notilist_noti_id ) REFERENCES ARL_notilist ( noti_id ) ;

ALTER TABLE ARL_notilist ADD CONSTRAINT ARL_notilist_ARL_member_FK FOREIGN KEY ( ARL_member_mem_id ) REFERENCES ARL_member ( mem_id ) ;

ALTER TABLE m2m_memlist ADD CONSTRAINT m2m_memlist_ARL_member_FK FOREIGN KEY ( ARL_member_mem_id ) REFERENCES ARL_member ( mem_id ) ;

ALTER TABLE m2m_memlist ADD CONSTRAINT m2m_memlist_ARL_notilist_FK FOREIGN KEY ( ARL_notilist_noti_id ) REFERENCES ARL_notilist ( noti_id ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             4
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
