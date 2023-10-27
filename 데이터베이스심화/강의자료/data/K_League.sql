DROP TABLE PLAYER CASCADE CONSTRAINT;
DROP TABLE TEAM CASCADE CONSTRAINT; 
DROP TABLE STADIUM CASCADE CONSTRAINT;
DROP TABLE SCHEDULE CASCADE CONSTRAINT;


CREATE TABLE STADIUM (
STADIUM_ID    CHAR(3) NOT NULL,
STADIUM_NAME  VARCHAR2(40) NOT NULL,
HOMETEAM_ID   CHAR(3),
SEAT_COUNT    NUMBER,
ADDRESS       VARCHAR2(60),
DDD           VARCHAR2(3),
TEL           VARCHAR2(10),
CONSTRAINT STADIUM_PK PRIMARY KEY (STADIUM_ID)
);


CREATE TABLE TEAM (
TEAM_ID     CHAR(3) NOT NULL,
REGION_NAME VARCHAR2(8) NOT NULL,
TEAM_NAME   VARCHAR2(40) NOT NULL,
E_TEAM_NAME VARCHAR2(50),
ORIG_YYYY   CHAR(4),
STADIUM_ID  CHAR(3) NOT NULL,
ZIP_CODE1   CHAR(3),
ZIP_CODE2   CHAR(3),
ADDRESS     VARCHAR2(80),
DDD         VARCHAR2(3),
TEL         VARCHAR2(10),
FAX         VARCHAR2(10),
HOMEPAGE    VARCHAR2(50),
OWNER       VARCHAR2(10),
CONSTRAINT TEAM_PK PRIMARY KEY (TEAM_ID),
CONSTRAINT TEAM_FK FOREIGN KEY (STADIUM_ID) REFERENCES STADIUM(STADIUM_ID)
);


CREATE TABLE   PLAYER (
PLAYER_ID      CHAR(7) NOT NULL,
PLAYER_NAME    VARCHAR2(20) NOT NULL,
TEAM_ID        CHAR(3) NOT NULL,
E_PLAYER_NAME  VARCHAR2(40),
NICKNAME       VARCHAR2(30),
JOIN_YYYY      CHAR(4),
POSITION       VARCHAR2(10),
BACK_NO        NUMBER(2),
NATION         VARCHAR2(20),
BIRTH_DATE     DATE,
SOLAR          CHAR(1),
HEIGHT         NUMBER(3),
WEIGHT         NUMBER(3),
CONSTRAINT PLAYER_PK PRIMARY KEY (PLAYER_ID),
CONSTRAINT PLAYER_FK FOREIGN KEY (TEAM_ID) REFERENCES TEAM(TEAM_ID) 
);


CREATE TABLE SCHEDULE (
STADIUM_ID   CHAR(3) NOT NULL,
SCHE_DATE    CHAR(8) NOT NULL,
GUBUN        CHAR(1) NOT NULL,
HOMETEAM_ID  CHAR(3) NOT NULL,
AWAYTEAM_ID  CHAR(3) NOT NULL,
HOME_SCORE   NUMBER(2),
AWAY_SCORE   NUMBER(2),
CONSTRAINT SCHEDULE_PK PRIMARY KEY (STADIUM_ID, SCHE_DATE),
CONSTRAINT SCHEDULE_FK FOREIGN KEY (STADIUM_ID) REFERENCES STADIUM(STADIUM_ID)
);



-- Insert STADIUM 20 Records and TEAM 15 Records 

INSERT ALL

INTO STADIUM VALUES ('D03','���ֿ����Ű����','K05',28000,'���� ���ֽ� ������ �ݿ��� 763-1','063','273-1763')
INTO STADIUM VALUES ('B02','�������տ��','K08',27000,'��⵵ ������ �д籸 ��ž�� 486','031','753-3956')
INTO STADIUM VALUES ('C06','���׽�ƿ�ߵ�','K03',25000,'��� ���׽� ���� ���� 1','054','282-2002')
INTO STADIUM VALUES ('D01','������������','K07',20009,'���� ����� ��ȣ�� 700','061','792-5600')
INTO STADIUM VALUES ('B05','��������Ű����','K09',66806,'����Ư���� ������ �������� 66','02','2128-2973')
INTO STADIUM VALUES ('B01','��õ�����Ű����','K04',35000,'��õ������ ���� ���е� 482','031','666-0496')
INTO STADIUM VALUES ('C05','â�����տ��','K11','27085','�泲 â���� �δ뵿 145','055','6644-8468')
INTO STADIUM VALUES ('C04','��깮�������','K01',46102,'��걤���� ���� ���� ��5','052','220-2468')
INTO STADIUM VALUES ('D02','���������Ű����','K10',41000,'���������� ������ ������ 270','042','252-2002')
INTO STADIUM VALUES ('B04','���������Ű����','K02',50000,'������ �ȴޱ� �츸1�� 228����','031','259-2150')
INTO STADIUM VALUES ('A02','���ֿ����Ű����','K12','40245','���ֱ����� ���� ǳ�ϵ� 423-2','062','2468-8642')
INTO STADIUM VALUES ('C02','�λ�ƽþƵ�����','K06',30000,'�λ걤���� ���� ����ŵ� 3�� 210����','051','247-5771')
INTO STADIUM VALUES ('A03','�������հ����','K13',33000,'���� ������ ���� ��58','033','459-3631')
INTO STADIUM VALUES ('A04','���ֿ����Ű����','K14',42256,'���� �������� ��ȯ��','064','3631-2460')
INTO STADIUM VALUES ('A05','�뱸�����Ű����','K15',66422,'�뱸������ ������ ���ﵿ 504','053','602-2011')
INTO STADIUM VALUES ('F01','�뱸�ùΰ����','',30000,'�뱸������','054','')
INTO STADIUM VALUES ('F02','�λ�ùΰ����','',30000,'�λ걤����','051','')
INTO STADIUM VALUES ('F03','�ϻ�����','',20000,'��⵵ �ϻ��','031','')
INTO STADIUM VALUES ('F04','��������','',20000,'�泲 �����','055','')
INTO STADIUM VALUES ('F05','�Ⱦ�����','',20000,'��⵵ �Ⱦ��','031','')

