CREATE TABLE CONVERTERHOLDER (ID VARCHAR(255) NOT NULL, PRIMARY KEY (ID))
CREATE TABLE KRNS_ADHOC_RTE_ACTN_RECIP_T (ACTN_RQST_RECIP_ID VARCHAR(70) NOT NULL, ACTN_RQST_CD VARCHAR(30) NOT NULL, RECIP_TYP_CD INTEGER NOT NULL, DOC_HDR_ID VARCHAR(14), OBJ_ID VARCHAR(36) UNIQUE, VER_NBR BIGINT, PRIMARY KEY (ACTN_RQST_RECIP_ID, ACTN_RQST_CD, RECIP_TYP_CD))
CREATE TABLE KRNS_MAINT_DOC_ATT_T (DOC_HDR_ID VARCHAR(14) NOT NULL, ATT_CNTNT LONGBLOB, CNTNT_TYP VARCHAR(255), FILE_NM VARCHAR(150), OBJ_ID VARCHAR(36) UNIQUE, VER_NBR BIGINT, PRIMARY KEY (DOC_HDR_ID))
CREATE TABLE KRNS_MAINT_DOC_ATT_LST_T (ATT_ID VARCHAR(40) NOT NULL, ATT_CNTNT LONGBLOB, CNTNT_TYP VARCHAR(255), DOC_HDR_ID VARCHAR(14), FILE_NM VARCHAR(150), OBJ_ID VARCHAR(36) UNIQUE, VER_NBR BIGINT, PRIMARY KEY (ATT_ID))
CREATE INDEX KRNS_MAINT_DOC_ATT_LST_TI1 ON KRNS_MAINT_DOC_ATT_LST_T (DOC_HDR_ID)
CREATE TABLE KRNS_SESN_DOC_T (PRNCPL_ID VARCHAR(40) NOT NULL, SESN_DOC_ID VARCHAR(40) NOT NULL, DOC_HDR_ID VARCHAR(14) NOT NULL, IP_ADDR VARCHAR(60) NOT NULL, CONTENT_ENCRYPTED_IND VARCHAR(1), LAST_UPDT_DT DATETIME, OBJ_ID VARCHAR(36) UNIQUE, SERIALZD_DOC_FRM LONGBLOB, VER_NBR BIGINT, PRIMARY KEY (PRNCPL_ID, SESN_DOC_ID, DOC_HDR_ID, IP_ADDR))
CREATE INDEX KRNS_SESN_DOC_TI1 ON KRNS_SESN_DOC_T (LAST_UPDT_DT)
CREATE TABLE KRNS_ATT_T (NTE_ID BIGINT NOT NULL, FILE_NM VARCHAR(250), FILE_SZ BIGINT, ATT_ID VARCHAR(36), MIME_TYP VARCHAR(255), ATT_TYP_CD VARCHAR(40), OBJ_ID VARCHAR(36) UNIQUE, VER_NBR BIGINT, PRIMARY KEY (NTE_ID))
CREATE TABLE KRNS_DOC_HDR_T (DOC_HDR_ID VARCHAR(14) NOT NULL, FDOC_DESC VARCHAR(255), TMPL_DOC_HDR_ID VARCHAR(14), EXPLANATION VARCHAR(400), OBJ_ID VARCHAR(36) UNIQUE, ORG_DOC_HDR_ID VARCHAR(10), VER_NBR BIGINT, PRIMARY KEY (DOC_HDR_ID))
CREATE INDEX KRNS_DOC_HDR_TI3 ON KRNS_DOC_HDR_T (ORG_DOC_HDR_ID)
CREATE TABLE KRNS_NTE_T (NTE_ID BIGINT NOT NULL, AUTH_PRNCPL_ID VARCHAR(40) NOT NULL, POST_TS DATETIME, PRG_CD VARCHAR(1), TXT VARCHAR(800), TPC_TXT VARCHAR(40), NTE_TYP_CD VARCHAR(4) NOT NULL, OBJ_ID VARCHAR(36) UNIQUE, RMT_OBJ_ID VARCHAR(36) NOT NULL, VER_NBR BIGINT, PRIMARY KEY (NTE_ID))
CREATE INDEX KRNS_NTE_TI1 ON KRNS_NTE_T (RMT_OBJ_ID)
CREATE TABLE KRNS_NTE_TYP_T (NTE_TYP_CD VARCHAR(4) NOT NULL, ACTV_IND VARCHAR(1), TYP_DESC_TXT VARCHAR(100) NOT NULL, OBJ_ID VARCHAR(36) UNIQUE, VER_NBR BIGINT, PRIMARY KEY (NTE_TYP_CD))
CREATE TABLE KRNS_PESSIMISTIC_LOCK_T (PESSIMISTIC_LOCK_ID BIGINT NOT NULL, DOC_HDR_ID VARCHAR(14), GNRT_DT DATETIME, LOCK_DESC_TXT VARCHAR(255), OBJ_ID VARCHAR(36) UNIQUE, PRNCPL_ID VARCHAR(255), SESN_ID VARCHAR(255), VER_NBR BIGINT, FDOC_NBR VARCHAR(14), PRIMARY KEY (PESSIMISTIC_LOCK_ID))
CREATE TABLE KRNS_MAINT_DOC_T (DOC_HDR_ID VARCHAR(14) NOT NULL, OBJ_ID VARCHAR(36) UNIQUE, VER_NBR BIGINT, DOC_CNTNT LONGTEXT, PRIMARY KEY (DOC_HDR_ID))
CREATE TABLE KRNS_MAINT_LOCK_T (MAINT_LOCK_ID VARCHAR(14) NOT NULL, DOC_HDR_ID VARCHAR(14) NOT NULL, MAINT_LOCK_REP_TXT VARCHAR(500), OBJ_ID VARCHAR(36) UNIQUE, VER_NBR BIGINT, PRIMARY KEY (MAINT_LOCK_ID))
CREATE INDEX KRNS_MAINT_LOCK_TI2 ON KRNS_MAINT_LOCK_T (DOC_HDR_ID)
CREATE TABLE KRAD_MSG_T (LOC VARCHAR(255) NOT NULL, NMSPC_CD VARCHAR(20) NOT NULL, CMPNT_CD VARCHAR(100) NOT NULL, MSG_KEY VARCHAR(100) NOT NULL, MSG_DESC VARCHAR(255), OBJ_ID VARCHAR(36) UNIQUE, TXT VARCHAR(4000), VER_NBR BIGINT, PRIMARY KEY (LOC, NMSPC_CD, CMPNT_CD, MSG_KEY))
CREATE TABLE KRNS_LOOKUP_RSLT_T (LOOKUP_RSLT_ID VARCHAR(255) NOT NULL, LOOKUP_DT DATETIME, PRNCPL_ID VARCHAR(255), OBJ_ID VARCHAR(36) UNIQUE, SERIALZD_RSLTS LONGTEXT, VER_NBR BIGINT, PRIMARY KEY (LOOKUP_RSLT_ID))
CREATE TABLE KRNS_LOOKUP_SEL_T (LOOKUP_RSLT_ID VARCHAR(255) NOT NULL, LOOKUP_DT DATETIME, PRNCPL_ID VARCHAR(255), OBJ_ID VARCHAR(36) UNIQUE, SEL_OBJ_IDS LONGTEXT, VER_NBR BIGINT, PRIMARY KEY (LOOKUP_RSLT_ID))
CREATE TABLE TRV_ACCT (ACCT_NUM VARCHAR(10) NOT NULL, ACCT_TYPE VARCHAR(3), CREATE_DT DATETIME, ACCT_FO_ID VARCHAR(14), ACCT_NAME VARCHAR(50), OBJ_ID VARCHAR(36) UNIQUE, SUB_ACCT VARCHAR(10), SUB_ACCT_NAME VARCHAR(50), SUBSIDIZED_PCT VARCHAR(255), VER_NBR BIGINT, PRIMARY KEY (ACCT_NUM))
CREATE TABLE TRV_ACCT_TYPE (ACCT_TYPE VARCHAR(3) NOT NULL, ACCT_TYPE_NAME VARCHAR(30), OBJ_ID VARCHAR(36) UNIQUE, VER_NBR BIGINT, PRIMARY KEY (ACCT_TYPE))
CREATE TABLE TRVL_TRAVELER_DTL_T (id INTEGER AUTO_INCREMENT NOT NULL, ACTV_IND VARCHAR(1) NOT NULL, citizenship VARCHAR(40), city_nm VARCHAR(50), country_cd VARCHAR(2), customer_num VARCHAR(40), doc_nbr VARCHAR(14), drive_lic_exp_dt DATE, drive_lic_num VARCHAR(20), email_addr VARCHAR(50), first_nm VARCHAR(40) NOT NULL, gender VARCHAR(1) NOT NULL, last_nm VARCHAR(40) NOT NULL, MIDDLENAME VARCHAR(40), non_res_alien VARCHAR(1), OBJ_ID VARCHAR(36) UNIQUE, phone_nbr VARCHAR(20), EMP_PRINCIPAL_ID VARCHAR(255), postal_state_cd VARCHAR(2) NOT NULL, addr_line_1 VARCHAR(50) NOT NULL, addr_line_2 VARCHAR(50), traveler_typ_cd VARCHAR(3) NOT NULL, VER_NBR BIGINT, postal_cd VARCHAR(11) NOT NULL, PRIMARY KEY (id))
CREATE TABLE TRVL_TRAVELER_TYP_T (code VARCHAR(3) NOT NULL, actv_ind VARCHAR(1) NOT NULL, advances_ind VARCHAR(1) NOT NULL, nm VARCHAR(40) NOT NULL, OBJ_ID VARCHAR(36) UNIQUE, src_code VARCHAR(10), VER_NBR BIGINT, PRIMARY KEY (code))
CREATE TABLE TRVL_AUTH_DOC_T (FDOC_NBR VARCHAR(14) NOT NULL, CELL_PH_NUM VARCHAR(20), CTZN_CNTRY_CD VARCHAR(255), EXP_LMT VARCHAR(255), OBJ_ID VARCHAR(36) UNIQUE, DELINQUENT_TR_EXCEPTION VARCHAR(1), RGN_FAMIL VARCHAR(255), TRVL_ID VARCHAR(19), TRAVELER_DTL_ID INTEGER, TRIP_BGN_DT DATE, TRIP_DESC VARCHAR(255), TRIP_END_DT DATE, TRIP_TYP_CD VARCHAR(3), VER_NBR BIGINT, PRIMARY KEY (FDOC_NBR))
CREATE TABLE KRNS_MAINT_DOC_T_KRNS_MAINT_DOC_ATT_LST_T (MaintenanceDocumentBase_DOC_HDR_ID VARCHAR(14) NOT NULL, attachments_ATT_ID VARCHAR(40) NOT NULL, PRIMARY KEY (MaintenanceDocumentBase_DOC_HDR_ID, attachments_ATT_ID))
ALTER TABLE KRNS_ADHOC_RTE_ACTN_RECIP_T ADD CONSTRAINT KRNS_ADHOC_RTE_ACTN_RECIP_TC0 UNIQUE (OBJ_ID)
ALTER TABLE KRNS_MAINT_DOC_ATT_T ADD CONSTRAINT KRNS_MAINT_DOC_ATT_TC0 UNIQUE (OBJ_ID)
ALTER TABLE KRNS_MAINT_DOC_ATT_LST_T ADD CONSTRAINT KRNS_MAINT_DOC_ATT_LST_TC0 UNIQUE (OBJ_ID)
ALTER TABLE KRNS_SESN_DOC_T ADD CONSTRAINT KRNS_SESN_DOC_TC0 UNIQUE (OBJ_ID)
ALTER TABLE KRNS_ATT_T ADD CONSTRAINT KRNS_ATT_TC0 UNIQUE (OBJ_ID)
ALTER TABLE KRNS_DOC_HDR_T ADD CONSTRAINT KRNS_DOC_HDR_TC0 UNIQUE (OBJ_ID)
ALTER TABLE KRNS_NTE_T ADD CONSTRAINT KRNS_NTE_TC0 UNIQUE (OBJ_ID)
ALTER TABLE KRNS_NTE_TYP_T ADD CONSTRAINT KRNS_NTE_TYP_TC0 UNIQUE (OBJ_ID)
ALTER TABLE KRNS_MAINT_DOC_T ADD CONSTRAINT KRNS_MAINT_DOC_TC0 UNIQUE (OBJ_ID)
ALTER TABLE KRNS_MAINT_LOCK_T ADD CONSTRAINT KRNS_MAINT_LOCK_TC0 UNIQUE (OBJ_ID)
ALTER TABLE KRAD_MSG_T ADD CONSTRAINT KRAD_MSG_TC0 UNIQUE (OBJ_ID)
ALTER TABLE KRNS_ATT_T ADD CONSTRAINT FK_KRNS_ATT_T_NTE_ID FOREIGN KEY (NTE_ID) REFERENCES KRNS_NTE_T (NTE_ID)
ALTER TABLE KRNS_NTE_T ADD CONSTRAINT FK_KRNS_NTE_T_NTE_TYP_CD FOREIGN KEY (NTE_TYP_CD) REFERENCES KRNS_NTE_TYP_T (NTE_TYP_CD)
ALTER TABLE KRNS_NTE_T ADD CONSTRAINT FK_KRNS_NTE_T_NTE_ID FOREIGN KEY (NTE_ID) REFERENCES KRNS_ATT_T (NTE_ID)
ALTER TABLE KRNS_PESSIMISTIC_LOCK_T ADD CONSTRAINT FK_KRNS_PESSIMISTIC_LOCK_T_DOC_HDR_ID FOREIGN KEY (DOC_HDR_ID) REFERENCES KRNS_MAINT_DOC_T (DOC_HDR_ID)
ALTER TABLE KRNS_PESSIMISTIC_LOCK_T ADD CONSTRAINT FK_KRNS_PESSIMISTIC_LOCK_T_FDOC_NBR FOREIGN KEY (FDOC_NBR) REFERENCES TRVL_AUTH_DOC_T (FDOC_NBR)
ALTER TABLE KRNS_MAINT_DOC_T ADD CONSTRAINT FK_KRNS_MAINT_DOC_T_DOC_HDR_ID FOREIGN KEY (DOC_HDR_ID) REFERENCES KRNS_MAINT_DOC_ATT_T (DOC_HDR_ID)
ALTER TABLE TRV_ACCT ADD CONSTRAINT FK_TRV_ACCT_ACCT_TYPE FOREIGN KEY (ACCT_TYPE) REFERENCES TRV_ACCT_TYPE (ACCT_TYPE)
ALTER TABLE KRNS_MAINT_DOC_T_KRNS_MAINT_DOC_ATT_LST_T ADD CONSTRAINT KRNSMAINTDOCTKRNSMAINTDOCATTLSTTattachments_ATT_ID FOREIGN KEY (attachments_ATT_ID) REFERENCES KRNS_MAINT_DOC_ATT_LST_T (ATT_ID)
ALTER TABLE KRNS_MAINT_DOC_T_KRNS_MAINT_DOC_ATT_LST_T ADD CONSTRAINT KRNSMNTDCTKRNSMNTDOCATTLSTTMntnncDcmntBaseDOCHDRID FOREIGN KEY (MaintenanceDocumentBase_DOC_HDR_ID) REFERENCES KRNS_MAINT_DOC_T (DOC_HDR_ID)
CREATE TABLE SEQUENCE (SEQ_NAME VARCHAR(50) NOT NULL, SEQ_COUNT DECIMAL(38), PRIMARY KEY (SEQ_NAME))
INSERT INTO SEQUENCE(SEQ_NAME, SEQ_COUNT) values ('KRNS_LOCK_S', 0)
