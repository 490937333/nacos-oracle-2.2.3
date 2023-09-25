prompt PL/SQL Developer Export user Objects for user user@.1
prompt Created by ower on 2023Äê9ÔÂ25ÈÕ
set define off
spool nacos-oracle11g.log

prompt
prompt Creating table CONFIG_INFO
prompt ==========================
prompt
create table user.CONFIG_INFO
(
  id                 NUMBER not null,
  data_id            VARCHAR2(255) not null,
  group_id           VARCHAR2(255),
  content            CLOB not null,
  md5                VARCHAR2(32),
  gmt_create         DATE not null,
  gmt_modified       DATE not null,
  src_user           CLOB,
  src_ip             VARCHAR2(50),
  app_name           VARCHAR2(128),
  tenant_id          VARCHAR2(128),
  c_desc             VARCHAR2(200),
  c_use              VARCHAR2(64),
  effect             VARCHAR2(64),
  type               VARCHAR2(64),
  c_schema           CLOB,
  encrypted_data_key CLOB
)
tablespace user
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index user.UK_CONFIGINFO_DATAGROUPTENANT on user.CONFIG_INFO (DATA_ID, GROUP_ID, TENANT_ID)
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table user.CONFIG_INFO
  add constraint PK_CONFIG_INFO_ID primary key (ID)
  using index 
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CONFIG_INFO_AGGR
prompt ===============================
prompt
create table user.CONFIG_INFO_AGGR
(
  id           NUMBER not null,
  data_id      VARCHAR2(200) not null,
  group_id     VARCHAR2(200) not null,
  datum_id     VARCHAR2(200) not null,
  content      CLOB not null,
  gmt_modified DATE not null,
  app_name     VARCHAR2(128),
  tenant_id    VARCHAR2(128)
)
tablespace user
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index user.UK_AGGR_DATAGROUPTENANTDATUM on user.CONFIG_INFO_AGGR (DATA_ID, GROUP_ID, DATUM_ID, TENANT_ID)
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table user.CONFIG_INFO_AGGR
  add constraint PK_CONFIG_INFO_AGGR_ID primary key (ID)
  using index 
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CONFIG_INFO_BETA
prompt ===============================
prompt
create table user.CONFIG_INFO_BETA
(
  id                 NUMBER not null,
  data_id            VARCHAR2(255) not null,
  group_id           VARCHAR2(128) not null,
  app_name           VARCHAR2(128),
  content            CLOB not null,
  beta_ips           VARCHAR2(1024),
  md5                VARCHAR2(32),
  gmt_create         DATE not null,
  gmt_modified       DATE not null,
  src_user           CLOB,
  src_ip             VARCHAR2(50),
  tenant_id          VARCHAR2(128),
  encrypted_data_key CLOB
)
tablespace user
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index user.UK_BETA_DATAGROUPTENANT on user.CONFIG_INFO_BETA (DATA_ID, GROUP_ID, TENANT_ID)
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table user.CONFIG_INFO_BETA
  add constraint PK_CONFIG_INFO_BETA_ID primary key (ID)
  using index 
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CONFIG_INFO_TAG
prompt ==============================
prompt
create table user.CONFIG_INFO_TAG
(
  id           NUMBER not null,
  data_id      VARCHAR2(255) not null,
  group_id     VARCHAR2(128) not null,
  tenant_id    VARCHAR2(128),
  tag_id       VARCHAR2(128) not null,
  app_name     VARCHAR2(128),
  content      CLOB not null,
  md5          VARCHAR2(32),
  gmt_create   DATE not null,
  gmt_modified DATE not null,
  src_user     CLOB,
  src_ip       VARCHAR2(50)
)
tablespace user
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index user.UK_TAG_DATAGROUPTENANTTAG on user.CONFIG_INFO_TAG (DATA_ID, GROUP_ID, TENANT_ID, TAG_ID)
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table user.CONFIG_INFO_TAG
  add constraint PK_CONFIG_INFO_TAG_ID primary key (ID)
  using index 
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CONFIG_TAGS_RELATION
prompt ===================================
prompt
create table user.CONFIG_TAGS_RELATION
(
  id        NUMBER not null,
  tag_name  VARCHAR2(128) not null,
  tag_type  VARCHAR2(64),
  data_id   VARCHAR2(255) not null,
  group_id  VARCHAR2(128) not null,
  tenant_id VARCHAR2(128),
  nid       NUMBER not null
)
tablespace user
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index user.IDX_TENANT_ID on user.CONFIG_TAGS_RELATION (TENANT_ID)
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index user.UK_TAGRELATION_CONFIGIDTAG on user.CONFIG_TAGS_RELATION (ID, TAG_NAME, TAG_TYPE)
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table user.CONFIG_TAGS_RELATION
  add constraint PK_CONFIG_TAGS_RELATION_ID primary key (NID)
  using index 
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table GROUP_CAPACITY
prompt =============================
prompt
create table user.GROUP_CAPACITY
(
  id                NUMBER(20) not null,
  group_id          VARCHAR2(128) not null,
  quota             NUMBER(20) not null,
  usage             NUMBER(20) not null,
  max_size          NUMBER(20) not null,
  max_aggr_count    NUMBER(20) not null,
  max_aggr_size     NUMBER(20) not null,
  max_history_count NUMBER(20) not null,
  gmt_create        DATE default SYSDATE not null,
  gmt_modified      DATE default SYSDATE not null
)
tablespace user
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table user.GROUP_CAPACITY
  add constraint PK_GROUP_CAPACITY primary key (ID)
  using index 
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table user.GROUP_CAPACITY
  add constraint UK_GROUP_ID unique (GROUP_ID)
  using index 
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table HIS_CONFIG_INFO
prompt ==============================
prompt
create table user.HIS_CONFIG_INFO
(
  id                 NUMBER(20) not null,
  nid                NUMBER(20) not null,
  data_id            VARCHAR2(255) not null,
  group_id           VARCHAR2(128) not null,
  app_name           VARCHAR2(128),
  content            CLOB not null,
  md5                VARCHAR2(32),
  gmt_create         DATE default SYSDATE not null,
  gmt_modified       DATE default SYSDATE not null,
  src_user           CLOB,
  src_ip             VARCHAR2(50),
  op_type            CHAR(10),
  tenant_id          VARCHAR2(128),
  encrypted_data_key CLOB
)
tablespace user
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index user.IDX_DID on user.HIS_CONFIG_INFO (DATA_ID)
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index user.IDX_GMT_CREATE on user.HIS_CONFIG_INFO (GMT_CREATE)
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index user.IDX_GMT_MODIFIED on user.HIS_CONFIG_INFO (GMT_MODIFIED)
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table user.HIS_CONFIG_INFO
  add constraint PK_HIS_CONFIG_INFO primary key (ID, NID)
  using index 
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PERMISSIONS
prompt ==========================
prompt
create table user.PERMISSIONS
(
  role      VARCHAR2(50) not null,
  resources VARCHAR2(255) not null,
  action    VARCHAR2(8) not null
)
tablespace user
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ROLES
prompt ====================
prompt
create table user.ROLES
(
  username VARCHAR2(50) not null,
  role     VARCHAR2(50) not null
)
tablespace user
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index user.IDX_user_ROLE on user.ROLES (userNAME, ROLE)
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TENANT_CAPACITY
prompt ==============================
prompt
create table user.TENANT_CAPACITY
(
  id                NUMBER(20) not null,
  tenant_id         VARCHAR2(128) not null,
  quota             NUMBER(20) not null,
  usage             NUMBER(20) not null,
  max_size          NUMBER(20) not null,
  max_aggr_count    NUMBER(20) not null,
  max_aggr_size     NUMBER(20) not null,
  max_history_count NUMBER(20) not null,
  gmt_create        DATE default SYSDATE not null,
  gmt_modified      DATE default SYSDATE not null
)
tablespace user
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table user.TENANT_CAPACITY
  add constraint PK_TENANT_CAPACITY primary key (ID)
  using index 
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table user.TENANT_CAPACITY
  add constraint UK_TENANT_ID unique (TENANT_ID)
  using index 
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TENANT_INFO
prompt ==========================
prompt
create table user.TENANT_INFO
(
  id            NUMBER(20) not null,
  kp            VARCHAR2(128) not null,
  tenant_id     VARCHAR2(128),
  tenant_name   VARCHAR2(128),
  tenant_desc   VARCHAR2(256),
  create_source VARCHAR2(32),
  gmt_create    NUMBER(20),
  gmt_modified  NUMBER(20)
)
tablespace user
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index user.IDX_TENANT_INFO_ID on user.TENANT_INFO (TENANT_ID)
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table user.TENANT_INFO
  add constraint PK_TENANT_INFO primary key (ID)
  using index 
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table user.TENANT_INFO
  add constraint UK_TENANT_INFO_KPTENANTID unique (KP, TENANT_ID)
  using index 
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table userS
prompt ====================
prompt
create table user.userS
(
  username VARCHAR2(50) not null,
  password VARCHAR2(500) not null,
  enabled  CHAR(1) not null
)
tablespace user
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table user.userS
  add constraint PK_user primary key (userNAME)
  using index 
  tablespace user
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating sequence CONFIG_INFO_AGGR_SEQ
prompt ======================================
prompt
create sequence user.CONFIG_INFO_AGGR_SEQ
minvalue 1
maxvalue 99999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence CONFIG_INFO_BETA_SEQ
prompt ======================================
prompt
create sequence user.CONFIG_INFO_BETA_SEQ
minvalue 1
maxvalue 99999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence CONFIG_INFO_SEQ
prompt =================================
prompt
create sequence user.CONFIG_INFO_SEQ
minvalue 1
maxvalue 99999999999999
start with 901
increment by 1
cache 20;