INTO TEAM VALUES ('K05','����','������ͽ�','CHUNBUK HYUNDAI MOTORS FC','1995','D03','560','190','���� ���ֽ� ������ �ݿ��� 763-1 ���ֿ����Ű���� ��','063','273-1763','273-1762','http://www.hyundai-motorsfc.com','')
INTO TEAM VALUES ('K08','����','��ȭõ��','SEONGNAM ILHWA CHUNMA FC','1988','B02','462','130','��⵵ ������ �д籸 ��ž�� 486���� ���� ��2���տ�� ��','031','753-3956','753-4443','http://www.esifc.com','')
INTO TEAM VALUES ('K03','����','��ƿ����','FC POHANG STEELERS','1973','C06','790','050','��� ���׽� �׵��� 614-8 ������� 7��','054','282-2002','282-5955','http://www.steelers.co.kr','')
INTO TEAM VALUES ('K07','����','�巡����','CHUNNAM DRAGONS FC','1994','D01','544','010','���� ����� �ߵ� 1318-5 ����������� 2��','061','792-5600','792-5605','http://www.dragons.co.kr','')
INTO TEAM VALUES ('K09','����','FC����','FOOTBALL CLUB SEOUL','1983','B05','138','221','���� ������ ���굿 515 ������ ����� ��','02','2005-5746','2005-5802','http://www.fcseoul.com','')
INTO TEAM VALUES ('K04','��õ','������Ƽ��','INCHEON UNITED FC','2004','B01','110','728','��õ������ ���� ���е� 482 ��õ�����Ű���� ��','032','2121-5271','2121-5276','http://www.incheonutd.com','')
INTO TEAM VALUES ('K11','�泲','�泲FC','GYEONGNAM FC','2006','C05','111','222','�泲 â���� �δ뵿 145 â�����տ��','055','6644-8468','6644-8488','http://www.gsndfc.co.kr','')
INTO TEAM VALUES ('K01','���','�������','ULSAN HYUNDAI FC','1986','C04','682','060','��걤���� ���� ���ε� ��137-1 ���뽺����Ŭ���Ͽ콺','052','230-6141','230-6145','http://www.uhfc.tv','')
INTO TEAM VALUES ('K10','����','��Ƽ��','DAEJEON CITIZEN FC','1996','D02','301','030','���������� ������ ������ 270 ���������Ű���� ���� 3��','042','252-2002','221-0669','http://www.dcfc.co.kr','')
INTO TEAM VALUES ('K02','����','�Ｚ�������','SUWON SAMSUNG BLUEWINGS FC','1995','B04','440','220','������ �ȴޱ� �츸1�� 228 ���������Ű���� 4��','031','247-2002','257-0766','http://www.bluewings.kr','')
INTO TEAM VALUES ('K12','����','���ֻ�','GWANGJU SANGMU FC','1984','A02','450','419','���ֱ����� ���� ǳ�ϵ� 423-2 ���ֿ����Ű���� ��','062','777-5180','777-5181','http://www.gwangjusmfc.co.kr','')
INTO TEAM VALUES ('K06','�λ�','������ũ','BUSAN IPARK FC','1983','C02','570','050','�λ걤���� ������ ����1�� 2155���� ����ü������ ��','051','555-7101','555-7103','http://www.busanipark.co.kr','')
INTO TEAM VALUES ('K13','����','����FC','GANGWON FC','2008','A03','333','444','���� ��õ�� �߾ӷ� 7 ������ ���߰��� ���� ��','033','459-3631','459-3630','http://www.gangwon-fc.com','')
INTO TEAM VALUES ('K14','����','����������Ƽ��FC','JEJU UNITED FC','1982','A04','555','666','���� �������� ������ 3355-5','064','3631-2460','3631-2468','http://www.jeju-utd.com','')
INTO TEAM VALUES ('K15','�뱸','�뱸FC','DAEGU FC','2002','A05','777','888','�뱸������ ������ ���ﵿ 504 �뱸��Ÿ��� ��','053','5566-3967','5566-3970','http://www.daegufc.co.kr','')