prompt
prompt Creating sequence CONFIG_INFO_TAG_SEQ
prompt =====================================
prompt
create sequence user.CONFIG_INFO_TAG_SEQ
minvalue 1
maxvalue 99999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence CONFIG_TAGS_RELATION_SEQ
prompt ==========================================
prompt
create sequence user.CONFIG_TAGS_RELATION_SEQ
minvalue 1
maxvalue 99999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence GROUP_CAPACITY_SEQ
prompt ====================================
prompt
create sequence user.GROUP_CAPACITY_SEQ
minvalue 1
maxvalue 99999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence HIS_CONFIG_INFO_SEQ
prompt =====================================
prompt
create sequence user.HIS_CONFIG_INFO_SEQ
minvalue 1
maxvalue 99999999999999
start with 1001
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CONFIG_INFO
prompt =================================
prompt
create sequence user.SEQ_CONFIG_INFO
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CONFIG_INFO_AGGR
prompt ======================================
prompt
create sequence user.SEQ_CONFIG_INFO_AGGR
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CONFIG_INFO_BETA
prompt ======================================
prompt
create sequence user.SEQ_CONFIG_INFO_BETA
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CONFIG_INFO_TAG
prompt =====================================
prompt
create sequence user.SEQ_CONFIG_INFO_TAG
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CONFIG_TAGS_RELATION
prompt ==========================================
prompt
create sequence user.SEQ_CONFIG_TAGS_RELATION
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_HISTORY_CONFIG_INFO
prompt =========================================
prompt
create sequence user.SEQ_HISTORY_CONFIG_INFO
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_TENANT_INFO
prompt =================================
prompt
create sequence user.SEQ_TENANT_INFO
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TENANT_CAPACITY_SEQ
prompt =====================================
prompt
create sequence user.TENANT_CAPACITY_SEQ
minvalue 1
maxvalue 99999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence TENANT_INFO_SEQ
prompt =================================
prompt
create sequence user.TENANT_INFO_SEQ
minvalue 1
maxvalue 99999999999999
start with 141
increment by 1
cache 20;

prompt
prompt Creating trigger CONFIG_INFO_AGGR_TRIGGER
prompt =========================================
prompt
create or replace trigger user.config_info_aggr_trigger
  before insert on config_info_aggr
  for each row
begin
  select config_info_aggr_seq.nextval into :new.id from sys.dual;
end;
/

prompt
prompt Creating trigger CONFIG_INFO_BETA_TRIGGER
prompt =========================================
prompt
create or replace trigger user.config_info_beta_trigger
  before insert on config_info_beta
  for each row
begin
  select config_info_beta_seq.nextval into :new.id from sys.dual;
end;
/

prompt
prompt Creating trigger CONFIG_INFO_TAG_TRIGGER
prompt ========================================
prompt
create or replace trigger user.config_info_tag_trigger
  before insert on config_info_tag
  for each row
begin
  select config_info_tag_seq.nextval into :new.id from sys.dual;
end;
/

prompt
prompt Creating trigger CONFIG_INFO_TRIGGER
prompt ====================================
prompt
create or replace trigger user.config_info_trigger
  before insert on config_info
  for each row
begin
  select config_info_seq.nextval into :new.id from sys.dual;
end;
/

prompt
prompt Creating trigger CONFIG_TAGS_RELATION_TRIGGER
prompt =============================================
prompt
create or replace trigger user.config_tags_relation_trigger
  before insert on config_tags_relation
  for each row
begin
  select config_tags_relation_seq.nextval into :new.nid from sys.dual;
end;
/

prompt
prompt Creating trigger GROUP_CAPACITY_TRIGGER
prompt =======================================
prompt
create or replace trigger user.group_capacity_trigger
  before insert on group_capacity
  for each row
begin
  select group_capacity_seq.nextval into :new.id from sys.dual;
end;
/

prompt
prompt Creating trigger HIS_CONFIG_INFO_TRIGGER
prompt ========================================
prompt
create or replace trigger user.his_config_info_trigger
  before insert on his_config_info
  for each row
begin
  select his_config_info_seq.nextval into :new.nid from sys.dual;
end;
/

prompt
prompt Creating trigger TENANT_CAPACITY_TRIGGER
prompt ========================================
prompt
create or replace trigger user.tenant_capacity_trigger
  before insert on tenant_capacity
  for each row
begin
  select tenant_capacity_seq.nextval into :new.id from sys.dual;
end;
/

prompt
prompt Creating trigger TENANT_INFO_TRIGGER
prompt ====================================
prompt
create or replace trigger user.tenant_info_trigger
  before insert on tenant_info
  for each row
begin
  select tenant_info_seq.nextval into :new.id from sys.dual;
end;
/


prompt Done
spool off
set define on