SELECT * FROM DUAL;


-- Insert PLAYER 50 Records  

INSERT ALL

INTO player VALUES ('2009175','�츣���','K06','','','2009','DF','4','����',TO_DATE('30-AUG-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','180','70')
INTO player VALUES ('2007188','������','K06','','','2005','DF','15','',TO_DATE('01-NOV-1982','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','180','74')
INTO player VALUES ('2012073','���ȣ','K06','','','2011','DF','23','',TO_DATE('13-JUL-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','177','72')
INTO player VALUES ('2007178','��μ�','K06','','','','DF','20','',TO_DATE('23-JUN-1983','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','182','73')
INTO player VALUES ('2007191','�����','K06','','���ߵ���,�������','2007','DF','18','',TO_DATE('05-JUN-1984','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','170','61')
INTO player VALUES ('2008384','����ȿ','K06','','������,��Ű��','2008','DF','19','',TO_DATE('23-JUL-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','174','68')
INTO player VALUES ('2008395','�����','K06','','�ޱ�','2010','DF','7','',TO_DATE('09-MAR-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','184','79')
INTO player VALUES ('2011050','�ڻ��','K06','','����ȫ�浿','2011','DF','36','',TO_DATE('14-JUN-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','173','65')
INTO player VALUES ('2007189','���翵','K06','','����','2006','MF','6','',TO_DATE('02-SEP-1983','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','187','75')
INTO player VALUES ('2011049','���¹�','K06','','ŷī','2011','MF','38','',TO_DATE('25-MAY-1992','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','180','71')
INTO player VALUES ('2010107','������','K06','','','2010','MF','37','',TO_DATE('04-JUN-1991','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','178','70')
INTO player VALUES ('2011043','������','K06','','�䷷����','2011','MF','24','',TO_DATE('20-FEB-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','177','73')
INTO player VALUES ('2011044','������','K06','','���漮','2011','MF','13','',TO_DATE('08-SEP-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','178','74')
INTO player VALUES ('2012137','�̰�','K06','�̰� �ǹ� �� �丮�̵���','�̰�','2012','MF','21','�����',TO_DATE('25-OCT-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','181','76')
INTO player VALUES ('2007200','�����','K06','','�����','2007','MF','26','',TO_DATE('15-DEC-1983','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','173','66')
INTO player VALUES ('2012072','�����','K06','','','2012','MF','14','',TO_DATE('22-MAR-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','176','67')
INTO player VALUES ('2009038','�����','K06','','����������','2009','MF','11','',TO_DATE('25-FEB-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','175','68')
INTO player VALUES ('2008365','���¼�','K06','','','2011','MF','30','',TO_DATE('16-JUN-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','177','64')
INTO player VALUES ('2011047','Ȳö��','K06','','��ٸ���','2011','MF','35','',TO_DATE('20-NOV-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','175','68')
INTO player VALUES ('2008235','������','K06','','','','FW','39','',TO_DATE('10-OCT-1986','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','178','71')
INTO player VALUES ('2011048','������','K06','','','2011','FW','25','',TO_DATE('22-MAY-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','182','78')
INTO player VALUES ('2012074','��â��','K06','','�Ӷ�','2012','FW','27','',TO_DATE('10-JAN-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','186','82')
INTO player VALUES ('2012127','���','K06','Sebastiao Pereira do Nascimento','','2012','FW','8','�����',TO_DATE('24-FEB-1986','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','179','78')
INTO player VALUES ('2007182','����ġ','K06','','�ٶ��� �Ƶ�','2006','FW','9','',TO_DATE('16-JAN-1982','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','184','80')
INTO player VALUES ('2007195','�켺��','K06','','����','2006','FW','22','',TO_DATE('18-AUG-1983','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','191','76')
INTO player VALUES ('2010103','����','K06','','¦��','2010','FW','12','',TO_DATE('08-JUL-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','180','71')
INTO player VALUES ('2012075','�̱���','K06','','','2012','FW','29','',TO_DATE('25-SEP-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','177','73')
INTO player VALUES ('2010087','�ϸ�','K06','','','2010','FW','10','�ݷҺ��',TO_DATE('14-MAY-1984','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','168','65')
INTO player VALUES ('2000017','�ڻ�','K06','','','2008','FW','32','',TO_DATE('07-SEP-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','188','80')
INTO player VALUES ('2000018','���丣','K06','','���丣','2011','FW','28','����������',TO_DATE('05-JAN-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','183','79')
INTO player VALUES ('2000021','������','K04','LEE, YOONGYUM','','2002','DF','','',TO_DATE('','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'','178','80')
INTO player VALUES ('2000022','������','K04','HA, JAEHON','','2002','DF','','',TO_DATE('','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'','174','67')
INTO player VALUES ('2000023','����ȣ','K04','KIM, CHUNGHO','','2009','DF','','',TO_DATE('','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'','185','83')
INTO player VALUES ('2000024','�ӱ���','K04','LIM, GIHAN','','2004','DF','','',TO_DATE('','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'','177','85')
INTO player VALUES ('2000025','�����','K04','KIM, KYOUNGTAE','','','DF','','',TO_DATE('','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'','','')
INTO player VALUES ('2012054','������','K04','','','','','31','',TO_DATE('20-APR-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','180','72')
INTO player VALUES ('2008499','����ȣ','K04','','','','GK','60','',TO_DATE('04-JUL-1978','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','185','83')
INTO player VALUES ('2011021','����','K04','','','','GK','1','',TO_DATE('07-NOV-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','192','85')
INTO player VALUES ('2012052','�ѵ���','K04','','','','GK','21','',TO_DATE('25-AUG-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','183','78')
INTO player VALUES ('2012126','�ٿ�','K04','','','','DF','61','',TO_DATE('25-SEP-1992','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','190','80')
INTO player VALUES ('2008182','��ö','K04','','','','DF','15','',TO_DATE('20-AUG-1983','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','176','77')
INTO player VALUES ('2010112','��â��','K04','','','','DF','23','',TO_DATE('31-DEC-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','175','67')
INTO player VALUES ('2008424','����ȣ','K04','','','','DF','2','',TO_DATE('13-MAY-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','179','70')
INTO player VALUES ('2008450','������','K04','','','','DF','5','',TO_DATE('08-DEC-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','177','75')
INTO player VALUES ('2011022','�����','K04','','','','DF','25','',TO_DATE('11-FEB-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','182','75')
INTO player VALUES ('2012053','���ȫ','K04','','','','','30','',TO_DATE('04-FEB-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','178','68')
INTO player VALUES ('2000001','����ȣ','K10','','','','DF','','',TO_DATE('29-JAN-1971','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','','')
INTO player VALUES ('2000002','�����','K10','JEONG, SAMSOO','','','DF','','',TO_DATE('08-FEB-1973','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','','')
INTO player VALUES ('2000003','������','K10','YOU, DONGWOO','','','DF','40','',TO_DATE('07-MAR-1978','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','177','70')
INTO player VALUES ('2000004','������','K10','JEON, GIHYUN','','','DF','','',TO_DATE('06-JUN-1975','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','','')

SELECT * FROM DUAL;


-- Insert PLAYER Other 50 Records  

INSERT ALL

INTO player VALUES ('2012047','������','K10','KANG, SUNGIL','','2012','GK','30','',TO_DATE('04-JUN-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','182','80')
INTO player VALUES ('2010057','�����','K10','KIM, SEUNGJUN','������','2010','GK','1','',TO_DATE('01-SEP-1982','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','183','77')
INTO player VALUES ('2007298','������','K10','LEE, EUNSUNG','��ȣõȲ','2007','GK','21','',TO_DATE('05-APR-1981','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','184','82')
INTO player VALUES ('2007312','�����','K10','JEONG, DAESOO','','2007','DF','15','',TO_DATE('20-MAR-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','184','74')
INTO player VALUES ('2012051','���α�','K10','','','','DF','3','',TO_DATE('25-APR-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','171','65')
INTO player VALUES ('2010110','������','K10','JEONG, SUNGKEUN','','2010','DF','33','',TO_DATE('20-JUN-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','180','73')
INTO player VALUES ('2011098','������','K10','JEONG, YOUNGKWEN','','2011','DF','5','',TO_DATE('12-OCT-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','180','70')
INTO player VALUES ('2007301','������','K10','JEONG, JUNGSOO','','2002','DF','36','',TO_DATE('17-JAN-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','180','74')
INTO player VALUES ('2007309','��â��','K10','KIM, CHANGYUP','','2007','DF','6','',TO_DATE('19-NOV-1984','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','174','64')
INTO player VALUES ('2007299','��ö��','K10','JANG, CHULWOO','���ֱ����','2010','DF','7','',TO_DATE('01-APR-1981','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','172','65')
INTO player VALUES ('2011116','�ݸ�','K10','OMAR PAPA COLY','������Ÿ(Black Camel)','2011','DF','29','���װ�',TO_DATE('20-MAY-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','182','75')
INTO player VALUES ('2007313','ȫ��ö','K10','HONG, KWANGCHUL','','2007','DF','4','',TO_DATE('09-OCT-1984','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','172','65')
INTO player VALUES ('2008461','������','K10','KANG, JUNGHOON','','2008','MF','38','',TO_DATE('20-FEB-1986','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','175','65')
INTO player VALUES ('2007306','������','K10','KONG, OHKYUN','CROW','2007','MF','22','',TO_DATE('10-AUG-1984','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','177','72')
INTO player VALUES ('2012049','������','K10','JEONG, KOOKJIN','','2012','MF','16','',TO_DATE('09-FEB-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','172','62')
INTO player VALUES ('2011099','������','K10','JEONG, DONGSUN','','2011','MF','9','',TO_DATE('15-MAR-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','170','65')
INTO player VALUES ('2010109','�ְ��','K10','CHOI, KUNGGUY','','2010','MF','10','',TO_DATE('10-MAR-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','177','72')
INTO player VALUES ('2010111','�ֳ�ö','K10','CHOI, RAECHEOL','','2010','MF','24','',TO_DATE('20-AUG-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','177','71')
INTO player VALUES ('2012048','�輺��','K10','BAE, SUNGJAE','','2012','MF','28','',TO_DATE('01-JUL-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','178','74')
INTO player VALUES ('2012121','��','K10','','','','MF','25','',TO_DATE('30-APR-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','174','69')
INTO player VALUES ('2012136','����','K10','','','','MF','26','',TO_DATE('03-JUN-1990','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','169','70')
INTO player VALUES ('2010056','�����','K10','KIM, KWANWOO','SIRIUS','2010','MF','8','',TO_DATE('25-FEB-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','175','69')
INTO player VALUES ('2012050','�豤��','K10','KIM, KWANGJIN','','2012','MF','13','',TO_DATE('27-MAY-1982','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','175','75')
INTO player VALUES ('2010113','����','K10','KIM, SANGKYU','','2010','MF','27','',TO_DATE('05-SEP-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','175','65')
INTO player VALUES ('2009151','�ӿ���','K10','LIM, YOUNGJOO','','2009','MF','23','',TO_DATE('08-MAR-1986','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','176','68')
INTO player VALUES ('2011101','�ڿ���','K10','PARK, YOUNGHOON','','2011','MF','12','',TO_DATE('01-MAY-1985','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','174','73')
INTO player VALUES ('2008178','������','K10','HAN, JUNGKOOK','','2011','MF','19','',TO_DATE('19-JUL-1981','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','179','71')
INTO player VALUES ('2012046','������','K10','JEONG, KWANGSUN','','2012','FW','32','',TO_DATE('17-JUN-1993','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','175','68')
INTO player VALUES ('2007315','������','K10','JEONG, EUNJUNG','����(SHARP)','2007','FW','18','',TO_DATE('08-APR-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','184','72')
INTO player VALUES ('2009152','������','K10','JEONG. CHANJOONG','','2009','FW','17','',TO_DATE('14-JUN-1986','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','182','72')
INTO player VALUES ('2011032','�輮','K10','KIM, SEOK','','2012','FW','20','',TO_DATE('01-FEB-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','194','85')
INTO player VALUES ('2011100','Ź�ؼ�','K10','TAK, JUNSUK','','2011','FW','11','',TO_DATE('24-MAR-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','178','69')
INTO player VALUES ('2000011','��ȣ��','K06','','','2010','DF','','',TO_DATE('26-MAR-1971','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','172','77')
INTO player VALUES ('2000012','�ְ���','K06','','','','DF','','',TO_DATE('19-JAN-1971','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','','')
INTO player VALUES ('2000013','������','K06','','','2010','DF','','',TO_DATE('11-JUN-1975','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','180','88')
INTO player VALUES ('2000014','����ǥ','K06','','','2005','DF','','',TO_DATE('27-JAN-1974','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','180','77')
INTO player VALUES ('2000015','������','K06','','','2005','DF','','',TO_DATE('30-MAY-1978','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','180','75')
INTO player VALUES ('2000016','������','K06','','','2006','DF','','',TO_DATE('22-MAY-1980','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','173','82')
INTO player VALUES ('2011052','������','K06','','�Ӳ���','2011','GK','41','',TO_DATE('07-FEB-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','186','78')
INTO player VALUES ('2012076','�����','K06','','','2012','GK','40','',TO_DATE('11-OCT-1989','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','189','83')
INTO player VALUES ('2010108','������','K06','','','2010','GK','31','',TO_DATE('22-NOV-1991','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','187','77')
INTO player VALUES ('2010059','������','K06','','��������','2010','GK','1','',TO_DATE('10-JUN-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','186','78')
INTO player VALUES ('2011053','������','K06','','��������','2011','DF','33','',TO_DATE('28-FEB-1993','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','180','76')
INTO player VALUES ('2007185','����ö','K06','','','2005','DF','3','',TO_DATE('07-NOV-1982','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','176','73')
INTO player VALUES ('2007193','������','K06','','','2005','DF','17','',TO_DATE('03-JUL-1986','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'2','184','68')
INTO player VALUES ('2011055','����ȫ','K06','','���Ӹ�','2011','DF','2','',TO_DATE('13-APR-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','178','70')
INTO player VALUES ('2011046','������','K06','','��������','2011','DF','34','',TO_DATE('02-JUL-1988','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','183','79')
INTO player VALUES ('2010058','�����','K06','','������ ��','2010','DF','5','',TO_DATE('11-MAR-1987','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','184','77')
INTO player VALUES ('2007123','���ӻ�','K04','','','','DF','20','',TO_DATE('17-NOV-1981','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','183','80')
INTO player VALUES ('2007022','������','K04','','','','DF','36','',TO_DATE('07-JUL-1982','DD_MON_YYYY','NLS_DATE_LANGUAGE = AMERICAN'),'1','181','72')


SELECT * FROM DUAL;


-- Insert SCHEDULE 90 Records 

INSERT ALL

INTO schedule VALUES ('C02','20120501','Y','K06','K10','2','0')
INTO schedule VALUES ('B04','20120505','Y','K02','K01','1','2')
INTO schedule VALUES ('B05','20120505','Y','K09','K08','1','3')
INTO schedule VALUES ('B02','20120512','Y','K08','K01','1','1')
INTO schedule VALUES ('C02','20120707','Y','K06','K01','1','2')
INTO schedule VALUES ('B02','20120707','Y','K08','K03','3','2')
INTO schedule VALUES ('D03','20120707','Y','K05','K09','2','1')
INTO schedule VALUES ('D01','20120707','Y','K07','K10','1','0')
INTO schedule VALUES ('B04','20120710','Y','K02','K01','2','1')
INTO schedule VALUES ('D03','20120710','Y','K05','K03','1','1')
INTO schedule VALUES ('D02','20120710','Y','K10','K04','0','2')
INTO schedule VALUES ('C02','20120710','Y','K06','K08','3','1')
INTO schedule VALUES ('D01','20120710','Y','K07','K09','0','0')
INTO schedule VALUES ('C06','20120713','Y','K03','K06','2','1')
INTO schedule VALUES ('B05','20120714','Y','K09','K02','3','0')
INTO schedule VALUES ('B01','20120714','Y','K04','K07','1','0')
INTO schedule VALUES ('D02','20120714','Y','K10','K08','1','1')
INTO schedule VALUES ('D01','20120717','Y','K07','K01','0','0')
INTO schedule VALUES ('C06','20120717','Y','K03','K02','2','0')
INTO schedule VALUES ('B02','20120717','Y','K08','K04','2','1')
INTO schedule VALUES ('C02','20120717','Y','K06','K05','1','2')
INTO schedule VALUES ('B05','20120717','Y','K09','K10','1','1')
INTO schedule VALUES ('D01','20120720','Y','K07','K03','1','1')
INTO schedule VALUES ('B04','20120721','Y','K02','K06','2','2')
INTO schedule VALUES ('D03','20120721','Y','K05','K08','2','2')
INTO schedule VALUES ('B01','20120721','Y','K04','K09','1','3')
INTO schedule VALUES ('D03','20120724','Y','K05','K02','1','1')
INTO schedule VALUES ('D02','20120724','Y','K10','K03','1','1')
INTO schedule VALUES ('C02','20120724','Y','K06','K07','0','1')
INTO schedule VALUES ('B02','20120724','Y','K08','K09','1','1')
INTO schedule VALUES ('C06','20120727','Y','K03','K04','2','1')
INTO schedule VALUES ('D01','20120727','Y','K07','K05','2','1')
INTO schedule VALUES ('C02','20120727','Y','K06','K10','3','0')
INTO schedule VALUES ('B05','20120728','Y','K09','K01','1','1')
INTO schedule VALUES ('B04','20120728','Y','K02','K08','2','2')
INTO schedule VALUES ('B02','20120731','Y','K08','K01','2','0')
INTO schedule VALUES ('B05','20120731','Y','K09','K03','3','1')
INTO schedule VALUES ('D02','20120731','Y','K10','K05','1','0')
INTO schedule VALUES ('B01','20120731','Y','K04','K06','3','2')
INTO schedule VALUES ('B04','20120731','Y','K02','K07','1','2')
INTO schedule VALUES ('B02','20120803','Y','K08','K07','1','0')
INTO schedule VALUES ('C02','20120803','Y','K06','K09','2','1')
INTO schedule VALUES ('D02','20120804','Y','K10','K02','0','3')
INTO schedule VALUES ('D03','20120804','Y','K05','K04','2','1')
INTO schedule VALUES ('B01','20120811','Y','K04','K02','0','2')
INTO schedule VALUES ('B05','20120811','Y','K09','K05','0','1')
INTO schedule VALUES ('C06','20120811','Y','K03','K08','2','0')
INTO schedule VALUES ('D01','20120811','Y','K07','K10','1','1')
INTO schedule VALUES ('D03','20120818','Y','K05','K01','0','2')
INTO schedule VALUES ('C02','20120818','Y','K06','K03','3','1')
INTO schedule VALUES ('B01','20120818','Y','K04','K07','1','0')
INTO schedule VALUES ('B04','20120818','Y','K02','K09','1','2')
INTO schedule VALUES ('B02','20120818','Y','K08','K10','3','1')
INTO schedule VALUES ('B04','20120824','Y','K02','K01','1','1')
INTO schedule VALUES ('D03','20120824','Y','K05','K03','3','3')
INTO schedule VALUES ('B02','20120824','Y','K08','K06','4','3')
INTO schedule VALUES ('D02','20120825','Y','K10','K04','1','1')
INTO schedule VALUES ('B05','20120825','Y','K09','K07','1','1')
INTO schedule VALUES ('C06','20120828','Y','K03','K02','0','0')
INTO schedule VALUES ('C02','20120828','Y','K06','K05','1','1')
INTO schedule VALUES ('B01','20120828','Y','K04','K08','2','3')
INTO schedule VALUES ('B05','20120828','Y','K09','K10','2','0')
INTO schedule VALUES ('D02','20120901','Y','K10','K01','2','3')
INTO schedule VALUES ('D01','20120901','Y','K07','K03','0','1')
INTO schedule VALUES ('B04','20120901','Y','K02','K06','1','1')
INTO schedule VALUES ('D03','20120901','Y','K05','K08','3','3')
INTO schedule VALUES ('B01','20120901','Y','K04','K09','2','1')
INTO schedule VALUES ('D01','20120911','N','K07','K05','','')
INTO schedule VALUES ('B05','20120911','N','K09','K01','','')
INTO schedule VALUES ('B04','20120911','N','K02','K08','','')
INTO schedule VALUES ('B01','20120911','N','K04','K03','','')
INTO schedule VALUES ('D02','20120911','N','K10','K06','','')
INTO schedule VALUES ('C02','20120914','N','K06','K04','','')
INTO schedule VALUES ('C06','20120914','N','K03','K09','','')
INTO schedule VALUES ('B02','20120914','N','K08','K01','','')
INTO schedule VALUES ('D01','20120914','N','K07','K02','','')
INTO schedule VALUES ('D03','20120915','N','K05','K10','','')
INTO schedule VALUES ('D02','20120918','N','K10','K02','','')
INTO schedule VALUES ('B02','20120918','N','K08','K07','','')
INTO schedule VALUES ('B05','20120918','N','K09','K06','','')
INTO schedule VALUES ('D03','20120918','N','K05','K04','','')
INTO schedule VALUES ('B04','20120925','N','K02','K10','','')
INTO schedule VALUES ('C06','20120925','N','K03','K01','','')
INTO schedule VALUES ('B01','20120925','N','K04','K05','','')
INTO schedule VALUES ('D01','20120925','N','K07','K08','','')
INTO schedule VALUES ('B05','20120925','N','K09','K06','','')
INTO schedule VALUES ('D01','20121019','N','K07','K02','','')
INTO schedule VALUES ('C06','20121019','N','K03','K09','','')
INTO schedule VALUES ('D02','20121020','N','K10','K05','','')
INTO schedule VALUES ('C02','20121020','N','K06','K04','','')

SELECT * FROM DUAL;


-- Insert SCHEDULE Other 90 Records 

INSERT ALL

INTO schedule VALUES ('C06','20121023','N','K03','K04','','')
INTO schedule VALUES ('D03','20121023','N','K05','K07','','')
INTO schedule VALUES ('C02','20121023','N','K06','K10','','')
INTO schedule VALUES ('B02','20121023','N','K08','K02','','')
INTO schedule VALUES ('D01','20121026','N','K07','K06','','')
INTO schedule VALUES ('D02','20121027','N','K10','K03','','')
INTO schedule VALUES ('B01','20121027','N','K04','K01','','')
INTO schedule VALUES ('B05','20121027','N','K09','K08','','')
INTO schedule VALUES ('B04','20121027','N','K02','K05','','')
INTO schedule VALUES ('B04','20121030','N','K02','K04','','')
INTO schedule VALUES ('D02','20121030','N','K10','K08','','')
INTO schedule VALUES ('C06','20121102','N','K03','K07','','')
INTO schedule VALUES ('B05','20121103','N','K09','K04','','')
INTO schedule VALUES ('C02','20121103','N','K06','K02','','')
INTO schedule VALUES ('B02','20121103','N','K08','K05','','')
INTO schedule VALUES ('D03','20121106','N','K05','K06','','')
INTO schedule VALUES ('D01','20121106','N','K07','K01','','')
INTO schedule VALUES ('D02','20121106','N','K10','K09','','')
INTO schedule VALUES ('B01','20121106','N','K04','K08','','')
INTO schedule VALUES ('B04','20121106','N','K02','K03','','')
INTO schedule VALUES ('C06','20121109','N','K03','K05','','')
INTO schedule VALUES ('B05','20121110','N','K09','K07','','')
INTO schedule VALUES ('B01','20121110','N','K04','K10','','')
INTO schedule VALUES ('B02','20121110','N','K08','K06','','')
INTO schedule VALUES ('D01','20121113','N','K07','K04','','')
INTO schedule VALUES ('C02','20121113','N','K06','K03','','')
INTO schedule VALUES ('B04','20121113','N','K02','K09','','')
INTO schedule VALUES ('D03','20121113','N','K05','K01','','')
INTO schedule VALUES ('B05','20121117','N','K09','K05','','')
INTO schedule VALUES ('D02','20121117','N','K10','K07','','')
INTO schedule VALUES ('C06','20121117','N','K03','K08','','')
INTO schedule VALUES ('B01','20121117','N','K04','K02','','')
INTO schedule VALUES ('C04','20120508','Y','K01','K08','1','3')
INTO schedule VALUES ('C04','20120713','Y','K01','K05','0','0')
INTO schedule VALUES ('C04','20120720','Y','K01','K10','0','0')
INTO schedule VALUES ('C04','20120724','Y','K01','K04','1','1')
INTO schedule VALUES ('C04','20120803','Y','K01','K03','3','0')
INTO schedule VALUES ('C04','20120811','Y','K01','K06','0','0')
INTO schedule VALUES ('C04','20120828','Y','K01','K07','0','1')
INTO schedule VALUES ('C04','20120918','N','K01','K03','','')
INTO schedule VALUES ('C04','20121019','N','K01','K08','','')
INTO schedule VALUES ('C04','20121023','N','K01','K09','','')
INTO schedule VALUES ('C04','20121102','N','K01','K10','','')
INTO schedule VALUES ('C04','20121110','N','K01','K02','','')
INTO schedule VALUES ('C04','20121117','N','K01','K06','','')
INTO schedule VALUES ('C04','20121124','N','K01','K08','','')
INTO schedule VALUES ('C06','20120317','Y','K03','K02','1','2')
INTO schedule VALUES ('B02','20120317','Y','K08','K04','6','0')
INTO schedule VALUES ('D02','20120317','Y','K10','K06','2','1')
INTO schedule VALUES ('C05','20120317','Y','K11','K09','2','2')
INTO schedule VALUES ('D01','20120320','Y','K07','K01','1','2')
INTO schedule VALUES ('D03','20120320','Y','K05','K03','1','0')
INTO schedule VALUES ('B04','20120320','Y','K02','K08','2','3')
INTO schedule VALUES ('B05','20120320','Y','K09','K10','2','0')
INTO schedule VALUES ('B04','20120323','Y','K02','K05','2','0')
INTO schedule VALUES ('C02','20120324','Y','K06','K01','1','2')
INTO schedule VALUES ('B01','20120324','Y','K04','K03','1','1')
INTO schedule VALUES ('B05','20120324','Y','K09','K07','1','0')
INTO schedule VALUES ('D01','20120327','Y','K07','K06','2','1')
INTO schedule VALUES ('C06','20120327','Y','K03','K08','1','0')
INTO schedule VALUES ('C05','20120327','Y','K11','K10','0','1')
INTO schedule VALUES ('D03','20120406','Y','K05','K04','3','2')
INTO schedule VALUES ('B01','20120410','Y','K04','K02','2','0')
INTO schedule VALUES ('B02','20120410','Y','K08','K05','2','1')
INTO schedule VALUES ('D02','20120410','Y','K10','K07','1','1')
INTO schedule VALUES ('C02','20120410','Y','K06','K09','1','4')
INTO schedule VALUES ('D02','20120414','Y','K10','K01','0','2')
INTO schedule VALUES ('B02','20120414','Y','K08','K03','1','1')
INTO schedule VALUES ('B01','20120414','Y','K04','K05','1','0')
INTO schedule VALUES ('C02','20120414','Y','K06','K07','2','0')
INTO schedule VALUES ('D03','20120420','Y','K05','K08','2','2')
INTO schedule VALUES ('D01','20120420','Y','K07','K10','0','1')
INTO schedule VALUES ('B04','20120421','Y','K02','K04','3','2')
INTO schedule VALUES ('B05','20120421','Y','K09','K06','1','0')
INTO schedule VALUES ('B02','20120424','Y','K08','K02','1','1')
INTO schedule VALUES ('C06','20120424','Y','K03','K05','1','2')
INTO schedule VALUES ('C05','20120424','Y','K11','K07','1','2')
INTO schedule VALUES ('D02','20120424','Y','K10','K09','1','3')
INTO schedule VALUES ('C06','20120427','Y','K03','K04','0','3')
INTO schedule VALUES ('C05','20120427','Y','K11','K06','5','2')
INTO schedule VALUES ('D01','20120427','Y','K07','K09','0','1')
INTO schedule VALUES ('D03','20120428','Y','K05','K02','1','2')
INTO schedule VALUES ('B05','20120501','Y','K09','K01','0','0')
INTO schedule VALUES ('B04','20120501','Y','K02','K03','1','2')
INTO schedule VALUES ('B01','20120501','Y','K04','K08','2','2')
INTO schedule VALUES ('D03','20120904','Y','K05','K02','1','2')
INTO schedule VALUES ('B02','20120904','Y','K08','K09','1','0')
INTO schedule VALUES ('C05','20120904','Y','K11','K04','2','2')
INTO schedule VALUES ('C06','20120904','Y','K03','K10','0','0')
INTO schedule VALUES ('C02','20120904','Y','K06','K07','2','2')

SELECT * FROM DUAL;
