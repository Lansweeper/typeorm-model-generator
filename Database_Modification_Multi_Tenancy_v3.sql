BEGIN TRANSACTION;
-- step 1 - create db schema

--
-- er/studio data architect 11.0 sql code generation
-- project :      lansweeperdb.dm1
--
-- date created : tuesday, june 05, 2018 07:52:13
-- target dbms : postgresql 9.x
--

-- 
-- table: htblagentconfig 
--

create table htblagentconfig(
    agentconfigid          int4       not null,
    agentid                int4       not null,
    shortcuts              boolean    default (false),
    emailoncreation        boolean    default (false),
    emailonassigned        boolean    default (false),
    emailonagentupdate     boolean    default (false),
    emailonclientupdate    boolean    default (false),
    emailonstatechange     boolean    default (false),
    emailonmyupdate        boolean    default (false),
    emailonteamchange      boolean    default (false) not null,
    primary key (agentconfigid)
)
;



-- 
-- table: htblagentlicenses 
--

create table htblagentlicenses(
    licenseid         int4             not null,
    key               varchar(2000)    not null,
    orderreference    varchar(250),
    licensee          varchar(150),
    primary key (licenseid)
)
;



-- 
-- table: htblagents 
--

create table htblagents(
    agentid                 int4         not null,
    userid                  int4         not null,
    active                  boolean,
    notificationschecked    timestamp    default (now()) not null,
    footer                  text         default (''),
    disabledbysystem        boolean      default (false) not null,
    primary key (agentid)
)
;



-- 
-- table: htblagentteam 
--

create table htblagentteam(
    agentid      int4    not null,
    teamid       int4    not null,
    webroleid    int4    not null,
    primary key (agentid, teamid, webroleid)
)
;



-- 
-- table: htblassignexclusions 
--

create table htblassignexclusions(
    assignexclusionid    int4    not null,
    type                 int4    not null,
    typeid               int4    not null,
    primary key (assignexclusionid)
)
;



-- 
-- table: htblattachements 
--

create table htblattachements(
    attachmentid    int4            not null,
    noteid          int4            not null,
    fileid          int4            not null,
    mediatype       varchar(100)    not null,
    contentid       varchar(100),
    filename        varchar(256),
    deleted         boolean      default (false) not null,
    primary key (attachmentid)
)
;



-- 
-- table: htblautomaticclose 
--

create table htblautomaticclose(
    autocloseid    int4         not null,
    time1          int4         not null,
    time2          int4         not null,
    time3          int4         not null,
    day1           boolean      not null,
    day2           boolean      not null,
    day3           boolean      not null,
    mail1          boolean      not null,
    mail2          boolean      not null,
    message1       text         not null,
    message2       text         not null,
    lastedited     timestamp,
    primary key (autocloseid)
)
;



-- 
-- table: htblautomaticcloselang 
--

create table htblautomaticcloselang(
    autocloseid    int4    not null,
    language       int4    not null,
    message1       text,
    message2       text,
    primary key (autocloseid, language)
)
;



-- 
-- table: htblautomaticcloseticketstates 
--

create table htblautomaticcloseticketstates(
    autocloseid      int4    not null,
    ticketstateid    int4    not null,
    primary key (autocloseid, ticketstateid)
)
;



-- 
-- table: htblautomaticclosetickettypes 
--

create table htblautomaticclosetickettypes(
    autocloseid     int4    not null,
    tickettypeid    int4    not null,
    primary key (autocloseid, tickettypeid)
)
;



-- 
-- table: htblbusinesshours 
--

create table htblbusinesshours(
    mon       timestamp    default ('1900-01-02 08:00:00.000') not null,
    mon2      timestamp    default ('1900-01-02 17:30:00.000') not null,
    tue       timestamp    default ('1900-01-02 08:00:00.000') not null,
    tue2      timestamp    default ('1900-01-02 17:30:00.000') not null,
    wed       timestamp    default ('1900-01-02 08:00:00.000') not null,
    wed2      timestamp    default ('1900-01-02 17:30:00.000') not null,
    thu       timestamp    default ('1900-01-02 08:00:00.000') not null,
    thu2      timestamp    default ('1900-01-02 17:30:00.000') not null,
    fri       timestamp    default ('1900-01-02 08:00:00.000') not null,
    fri2      timestamp    default ('1900-01-02 17:30:00.000') not null,
    sat       timestamp    default ('1900-01-02 08:00:00.000') not null,
    sat2      timestamp    default ('1900-01-02 17:30:00.000') not null,
    sun       timestamp    default ('1900-01-02 08:00:00.000') not null,
    sun2      timestamp    default ('1900-01-02 17:30:00.000') not null,
    monnot    boolean      default (false),
    tuenot    boolean      default (false),
    wednot    boolean      default (false),
    thunot    boolean      default (false),
    frinot    boolean      default (false),
    satnot    boolean      default (true),
    sunnot    boolean      default (true)
)
;



-- 
-- table: htblcalendarsettings 
--

create table htblcalendarsettings(
    "settingid"           int4            not null,
    "userid"              int4            not null,
    "eventtypefilter"     varchar(100),
    "agentfilter"         varchar(100),
    "teamfilter"          varchar(100),
    "myeventfilter"       boolean,
    "disabledeventtypes"  varchar(100),
    primary key ("settingid")
)
;



-- 
-- table: htblcustomfields 
--

create table htblcustomfields(
    fieldid           int4            not null,
    name              varchar(500),
    type              int4            not null,
    labeltext         varchar(500),
    editable          boolean         not null,
    showinoverview    boolean      default (false),
    showinsummary     boolean      default (false),
    primary key (fieldid)
)
;



-- 
-- table: htblcustomfieldslang 
--

create table htblcustomfieldslang(
    fieldid      int4            not null,
    language     int4            not null,
    name         varchar(500),
    labeltext    varchar(500),
    primary key (fieldid, language)
)
;



-- 
-- table: htblcustomfieldvaluelinks 
--

create table htblcustomfieldvaluelinks(
    linkid           int4    not null,
    fieldvalueid     int4    not null,
    fieldid          int4    not null,
    sortorder        int4    default ((1)),
    parentfieldid    int4,
    primary key (linkid)
)
;



-- 
-- table: htblcustomfieldvalues 
--

create table htblcustomfieldvalues(
    fieldvalueid    int4            not null,
    fieldid         int4            not null,
    value           varchar(500),
    color           varchar(10)     default ('#ffffff'),
    color2          varchar(10)     default ('#ffffff'),
    visible         boolean      default (true) not null,
    primary key (fieldvalueid)
)
;



-- 
-- table: htblcustomticketfilteritems 
--

create table htblcustomticketfilteritems(
    filteritemid    int4            not null,
    filterid        int4            not null,
    type            int4            not null,
    itemid          int4            not null,
    value           varchar(150),
    primary key (filteritemid)
)
;



-- 
-- table: htblcustomticketfilters 
--

create table htblcustomticketfilters(
    filterid       int4            not null,
    title          varchar(100)    not null,
    agents         varchar(500)    default ('') not null,
    clients        varchar(500)    default ('') not null,
    flagged        int4            default ((0)) not null,
    datefrom       timestamp,
    dateto         timestamp,
    spam           boolean      default (false),
    userid         int4,
    assigned       boolean      default (false),
    unassigned     boolean      default (false),
    related        boolean      default (false),
    slaovertime    boolean      default (false),
    subscribed     boolean      default (false),
    agentinit      boolean      default (false),
    search         varchar(150)    default (''),
    unanswered     boolean      default (false),
    sort           int4            default ((1)),
    "order"          varchar(5)      default ('asc'),
    top            int4            default ((100)),
    primary key (filterid)
)
;



-- 
-- table: htbldeadlines 
--

create table htbldeadlines(
    deadlineid     int4            not null,
    image          varchar(100),
    time           int8            default ((1440)),
    description    varchar(150),
    primary key (deadlineid)
)
;



-- 
-- table: htblemailaccounts 
--

create table htblemailaccounts(
    accountid                 int4             not null,
    "smtpserver"              varchar(250)     not null,
    incomingmailserver        varchar(250)     not null,
    address                   varchar(250)     not null,
    displayname               varchar(250)     not null,
    sslincoming               int4             default ((0)),
    ssloutgoing               int4             default ((0)),
    authenticationincoming    boolean      default (false),
    authenticationoutgoing    boolean      default (false),
    usernameincoming          varchar(50),
    usernameoutgoing          varchar(50),
    passwordincoming          varchar(1000),
    passwordoutgoing          varchar(1000),
    "smtpport"                int4             not null,
    serverport                int4             not null,
    "default"                   boolean      default (false),
    protocol                  int2             not null,
    inboxfolders              varchar(500)     default ('') not null,
    archivefolder             varchar(500)     default ('') not null,
    trashfolder               varchar(500)     default ('') not null,
    "lastchanged"             timestamp        default (now()) not null,
    errorincoming             int2             default ((0)),
    erroroutgoing             int2             default ((0)),
    lasttried                 timestamp        default (null),
    aliases                   text             default (''),
    "passwordkeyhash"         int4,
    noincoming                boolean      default (false) not null,
    nooutgoing                boolean      default (false) not null,
    protocoloutgoing          int2             default ((1)) not null,
    primary key (accountid)
)
;



-- 
-- table: htblemailaccountslang 
--

create table htblemailaccountslang(
    accountid      int4            not null,
    language       int4            not null,
    displayname    varchar(250),
    primary key (accountid, language)
)
;



-- 
-- table: htblemailaccountsteams 
--

create table htblemailaccountsteams(
    teamid       int4    not null,
    accountid    int4    not null,
    primary key (teamid, accountid)
)
;



-- 
-- table: htblemailfilters 
--

create table htblemailfilters(
    filterid    int4            not null,
    type        int4            not null,
    filter      varchar(250),
    primary key (filterid)
)
;



-- 
-- table: htblemailsetup 
--

create table htblemailsetup(
    timeout                  int4             not null,
    historytime              int4             not null,
    historytype              int4             not null,
    rejectunknownid          boolean      default (false),
    addnewclient             int4             default ('1'),
    accepteddomains          varchar(2500),
    includegraphics          boolean      default (true),
    clayoutclient            int4             default ('1'),
    clayoutticket            int4             default ('2'),
    clayoutnotes             int4             default ('3'),
    cnotes                   int4             default ('-1'),
    alayoutclient            int4             default ('1'),
    alayoutticket            int4             default ('2'),
    alayoutnotes             int4             default ('3'),
    anotes                   int4             default ('-1'),
    interfacelinks           boolean      default (false),
    actionlinks              boolean      default (true),
    threshold                int4             default ('10'),
    footer                   text,
    emailprefix              varchar(50)      default (''),
    cannotaddclient          boolean      default (false),
    cannotaddclienttext      varchar(1000)    default (''),
    interfacelinkhostname    varchar(250)     default (''),
    divider                  varchar(250)     default ('### everything above this line is added to your ticket ###'),
    dividerregex             varchar(250)     default ('\#\#\#\s+everything\s+above\s+this\s+line\s+is\s+added\s+to\s+your\s+ticket\s+\#\#\#'),
    historycleanup           timestamp        default (now()) not null,
    allowkblinks             boolean      default (false),
    emailstyle               int4             default ((1)) not null,
    footertype               int4             default ((1)) not null
)
;



-- 
-- table: htblemailtemplates 
--

create table htblemailtemplates(
    templateid        int4            not null,
    name              varchar(100)    default ('new e-mail template'),
    text              text,
    outgoing          boolean         not null,
    replytype         int4            default ((1)),
    addnotehistory    boolean      default (false),
    subject           varchar(250),
    enabled           boolean,
    primary key (templateid)
)
;



-- 
-- table: htblemailtemplatesattachements 
--

create table htblemailtemplatesattachements(
    attachmentid    int4            not null,
    templateid      int4,
    fileid          int4            not null,
    mediatype       varchar(100)    not null,
    contentid       varchar(100),
    filename        varchar(256)    not null,
    primary key (attachmentid)
)
;



-- 
-- table: htblemailtemplateslang 
--

create table htblemailtemplateslang(
    templateid    int4            not null,
    language      int4            not null,
    name          varchar(250),
    subject       varchar(250),
    text          text,
    primary key (templateid, language)
)
;



-- 
-- table: htblemailtemplatespriorities 
--

create table htblemailtemplatespriorities(
    templateid    int4    not null,
    priority      int4    not null,
    primary key (templateid, priority)
)
;



-- 
-- table: htblemailtemplatesticketstates 
--

create table htblemailtemplatesticketstates(
    templateid       int4    not null,
    ticketstateid    int4    not null,
    primary key (templateid, ticketstateid)
)
;



-- 
-- table: htblemailtemplatestickettypes 
--

create table htblemailtemplatestickettypes(
    templateid      int4    not null,
    tickettypeid    int4    not null,
    primary key (templateid, tickettypeid)
)
;



-- 
-- table: htblemailverification 
--

create table htblemailverification(
    verificationid    int4            not null,
    userid            int4            not null,
    email             varchar(256)    not null,
    primary key (verificationid)
)
;



-- 
-- table: htbleventinfochecks 
--

create table htbleventinfochecks(
    "eventcheckid"  int4    not null,
    "agentid"       int4    not null,
    "infoid"        int4    not null,
    primary key ("eventcheckid")
)
;



-- 
-- table: htbleventreminders 
--

create table htbleventreminders(
    "eventreminderid"  int4         not null,
    "agentid"          int4         not null,
    "eventid"          int4         not null,
    "checked"          boolean      default (false) not null,
    "nextreminder"     timestamp,
    primary key ("eventreminderid")
)
;



-- 
-- table: htblfiles 
--

create table htblfiles(
    fileid      int4            not null,
    uid         varchar(50),
    bithash     varchar(250),
    uploaded    timestamp,
    primary key (fileid)
)
;



-- 
-- table: htblfooterattachements 
--

create table htblfooterattachements(
    attachmentid    int4            not null,
    userid          int4,
    fileid          int4            not null,
    mediatype       varchar(100)    not null,
    contentid       varchar(100),
    filename        varchar(256),
    primary key (attachmentid)
)
;



-- 
-- table: htblhistory 
--

create table htblhistory(
    histid           int4             not null,
    action           varchar(4000),
    userid           int4,
    ticketid         int4,
    date             timestamp        default (now()),
    typeid           int4             not null,
    status           int4             default ((0)),
    reason           varchar(100),
    ticketstateid    int4             default (null),
    tickettypeid     int4             default (null),
    priority         int4             default (null),
    teamid           int4             default (null),
    agentid          int4             default (null),
    assetid          int4             default (null),
    scheduleid       int4             default (null),
    noteid           int4             default (null),
    fieldid          int4             default (null),
    ruleid           int4             default (null),
    userid2          int4             default (null),
    userid3          int4             default (null),
    agentid2         int4             default (null),
    type             int4             default (null),
    unauthorised     boolean      default (false),
    luceneadded      boolean      default (false),
    newvalue         varchar(4000),
    primary key (histid)
)
;



-- 
-- table: htblhistorytypes 
--

create table htblhistorytypes(
    typeid    int4           not null,
    name      varchar(50)    not null,
    primary key (typeid)
)
;



-- 
-- table: htblknowledgebase 
--

create table htblknowledgebase(
    kbid             int4            not null,
    attachementid    int4,
    name             varchar(500),
    type             varchar(50),
    categoryid       int4            not null,
    sortorder        int4            not null,
    added            timestamp       default (now()),
    message          text,
    createdby        int4,
    alteredby        int4,
    altered          timestamp       default (now()),
    primary key (kbid)
)
;



-- 
-- table: htblknowledgebaseattachments 
--

create table htblknowledgebaseattachments(
    attachmentid    int4            not null,
    kbid            int4            not null,
    fileid          int4            not null,
    mediatype       varchar(100)    not null,
    contentid       varchar(100),
    filename        varchar(256),
    primary key (attachmentid)
)
;



-- 
-- table: htblknowledgebasecategories 
--

create table htblknowledgebasecategories(
    categoryid    int4           not null,
    name          varchar(50)    not null,
    sortorder     int4           not null,
    color         char(10),
    useraccess    boolean,
    primary key (categoryid)
)
;



-- 
-- table: htblknowledgebasecategorieslang 
--

create table htblknowledgebasecategorieslang(
    categoryid    int4            not null,
    language      int4            not null,
    name          varchar(100),
    primary key (categoryid, language)
)
;



-- 
-- table: htblknowledgebasecategoriesteams 
--

create table htblknowledgebasecategoriesteams(
    linkid        int4       not null,
    categoryid    int4       not null,
    teamid        int4       not null,
    editaccess    boolean,
    primary key (linkid)
)
;



-- 
-- table: htblknowledgebaselang 
--

create table htblknowledgebaselang(
    kbid        int4            not null,
    language    int4            not null,
    name        varchar(100),
    message     text,
    primary key (kbid, language)
)
;



-- 
-- table: htbllook 
--

create table htbllook(
    name                varchar(100)    default ('lansweeper helpdesk'),
    singlebg            boolean      default (true),
    colorbg             char(10)        default ('#535353'),
    colorgradient1      char(10)        default ('#535353'),
    colorgradient2      char(10)        default ('#1b1b1b'),
    colortext           char(10)        default ('#ffffff'),
    font                varchar(50)     default ('arial'),
    tabcolor            char(10)        default ('#e2ebf4'),
    tabtext             char(10)        default ('#0084b4'),
    selectedtabcolor    char(10)        default ('#ffffff'),
    selectedtabtext     char(10)        default ('#0084b4'),
    showname            boolean      default (true),
    nameshadow          boolean      default (true),
    customheader        boolean      default (false)
)
;



-- 
-- table: htblnews 
--

create table htblnews(
    newsid         int4            not null,
    type           int4            not null,
    text           text            not null,
    description    varchar(100)    not null,
    enabled        boolean      default (true),
    sort           int4,
    primary key (newsid)
)
;



-- 
-- table: htblnewslang 
--

create table htblnewslang(
    newsid         int4            not null,
    language       int4            not null,
    description    varchar(100),
    text           text,
    primary key (newsid, language)
)
;



-- 
-- table: htblnotehistory 
--

create table htblnotehistory(
    notehistoryid    int4         not null,
    noteid           int4         not null,
    note             text,
    userid           int4         not null,
    date             timestamp    default (now()),
    primary key (notehistoryid)
)
;



-- 
-- table: htblnotes 
--

create table htblnotes(
    noteid              int4             not null,
    ticketid            int4,
    userid              int4,
    date                timestamp        default (now()) not null,
    note                text,
    notetype            int4,
    emailmessageid      varchar(1024),
    servicechange       boolean      default (false),
    timeworkeduserid    int4,
    timeworkeddate      timestamp,
    timeworked          int4,
    primary key (noteid)
)
;



-- 
-- table: htblnotificationschecked 
--

create table htblnotificationschecked(
    checkid    int4    not null,
    userid     int4    not null,
    histid     int4    not null,
    primary key (checkid)
)
;



-- 
-- table: htbloldticketdata 
--

create table htbloldticketdata(
    oldid          int4            not null,
    ticketid       int4            not null,
    subject        varchar(500),
    description    text,
    changed        timestamp       default (now()),
    userid         int4,
    primary key (oldid)
)
;



-- 
-- table: htblpriorities 
--

create table htblpriorities(
    priority     int4           not null,
    name         varchar(50),
    color        varchar(10),
    sortorder    int4           default ((1)),
    primary key (priority)
)
;



-- 
-- table: htblprioritieslang 
--

create table htblprioritieslang(
    priority    int4           not null,
    language    int4           not null,
    name        varchar(50),
    primary key (priority, language)
)
;



-- 
-- table: htblreports 
--

create table htblreports(
    reportid    int4            not null,
    title       varchar(200)    not null,
    query       text            not null,
    builtin     boolean      default (false),
    primary key (reportid)
)
;



-- 
-- table: htblreportslang 
--

create table htblreportslang(
    reportid    int4            not null,
    language    int4            not null,
    title       varchar(200),
    primary key (reportid, language)
)
;



-- 
-- table: htblsavedcustomfilters 
--

create table htblsavedcustomfilters(
    saveid        int4             not null,
    userid        int4             not null,
    filterdata    varchar(2500)    default ('') not null,
    sortorder     int4             default ((0)) not null,
    amount        int4             default ((0)),
    primary key (saveid)
)
;



-- 
-- table: htblschedule 
--

create table htblschedule(
    scheduleid     int4             not null,
    ticketid       int4,
    date           timestamp,
    enddate        timestamp,
    title          varchar(150),
    description    varchar(4000),
    status         int4,
    typeid         int4,
    allday         boolean,
    public         boolean,
    showtoteam     boolean      default (false),
    createdby      int4,
    alteredby      int4,
    reminder       int4             default ((-1)),
    deleted        boolean      default (false) not null,
    "processed"    boolean      default (false) not null,
    primary key (scheduleid)
)
;



-- 
-- table: htblscheduleagents 
--

create table htblscheduleagents(
    scheduleagentid    int4         not null,
    scheduleid         int4         not null,
    agentid            int4         not null,
    nextreminder       timestamp    default (now()) not null,
    status             boolean      default (false) not null,
    checked            boolean      default (false) not null,
    "editallowed"      boolean      default (true),
    primary key (scheduleagentid)
)
;



-- 
-- table: htblscheduleinfo 
--

create table htblscheduleinfo(
    infoid         int4            not null,
    agentid        int4,
    scheduleid     int4,
    infotype       int4            default ((1)) not null,
    title          varchar(150),
    userid         int4,
    datechanged    timestamp       default (now()),
    primary key (infoid)
)
;



-- 
-- table: htblschedulerepeat 
--

create table htblschedulerepeat(
    repeatid       int4          not null,
    scheduleid     int4          not null,
    repeattype     int4          default ((1)) not null,
    amount         int4          default ((1)) not null,
    dayofmonth     boolean      default (false) not null,
    day            int4          default ((1)),
    ends           int4          default ((1)) not null,
    occurrences    int4          default ((15)),
    weekdays       varchar(7)    default ('0000000') not null,
    enddate        timestamp     default (now()),
    primary key (repeatid)
)
;



-- 
-- table: htblscheduleteams 
--

create table htblscheduleteams(
    "scheduleteamid"  int4       not null,
    "scheduleid"      int4       not null,
    "teamid"          int4       not null,
    "editallowed"     boolean      default (false) not null,
    primary key ("scheduleteamid")
)
;



-- 
-- table: htblscheduletypes 
--

create table htblscheduletypes(
    typeid            int4            not null,
    name              varchar(100)    not null,
    color             char(10),
    agentavailable    boolean      default (true),
    "default"           boolean      default (false) not null,
    primary key (typeid)
)
;



-- 
-- table: htblscheduletypeslang 
--

create table htblscheduletypeslang(
    typeid      int4            not null,
    language    int4            not null,
    name        varchar(100),
    primary key (typeid, language)
)
;



-- 
-- table: htblserviceactions 
--

create table htblserviceactions(
    actionid        int4           not null,
    action          varchar(50),
    compare         varchar(50),
    operator        varchar(50),
    comparevalue    varchar(50),
    primary key (actionid)
)
;



-- 
-- table: htblsetup 
--

create table htblsetup(
    defaultpriority         int4,
    editwarning             int4            default ((2)),
    emailtickets            boolean      default (true),
    consoletickets          boolean      default (true),
    allowmerging            boolean      default (true),
    allowattachments        boolean      default (true),
    sortascending           boolean      default (false),
    selectunrelated         boolean      default (true),
    selectsamelocation      boolean      default (false),
    showschedule            boolean      default (false),
    showduedate             boolean      default (false),
    clientcc                boolean      default (true),
    showagentnotes          boolean      default (false),
    autoassign              boolean      default (true),
    assigntocreator         boolean      default (false),
    assigntype              int4            default ('1'),
    assignwhen              int4            default ('1'),
    assigntoeditor          boolean      default (true),
    standarddeadline        int8            default ((1440)) not null,
    maxkbarticles           int4            default ((5)) not null,
    defaulttickettype       int4,
    pasteventsdeletion      int4            default ((180)) not null,
    attachmentsfolder       varchar(200),
    usecustomfolder         boolean      default (false),
    attfolderlogin          varchar(100),
    attfolderpass           varchar(500),
    clientsaddemail         boolean      default (true),
    keepspamdays            int4            default ((-1)),
    firstrun                boolean      default (false),
    usedeadlines            boolean      default (false),
    kbenabled               boolean      default (true),
    kbagentonly             boolean      default (false),
    defaultteamid           int4,
    shortcuts               boolean      default (false),
    servernamechanged       boolean,
    showpriority            boolean      default (false),
    ticketshover            int4            default ((0)),
    allowselectotheruser    boolean,
    clientclose             boolean      default (true),
    attfolderkeyhash        int4,
    disablehelpdesk         boolean,
    showkbembeddedimages    boolean      default (true),
    kbattachmentstop        boolean      default (true),
    defaultsourceid         int4,
    kbsort                  int4,
    autoticketlink          boolean,
    disablenoteemails       boolean      default (false) not null
)
;



-- 
-- table: htblshortcuts 
--

create table htblshortcuts(
    keyid     int4           not null,
    effect    varchar(50)    not null,
    code      int4           not null,
    key       varchar(10)    not null,
    primary key (keyid)
)
;



-- 
-- table: htblshortcutslang 
--

create table htblshortcutslang(
    keyid       int4           not null,
    language    int4           not null,
    effect      varchar(50),
    primary key (keyid, language)
)
;



-- 
-- table: htblshownclientrelations 
--

create table htblshownclientrelations(
    "relationtypeid"  int4    not null,
    primary key ("relationtypeid")
)
;



-- 
-- table: htblsla 
--

create table htblsla(
    slaid        int4           not null,
    name         varchar(75)    not null,
    hours        int4           default ((0)) not null,
    initial      timestamp      default ('1900-01-01 12:00:00.000') not null,
    resolved     timestamp      default ('1900-01-02 12:00:00.000') not null,
    color1       char(10)       default ('#114506') not null,
    color2       char(10)       default ('#a89718') not null,
    sortorder    int4           default ((500)) not null,
    enabled      boolean      default (true) not null,
    primary key (slaid)
)
;



-- 
-- table: htblslacompanies 
--

create table htblslacompanies(
    slaid      int4            not null,
    company    varchar(100)    not null
)
;



-- 
-- table: htblsladepartments 
--

create table htblsladepartments(
    slaid         int4            not null,
    department    varchar(500)    not null
)
;



-- 
-- table: htblslapriorities 
--

create table htblslapriorities(
    slaid       int4    not null,
    priority    int4    not null
)
;



-- 
-- table: htblslasource 
--

create table htblslasource(
    slaid       int4    not null,
    sourceid    int4    not null,
    primary key (slaid, sourceid)
)
;



-- 
-- table: htblslatickettypes 
--

create table htblslatickettypes(
    slaid           int4    not null,
    tickettypeid    int4    not null,
    primary key (slaid, tickettypeid)
)
;



-- 
-- table: htblslausers 
--

create table htblslausers(
    slaid     int4    not null,
    userid    int4    not null,
    primary key (slaid, userid)
)
;



-- 
-- table: htblsource 
--

create table htblsource(
    sourceid       int4            not null,
    name           varchar(100)    not null,
    icon           varchar(100)    not null,
    description    varchar(150),
    primary key (sourceid)
)
;



-- 
-- table: htblsourcelang 
--

create table htblsourcelang(
    sourceid       int4            not null,
    language       int4            not null,
    name           varchar(100),
    description    varchar(200),
    primary key (sourceid, language)
)
;



-- 
-- table: htblspecialrules 
--

create table htblspecialrules(
    ruleid             int4             not null,
    name               varchar(100)     not null,
    description        varchar(4000)    not null,
    sortorder          int4             default ((100)),
    enabled            boolean      default (false),
    stopdispatching    boolean      default (false),
    primary key (ruleid)
)
;



-- 
-- table: htblspecialrulesactions 
--

create table htblspecialrulesactions(
    actionid    int4    not null,
    ruleid      int4    not null,
    type        int4    not null,
    typeid      int4    not null,
    primary key (actionid)
)
;



-- 
-- table: htblspecialrulesconditions 
--

create table htblspecialrulesconditions(
    conditionid    int4            not null,
    ruleid         int4            not null,
    type           int4            not null,
    condition      int4            not null,
    text           varchar(100)    not null,
    primary key (conditionid)
)
;



-- 
-- table: htblspecialrulestaskagents 
--

create table htblspecialrulestaskagents(
    ruletaskagentid    int4       not null,
    ruletaskid         int4       not null,
    agentid            int4       not null,
    "editallowed"      boolean    default (true) not null,
    primary key (ruletaskagentid)
)
;



-- 
-- table: htblspecialrulestasks 
--

create table htblspecialrulestasks(
    taskid             int4             not null,
    ruleid             int4             not null,
    typeid             int4             not null,
    minutesdelay       int4             not null,
    minutesrequired    int4             not null,
    title              varchar(50)      not null,
    description        varchar(4000)    not null,
    allday             boolean      default (false),
    showtoteam         boolean      default (false),
    primary key (taskid)
)
;



-- 
-- table: htblspecialrulestaskteams 
--

create table htblspecialrulestaskteams(
    ruletaskteamid    int4       not null,
    ruletaskid        int4       not null,
    teamid            int4       not null,
    "editallowed"     boolean      default (false) not null,
    primary key (ruletaskteamid)
)
;



-- 
-- table: htblteams 
--

create table htblteams(
    teamid      int4           not null,
    teamname    varchar(50),
    color       char(10),
    img         varchar(50),
    primary key (teamid)
)
;



-- 
-- table: htblteamslang 
--

create table htblteamslang(
    teamid      int4            not null,
    language    int4            not null,
    teamname    varchar(100),
    primary key (teamid, language)
)
;



-- 
-- table: htbltemplatecategories 
--

create table htbltemplatecategories(
    categoryid    int4            not null,
    name          varchar(100)    not null,
    primary key (categoryid)
)
;



-- 
-- table: htbltemplates 
--

create table htbltemplates(
    templateid    int4            not null,
    name          varchar(100)    default ('new template'),
    text          text,
    categoryid    int4,
    primary key (templateid)
)
;



-- 
-- table: htbltemplateslang 
--

create table htbltemplateslang(
    templateid    int4            not null,
    language      int4            not null,
    name          varchar(100),
    text          text,
    primary key (templateid, language)
)
;



-- 
-- table: htblticket 
--

create table htblticket(
    ticketid            int4            not null,
    subject             varchar(500)    not null,
    replysubject        varchar(500),
    date                timestamp       default (now()) not null,
    priority            int4,
    ticketstateid       int4,
    fromuserid          int4,
    agentid             int4,
    tickettypeid        int4,
    deadline            timestamp,
    sourceid            int4,
    updated             timestamp       default (now()) not null,
    flagged             boolean      default (false),
    accountid           int4,
    replyaddress        varchar(256),
    servicechange       boolean      default (true),
    websitechange       boolean,
    extradata           varchar(250),
    clientconcerning    int4,
    spam                boolean      default (false),
    assetid             int4            default ((0)),
    agentinitiated      boolean      default (false),
    alias               varchar(256),
    slaname             varchar(75)     default (''),
    slainitial          timestamp,
    slaresolved         timestamp,
    resolvecalc         boolean      default (false),
    slabusiness         boolean      default (false),
    flaggeddate         timestamp       default ('1900-01-01 00:00:00.000'),
    autoclose           int4            default ((0)),
    duplicateid         int4,
    ispersonal          boolean      default (false) not null,
    histid              int4,
    userid_lastnote     int4,
    ipaddress           varchar(100),
    lastuserreply       timestamp       default (now()),
    primary key (ticketid)
)
;



-- 
-- table: htblticketasset 
--

create table htblticketasset(
    ticketid    int4    not null,
    assetid     int4    not null,
    primary key (ticketid, assetid)
)
;



-- 
-- table: htblticketcustomfield 
--

create table htblticketcustomfield(
    ticketid               int4             not null,
    fieldid                int4             not null,
    data                   varchar(4000),
    ticketcustomfieldid    int4             not null,
    tickettypefieldid      int4,
    primary key (ticketcustomfieldid)
)
;



-- 
-- table: htblticketmerges 
--

create table htblticketmerges(
    mergeid    int4         not null,
    oldtid     int4         not null,
    newtid     int4         not null,
    date       timestamp    default (now()),
    primary key (mergeid)
)
;



-- 
-- table: htblticketsfilter 
--

create table htblticketsfilter(
    filterid       int4             not null,
    tablefilter    varchar(50)      not null,
    field          varchar(100),
    filtervalue    varchar(4000)    not null,
    operator       varchar(3),
    comparator     int4             not null,
    grouped        int4             default ((0)) not null,
    primary key (filterid)
)
;



-- 
-- table: htblticketssummary 
--

create table htblticketssummary(
    summaryid       int4            not null,
    userid          int4            not null,
    customtime      boolean      default (false) not null,
    standardtime    int4            default ((1)) not null,
    time1           timestamp       default (now() - interval '7 day') not null,
    time2           timestamp       default (now()) not null,
    endtoday        boolean      default (true) not null,
    tickettypes     varchar(150)    default (''),
    teams           varchar(150)    default (''),
    agents          varchar(150)    default (''),
    s1              varchar(50),
    s2              varchar(50),
    s3              varchar(50),
    sort            int4            default ((1)) not null,
    "order"           int4            default ((0)) not null,
    amount          int4            default ((100)) not null,
    primary key (summaryid)
)
;



-- 
-- table: htblticketssummaryfilter 
--

create table htblticketssummaryfilter(
    summaryid      int4    not null,
    filterid       int4    not null,
    filterorder    int4    not null,
    primary key (summaryid)
)
;



-- 
-- table: htblticketstates 
--

create table htblticketstates(
    ticketstateid    int4            not null,
    statename        varchar(50),
    color            char(10),
    description      varchar(100),
    "default"          boolean      default (false),
    trackaswork      boolean      default (false),
    sortorder        int4            default ((1)),
    clientreplies    boolean      default (false),
    taskstate        boolean      default (false),
    replacementid    int4            default (null),
    primary key (ticketstateid)
)
;



-- 
-- table: htblticketstateslang 
--

create table htblticketstateslang(
    ticketstateid    int4           not null,
    language         int4           not null,
    statename        varchar(50),
    primary key (ticketstateid, language)
)
;



-- 
-- table: htblticketsubscribers 
--

create table htblticketsubscribers(
    subscriberid    int4    not null,
    ticketid        int4,
    agentid         int4    not null,
    type            int4    default ((3)),
    primary key (subscriberid)
)
;



-- 
-- table: htblticketteam 
--

create table htblticketteam(
    ticketid    int4    not null,
    teamid      int4    not null,
    primary key (ticketid, teamid)
)
;



-- 
-- table: htbltickettypecustomfield 
--

create table htbltickettypecustomfield(
    tickettypeid               int4       not null,
    fieldid                    int4       not null,
    orderindex                 int2,
    agentonly                  boolean      default (false),
    requiredonclosing          boolean      default (false) not null,
    requiredoncreation         boolean      default (false) not null,
    tickettypecustomfieldid    int4       not null,
    collapsed                  boolean      default (false) not null,
    linked                     boolean      default (false) not null,
    primary key (tickettypecustomfieldid)
)
;



-- 
-- table: htbltickettypes 
--

create table htbltickettypes(
    tickettypeid          int4           not null,
    typename              varchar(50),
    icon                  varchar(50),
    agentid               int4,
    enabled               boolean      default (true),
    notetype              int4           default ((1)),
    replacementid         int4           default (null),
    ignoredefaultstate    boolean    default (false) not null,
    initialdescription    int4,
    extraticketoptions    int4,
    timeworked            boolean,
    initialpriority       boolean    default (false) not null,
    addccusers            boolean    default (false),
    primary key (tickettypeid)
)
;



-- 
-- table: htbltickettypeslang 
--

create table htbltickettypeslang(
    tickettypeid    int4           not null,
    language        int4           not null,
    typename        varchar(50),
    primary key (tickettypeid, language)
)
;



-- 
-- table: htbltickettypeteams 
--

create table htbltickettypeteams(
    teamid          int4    not null,
    tickettypeid    int4    not null,
    primary key (teamid, tickettypeid)
)
;



-- 
-- table: htblticketuserrelation 
--

create table htblticketuserrelation(
    ticketuserrelationid    int4         not null,
    ticketid                int4         not null,
    userid                  int4         not null,
    type                    int4         not null,
    date                    timestamp    default (now()) not null,
    primary key (ticketuserrelationid)
)
;



-- 
-- table: htblusers 
--

create table htblusers(
    userid             int4             not null,
    email              varchar(256),
    img                varchar(50)      default (''),
    name               varchar(500),
    password           varchar(100),
    upn                varchar(300),
    username           varchar(150)     default (''),
    userdomain         varchar(150)     default (''),
    metrocolor         char(10),
    description        varchar(500),
    address            varchar(1000),
    telephone          varchar(500),
    mobile             varchar(50),
    fax                varchar(50),
    company            varchar(100),
    department         varchar(500),
    ticketssort        int4             default ((80)),
    info               varchar(500)     default (''),
    "roleid"           int4,
    firstdayofweek     int2,
    "namelock"         boolean      default (false) not null,
    "descriptionlock"  boolean      default (false) not null,
    "addresslock"      boolean      default (false) not null,
    "telephonelock"    boolean      default (false) not null,
    "mobilelock"       boolean      default (false) not null,
    "faxlock"          boolean      default (false) not null,
    "companylock"      boolean      default (false) not null,
    "departmentlock"   boolean      default (false) not null,
    "emaillock"        boolean      default (false) not null,
    language           int4             default ((1)) not null,
    calendarview       int4             default ((2)),
    "nomailasuser"     boolean      default (false) not null,
    added              timestamp        default (now()),
    primary key (userid)
)
;



-- 
-- table: htblwebroles 
--

create table htblwebroles(
    webroleid      int4             not null,
    description    varchar(4000),
    authmembers    varchar(4000),
    primary key (webroleid)
)
;



-- 
-- table: htblzones 
--

create table htblzones(
    zoneid        int4            not null,
    name          varchar(100)    not null,
    timezone      varchar(100)    not null,
    country       varchar(100)    not null,
    day1          boolean         not null,
    day2          boolean         not null,
    day3          boolean         not null,
    day4          boolean         not null,
    day5          boolean         not null,
    day6          boolean         not null,
    day7          boolean         not null,
    day1time1     timestamp       not null,
    day1time2     timestamp       not null,
    day2time1     timestamp       not null,
    day2time2     timestamp       not null,
    day3time1     timestamp       not null,
    day3time2     timestamp       not null,
    day4time1     timestamp       not null,
    day4time2     timestamp       not null,
    day5time1     timestamp       not null,
    day5time2     timestamp       not null,
    day6time1     timestamp       not null,
    day6time2     timestamp       not null,
    day7time1     timestamp       not null,
    day7time2     timestamp       not null,
    dateformat    varchar(20)     not null,
    "default"       boolean         not null,
    primary key (zoneid)
)
;



-- 
-- table: tbladcomputers 
--

create table tbladcomputers(
    "adcomputerid"       int4            not null,
    "assetid"            int4            not null,
    "comment"            varchar(800),
    "company"            varchar(500),
    "description"        varchar(500),
    "location"           varchar(500),
    "ou"                 varchar(500),
    "lastchanged"        timestamp       default (now()) not null,
    "adobjectid"         int4,
    "manageradobjectid"  int4,
    primary key ("adcomputerid")
)
;



-- 
-- table: tbladgroups 
--

create table tbladgroups(
    "adgroupid"          int4            not null,
    "adobjectid"         int4            not null,
    "manageradobjectid"  int4,
    "grouptype"          int4,
    "lastchanged"        timestamp       default (now()) not null,
    "description"        varchar(500),
    "name"               varchar(500),
    primary key ("adgroupid")
)
;



-- 
-- table: tbladmembership 
--

create table tbladmembership(
    "childadobjectid"   int4         not null,
    "parentadobjectid"  int4         not null,
    "lastchanged"       timestamp    default (now()) not null,
    primary key ("childadobjectid", "parentadobjectid")
)
;



-- 
-- table: tbladobjects 
--

create table tbladobjects(
    "adobjectid"      int4            not null,
    "samaccountname"  varchar(150)    not null,
    domain            varchar(150)    not null,
    "lastscanned"     timestamp       default (now()) not null,
    primary key ("adobjectid")
)
;



-- 
-- table: tbladusers 
--

create table tbladusers(
    "username"           varchar(150)    not null,
    "userdomain"         varchar(150)    not null,
    "firstname"          varchar(500),
    "lastname"           varchar(500),
    "name"               varchar(500),
    "displayname"        varchar(500),
    "description"        varchar(500),
    "office"             varchar(500),
    "telephone"          varchar(500),
    "fax"                varchar(50),
    "mobile"             varchar(50),
    "street"             varchar(500),
    "city"               varchar(500),
    "c"                  varchar(300),
    "zip"                varchar(300),
    "country"            varchar(300),
    "countrycode"        varchar(300),
    "upn"                varchar(300),
    "title"              varchar(500),
    "department"         varchar(500),
    "company"            varchar(500),
    email                varchar(300),
    "ou"                 varchar(500),
    "lastchanged"        timestamp       default (now()) not null,
    "picture"            bytea,
    "adobjectid"         int4,
    "manageradobjectid"  int4,
    "homephone"          varchar(50),
    "pager"              varchar(50),
    "ipphone"            varchar(50),
    "state"              varchar(300),
    "homepage"           varchar(300),
    "homedirectory"      varchar(500),
    "profilepath"        varchar(500),
    "logonscript"        varchar(500),
    "whencreated"        timestamp,
    "whenchanged"        timestamp,
    "employeeid"         varchar(50),
    "employeenumber"     varchar(50),
    "employeetype"       varchar(50),
    "info"               varchar(500),
    "division"           varchar(500),
    "aduserid"           int4            not null,
    primary key ("username", "userdomain")
)
;



-- 
-- table: tblantivirus 
--

create table tblantivirus(
    "antivirusid"              int4           not null,
    "displayname"              varchar(50),
    "assetid"                  int4           not null,
    "productstate"             int4,
    "lastchanged"              timestamp      default (now()) not null,
    "onaccessscanningenabled"  boolean,
    "productuptodate"          boolean,
    primary key ("antivirusid")
)
;



-- 
-- table: tblassetcomments 
--

create table tblassetcomments(
    "commentid"  int4             not null,
    "assetid"    int4             not null,
    "comment"    varchar(4000)    not null,
    "addedby"    varchar(150)     not null,
    "added"      timestamp        default (now()) not null,
    primary key ("commentid")
)
;



-- 
-- table: tblassetcustom 
--

create table tblassetcustom(
    "custid"            int4              not null,
    "assetid"           int4              not null,
    "state"             int4              default ((1)) not null,
    "purchasedate"      timestamp,
    "warrantydate"      timestamp,
    "lastpatched"       timestamp,
    "lastfullbackup"    timestamp,
    "lastfullimage"     timestamp,
    "ordernumber"       varchar(50),
    "comments"          text,
    "location"          varchar(300),
    "locationlock"      boolean,
    "building"          varchar(300),
    "department"        varchar(300),
    "branchoffice"      varchar(50),
    "barcode"           varchar(100),
    "manufacturer"      varchar(200),
    "manufacturerlock"  boolean,
    "contact"           varchar(300),
    "contactlock"       boolean,
    "model"             varchar(200),
    "modellock"         boolean,
    "httptitle"         varchar(1000),
    "httpserver"        varchar(500),
    "httpsserver"       varchar(500),
    "snmpoid"           varchar(150),
    "smtpheader"        varchar(500),
    "ftpheader"         varchar(500),
    "lastchanged"       timestamp         default (now()) not null,
    "serialnumber"      varchar(100),
    "serialnumberlock"  boolean,
    "printedpages"      numeric(18, 0),
    "printerstatus"     varchar(100),
    "custom1"           varchar(255)      default (''),
    "custom2"           varchar(255)      default (''),
    "custom3"           varchar(255)      default (''),
    "custom4"           varchar(255)      default (''),
    "custom5"           varchar(255)      default (''),
    "custom6"           varchar(255)      default (''),
    "custom7"           varchar(255)      default (''),
    "custom8"           varchar(255)      default (''),
    "custom9"           varchar(255)      default (''),
    "custom10"          varchar(255)      default (''),
    "custom11"          varchar(255)      default (''),
    "custom12"          varchar(255)      default (''),
    "custom13"          varchar(255)      default (''),
    "custom14"          varchar(255)      default (''),
    "custom15"          varchar(255)      default (''),
    "custom16"          varchar(255)      default (''),
    "custom17"          varchar(255)      default (''),
    "custom18"          varchar(255)      default (''),
    "custom19"          varchar(255)      default (''),
    "custom20"          varchar(255)      default (''),
    "dnsname"           varchar(500),
    "sshserver"         varchar(255),
    "purchasedatelock"  boolean,
    "warrantydatelock"  boolean,
    "systemsku"         varchar(200),
    "preventcleanup"    boolean      default (false),
    "locksystemsku"     boolean      default (false),
    "dmidecodeerror"    boolean      default (false) not null,
    primary key ("custid")
)
;



-- 
-- table: tblassetdocs 
--

create table tblassetdocs(
    "docsid"   int4            not null,
    "assetid"  int4            not null,
    "docname"  varchar(255)    not null,
    "docguid"  varchar(100)    not null,
    "addedby"  varchar(150)    not null,
    "added"    timestamp       default (now()) not null,
    primary key ("docsid")
)
;



-- 
-- table: tblassetgrouplink 
--

create table tblassetgrouplink(
    "assetgrouplinkid"  int8    not null,
    "assetid"           int4    not null,
    "assetgroupid"      int4    default ((0)) not null,
    primary key ("assetgrouplinkid")
)
;



-- 
-- table: tblassetgroups 
--

create table tblassetgroups(
    "assetgroupid"  int4            not null,
    "assetgroup"    varchar(150)    not null,
    "builtin"       boolean      default (false) not null,
    "dynamic"       boolean      default (false),
    primary key ("assetgroupid")
)
;



-- 
-- table: tblassetmacaddress 
--

create table tblassetmacaddress(
    "macid"        int8           not null,
    "assetid"      int4           not null,
    "mac"          varchar(20)    not null,
    "lastchanged"  timestamp      default (now()) not null,
    primary key ("macid")
)
;



-- 
-- table: "tblassetmergelinks" 
--

create table tblassetmergelinks(
    "assetmergelinkid"  int4    not null,
    "oldassetid"        int4    not null,
    "newassetid"        int4    not null,
    primary key ("assetmergelinkid")
)
;



-- 
-- table: tblassetrelations 
--

create table tblassetrelations(
    "relationid"     int4            not null,
    "parentassetid"  int4,
    "childassetid"   int4,
    "type"           int4,
    "comments"       varchar(150),
    "lastchanged"    timestamp       default (now()) not null,
    "posx"           int4,
    "posy"           int4,
    "startdate"      timestamp       default (now()),
    primary key ("relationid")
)
;



-- 
-- table: tblassets 
--

create table tblassets(
    "assetid"            int4              not null,
    "assetunique"        varchar(150),
    "domain"             varchar(150),
    "username"           varchar(150),
    "userdomain"         varchar(150),
    "fqdn"               varchar(512),
    "ipaddress"          varchar(100),
    "ipnumeric"          numeric(18, 0),
    "siteid"             numeric(18, 0),
    "scanserver"         varchar(150),
    "oscode"             varchar(20),
    "sp"                 numeric(18, 0),
    "description"        varchar(500),
    "descriptionlock"    boolean,
    "assettype"          int4              default ((-1)) not null,
    "assettypelock"      boolean,
    "assetname"          varchar(200)      not null,
    "assetnamelock"      boolean,
    "mac"                varchar(20),
    "firstseen"          timestamp         default (now()),
    "lastseen"           timestamp         default (now()),
    "lasttried"          timestamp,
    "lasttriggered"      timestamp,
    "lastscheduled"      timestamp,
    "lastactivescan"     timestamp,
    "lastipscan"         timestamp,
    "lastlspush"         timestamp,
    "lastsaved"          timestamp,
    "uptime"             numeric(18, 0),
    "memory"             numeric(18, 0),
    "nrprocessors"       numeric(18, 0),
    "processor"          varchar(255),
    "serviceversion"     varchar(50),
    "lspushversion"      varchar(50),
    "lastworkgroupscan"  timestamp,
    "locationid"         int4              default ((-1)) not null,
    "manualmac"          boolean      default (false) not null,
    "lastchanged"        timestamp         default (now()) not null,
    "lastlsfallback"     timestamp,
    primary key ("assetid")
)
;



-- 
-- table: tblassetuserrelations 
--

create table tblassetuserrelations(
    "relationid"   int4            not null,
    "username"     varchar(150),
    "userdomain"   varchar(150),
    "assetid"      int4,
    "type"         int4,
    "comments"     varchar(150),
    "lastchanged"  timestamp       default (now()) not null,
    "startdate"    timestamp       default (now()),
    primary key ("relationid")
)
;



-- 
-- table: tblautorun 
--

create table tblautorun(
    "autorunid"    int4         not null,
    "assetid"      int4         not null,
    "autorununi"   int4         not null,
    "locationid"   int4         not null,
    "lastchanged"  timestamp    default (now()) not null,
    primary key ("autorunid")
)
;



-- 
-- table: tblautorunhist 
--

create table tblautorunhist(
    "trackercode"  int4              not null,
    "assetid"      int4              not null,
    "autorununi"   int4,
    "locationid"   int4,
    "lastchanged"  timestamp         default (now()) not null,
    "action"       numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: "tblautorunloc" 
--

create table tblautorunloc(
    "locationid"  int4            not null,
    "location"    varchar(400),
    primary key ("locationid")
)
;



-- 
-- table: tblautorununi 
--

create table tblautorununi(
    "autorununi"  int4            not null,
    "caption"     varchar(100),
    "command"     varchar(350),
    primary key ("autorununi")
)
;



-- 
-- table: tblbaseboard 
--

create table tblbaseboard(
    "win32_baseboardid"  int4            not null,
    "assetid"            int4            not null,
    "hostingboard"       boolean,
    "manufacturer"       varchar(450),
    "product"            varchar(450),
    "serialnumber"       varchar(450),
    "version"            varchar(255),
    "lastchanged"        timestamp       default (now()) not null,
    primary key ("win32_baseboardid")
)
;



-- 
-- table: tblbaseboardhist 
--

create table tblbaseboardhist(
    "trackercode"   int4              not null,
    "assetid"       int4              not null,
    "hostingboard"  boolean,
    "manufacturer"  varchar(450),
    "product"       varchar(450),
    "serialnumber"  varchar(450),
    "version"       varchar(255),
    "lastchanged"   timestamp         default (now()) not null,
    "action"        numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblbattery 
--

create table tblbattery(
    "win32_batteryid"              int4              not null,
    "assetid"                      int4              not null,
    "availability"                 numeric(18, 0),
    "batterystatus"                numeric(18, 0),
    "chemistry"                    numeric(18, 0),
    "designcapacity"               numeric(18, 0),
    "deviceid"                     varchar(450),
    "name"                         varchar(450),
    "powermanagementcapabilities"  varchar(400),
    "powermanagementsupported"     boolean,
    "smartbatteryversion"          varchar(50),
    "lastchanged"                  timestamp         default (now()) not null,
    primary key ("win32_batteryid")
)
;



-- 
-- table: tblbatteryhist 
--

create table tblbatteryhist(
    "trackercode"                  int4              not null,
    "assetid"                      int4              not null,
    "availability"                 numeric(18, 0),
    "batterystatus"                numeric(18, 0),
    "chemistry"                    numeric(18, 0),
    "designcapacity"               numeric(18, 0),
    "deviceid"                     varchar(450),
    "name"                         varchar(450),
    "powermanagementcapabilities"  varchar(400),
    "powermanagementsupported"     boolean,
    "smartbatteryversion"          varchar(50),
    "lastchanged"                  timestamp         default (now()) not null,
    "action"                       numeric(18, 0),
    primary key ("trackercode")
)
;



-- 
-- table: tblbios 
--

create table tblbios(
    "win32_biosid"          int4              not null,
    "assetid"               int4              not null,
    "bioscharacteristics"   varchar(400),
    "caption"               varchar(450),
    "currentlanguage"       varchar(500),
    "installablelanguages"  numeric(18, 0),
    "manufacturer"          varchar(450),
    "primarybios"           boolean,
    "releasedate"           timestamp,
    "serialnumber"          varchar(100),
    "smbiosbiosversion"     varchar(200),
    "smbiosmajorversion"    numeric(18, 0),
    "smbiosminorversion"    numeric(18, 0),
    "smbiospresent"         boolean,
    "version"               varchar(200),
    "lastchanged"           timestamp         default (now()) not null,
    primary key ("win32_biosid")
)
;



-- 
-- table: tblbioshist 
--

create table tblbioshist(
    "trackercode"           int4              not null,
    "assetid"               int4              not null,
    "bioscharacteristics"   varchar(400),
    "caption"               varchar(450),
    "currentlanguage"       varchar(500),
    "installablelanguages"  numeric(18, 0),
    "manufacturer"          varchar(450),
    "primarybios"           boolean,
    "releasedate"           timestamp,
    "serialnumber"          varchar(100),
    "smbiosbiosversion"     varchar(200),
    "smbiosmajorversion"    numeric(18, 0),
    "smbiosminorversion"    numeric(18, 0),
    "smbiospresent"         boolean,
    "version"               varchar(200),
    "lastchanged"           timestamp         default (now()) not null,
    "action"                numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblbootconfiguration 
--

create table tblbootconfiguration(
    "win32_bootconfigurationid"  int4         not null,
    "assetid"                    int4         not null,
    "bootconfigurationuniid"     int4         not null,
    "lastchanged"                timestamp    default (now()) not null,
    primary key ("win32_bootconfigurationid")
)
;



-- 
-- table: tblbootconfigurationhist 
--

create table tblbootconfigurationhist(
    "trackercode"             int4              not null,
    "assetid"                 int4              not null,
    "bootconfigurationuniid"  int4              not null,
    "lastchanged"             timestamp         default (now()) not null,
    "action"                  numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblbootconfigurationuni 
--

create table tblbootconfigurationuni(
    "bootconfigurationuniid"  int4            not null,
    "bootdirectory"           varchar(500),
    "caption"                 varchar(500),
    "configurationpath"       varchar(500),
    "scratchdirectory"        varchar(500),
    "tempdirectory"           varchar(500),
    hash                      varchar(40)     not null,
    primary key ("bootconfigurationuniid")
)
;



-- 
-- table: tblbus 
--

create table tblbus(
    "win32_busid"  int4              not null,
    "assetid"      int4              not null,
    "busnum"       numeric(18, 0),
    "bustype"      numeric(18, 0),
    "deviceid"     varchar(450),
    "lastchanged"  timestamp         default (now()) not null,
    primary key ("win32_busid")
)
;



-- 
-- table: tblbushist 
--

create table tblbushist(
    "trackercode"  int4              not null,
    "assetid"      int4              not null,
    "busnum"       numeric(18, 0),
    "bustype"      numeric(18, 0),
    "deviceid"     varchar(450),
    "lastchanged"  timestamp         default (now()) not null,
    "action"       numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblcdromdrive 
--

create table tblcdromdrive(
    "win32_cdromdriveid"  int4              not null,
    "assetid"             int4              not null,
    "capabilities"        varchar(100),
    "caption"             varchar(450),
    "drive"               varchar(20),
    "manufacturer"        varchar(450),
    "scsibus"             numeric(18, 0),
    "scsilogicalunit"     numeric(18, 0),
    "scsiport"            numeric(18, 0),
    "scsitargetid"        numeric(18, 0),
    "lastchanged"         timestamp         default (now()) not null,
    primary key ("win32_cdromdriveid")
)
;



-- 
-- table: tblcdromdrivehist 
--

create table tblcdromdrivehist(
    "trackercode"      int4              not null,
    "assetid"          int4              not null,
    "capabilities"     varchar(100),
    "caption"          varchar(450),
    "drive"            varchar(20),
    "manufacturer"     varchar(450),
    "scsibus"          numeric(18, 0),
    "scsilogicalunit"  numeric(18, 0),
    "scsiport"         numeric(18, 0),
    "scsitargetid"     numeric(18, 0),
    "lastchanged"      timestamp         default (now()) not null,
    "action"           numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblcodecfile 
--

create table tblcodecfile(
    "win32_codecfileid"  int4              not null,
    "assetid"            int4              not null,
    "archive"            boolean,
    "caption"            varchar(450),
    "compressed"         boolean,
    "compressionmethod"  varchar(200),
    "description"        varchar(500),
    "drive"              varchar(20),
    "encrypted"          boolean,
    "encryptionmethod"   varchar(100),
    "extension"          varchar(50),
    "filename"           varchar(300),
    "filesize"           numeric(18, 0),
    "filetype"           varchar(300),
    "fsname"             varchar(50),
    "group"              varchar(50),
    "hidden"             boolean,
    "installdate"        timestamp,
    "manufacturer"       varchar(450),
    "status"             varchar(20),
    "system"             boolean,
    "version"            varchar(200),
    lastchanged          timestamp         default (now()) not null,
    primary key ("win32_codecfileid")
)
;



-- 
-- table: tblcodecfilehist 
--

create table tblcodecfilehist(
    "trackercode"        int4              not null,
    "assetid"            int4              not null,
    "archive"            boolean,
    "caption"            varchar(450),
    "compressed"         boolean,
    "compressionmethod"  varchar(200),
    "description"        varchar(500),
    "drive"              varchar(20),
    "encrypted"          boolean,
    "encryptionmethod"   varchar(100),
    "extension"          varchar(50),
    "filename"           varchar(300),
    "filesize"           numeric(18, 0),
    "filetype"           varchar(300),
    "fsname"             varchar(50),
    "group"              varchar(50),
    "hidden"             boolean,
    "installdate"        timestamp,
    "manufacturer"       varchar(450),
    "status"             varchar(20),
    "system"             boolean,
    "version"            varchar(200),
    lastchanged          timestamp         default (now()) not null,
    "action"             numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblcomapplication 
--

create table tblcomapplication(
    "win32_comapplicationid"  int4            not null,
    "assetid"                 int4            not null,
    "caption"                 varchar(450),
    lastchanged               timestamp       default (now()) not null,
    primary key ("win32_comapplicationid")
)
;



-- 
-- table: tblcomapplicationhist 
--

create table tblcomapplicationhist(
    "trackercode"  int4              not null,
    "assetid"      int4              not null,
    "caption"      varchar(450),
    lastchanged    timestamp         default (now()) not null,
    "action"       numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblcomponentcategory 
--

create table tblcomponentcategory(
    "win32_componentcategoryid"  int4            not null,
    "assetid"                    int4            not null,
    "caption"                    varchar(450),
    "categoryid"                 varchar(100),
    "lastchanged"                timestamp       default (now()) not null,
    primary key ("win32_componentcategoryid")
)
;



-- 
-- table: tblcomponentcategoryhist 
--

create table tblcomponentcategoryhist(
    "trackercode"  int4              not null,
    "assetid"      int4              not null,
    "caption"      varchar(450),
    "categoryid"   varchar(100),
    "lastchanged"  timestamp         default (now()) not null,
    "action"       numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblcomputersystem 
--

create table tblcomputersystem(
    "computersystemid"           int4              not null,
    "assetid"                    int4              not null,
    "adminpasswordstatus"        numeric(18, 0),
    "automaticresetbootoption"   boolean,
    "automaticresetcapability"   boolean,
    "bootoptiononlimit"          numeric(18, 0),
    "bootoptiononwatchdog"       numeric(18, 0),
    "bootromsupported"           boolean,
    "chassisbootupstate"         numeric(18, 0),
    "currenttimezone"            numeric(18, 0),
    "daylightineffect"           boolean,
    "domainrole"                 int4,
    "enabledaylightsavingstime"  boolean,
    "frontpanelresetstatus"      numeric(18, 0),
    "infraredsupported"          boolean,
    "keyboardpasswordstatus"     numeric(18, 0),
    "networkservermodeenabled"   boolean,
    "numberoflogicalprocessors"  numeric(18, 0),
    "numberofprocessors"         numeric(18, 0),
    "partofdomain"               boolean,
    "pauseafterreset"            numeric(18, 0),
    "poweronpasswordstatus"      numeric(18, 0),
    "powerstate"                 numeric(18, 0),
    "powersupplystate"           numeric(18, 0),
    "resetcapability"            numeric(18, 0),
    "resetcount"                 numeric(18, 0),
    "resetlimit"                 numeric(18, 0),
    "roles"                      varchar(1000),
    "systemstartupdelay"         numeric(18, 0),
    "systemstartupsetting"       numeric(18, 0),
    "systemtype"                 varchar(450),
    "thermalstate"               numeric(18, 0),
    "totalphysicalmemory"        numeric(18, 0),
    "wakeuptype"                 numeric(18, 0),
    "lastchanged"                timestamp         default (now()) not null,
    "model"                      varchar(255),
    primary key ("computersystemid")
)
;



-- 
-- table: tblcomputersystemhist 
--

create table tblcomputersystemhist(
    "trackercode"                int4              not null,
    "assetid"                    int4              not null,
    "adminpasswordstatus"        numeric(18, 0),
    "automaticresetbootoption"   boolean,
    "automaticresetcapability"   boolean,
    "bootoptiononlimit"          numeric(18, 0),
    "bootoptiononwatchdog"       numeric(18, 0),
    "bootromsupported"           boolean,
    "chassisbootupstate"         numeric(18, 0),
    "currenttimezone"            numeric(18, 0),
    "daylightineffect"           boolean,
    "domainrole"                 int4,
    "enabledaylightsavingstime"  boolean,
    "frontpanelresetstatus"      numeric(18, 0),
    "infraredsupported"          boolean,
    "keyboardpasswordstatus"     numeric(18, 0),
    "networkservermodeenabled"   boolean,
    "numberoflogicalprocessors"  numeric(18, 0),
    "numberofprocessors"         numeric(18, 0),
    "partofdomain"               boolean,
    "pauseafterreset"            numeric(18, 0),
    "poweronpasswordstatus"      numeric(18, 0),
    "powerstate"                 numeric(18, 0),
    "powersupplystate"           numeric(18, 0),
    "resetcapability"            numeric(18, 0),
    "resetcount"                 numeric(18, 0),
    "resetlimit"                 numeric(18, 0),
    "roles"                      varchar(1000),
    "systemstartupdelay"         numeric(18, 0),
    "systemstartupsetting"       numeric(18, 0),
    "systemtype"                 varchar(450),
    "thermalstate"               numeric(18, 0),
    "totalphysicalmemory"        numeric(18, 0),
    "wakeuptype"                 numeric(18, 0),
    "lastchanged"                timestamp         default (now()) not null,
    "action"                     numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblcomputersystemproduct 
--

create table tblcomputersystemproduct(
    "win32_computersystemproductid"  int4            not null,
    "assetid"                        int4            not null,
    "uuid"                           varchar(450),
    "version"                        varchar(450),
    "lastchanged"                    timestamp       default (now()) not null,
    primary key ("win32_computersystemproductid")
)
;



-- 
-- table: tblcomputersystemproducthist 
--

create table tblcomputersystemproducthist(
    "trackercode"  int4              not null,
    "assetid"      int4              not null,
    "uuid"         varchar(450),
    "version"      varchar(450),
    "lastchanged"  timestamp         default (now()) not null,
    "action"       numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: "tblconfiglog" 
--

create table tblconfiglog(
    "logid"        int4            not null,
    "actionid"     int4            not null,
    "description"  varchar(500)    not null,
    "oldvalue"     varchar(500),
    "newvalue"     varchar(500),
    "userid"       int4            not null,
    "date"         timestamp       default (now()) not null,
    displayname    varchar(100),
    primary key ("logid")
)
;



-- 
-- table: tblcplogoninfo 
--

create table tblcplogoninfo(
    "id"         int4            not null,
    "assetid"    int4            not null,
    logontime    timestamp       default (now()),
    "domain"     varchar(150),
    "username"   varchar(150),
    "ipaddress"  varchar(15),
    primary key ("id")
)
;



-- 
-- table: tblcustdevprinter 
--

create table tblcustdevprinter(
    "devprintid"      int4              not null,
    "assetid"         int4              not null,
    "tonernr"         numeric(18, 0),
    "tonername"       varchar(150),
    "tonercolorname"  varchar(100),
    "tonercolornr"    numeric(18, 0),
    "tonermaximum"    numeric(18, 0),
    "tonerremaining"  numeric(18, 0),
    "lastchanged"     timestamp         default (now()) not null,
    primary key ("devprintid")
)
;



-- 
-- table: tbldcomapplication 
--

create table tbldcomapplication(
    "win32_dcomapplicationid"  int4            not null,
    "assetid"                  int4            not null,
    "caption"                  varchar(450),
    "lastchanged"              timestamp       default (now()) not null,
    primary key ("win32_dcomapplicationid")
)
;



-- 
-- table: tbldcomapplicationhist 
--

create table tbldcomapplicationhist(
    "trackercode"  int4              not null,
    "assetid"      int4              not null,
    "caption"      varchar(450),
    "lastchanged"  timestamp         default (now()) not null,
    "action"       numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tbldesktop 
--

create table tbldesktop(
    "win32_desktopid"        int4              not null,
    "assetid"                int4              not null,
    "borderwidth"            numeric(18, 0),
    "coolswitch"             boolean,
    "cursorblinkrate"        numeric(18, 0),
    "dragfullwindows"        boolean,
    "gridgranularity"        numeric(18, 0),
    "iconspacing"            numeric(18, 0),
    "icontitlefacename"      varchar(300),
    "icontitlesize"          numeric(18, 0),
    "icontitlewrap"          boolean,
    "name"                   varchar(450),
    "pattern"                varchar(450),
    "screensaveractive"      boolean,
    "screensaverexecutable"  varchar(450),
    "screensaversecure"      boolean,
    "screensavertimeout"     numeric(18, 0),
    "wallpaper"              varchar(450),
    "wallpaperstretched"     boolean,
    "wallpapertiled"         boolean,
    "lastchanged"            timestamp         default (now()) not null,
    primary key ("win32_desktopid")
)
;



-- 
-- table: tbldesktopmonitor 
--

create table tbldesktopmonitor(
    "win32_desktopmonitorid"  int4              not null,
    "assetid"                 int4              not null,
    "availability"            numeric(18, 0),
    "caption"                 varchar(450),
    "deviceid"                varchar(450),
    "monitormanufacturer"     varchar(450),
    "pixelsperxlogicalinch"   numeric(18, 0),
    "pixelsperylogicalinch"   numeric(18, 0),
    "screenheight"            numeric(18, 0),
    "screenwidth"             numeric(18, 0),
    "lastchanged"             timestamp         default (now()) not null,
    "pnpdeviceid"             varchar(1024),
    primary key ("win32_desktopmonitorid")
)
;



-- 
-- table: tbldesktopmonitorhist 
--

create table tbldesktopmonitorhist(
    "trackercode"            int4              not null,
    "assetid"                int4              not null,
    "availability"           numeric(18, 0),
    "caption"                varchar(450),
    "deviceid"               varchar(450),
    "monitormanufacturer"    varchar(450),
    "pixelsperxlogicalinch"  numeric(18, 0),
    "pixelsperylogicalinch"  numeric(18, 0),
    "screenheight"           numeric(18, 0),
    "screenwidth"            numeric(18, 0),
    "lastchanged"            timestamp         default (now()) not null,
    "action"                 numeric(18, 0)    not null,
    "pnpdeviceid"            varchar(1024),
    primary key ("trackercode")
)
;



-- 
-- table: tbldiskdrives 
--

create table tbldiskdrives(
    "diskid"              int4              not null,
    "assetid"             int4              not null,
    "caption"             varchar(20),
    "compressed"          boolean,
    "description"         varchar(450),
    "drivetype"           numeric(18, 0),
    "filesystem"          varchar(50),
    "freespace"           numeric(18, 0),
    "size"                numeric(18, 0),
    "volumename"          varchar(300),
    "volumeserialnumber"  varchar(50),
    "lastchanged"         timestamp         default (now()) not null,
    primary key ("diskid")
)
;



-- 
-- table: tbldiskpartition 
--

create table tbldiskpartition(
    "win32_diskpartitionid"  int4              not null,
    "assetid"                int4              not null,
    "blocksize"              numeric(18, 0),
    "bootable"               boolean,
    "bootpartition"          boolean,
    "diskindex"              numeric(18, 0),
    "index"                  numeric(18, 0),
    "numberofblocks"         numeric(18, 0),
    "primarypartition"       boolean,
    "size"                   numeric(18, 0),
    "startingoffset"         numeric(18, 0),
    "type"                   varchar(450),
    "lastchanged"            timestamp         default (now()) not null,
    primary key ("win32_diskpartitionid")
)
;



-- 
-- table: tbldiskpartitionhist 
--

create table tbldiskpartitionhist(
    "trackercode"       int4              not null,
    "assetid"           int4              not null,
    "blocksize"         numeric(18, 0),
    "bootable"          boolean,
    "bootpartition"     boolean,
    "diskindex"         numeric(18, 0),
    "index"             numeric(18, 0),
    "numberofblocks"    numeric(18, 0),
    "primarypartition"  boolean,
    "size"              numeric(18, 0),
    "startingoffset"    numeric(18, 0),
    "type"              varchar(450),
    "lastchanged"       timestamp         default (now()) not null,
    "action"            numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tbldisplayconfiguration 
--

create table tbldisplayconfiguration(
    "win32_displayconfigurationid"  int4              not null,
    "assetid"                       int4              not null,
    "bitsperpel"                    numeric(18, 0),
    "caption"                       varchar(450),
    "displayflags"                  numeric(18, 0),
    "displayfrequency"              numeric(18, 0),
    "driverversion"                 varchar(450),
    "logpixels"                     numeric(18, 0),
    "pelsheight"                    numeric(18, 0),
    "pelswidth"                     numeric(18, 0),
    "specificationversion"          numeric(18, 0),
    lastchanged                     timestamp         default (now()) not null,
    primary key ("win32_displayconfigurationid")
)
;



-- 
-- table: tbldisplayconfigurationhist 
--

create table tbldisplayconfigurationhist(
    "trackercode"           int4              not null,
    "assetid"               int4              not null,
    "bitsperpel"            numeric(18, 0),
    "caption"               varchar(450),
    "displayflags"          numeric(18, 0),
    "displayfrequency"      numeric(18, 0),
    "driverversion"         varchar(450),
    "logpixels"             numeric(18, 0),
    "pelsheight"            numeric(18, 0),
    "pelswidth"             numeric(18, 0),
    "specificationversion"  numeric(18, 0),
    lastchanged             timestamp         default (now()) not null,
    "action"                numeric(18, 0),
    primary key ("trackercode")
)
;



-- 
-- table: tbldisplaycontrollerconfiguration 
--

create table tbldisplaycontrollerconfiguration(
    "win32_displaycontrollerconfigurationid"  int4              not null,
    "assetid"                                 int4              not null,
    "bitsperpixel"                            numeric(18, 0),
    "caption"                                 varchar(450),
    "colorplanes"                             numeric(18, 0),
    "deviceentriesinacolortable"              numeric(18, 0),
    "devicespecificpens"                      numeric(18, 0),
    "horizontalresolution"                    numeric(18, 0),
    "refreshrate"                             numeric(18, 0),
    "verticalresolution"                      numeric(18, 0),
    "videomode"                               varchar(300),
    "lastchanged"                             timestamp         default (now()) not null,
    primary key ("win32_displaycontrollerconfigurationid")
)
;



-- 
-- table: tbldisplaycontrollerconfigurationhist 
--

create table tbldisplaycontrollerconfigurationhist(
    "trackercode"                 int4              not null,
    "assetid"                     int4              not null,
    "bitsperpixel"                numeric(18, 0),
    "caption"                     varchar(450),
    "colorplanes"                 numeric(18, 0),
    "deviceentriesinacolortable"  numeric(18, 0),
    "devicespecificpens"          numeric(18, 0),
    "horizontalresolution"        numeric(18, 0),
    "refreshrate"                 numeric(18, 0),
    "verticalresolution"          numeric(18, 0),
    "videomode"                   varchar(300),
    "lastchanged"                 timestamp         default (now()) not null,
    "action"                      numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: "tbldomainroles" 
--

create table tbldomainroles(
    "domainrole"      int4           not null,
    "domainrolename"  varchar(50)    not null,
    primary key ("domainrole")
)
;



-- 
-- table: tblencryptablevolume 
--

create table tblencryptablevolume(
    "win32_encryptablevolumeid"  int4           not null,
    "assetid"                    int4           not null,
    "driveletter"                varchar(50),
    "protectionstatus"           int4,
    "lastchanged"                timestamp      default (now()) not null,
    primary key ("win32_encryptablevolumeid")
)
;



-- 
-- table: tblenvironment 
--

create table tblenvironment(
    "win32_environmentid"  int4             not null,
    "assetid"              int4             not null,
    "caption"              varchar(450),
    "name"                 varchar(450),
    "systemvariable"       boolean,
    "username"             varchar(300),
    "variablevalue"        varchar(4000),
    "lastchanged"          timestamp        default (now()) not null,
    primary key ("win32_environmentid")
)
;



-- 
-- table: tblerrors 
--

create table tblerrors(
    "teller"       int4             not null,
    "assetid"      int4             not null,
    "cfgname"      varchar(20),
    "errortext"    varchar(2000),
    "lastchanged"  timestamp        default (now()) not null,
    "errortype"    int4             default ((0)) not null,
    primary key ("teller")
)
;



-- 
-- table: tblfeature 
--

create table tblfeature(
    "featureid"    int4         not null,
    "assetid"      int4         not null,
    "featuniid"    int4         not null,
    "lastchanged"  timestamp    default (now()) not null,
    primary key ("featureid")
)
;



-- 
-- table: "tblfeatureuni" 
--

create table tblfeatureuni(
    "featuniid"       int4            not null,
    "featurename"     varchar(300),
    "featurecaption"  varchar(150),
    "addeddate"       timestamp       default (now()) not null,
    primary key ("featuniid")
)
;



-- 
-- table: tblfileversions 
--

create table tblfileversions(
    "versionid"     int4              not null,
    "assetid"       int4              not null,
    "found"         boolean      default (false),
    "filepathfull"  varchar(1000),
    "fileversion"   varchar(100),
    "companyname"   varchar(300),
    "filesize"      numeric(18, 0),
    "lastchanged"   timestamp         default (now()) not null,
    "creationdate"  timestamp,
    "lastaccessed"  timestamp,
    "lastmodified"  timestamp,
    primary key ("versionid")
)
;



-- 
-- table: tblfloppy 
--

create table tblfloppy(
    "floppyid"           int4              not null,
    "assetid"            int4              not null,
    bytespersector       numeric(18, 0),
    "interfacetype"      varchar(450),
    "manufacturer"       varchar(450),
    "model"              varchar(450),
    "name"               varchar(450),
    "partitions"         numeric(18, 0),
    "sectorspertrack"    numeric(18, 0),
    "size"               numeric(18, 0),
    "totalcylinders"     numeric(18, 0),
    "totalheads"         numeric(18, 0),
    "totalsectors"       numeric(18, 0),
    "totaltracks"        numeric(18, 0),
    "trackspercylinder"  numeric(18, 0),
    "lastchanged"        timestamp         default (now()) not null,
    "firmwarerevision"   varchar(250),
    "serialnumber"       varchar(250),
    "status"             varchar(15),
    primary key ("floppyid")
)
;



-- 
-- table: tblfloppyhist 
--

create table tblfloppyhist(
    "trackercode"        int4              not null,
    "assetid"            int4              not null,
    bytespersector       numeric(18, 0),
    "interfacetype"      varchar(100),
    "manufacturer"       varchar(300),
    "model"              varchar(450),
    "name"               varchar(450),
    "partitions"         numeric(18, 0),
    "sectorspertrack"    numeric(18, 0),
    "size"               numeric(18, 0),
    "totalcylinders"     numeric(18, 0),
    "totalheads"         numeric(18, 0),
    "totalsectors"       numeric(18, 0),
    "totaltracks"        numeric(18, 0),
    "trackspercylinder"  numeric(18, 0),
    "lastchanged"        timestamp         default (now()) not null,
    "action"             numeric(18, 0),
    "firmwarerevision"   varchar(250),
    "serialnumber"       varchar(250),
    "status"             varchar(15),
    primary key ("trackercode")
)
;



-- 
-- table: tblgroups 
--

create table tblgroups(
    "userid"       int4         not null,
    "assetid"      int4         not null,
    "groupid"      int4         not null,
    "lastchanged"  timestamp    default (now()) not null,
    primary key ("userid")
)
;



-- 
-- table: tblgroupshist 
--

create table tblgroupshist(
    "trackercode"  int4              not null,
    "assetid"      int4              not null,
    "groupid"      int4              not null,
    "lastchanged"  timestamp         default (now()) not null,
    "action"       numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: "tblgroupuni" 
--

create table tblgroupuni(
    "groupid"  int4            not null,
    "name"     varchar(300),
    "sid"      varchar(300),
    primary key ("groupid")
)
;



-- 
-- table: tblhypervguest 
--

create table tblhypervguest(
    "hypervguestid"  int4            not null,
    "assetid"        int4            not null,
    "name"           varchar(255),
    "enabledstate"   int8,
    "healthstate"    int8,
    "lastchanged"    timestamp       default (now()) not null,
    "memory"         int4,
    "instanceid"     varchar(50),
    primary key ("hypervguestid")
)
;



-- 
-- table: tblhypervguestnetwork 
--

create table tblhypervguestnetwork(
    "hypervguestnetworkid"  int4           not null,
    "hypervguestid"         int4           not null,
    "macaddress"            varchar(50),
    "lastchanged"           timestamp      default (now()) not null,
    primary key ("hypervguestnetworkid")
)
;



-- 
-- table: tblidecontroller 
--

create table tblidecontroller(
    "win32_idecontrollerid"  int4              not null,
    "assetid"                int4              not null,
    "caption"                varchar(450),
    "manufacturer"           varchar(450),
    "protocolsupported"      numeric(18, 0),
    "lastchanged"            timestamp         default (now()) not null,
    primary key ("win32_idecontrollerid")
)
;



-- 
-- table: tblidecontrollerhist 
--

create table tblidecontrollerhist(
    "trackercode"        int4              not null,
    "assetid"            int4              not null,
    "caption"            varchar(450),
    "manufacturer"       varchar(450),
    "protocolsupported"  numeric(18, 0),
    "lastchanged"        timestamp         default (now()) not null,
    "action"             numeric(18, 0),
    primary key ("trackercode")
)
;



-- 
-- table: tblieactivex 
--

create table tblieactivex(
    "ieactivexid"  int4             not null,
    "assetid"      int4             not null,
    "control"      varchar(150),
    "codebase"     varchar(1000),
    "inf"          varchar(1000),
    "osd"          varchar(1000),
    "lastchanged"  timestamp        default (now()) not null,
    primary key ("ieactivexid")
)
;



-- 
-- table: tblieactivexhist 
--

create table tblieactivexhist(
    "trackercode"  int4              not null,
    "assetid"      int4              not null,
    "control"      varchar(150),
    "codebase"     varchar(1000),
    "inf"          varchar(1000),
    "osd"          varchar(1000),
    "lastchanged"  timestamp         default (now()) not null,
    "action"       numeric(18, 0),
    primary key ("trackercode")
)
;



-- 
-- table: tbliebars 
--

create table tbliebars(
    "iebarid"      int4            not null,
    "assetid"      int4            not null,
    "control"      varchar(100),
    "lastchanged"  timestamp       default (now()) not null,
    primary key ("iebarid")
)
;



-- 
-- table: tbliebarshist 
--

create table tbliebarshist(
    "trackercode"  int4              not null,
    "assetid"      int4              not null,
    "control"      varchar(100),
    "lastchanged"  timestamp         default (now()) not null,
    "action"       numeric(18, 0),
    primary key ("trackercode")
)
;



-- 
-- table: tbliebho 
--

create table tbliebho(
    "iebhoid"      int4            not null,
    "assetid"      int4            not null,
    "control"      varchar(100),
    "lastchanged"  timestamp       default (now()) not null,
    primary key ("iebhoid")
)
;



-- 
-- table: tbliebhohist 
--

create table tbliebhohist(
    "trackercode"  int4              not null,
    "assetid"      int4              not null,
    "control"      varchar(100),
    "lastchanged"  timestamp         default (now()) not null,
    "action"       numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblieextensions 
--

create table tblieextensions(
    "ieextid"      int4             not null,
    "assetid"      int4             not null,
    "control"      varchar(50),
    "buttontext"   varchar(500),
    "clsid"        varchar(100),
    "exec"         varchar(1000),
    "menutext"     varchar(500),
    "lastchanged"  timestamp        default (now()) not null,
    primary key ("ieextid")
)
;



-- 
-- table: tblieextensionshist 
--

create table tblieextensionshist(
    "trackercode"  int4              not null,
    "assetid"      int4              not null,
    "control"      varchar(50),
    "buttontext"   varchar(500),
    "clsid"        varchar(100),
    "exec"         varchar(1000),
    "menutext"     varchar(500),
    "lastchanged"  timestamp         default (now()) not null,
    "action"       numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblinfrareddevice 
--

create table tblinfrareddevice(
    "win32_infrareddeviceid"   int4              not null,
    "assetid"                  int4              not null,
    "availability"             numeric(18, 0),
    "caption"                  varchar(450),
    "configmanagererrorcode"   numeric(18, 0),
    "configmanageruserconfig"  boolean,
    "manufacturer"             varchar(450),
    "protocolsupported"        boolean,
    "lastchanged"              timestamp         default (now()) not null,
    primary key ("win32_infrareddeviceid")
)
;



-- 
-- table: tblinfrareddevicehist 
--

create table tblinfrareddevicehist(
    "trackercode"              int4              not null,
    "assetid"                  int4              not null,
    "availability"             numeric(18, 0),
    "caption"                  varchar(450),
    "configmanagererrorcode"   numeric(18, 0),
    "configmanageruserconfig"  boolean,
    "manufacturer"             varchar(450),
    "protocolsupported"        boolean,
    "lastchanged"              timestamp         default (now()) not null,
    "action"                   numeric(18, 0),
    primary key ("trackercode")
)
;



-- 
-- table: tblkeyboard 
--

create table tblkeyboard(
    "win32_keyboardid"         int4              not null,
    "assetid"                  int4              not null,
    "configmanagererrorcode"   numeric(18, 0),
    "configmanageruserconfig"  boolean,
    "description"              varchar(450),
    "layout"                   varchar(50),
    "numberoffunctionkeys"     numeric(18, 0),
    "lastchanged"              timestamp         default (now()) not null,
    primary key ("win32_keyboardid")
)
;



-- 
-- table: tblkeyboardhist 
--

create table tblkeyboardhist(
    "trackercode"              int4              not null,
    "assetid"                  int4              not null,
    "configmanagererrorcode"   numeric(18, 0),
    "configmanageruserconfig"  boolean,
    "description"              varchar(450),
    "layout"                   varchar(50),
    "numberoffunctionkeys"     numeric(18, 0),
    "lastchanged"              timestamp         default (now()) not null,
    "action"                   numeric(18, 0),
    primary key ("trackercode")
)
;



-- 
-- table: "tbllanguages" 
--

create table tbllanguages(
    "languagecode"  int4            not null,
    "language"      varchar(200)    not null,
    primary key ("languagecode")
)
;



-- 
-- table: tbllicenses 
--

create table tbllicenses(
    "licenseidid"          int4            not null,
    "softwarename"         varchar(300)    not null,
    "priceperlicense"      money           default ((0)) not null,
    "licensetype"          int4,
    "licensetypecomments"  text,
    "licensecontract"      boolean      default (false) not null,
    "licenseexpiration"    timestamp,
    "comments"             text,
    "licensecontact"       varchar(500),
    "licenseowner"         varchar(255),
    primary key ("licenseidid")
)
;



-- 
-- table: tbllinuxbaseboard 
--

create table tbllinuxbaseboard(
    "baseboardid"        int4           not null,
    "assetid"            int4           not null,
    "productname"        varchar(50),
    "manufacturer"       varchar(50),
    "version"            varchar(50),
    "serialnumber"       varchar(50),
    "locationinchassis"  varchar(50),
    "type"               varchar(50),
    "lastchanged"        timestamp      default (now()) not null,
    primary key ("baseboardid")
)
;



-- 
-- table: tbllinuxbios 
--

create table tbllinuxbios(
    "biosid"       int4            not null,
    "assetid"      int4            not null,
    "version"      varchar(150),
    "releasedate"  varchar(150),
    "address"      varchar(150),
    "vendor"       varchar(150),
    "runtimesize"  varchar(150),
    "romsize"      varchar(150),
    "lastchanged"  timestamp       default (now()) not null,
    primary key ("biosid")
)
;



-- 
-- table: tbllinuxenclosure 
--

create table tbllinuxenclosure(
    "linuxenclosureid"  int4              not null,
    "assetid"           int4              not null,
    "chassistypes"      numeric(18, 0),
    "lockpresent"       boolean,
    "manufacturer"      varchar(450),
    "securitystatus"    numeric(18, 0),
    "serialnumber"      varchar(300),
    "smbiosassettag"    varchar(300),
    "version"           varchar(300),
    "lastchanged"       timestamp         default (now()) not null,
    primary key ("linuxenclosureid")
)
;



-- 
-- table: tbllinuxgraphicscards 
--

create table tbllinuxgraphicscards(
    "graphicsid"             int4            not null,
    "assetid"                int4            not null,
    "name"                   varchar(200),
    "manufacturer"           varchar(200),
    "type"                   varchar(200),
    "deviceid"               varchar(200),
    "lastchanged"            timestamp       default (now()) not null,
    "subsystemname"          varchar(200),
    "subsystemmanufacturer"  varchar(200),
    primary key ("graphicsid")
)
;



-- 
-- table: tbllinuxharddisks 
--

create table tbllinuxharddisks(
    "harddiskid"   int4            not null,
    "assetid"      int4            not null,
    "filesystem"   varchar(400),
    "size"         varchar(30),
    "used"         varchar(30),
    "available"    varchar(30),
    "percentage"   varchar(10),
    "mountedon"    varchar(300),
    "lastchanged"  timestamp       default (now()) not null,
    primary key ("harddiskid")
)
;



-- 
-- table: tbllinuxmemorycontroller 
--

create table tbllinuxmemorycontroller(
    "controllerid"         int4            not null,
    "assetid"              int4            not null,
    "supportedinterleave"  varchar(50),
    "currentinterleave"    varchar(50),
    "maxmemorymodulesize"  varchar(20),
    "maxtotalmemorysize"   varchar(20),
    "supportedspeeds"      varchar(100),
    "supportedmemtypes"    varchar(100),
    "memorymodulevoltage"  varchar(10),
    "numberofslots"        varchar(10),
    "lastchanged"          timestamp       default (now()) not null,
    primary key ("controllerid")
)
;



-- 
-- table: tbllinuxmemorydevices 
--

create table tbllinuxmemorydevices(
    "memorydeviceid"  int4           not null,
    "assetid"         int4           not null,
    "totalwidth"      varchar(20),
    "datawidth"       varchar(20),
    "size"            varchar(20),
    "formfactor"      varchar(20),
    "set"             varchar(20),
    "locator"         varchar(20),
    "banklocator"     varchar(20),
    "type"            varchar(20),
    "typedetail"      varchar(20),
    "speed"           varchar(20),
    "manufacturer"    varchar(20),
    "serialnumber"    varchar(20),
    "lastchanged"     timestamp      default (now()) not null,
    primary key ("memorydeviceid")
)
;



-- 
-- table: tbllinuxmemorymodules 
--

create table tbllinuxmemorymodules(
    "memorymoduleid"   int4           not null,
    "assetid"          int4           not null,
    "socket"           varchar(20),
    "bankconnections"  varchar(20),
    "currentspeed"     varchar(20),
    "type"             varchar(20),
    "installedsize"    varchar(50),
    "enabledsize"      varchar(50),
    "errorstatus"      varchar(20),
    "lastchanged"      timestamp      default (now()) not null,
    primary key ("memorymoduleid")
)
;



-- 
-- table: tbllinuxnetworkdetection 
--

create table tbllinuxnetworkdetection(
    "networkid"    int4            not null,
    "assetid"      int4            not null,
    "name"         varchar(200),
    "linkencap"    varchar(200),
    "mac"          varchar(200),
    "ipv4"         varchar(200),
    "ipv6"         varchar(200),
    "broadcast"    varchar(200),
    "subnetmask"   varchar(200),
    "scope"        varchar(200),
    "lastchanged"  timestamp       default (now()) not null,
    "gateway"      varchar(200),
    primary key ("networkid")
)
;



-- 
-- table: tbllinuxopticaldrives 
--

create table tbllinuxopticaldrives(
    "opticaldriveid"  int4           not null,
    "assetid"         int4           not null,
    "vendor"          varchar(50),
    "path"            varchar(20),
    "product"         varchar(50),
    "bus"             varchar(20),
    "mount"           varchar(20),
    "lastchanged"     timestamp      default (now()) not null,
    primary key ("opticaldriveid")
)
;



-- 
-- table: tbllinuxpcicards 
--

create table tbllinuxpcicards(
    "pciid"                  int4            not null,
    "assetid"                int4            not null,
    "name"                   varchar(300),
    "manufacturer"           varchar(300),
    "type"                   varchar(300),
    "deviceid"               varchar(300),
    "lastchanged"            timestamp       default (now()) not null,
    "subsystemname"          varchar(200),
    "subsystemmanufacturer"  varchar(200),
    primary key ("pciid")
)
;



-- 
-- table: tbllinuxprocessors 
--

create table tbllinuxprocessors(
    "processorid"    int4            not null,
    "assetid"        int4            not null,
    "socket"         varchar(200),
    "type"           varchar(200),
    "family"         varchar(200),
    "manufacturer"   varchar(200),
    "id"             varchar(200),
    "version"        varchar(200),
    "voltage"        varchar(200),
    "externalclock"  varchar(200),
    "maxspeed"       varchar(200),
    "currentspeed"   varchar(200),
    "status"         varchar(200),
    "serialnumber"   varchar(200),
    "lastchanged"    timestamp       default (now()) not null,
    primary key ("processorid")
)
;



-- 
-- table: tbllinuxsoftware 
--

create table tbllinuxsoftware(
    "softwareid"     int4            not null,
    "assetid"        int4            not null,
    "softwareuniid"  int4            not null,
    "version"        varchar(50),
    "release"        varchar(50),
    "architecture"   varchar(255),
    "desired"        varchar(20),
    "status"         varchar(20),
    "error"          varchar(20),
    "installdate"    varchar(100),
    "lastchanged"    timestamp       default (now()) not null,
    primary key ("softwareid")
)
;



-- 
-- table: tbllinuxsoundcards 
--

create table tbllinuxsoundcards(
    "soundid"      int4         not null,
    "assetid"      int4         not null,
    "card"         char(300),
    "vendor"       char(50),
    "parent"       char(50),
    "lastchanged"  timestamp    default (now()) not null,
    primary key ("soundid")
)
;



-- 
-- table: tbllinuxsystem 
--

create table tbllinuxsystem(
    "systemid"             int4            not null,
    "assetid"              int4            not null,
    "manufacturer"         varchar(150),
    "productname"          varchar(150),
    "version"              varchar(150),
    "serial"               varchar(150),
    "uuid"                 varchar(150),
    "wakeuptime"           varchar(150),
    "bootstatus"           varchar(150),
    "networknodehostname"  varchar(150),
    "kernelname"           varchar(150),
    "kernelrelease"        varchar(150),
    "kernelversion"        varchar(150),
    "machinehardwarename"  varchar(150),
    "processortype"        varchar(150),
    "hardwareplatform"     varchar(150),
    "operatingsystem"      varchar(150),
    "osrelease"            varchar(150),
    "lastchanged"          timestamp       default (now()) not null,
    "systemsku"            varchar(150),
    primary key ("systemid")
)
;



-- 
-- table: tbllinuxvolumes 
--

create table tbllinuxvolumes(
    "volumeid"     int4           not null,
    "assetid"      int4           not null,
    "type"         varchar(20),
    "size"         varchar(30),
    "mounted"      varchar(20),
    "path"         varchar(50),
    "mountpoint"   varchar(50),
    "label"        varchar(50),
    "lastchanged"  timestamp      default (now()) not null,
    primary key ("volumeid")
)
;



-- 
-- table: "tblloginlog" 
--

create table tblloginlog(
    "logid"      int4            not null,
    "success"    boolean         not null,
    "ipaddress"  varchar(500)    not null,
    "username"   varchar(100)    not null,
    "date"       timestamp       default (now()) not null,
    cert         varchar(300),
    primary key ("logid")
)
;



-- 
-- table: tblmacapplications 
--

create table tblmacapplications(
    "applicationid"  int4            not null,
    "assetid"        int4            not null,
    softid           int4            not null,
    "version"        varchar(200),
    "installdate"    timestamp,
    "lastchanged"    timestamp       default (now()) not null,
    primary key ("applicationid")
)
;



-- 
-- table: tblmacdiscburning 
--

create table tblmacdiscburning(
    "discburningid"           int4            not null,
    "assetid"                 int4            not null,
    "name"                    varchar(100),
    "firmware"                varchar(20),
    "interconnect"            varchar(50),
    "burnsupport"             varchar(50),
    "burnunderrunprotection"  boolean,
    "cache"                   varchar(20),
    "cdwrite"                 varchar(20),
    "dvdwrite"                varchar(50),
    "media"                   boolean,
    "readdvd"                 boolean,
    "writestrategies"         varchar(50),
    "lastchanged"             timestamp       default (now()) not null,
    primary key ("discburningid")
)
;



-- 
-- table: tblmacdisplays 
--

create table tblmacdisplays(
    "displayid"      int4           not null,
    "assetid"        int4           not null,
    "name"           varchar(50),
    "devicetype"     varchar(50),
    "displaytype"    varchar(50),
    "builtin"        boolean,
    "depth"          varchar(50),
    "main"           boolean,
    "mirror"         varchar(20),
    "online"         boolean,
    "resolution"     varchar(50),
    "coreimage"      varchar(50),
    "quartzextreme"  varchar(50),
    "lastchanged"    timestamp      default (now()) not null,
    primary key ("displayid")
)
;



-- 
-- table: tblmacfirewires 
--

create table tblmacfirewires(
    "firewireid"   int4           not null,
    "assetid"      int4           not null,
    "name"         varchar(50),
    "maxspeed"     varchar(50),
    "lastchanged"  timestamp      default (now()) not null,
    primary key ("firewireid")
)
;



-- 
-- table: tblmachwoverview 
--

create table tblmachwoverview(
    "hwoverviewid"      int4           not null,
    "assetid"           int4           not null,
    "machinename"       varchar(50),
    "machinemodel"      varchar(50),
    "cputype"           varchar(50),
    "nrofcpus"          int4,
    "cpuspeed"          varchar(50),
    "l2cachepercpu"     varchar(50),
    "memory"            varchar(50),
    "busspeed"          varchar(50),
    "bootromversion"    varchar(50),
    "serialnumber"      varchar(50),
    "packages"          int4,
    "platformuuid"      varchar(50),
    "smcversionsystem"  varchar(50),
    "lastchanged"       timestamp      default (now()) not null,
    primary key ("hwoverviewid")
)
;



-- 
-- table: tblmacmemory 
--

create table tblmacmemory(
    "memoryid"     int4           not null,
    "assetid"      int4           not null,
    "name"         varchar(50),
    "size"         varchar(20),
    "speed"        varchar(20),
    "type"         varchar(20),
    "status"       varchar(20),
    "lastchanged"  timestamp      default (now()) not null,
    primary key ("memoryid")
)
;



-- 
-- table: tblmacmodems 
--

create table tblmacmodems(
    "modemid"        int4           not null,
    "assetid"        int4           not null,
    "model"          varchar(50),
    "interfacetype"  varchar(20),
    "modulation"     varchar(20),
    "hwversion"      varchar(20),
    "driverinfo"     varchar(50),
    "countryinfo"    varchar(50),
    "lastchanged"    timestamp      default (now()) not null,
    primary key ("modemid")
)
;



-- 
-- table: tblmacnetwork 
--

create table tblmacnetwork(
    "networkid"      int4            not null,
    "assetid"        int4            not null,
    "name"           varchar(200),
    "serviceorder"   int4,
    "hardware"       varchar(50),
    "bsddevicename"  varchar(50),
    "type"           varchar(50),
    "lastchanged"    timestamp       default (now()) not null,
    "mac"            varchar(200),
    "ipv4"           varchar(200),
    "ipv4mask"       varchar(200),
    "ipv6"           varchar(200),
    "ipv6prefix"     varchar(200),
    "gateway"        varchar(200),
    primary key ("networkid")
)
;



-- 
-- table: tblmacnetworkvolumes 
--

create table tblmacnetworkvolumes(
    "networkvolumeid"  int4           not null,
    "assetid"          int4           not null,
    "name"             varchar(50),
    "automounted"      boolean,
    "mountedfrom"      varchar(50),
    "mountpoint"       varchar(50),
    "type"             varchar(50),
    "lastchanged"      timestamp      default (now()) not null,
    primary key ("networkvolumeid")
)
;



-- 
-- table: tblmacosinfo 
--

create table tblmacosinfo(
    "macosinfoid"                int4            not null,
    "assetid"                    int4            not null,
    "systemversion"              varchar(50),
    "kernelversion"              varchar(50),
    "bootvolume"                 varchar(50),
    "bootmode"                   varchar(50),
    "computername"               varchar(150),
    "username"                   varchar(150),
    "securevirtualmemory"        varchar(50),
    "sixtyfourbitkernelandexts"  varchar(50),
    "lastchanged"                timestamp       default (now()) not null,
    primary key ("macosinfoid")
)
;



-- 
-- table: tblmacpartitions 
--

create table tblmacpartitions(
    "harddiskid"   int4           not null,
    "assetid"      int4           not null,
    "filesystem"   varchar(50),
    "size"         varchar(20),
    "used"         varchar(20),
    "available"    varchar(20),
    "percentage"   varchar(10),
    "mountedon"    varchar(50),
    "lastchanged"  timestamp      default (now()) not null,
    primary key ("harddiskid")
)
;



-- 
-- table: tblmappeddrives 
--

create table tblmappeddrives(
    "driveid"      int4             not null,
    "assetid"      int4             not null,
    "username"     varchar(300),
    "driveletter"  varchar(3),
    "remotepath"   varchar(1024),
    "lastchanged"  timestamp        default (now()) not null,
    primary key ("driveid")
)
;



-- 
-- table: tblmonitor 
--

create table tblmonitor(
    "monitorid"            int4             not null,
    "assetid"              int4             not null,
    "monitormodel"         varchar(300),
    "serialnumber"         varchar(100),
    "monitormanufacturer"  varchar(400),
    "manufactureddate"     timestamp,
    "lastchanged"          timestamp        default (now()) not null,
    "pnpdeviceid"          varchar(1024),
    primary key ("monitorid")
)
;



-- 
-- table: tblmonitorhist 
--

create table tblmonitorhist(
    "trackercode"          int4              not null,
    "assetid"              int4              not null,
    "monitormodel"         varchar(300),
    "serialnumber"         varchar(100),
    "monitormanufacturer"  varchar(300),
    "manufactureddate"     timestamp,
    "lastchanged"          timestamp         default (now()) not null,
    "action"               numeric(18, 0)    not null,
    "pnpdeviceid"          varchar(1024),
    primary key ("trackercode")
)
;



-- 
-- table: tblnetwork 
--

create table tblnetwork(
    "networkid"                     int4              not null,
    "assetid"                       int4              not null,
    "databasepath"                  varchar(500),
    "defaultipgateway"              varchar(500),
    "description"                   varchar(450),
    "dhcpenabled"                   boolean,
    "dhcpserver"                    varchar(50),
    "dnsdomain"                     varchar(450),
    "dnsdomainsuffixsearchorder"    varchar(1000),
    "dnsenabledforwinsresolution"   boolean,
    "dnshostname"                   varchar(300),
    "dnsserversearchorder"          varchar(500),
    "domaindnsregistrationenabled"  boolean,
    "fulldnsregistrationenabled"    boolean,
    "gatewaycostmetric"             varchar(500),
    "ipaddress"                     varchar(500),
    "ipconnectionmetric"            numeric(18, 0),
    "ipenabled"                     boolean,
    "ipfiltersecurityenabled"       boolean,
    "ipportsecurityenabled"         boolean,
    "ipsecpermitipprotocols"        varchar(200),
    "ipsecpermittcpports"           varchar(200),
    "ipsubnet"                      varchar(500),
    "macaddress"                    varchar(20),
    "servicename"                   varchar(900),
    "tcpipnetbiosoptions"           numeric(18, 0),
    "winsenablelmhostslookup"       boolean,
    "winsprimaryserver"             varchar(50),
    "winsscopeid"                   varchar(50),
    "winssecondaryserver"           varchar(50),
    "lastchanged"                   timestamp         default (now()) not null,
    primary key ("networkid")
)
;



-- 
-- table: tblnetworkadapter 
--

create table tblnetworkadapter(
    networkadapterid    int8            not null,
    "assetid"           int4            not null,
    "macaddress"        varchar(20),
    "manufacturer"      varchar(300),
    "name"              varchar(300),
    "netconnectionid"   varchar(300),
    "netenabled"        boolean,
    "speed"             int8,
    "lastchanged"       timestamp       default (now()) not null,
    primary key (networkadapterid)
)
;



-- 
-- table: tblnetworkclient 
--

create table tblnetworkclient(
    "win32_networkclientid"  int4            not null,
    "assetid"                int4            not null,
    "caption"                varchar(450),
    "manufacturer"           varchar(450),
    "name"                   varchar(450),
    "lastchanged"            timestamp       default (now()) not null,
    primary key ("win32_networkclientid")
)
;



-- 
-- table: tblnetworkclienthist 
--

create table tblnetworkclienthist(
    "trackercode"   int4              not null,
    "assetid"       int4              not null,
    "caption"       varchar(450),
    "manufacturer"  varchar(450),
    "name"          varchar(450),
    "lastchanged"   timestamp         default (now()) not null,
    "action"        numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblnetworkhist 
--

create table tblnetworkhist(
    "trackercode"                   int4              not null,
    "assetid"                       int4              not null,
    "databasepath"                  varchar(500),
    "defaultipgateway"              varchar(500),
    "description"                   varchar(450),
    "dhcpenabled"                   boolean,
    "dhcpserver"                    varchar(50),
    "dnsdomain"                     varchar(450),
    "dnsdomainsuffixsearchorder"    varchar(1000),
    "dnsenabledforwinsresolution"   boolean,
    "dnshostname"                   varchar(300),
    "dnsserversearchorder"          varchar(500),
    "domaindnsregistrationenabled"  boolean,
    "fulldnsregistrationenabled"    boolean,
    "gatewaycostmetric"             varchar(500),
    "ipaddress"                     varchar(500),
    "ipconnectionmetric"            numeric(18, 0),
    "ipenabled"                     boolean,
    "ipfiltersecurityenabled"       boolean,
    "ipportsecurityenabled"         boolean,
    "ipsecpermitipprotocols"        varchar(200),
    "ipsecpermittcpports"           varchar(200),
    "ipsubnet"                      varchar(500),
    "macaddress"                    varchar(20),
    "servicename"                   varchar(900),
    "tcpipnetbiosoptions"           numeric(18, 0),
    "winsenablelmhostslookup"       boolean,
    "winsprimaryserver"             varchar(50),
    "winsscopeid"                   varchar(50),
    "winssecondaryserver"           varchar(50),
    "lastchanged"                   timestamp         default (now()) not null,
    "action"                        numeric(18, 0),
    primary key ("trackercode")
)
;



-- 
-- table: tblntlog 
--

create table tblntlog(
    "eventlogid"     int8         not null,
    "assetid"        int4         not null,
    "eventcode"      int4,
    "eventtype"      int2,
    "logfileid"      int4,
    "messageid"      int4,
    "sourcenameid"   int4,
    "loguserid"      int4,
    "timegenerated"  timestamp,
    primary key ("eventlogid")
)
;



-- 
-- table: tblntlogfile 
--

create table tblntlogfile(
    "logfileid"  int4            not null,
    "logfile"    varchar(100)    not null,
    primary key ("logfileid")
)
;



-- 
-- table: tblntlogmessage 
--

create table tblntlogmessage(
    "messageid"  int4             not null,
    "hash"       varchar(40)      not null,
    "message"    varchar(3900)    not null,
    primary key ("messageid")
)
;



-- 
-- table: tblntlogsource 
--

create table tblntlogsource(
    "sourcenameid"  int4            not null,
    "sourcename"    varchar(100)    not null,
    primary key ("sourcenameid")
)
;



-- 
-- table: tblntloguser 
--

create table tblntloguser(
    "loguserid"  int4            not null,
    "loguser"    varchar(300)    not null,
    primary key ("loguserid")
)
;



-- 
-- table: tblonboarddevice 
--

create table tblonboarddevice(
    "win32_onboarddeviceid"  int4              not null,
    "assetid"                int4              not null,
    "description"            varchar(450),
    "devicetype"             numeric(18, 0),
    "enabled"                boolean,
    "tag"                    varchar(450),
    "lastchanged"            timestamp         default (now()) not null,
    primary key ("win32_onboarddeviceid")
)
;



-- 
-- table: tblonboarddevicehist 
--

create table tblonboarddevicehist(
    "trackercode"  int4              not null,
    "assetid"      int4              not null,
    "description"  varchar(450),
    "devicetype"   numeric(18, 0),
    "enabled"      boolean,
    "tag"          varchar(450),
    "lastchanged"  timestamp         default (now()) not null,
    "action"       numeric(18, 0),
    primary key ("trackercode")
)
;



-- 
-- table: tbloperatingsystem 
--

create table tbloperatingsystem(
    "osid"                                       int4              not null,
    "assetid"                                    int4              not null,
    "buildtype"                                  varchar(450),
    "caption"                                    varchar(450),
    "codeset"                                    varchar(50),
    "countrycode"                                varchar(50),
    "currenttimezone"                            numeric(18, 0),
    "dataexecutionprevention_32bitapplications"  boolean,
    "dataexecutionprevention_available"          boolean,
    "dataexecutionprevention_drivers"            boolean,
    "dataexecutionprevention_supportpolicy"      numeric(18, 0),
    "debug"                                      boolean,
    "encryptionlevel"                            numeric(18, 0),
    "foregroundapplicationboost"                 int4,
    "installdate"                                timestamp,
    "largesystemcache"                           boolean,
    "maxprocessmemorysize"                       numeric(18, 0),
    "numberoflicensedusers"                      numeric(18, 0),
    "organization"                               varchar(450),
    "oslanguage"                                 numeric(18, 0),
    "osproductsuite"                             numeric(18, 0),
    "ostype"                                     numeric(18, 0),
    "othertypedescription"                       varchar(50),
    "plusproductid"                              varchar(50),
    "plusversionnumber"                          varchar(50),
    "producttype"                                numeric(18, 0),
    "registereduser"                             varchar(450),
    "serialnumber"                               varchar(50),
    "servicepackmajorversion"                    numeric(18, 0),
    "servicepackminorversion"                    numeric(18, 0),
    "sizestoredinpagingfiles"                    numeric(18, 0),
    "suitemask"                                  numeric(18, 0),
    "systemdevice"                               varchar(450),
    "systemdrive"                                varchar(50),
    "totalvirtualmemorysize"                     numeric(18, 0),
    "totalvisiblememorysize"                     numeric(18, 0),
    "version"                                    varchar(50),
    "windowsdirectory"                           varchar(300),
    "lastchanged"                                timestamp         default (now()) not null,
    primary key ("osid")
)
;



-- 
-- table: tbloperatingsystemhist 
--

create table tbloperatingsystemhist(
    "trackercode"                                int4              not null,
    "assetid"                                    int4              not null,
    "buildtype"                                  varchar(450),
    "caption"                                    varchar(450),
    "codeset"                                    varchar(50),
    "countrycode"                                varchar(50),
    "currenttimezone"                            numeric(18, 0),
    "dataexecutionprevention_32bitapplications"  boolean,
    "dataexecutionprevention_available"          boolean,
    "dataexecutionprevention_drivers"            boolean,
    "dataexecutionprevention_supportpolicy"      numeric(18, 0),
    "debug"                                      boolean,
    "encryptionlevel"                            numeric(18, 0),
    "foregroundapplicationboost"                 int4,
    "installdate"                                timestamp,
    "largesystemcache"                           boolean,
    "maxprocessmemorysize"                       numeric(18, 0),
    "numberoflicensedusers"                      numeric(18, 0),
    "organization"                               varchar(450),
    "oslanguage"                                 numeric(18, 0),
    "osproductsuite"                             numeric(18, 0),
    "ostype"                                     numeric(18, 0),
    "othertypedescription"                       varchar(50),
    "plusproductid"                              varchar(50),
    "plusversionnumber"                          varchar(50),
    "producttype"                                numeric(18, 0),
    "registereduser"                             varchar(450),
    "serialnumber"                               varchar(50),
    "servicepackmajorversion"                    numeric(18, 0),
    "servicepackminorversion"                    numeric(18, 0),
    "sizestoredinpagingfiles"                    numeric(18, 0),
    "suitemask"                                  numeric(18, 0),
    "systemdevice"                               varchar(450),
    "systemdrive"                                varchar(50),
    "totalvirtualmemorysize"                     numeric(18, 0),
    "totalvisiblememorysize"                     numeric(18, 0),
    "version"                                    varchar(50),
    "windowsdirectory"                           varchar(300),
    "lastchanged"                                timestamp         default (now()) not null,
    "action"                                     numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tbloslicenses 
--

create table tbloslicenses(
    "oslicenseidid"    int4            not null,
    "os"               varchar(450)    not null,
    "priceperlicense"  money           default ((0)) not null,
    "comments"         text,
    "licensecontact"   varchar(500),
    "licenseowner"     varchar(255),
    primary key ("oslicenseidid")
)
;



-- 
-- table: tblosrecoveryconfiguration 
--

create table tblosrecoveryconfiguration(
    "win32_osrecoveryconfigurationid"  int4              not null,
    "assetid"                          int4              not null,
    "autoreboot"                       boolean,
    "debugfilepath"                    varchar(450),
    "debuginfotype"                    numeric(18, 0),
    "kerneldumponly"                   boolean,
    "minidumpdirectory"                varchar(450),
    "overwriteexistingdebugfile"       boolean,
    "sendadminalert"                   boolean,
    "writedebuginfo"                   boolean,
    "writetosystemlog"                 boolean,
    "lastchanged"                      timestamp         default (now()) not null,
    primary key ("win32_osrecoveryconfigurationid")
)
;



-- 
-- table: tblosrecoveryconfigurationhist 
--

create table tblosrecoveryconfigurationhist(
    "trackercode"                 int4              not null,
    "assetid"                     int4              not null,
    "autoreboot"                  boolean,
    "debugfilepath"               varchar(450),
    "debuginfotype"               numeric(18, 0),
    "kerneldumponly"              boolean,
    "minidumpdirectory"           varchar(450),
    "overwriteexistingdebugfile"  boolean,
    "sendadminalert"              boolean,
    "writedebuginfo"              boolean,
    "writetosystemlog"            boolean,
    "lastchanged"                 timestamp         default (now()) not null,
    "action"                      numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblossublicensedocs 
--

create table tblossublicensedocs(
    "oslicensesubdocid"  int4             not null,
    "oslicenseidid"      int4             not null,
    "doclink"            varchar(1000),
    "docname"            varchar(255),
    "comments"           text,
    primary key ("oslicensesubdocid")
)
;



-- 
-- table: tblossublicenses 
--

create table tblossublicenses(
    "oslicensesubid"  int4            not null,
    "oslicenseidid"   int4            not null,
    "os"              varchar(450)    not null,
    primary key ("oslicensesubid")
)
;



-- 
-- table: tblossublicensesorders 
--

create table tblossublicensesorders(
    "oslicensesuborderid"  int4            not null,
    "oslicenseidid"        int4            not null,
    "orderdate"            timestamp       default (now()),
    "nrlicenses"           int4,
    "priceperlicense"      money           default ((0)),
    "ordernumber"          varchar(255),
    "comments"             text,
    "licensekey"           text,
    primary key ("oslicensesuborderid")
)
;



-- 
-- table: tblpagefile 
--

create table tblpagefile(
    "win32_pagefileid"  int4              not null,
    "assetid"           int4              not null,
    "archive"           boolean,
    "caption"           varchar(450),
    "creationdate"      timestamp,
    "filesize"          numeric(18, 0),
    "hidden"            boolean,
    "initialsize"       numeric(18, 0),
    "installdate"       timestamp,
    "maximumsize"       numeric(18, 0),
    "path"              varchar(450),
    "readable"          boolean,
    "system"            boolean,
    "writeable"         boolean,
    "lastchanged"       timestamp         default (now()) not null,
    primary key ("win32_pagefileid")
)
;



-- 
-- table: tblpagefilehist 
--

create table tblpagefilehist(
    "trackercode"   int4              not null,
    "assetid"       int4              not null,
    "archive"       boolean,
    "caption"       varchar(450),
    "creationdate"  timestamp,
    "filesize"      numeric(18, 0),
    "hidden"        boolean,
    "initialsize"   numeric(18, 0),
    "installdate"   timestamp,
    "maximumsize"   numeric(18, 0),
    "path"          varchar(450),
    "readable"      boolean,
    "system"        boolean,
    "writeable"     boolean,
    "lastchanged"   timestamp         default (now()) not null,
    "action"        numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblparallelport 
--

create table tblparallelport(
    "win32_parallelportid"      int4              not null,
    "assetid"                   int4              not null,
    "availability"              numeric(18, 0),
    "caption"                   varchar(450),
    "configmanagererrorcode"    numeric(18, 0),
    "configmanageruserconfig"   boolean,
    "osautodiscovered"          boolean,
    "powermanagementsupported"  boolean,
    "protocolsupported"         numeric(18, 0),
    "lastchanged"               timestamp         default (now()) not null,
    primary key ("win32_parallelportid")
)
;



-- 
-- table: tblparallelporthist 
--

create table tblparallelporthist(
    "trackercode"               int4              not null,
    "assetid"                   int4              not null,
    "availability"              numeric(18, 0),
    "caption"                   varchar(450),
    "configmanagererrorcode"    numeric(18, 0),
    "configmanageruserconfig"   boolean,
    "osautodiscovered"          boolean,
    "powermanagementsupported"  boolean,
    "protocolsupported"         numeric(18, 0),
    "lastchanged"               timestamp         default (now()) not null,
    "action"                    numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblpcmciacontroller 
--

create table tblpcmciacontroller(
    "win32_pcmciacontrollerid"  int4              not null,
    "assetid"                   int4              not null,
    "caption"                   varchar(450),
    "configmanagererrorcode"    numeric(18, 0),
    "configmanageruserconfig"   boolean,
    "manufacturer"              varchar(450),
    "protocolsupported"         numeric(18, 0),
    "lastchanged"               timestamp         default (now()) not null,
    primary key ("win32_pcmciacontrollerid")
)
;



-- 
-- table: tblpcmciacontrollerhist 
--

create table tblpcmciacontrollerhist(
    "trackercode"              int4              not null,
    "assetid"                  int4              not null,
    "caption"                  varchar(450),
    "configmanagererrorcode"   numeric(18, 0),
    "configmanageruserconfig"  boolean,
    "manufacturer"             varchar(450),
    "protocolsupported"        numeric(18, 0),
    "lastchanged"              timestamp         default (now()) not null,
    "action"                   numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblphysicalmemory 
--

create table tblphysicalmemory(
    "win32_physicalmemoryid"  int4              not null,
    "assetid"                 int4              not null,
    "capacity"                numeric(18, 0),
    "datawidth"               numeric(18, 0),
    "devicelocator"           varchar(400),
    "formfactor"              numeric(18, 0),
    "interleavedatadepth"     numeric(18, 0),
    "interleaveposition"      numeric(18, 0),
    "memorytype"              int4,
    "positioninrow"           numeric(18, 0),
    "speed"                   numeric(18, 0),
    "totalwidth"              numeric(18, 0),
    "typedetail"              numeric(18, 0),
    "lastchanged"             timestamp         default (now()) not null,
    "manufacturer"            varchar(200),
    "partnumber"              varchar(200),
    "serialnumber"            varchar(200),
    "sku"                     varchar(200),
    "configuredclockspeed"    int4,
    "configuredvoltage"       int4,
    primary key ("win32_physicalmemoryid")
)
;



-- 
-- table: tblphysicalmemoryarray 
--

create table tblphysicalmemoryarray(
    "win32_physicalmemoryarrayid"  int4              not null,
    "assetid"                      int4              not null,
    "location"                     numeric(18, 0),
    "maxcapacity"                  numeric(18, 0),
    "memorydevices"                numeric(18, 0),
    "memoryerrorcorrection"        numeric(18, 0),
    "tag"                          varchar(450),
    "use"                          numeric(18, 0),
    "lastchanged"                  timestamp         default (now()) not null,
    primary key ("win32_physicalmemoryarrayid")
)
;



-- 
-- table: tblphysicalmemoryarrayhist 
--

create table tblphysicalmemoryarrayhist(
    "trackercode"            int4              not null,
    "assetid"                int4              not null,
    "location"               numeric(18, 0),
    "maxcapacity"            numeric(18, 0),
    "memorydevices"          numeric(18, 0),
    "memoryerrorcorrection"  numeric(18, 0),
    "tag"                    varchar(450),
    "use"                    numeric(18, 0),
    "lastchanged"            timestamp         default (now()) not null,
    "action"                 numeric(18, 0),
    primary key ("trackercode")
)
;



-- 
-- table: tblphysicalmemoryhist 
--

create table tblphysicalmemoryhist(
    "trackercode"           int4              not null,
    "assetid"               int4              not null,
    "capacity"              numeric(18, 0),
    "datawidth"             numeric(18, 0),
    "devicelocator"         varchar(400),
    "formfactor"            numeric(18, 0),
    "interleavedatadepth"   numeric(18, 0),
    "interleaveposition"    numeric(18, 0),
    "memorytype"            numeric(18, 0),
    "positioninrow"         numeric(18, 0),
    "speed"                 numeric(18, 0),
    "totalwidth"            numeric(18, 0),
    "typedetail"            numeric(18, 0),
    "lastchanged"           timestamp         default (now()) not null,
    "action"                numeric(18, 0)    not null,
    "manufacturer"          varchar(200),
    "partnumber"            varchar(200),
    "serialnumber"          varchar(200),
    "sku"                   varchar(200),
    "configuredclockspeed"  int4,
    "configuredvoltage"     int4,
    primary key ("trackercode")
)
;



-- 
-- table: tblpointingdevice 
--

create table tblpointingdevice(
    "win32_pointingdeviceid"  int4              not null,
    "assetid"                 int4              not null,
    "caption"                 varchar(450),
    "deviceinterface"         numeric(18, 0),
    "doublespeedthreshold"    numeric(18, 0),
    "handedness"              numeric(18, 0),
    "manufacturer"            varchar(450),
    "numberofbuttons"         numeric(18, 0),
    "pointingtype"            numeric(18, 0),
    "quadspeedthreshold"      numeric(18, 0),
    "lastchanged"             timestamp         default (now()) not null,
    primary key ("win32_pointingdeviceid")
)
;



-- 
-- table: tblpointingdevicehist 
--

create table tblpointingdevicehist(
    "trackercode"           int4              not null,
    "assetid"               int4              not null,
    "caption"               varchar(450),
    "deviceinterface"       numeric(18, 0),
    "doublespeedthreshold"  numeric(18, 0),
    "handedness"            numeric(18, 0),
    "manufacturer"          varchar(450),
    "numberofbuttons"       numeric(18, 0),
    "pointingtype"          numeric(18, 0),
    "quadspeedthreshold"    numeric(18, 0),
    "lastchanged"           timestamp         default (now()) not null,
    "action"                numeric(18, 0),
    primary key ("trackercode")
)
;



-- 
-- table: tblportablebattery 
--

create table tblportablebattery(
    "win32_portablebatteryid"  int4              not null,
    "assetid"                  int4              not null,
    "capacitymultiplier"       numeric(18, 0),
    "chemistry"                numeric(18, 0),
    "designcapacity"           numeric(18, 0),
    "designvoltage"            numeric(18, 0),
    "deviceid"                 varchar(1000),
    "location"                 varchar(1000),
    "manufacturedate"          timestamp,
    "manufacturer"             varchar(450),
    "maxbatteryerror"          numeric(18, 0),
    "name"                     varchar(450),
    "smartbatteryversion"      varchar(450),
    "lastchanged"              timestamp         default (now()) not null,
    primary key ("win32_portablebatteryid")
)
;



-- 
-- table: tblportablebatteryhist 
--

create table tblportablebatteryhist(
    "trackercode"          int4              not null,
    "assetid"              int4              not null,
    "capacitymultiplier"   numeric(18, 0),
    "chemistry"            numeric(18, 0),
    "designcapacity"       numeric(18, 0),
    "designvoltage"        numeric(18, 0),
    "deviceid"             varchar(1000),
    "location"             varchar(1000),
    "manufacturedate"      timestamp,
    "manufacturer"         varchar(450),
    "maxbatteryerror"      numeric(18, 0),
    "name"                 varchar(450),
    "smartbatteryversion"  varchar(450),
    "lastchanged"          timestamp         default (now()) not null,
    "action"               numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblportconnector 
--

create table tblportconnector(
    "win32_portconnectorid"        int4              not null,
    "assetid"                      int4              not null,
    "connectortype"                varchar(100),
    "externalreferencedesignator"  varchar(450),
    "internalreferencedesignator"  varchar(450),
    "porttype"                     numeric(18, 0),
    "lastchanged"                  timestamp         default (now()) not null,
    primary key ("win32_portconnectorid")
)
;



-- 
-- table: tblportconnectorhist 
--

create table tblportconnectorhist(
    "trackercode"                  int4              not null,
    "assetid"                      int4              not null,
    "connectortype"                varchar(100),
    "externalreferencedesignator"  varchar(450),
    "internalreferencedesignator"  varchar(450),
    "porttype"                     numeric(18, 0),
    "lastchanged"                  timestamp         default (now()) not null,
    "action"                       numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblpotsmodem 
--

create table tblpotsmodem(
    "win32_potsmodemid"        int4              not null,
    "assetid"                  int4              not null,
    "attachedto"               varchar(50),
    "caption"                  varchar(450),
    "countryselected"          varchar(500),
    "devicetype"               varchar(500),
    "maxbaudratetophone"       numeric(18, 0),
    "maxbaudratetoserialport"  numeric(18, 0),
    "providername"             varchar(500),
    "lastchanged"              timestamp         default (now()) not null,
    primary key ("win32_potsmodemid")
)
;



-- 
-- table: tblpotsmodemhist 
--

create table tblpotsmodemhist(
    "trackercode"              int4              not null,
    "assetid"                  int4              not null,
    "attachedto"               varchar(50),
    "caption"                  varchar(450),
    "countryselected"          varchar(500),
    "devicetype"               varchar(500),
    "maxbaudratetophone"       numeric(18, 0),
    "maxbaudratetoserialport"  numeric(18, 0),
    "providername"             varchar(500),
    "lastchanged"              timestamp         default (now()) not null,
    "action"                   numeric(18, 0),
    primary key ("trackercode")
)
;



-- 
-- table: tblprinters 
--

create table tblprinters(
    "printerid"               int4              not null,
    "assetid"                 int4              not null,
    "capabilitydescriptions"  varchar(500),
    "caption"                 varchar(500),
    "comment"                 varchar(500),
    "enablebidi"              boolean,
    "horizontalresolution"    numeric(18, 0),
    "local"                   boolean,
    "location"                varchar(450),
    "network"                 boolean,
    "portname"                varchar(250),
    "printjobdatatype"        varchar(50),
    "printprocessor"          varchar(50),
    "sharename"               varchar(500),
    "status"                  varchar(50),
    verticalresolution        numeric(18, 0),
    "lastchanged"             timestamp         default (now()) not null,
    primary key ("printerid")
)
;



-- 
-- table: tblprintershist 
--

create table tblprintershist(
    "trackercode"             int4              not null,
    "assetid"                 int4              not null,
    "capabilitydescriptions"  varchar(500),
    "caption"                 varchar(500),
    "comment"                 varchar(500),
    "enablebidi"              boolean,
    "horizontalresolution"    numeric(18, 0),
    "local"                   boolean,
    "location"                varchar(450),
    "network"                 boolean,
    "portname"                varchar(250),
    "printjobdatatype"        varchar(50),
    "printprocessor"          varchar(50),
    "sharename"               varchar(500),
    "status"                  varchar(50),
    verticalresolution        numeric(18, 0),
    "lastchanged"             timestamp         default (now()) not null,
    "action"                  numeric(18, 0),
    primary key ("trackercode")
)
;



-- 
-- table: tblprocesses 
--

create table tblprocesses(
    "processid"       int4              not null,
    "assetid"         int4              not null,
    "caption"         varchar(450),
    "commandline"     varchar(1000),
    "executablepath"  varchar(1000),
    "threadcount"     numeric(18, 0),
    "priority"        numeric(18, 0),
    "lastchanged"     timestamp         default (now()) not null,
    primary key ("processid")
)
;



-- 
-- table: tblprocessor 
--

create table tblprocessor(
    "win32_processorid"          int4              not null,
    "assetid"                    int4              not null,
    "addresswidth"               numeric(18, 0),
    "architecture"               numeric(18, 0),
    "availability"               numeric(18, 0),
    "caption"                    varchar(450),
    "cpustatus"                  numeric(18, 0),
    "datawidth"                  numeric(18, 0),
    "deviceid"                   varchar(450),
    "extclock"                   numeric(18, 0),
    "family"                     numeric(18, 0),
    "l2cachesize"                numeric(18, 0),
    "l2cachespeed"               numeric(18, 0),
    "level"                      numeric(18, 0),
    "manufacturer"               varchar(450),
    "maxclockspeed"              numeric(18, 0),
    "name"                       varchar(450),
    "numberofcores"              numeric(18, 0),
    "numberoflogicalprocessors"  numeric(18, 0),
    "processorid"                varchar(300),
    "processortype"              numeric(18, 0),
    "revision"                   numeric(18, 0),
    "socketdesignation"          varchar(450),
    "stepping"                   varchar(50),
    "uniqueid"                   varchar(300),
    "upgrademethod"              numeric(18, 0),
    "version"                    varchar(500),
    "voltagecaps"                numeric(18, 0),
    "lastchanged"                timestamp         default (now()) not null,
    primary key ("win32_processorid")
)
;



-- 
-- table: tblprocessorhist 
--

create table tblprocessorhist(
    "trackercode"                int4              not null,
    "assetid"                    int4              not null,
    "addresswidth"               numeric(18, 0),
    "architecture"               numeric(18, 0),
    "availability"               numeric(18, 0),
    "caption"                    varchar(450),
    "cpustatus"                  numeric(18, 0),
    "datawidth"                  numeric(18, 0),
    "deviceid"                   varchar(450),
    "extclock"                   numeric(18, 0),
    "family"                     numeric(18, 0),
    "l2cachesize"                numeric(18, 0),
    "l2cachespeed"               numeric(18, 0),
    "level"                      numeric(18, 0),
    "manufacturer"               varchar(450),
    "maxclockspeed"              numeric(18, 0),
    "name"                       varchar(450),
    "numberofcores"              numeric(18, 0),
    "numberoflogicalprocessors"  numeric(18, 0),
    "processorid"                varchar(300),
    "processortype"              numeric(18, 0),
    "revision"                   numeric(18, 0),
    "socketdesignation"          varchar(450),
    "stepping"                   varchar(50),
    "uniqueid"                   varchar(300),
    "upgrademethod"              numeric(18, 0),
    "version"                    varchar(500),
    "voltagecaps"                numeric(18, 0),
    "lastchanged"                timestamp         default (now()) not null,
    "action"                     numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblproxy 
--

create table tblproxy(
    "proxyid"          int4            not null,
    "assetid"          int4            not null,
    "proxyportnumber"  varchar(50),
    "proxyserver"      varchar(450),
    "lastchanged"      timestamp       default (now()) not null,
    primary key ("proxyid")
)
;



-- 
-- table: tblquickfixengineering 
--

create table tblquickfixengineering(
    "win32_quickfixengineeringid"  int4            not null,
    "assetid"                      int4            not null,
    "qfeid"                        int4            not null,
    "installedbyid"                int4            not null,
    "installedon"                  varchar(300),
    "lastchanged"                  timestamp       default (now()) not null,
    primary key ("win32_quickfixengineeringid")
)
;



-- 
-- table: tblquickfixengineeringhist 
--

create table tblquickfixengineeringhist(
    "trackercode"    int4              not null,
    "assetid"        int4              not null,
    "qfeid"          int4,
    "installedbyid"  int4,
    "installedon"    varchar(300),
    "lastchanged"    timestamp         default (now()) not null,
    "action"         numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: "tblquickfixengineeringinstalledby" 
--

create table tblquickfixengineeringinstalledby(
    "installedbyid"  int4            not null,
    "installedby"    varchar(350),
    primary key ("installedbyid")
)
;



-- 
-- table: "tblquickfixengineeringuni" 
--

create table tblquickfixengineeringuni(
    "qfeid"                int4            not null,
    "description"          varchar(450),
    "fixcomments"          varchar(450),
    "hotfixid"             varchar(200),
    "servicepackineffect"  varchar(300),
    "hash"                 varchar(40)     not null,
    primary key ("qfeid")
)
;



-- 
-- table: tblregistry 
--

create table tblregistry(
    "registryid"   int4             not null,
    "assetid"      int4             not null,
    "regkey"       varchar(1000),
    "valuename"    varchar(200),
    "value"        varchar(4000),
    "lastchanged"  timestamp        default (now()) not null,
    primary key ("registryid")
)
;



-- 
-- table: "tblsafeguids" 
--

create table tblsafeguids(
    guid      varchar(50)     not null,
    "remark"  varchar(400),
    primary key (guid)
)
;



-- 
-- table: tblscanhistory 
--

create table tblscanhistory(
    "scanhistoryid"     int4            not null,
    "assetid"           int4            not null,
    "scanserver"        varchar(60)     not null,
    "scanningmethodid"  int4            not null,
    "description"       varchar(500),
    "scantime"          timestamp       not null,
    primary key ("scanhistoryid")
)
;



-- 
-- table: tblscsicontroller 
--

create table tblscsicontroller(
    "win32_scsicontrollerid"  int4              not null,
    "assetid"                 int4              not null,
    "availability"            numeric(18, 0),
    "caption"                 varchar(450),
    "manufacturer"            varchar(450),
    "protocolsupported"       numeric(18, 0),
    "lastchanged"             timestamp         default (now()) not null,
    primary key ("win32_scsicontrollerid")
)
;



-- 
-- table: tblscsicontrollerhist 
--

create table tblscsicontrollerhist(
    "trackercode"        int4              not null,
    "assetid"            int4              not null,
    "availability"       numeric(18, 0),
    "caption"            varchar(450),
    "manufacturer"       varchar(450),
    "protocolsupported"  numeric(18, 0),
    "lastchanged"        timestamp         default (now()) not null,
    "action"             numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblserialnumber 
--

create table tblserialnumber(
    "serialid"     int4             not null,
    "assetid"      int4             not null,
    "product"      varchar(400),
    "productid"    varchar(100),
    "productkey"   varchar(4000),
    "lastchanged"  timestamp        default (now()) not null,
    primary key ("serialid")
)
;



-- 
-- table: tblserialport 
--

create table tblserialport(
    "win32_serialportid"       int4              not null,
    "assetid"                  int4              not null,
    "availability"             numeric(18, 0),
    "binary"                   boolean,
    "deviceid"                 varchar(200),
    "maxbaudrate"              numeric(18, 0),
    "maximuminputbuffersize"   numeric(18, 0),
    "maximumoutputbuffersize"  numeric(18, 0),
    "osautodiscovered"         boolean,
    "providertype"             varchar(50),
    "lastchanged"              timestamp         default (now()) not null,
    primary key ("win32_serialportid")
)
;



-- 
-- table: tblserialporthist 
--

create table tblserialporthist(
    "trackercode"              int4              not null,
    "assetid"                  int4              not null,
    "availability"             numeric(18, 0),
    "binary"                   boolean,
    "deviceid"                 varchar(200),
    "maxbaudrate"              numeric(18, 0),
    "maximuminputbuffersize"   numeric(18, 0),
    "maximumoutputbuffersize"  numeric(18, 0),
    "osautodiscovered"         boolean,
    "providertype"             varchar(50),
    "lastchanged"              timestamp         default (now()) not null,
    "action"                   numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblservices 
--

create table tblservices(
    "serviceid"        int4         not null,
    "assetid"          int4         not null,
    "serviceuniqueid"  int4         not null,
    "acceptpause"      boolean,
    "acceptstop"       boolean,
    "desktopinteract"  boolean,
    "started"          boolean      not null,
    "startid"          int4,
    "stateid"          int4,
    "lastchanged"      timestamp    default (now()) not null,
    primary key ("serviceid")
)
;



-- 
-- table: "tblservicestartmode" 
--

create table tblservicestartmode(
    "startid"    int4           not null,
    "startmode"  varchar(50)    not null,
    primary key ("startid")
)
;



-- 
-- table: "tblservicestate" 
--

create table tblservicestate(
    "stateid"  int4           not null,
    "state"    varchar(50)    not null,
    primary key ("stateid")
)
;



-- 
-- table: "tblservicesuni" 
--

create table tblservicesuni(
    "serviceuniqueid"  int4             not null,
    "caption"          varchar(450),
    "name"             varchar(450),
    "pathname"         varchar(1000),
    "startname"        varchar(450),
    "hash"             varchar(40)      not null,
    primary key ("serviceuniqueid")
)
;



-- 
-- table: tblsharepermissions 
--

create table tblsharepermissions(
    "permissionid"  int4           not null,
    "shareid"       int4           not null,
    trustee         varchar(64),
    "readaccess"    boolean,
    "writeaccess"   boolean,
    "fullaccess"    boolean,
    "denyaccess"    boolean,
    "lastchanged"   timestamp      default (now()) not null,
    primary key ("permissionid")
)
;



-- 
-- table: tblshares 
--

create table tblshares(
    "shareid"        int4         not null,
    "assetid"        int4         not null,
    "shareuniqueid"  int4         not null,
    "lastchanged"    timestamp    default (now()) not null,
    primary key ("shareid")
)
;



-- 
-- table: tblshareshist 
--

create table tblshareshist(
    "trackercode"    int4              not null,
    "assetid"        int4              not null,
    "shareuniqueid"  int4              not null,
    "lastchanged"    timestamp         default (now()) not null,
    "action"         numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: "tblsharesuni" 
--

create table tblsharesuni(
    "shareuniqueid"  int4              not null,
    "caption"        varchar(450),
    "name"           varchar(450),
    "path"           varchar(1000),
    "type"           numeric(18, 0),
    hash             varchar(40)       not null,
    primary key ("shareuniqueid")
)
;



-- 
-- table: tblsnmpassetmac 
--

create table tblsnmpassetmac(
    "snmpmacid"        int8           not null,
    "assetid"          int4           not null,
    "ifindex"          int4           not null,
    "assetmacaddress"  varchar(50)    not null,
    "lastchanged"      timestamp      default (now()) not null,
    "online"           boolean      default (true) not null,
    "lastseen"         timestamp      not null,
    primary key ("snmpmacid")
)
;



-- 
-- table: "tblsnmpiftypes" 
--

create table tblsnmpiftypes(
    "iftype"      int4            not null,
    "iftypename"  varchar(200)    not null,
    primary key ("iftype")
)
;



-- 
-- table: tblsnmpinfo 
--

create table tblsnmpinfo(
    "snmpinfoid"      int8              not null,
    "assetid"         int4              not null,
    "ifindex"         int4,
    "ifdescription"   varchar(255),
    "iftype"          numeric(18, 0),
    "ifmtu"           numeric(18, 0),
    "ifspeed"         numeric(18, 0),
    "ifipaddress"     varchar(50),
    "ifmask"          varchar(50),
    "ifmacaddress"    varchar(50),
    "ifadminstatus"   int4,
    "ifoperstatus"    int4,
    "lastchanged"     timestamp         default (now()) not null,
    "uplink"          boolean      default (false) not null,
    "portname"        varchar(50),
    "vlan"            varchar(2048),
    "ifname"          varchar(255),
    "ifalias"         varchar(255),
    "defaultgateway"  varchar(50),
    primary key ("snmpinfoid")
)
;



-- 
-- table: tblsoftware 
--

create table tblsoftware(
    "softwareid"       int4            not null,
    "assetid"          int4            not null,
    "softid"           int4            not null,
    "softwareversion"  varchar(100),
    "installdate"      timestamp,
    "lastchanged"      timestamp       default (now()) not null,
    "currentuser"      boolean      default (false),
    "msi"              boolean      default (false),
    primary key ("softwareid")
)
;



-- 
-- table: tblsoftwarehist 
--

create table tblsoftwarehist(
    "trackercode"      int4              not null,
    "assetid"          int4              not null,
    softid             int4,
    "softwareversion"  varchar(100),
    "installdate"      timestamp,
    "lastchanged"      timestamp         default (now()) not null,
    "action"           numeric(18, 0),
    "currentuser"      boolean      default (false),
    "msi"              boolean      default (false),
    primary key ("trackercode")
)
;



-- 
-- table: tblsoftwareuni 
--

create table tblsoftwareuni(
    "softid"             int4            not null,
    "softwarename"       varchar(300),
    "softwarepublisher"  varchar(150),
    "approved"           int4            default ((0)) not null,
    "ostype"             int4            default ((1)) not null,
    "added"              timestamp       default (now()) not null,
    primary key ("softid")
)
;



-- 
-- table: tblsounddevice 
--

create table tblsounddevice(
    "win32_sounddeviceid"  int4            not null,
    "assetid"              int4            not null,
    "caption"              varchar(450),
    "manufacturer"         varchar(450),
    "lastchanged"          timestamp       default (now()) not null,
    primary key ("win32_sounddeviceid")
)
;



-- 
-- table: tblsounddevicehist 
--

create table tblsounddevicehist(
    "trackercode"   int4              not null,
    "assetid"       int4              not null,
    "caption"       varchar(450),
    "manufacturer"  varchar(450),
    "lastchanged"   timestamp         default (now()) not null,
    "action"        numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblsqldatabases 
--

create table tblsqldatabases(
    "sqldatabaseid"       int8            not null,
    "datafilessizekb"     int4,
    "logfilessizekb"      int4,
    "logfilesusedsizekb"  int4,
    name                  varchar(255),
    "lastchanged"         timestamp       default (now()),
    "sqlserverid"         int8            not null,
    primary key ("sqldatabaseid")
)
;



-- 
-- table: tblsqllicensedocs 
--

create table tblsqllicensedocs(
    "docid"      int4             not null,
    "licenseid"  int4             not null,
    "doclink"    varchar(1000),
    "docname"    varchar(255),
    "comments"   text,
    primary key ("docid")
)
;



-- 
-- table: tblsqllicenses 
--

create table tblsqllicenses(
    "licenseid"            int4            not null,
    "name"                 varchar(300),
    "priceperserver"       money,
    "licensetype"          int4,
    "licensetypecomments"  text,
    "nrofterms"            int4,
    "priceperterm"         money,
    "comments"             text,
    "licensecontact"       varchar(500),
    "licenseowner"         varchar(255),
    "sharedcal"            boolean,
    "licenseexpiration"    timestamp,
    primary key ("licenseid")
)
;



-- 
-- table: tblsqllicensesorders 
--

create table tblsqllicensesorders(
    "licenseorderid"   int4            not null,
    "licenseid"        int4            not null,
    "orderdate"        timestamp,
    "nrlicenses"       int4,
    "priceperlicense"  money,
    "ordernumber"      varchar(255),
    "comments"         text,
    primary key ("licenseorderid")
)
;



-- 
-- table: tblsqllicensesserverorders 
--

create table tblsqllicensesserverorders(
    "licenseorderid"   int4            not null,
    "licenseid"        int4            not null,
    "orderdate"        timestamp,
    "nrlicenses"       int4,
    "priceperlicense"  money,
    "ordernumber"      varchar(255),
    "comments"         text,
    primary key ("licenseorderid")
)
;



-- 
-- table: tblsqlservers 
--

create table tblsqlservers(
    "sqlserverid"     int8             not null,
    "datapath"        varchar(1024),
    "fileversion"     varchar(100),
    "installpath"     varchar(1024),
    "iswow64"         int4,
    language          int4,
    "skuname"         varchar(255),
    "splevel"         int4,
    version           varchar(255),
    "displayversion"  varchar(255),
    "lastchanged"     timestamp        default (now()),
    "assetid"         int4             not null,
    "servicename"     varchar(255)     not null,
    primary key ("sqlserverid")
)
;



-- 
-- table: tblsqlsubservers 
--

create table tblsqlsubservers(
    "subserverid"  int4            not null,
    "licenseid"    int4            not null,
    "name"         varchar(300),
    "assetname"    varchar(300),
    primary key ("subserverid")
)
;



-- 
-- table: tblstate 
--

create table tblstate(
    "state"        int4            not null,
    "statename"    varchar(300)    not null,
    "lastchanged"  timestamp       default (now()) not null,
    primary key ("state")
)
;



-- 
-- table: tblsublicensedocs 
--

create table tblsublicensedocs(
    "licensesubdocid"  int4             not null,
    "licenseidid"      int4             not null,
    "doclink"          varchar(1000),
    "docname"          varchar(255),
    "comments"         text,
    primary key ("licensesubdocid")
)
;



-- 
-- table: tblsublicenses 
--

create table tblsublicenses(
    "licensesubid"     int4            not null,
    "licenseidid"      int4            not null,
    "softwarename"     varchar(300)    not null,
    "softwareversion"  varchar(100)    default (''),
    primary key ("licensesubid")
)
;



-- 
-- table: tblsublicensesorders 
--

create table tblsublicensesorders(
    "licensesuborderid"  int4            not null,
    "licenseidid"        int4            not null,
    "orderdate"          timestamp       default (now()) not null,
    "nrlicenses"         int4            not null,
    "priceperlicense"    money           default ((0)) not null,
    "ordernumber"        varchar(255),
    "comments"           text,
    "licensekey"         text,
    primary key ("licensesuborderid")
)
;



-- 
-- table: tblsystemenclosure 
--

create table tblsystemenclosure(
    "win32_systemenclosureid"  int4              not null,
    "assetid"                  int4              not null,
    "chassistypes"             numeric(18, 0),
    "lockpresent"              boolean,
    "manufacturer"             varchar(450),
    "securitystatus"           numeric(18, 0),
    "serialnumber"             varchar(300),
    "smbiosassettag"           varchar(300),
    "version"                  varchar(300),
    "lastchanged"              timestamp         default (now()) not null,
    primary key ("win32_systemenclosureid")
)
;



-- 
-- table: tblsystemenclosurehist 
--

create table tblsystemenclosurehist(
    "trackercode"     int4              not null,
    "assetid"         int4              not null,
    "chassistypes"    numeric(18, 0),
    "lockpresent"     boolean,
    "manufacturer"    varchar(450),
    "securitystatus"  numeric(18, 0),
    "serialnumber"    varchar(300),
    "smbiosassettag"  varchar(300),
    "version"         varchar(300),
    "lastchanged"     timestamp         default (now()) not null,
    "action"          numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tbltapedrive 
--

create table tbltapedrive(
    "win32_tapedriveid"       int4              not null,
    "assetid"                 int4              not null,
    "availability"            numeric(18, 0),
    "capabilities"            varchar(500),
    "caption"                 varchar(450),
    "compression"             numeric(18, 0),
    "defaultblocksize"        numeric(18, 0),
    "manufacturer"            varchar(450),
    "maxblocksize"            numeric(18, 0),
    "maxmediasize"            numeric(18, 0),
    "maxpartitioncount"       numeric(18, 0),
    "mediatype"               varchar(450),
    "minblocksize"            numeric(18, 0),
    "needscleaning"           boolean,
    "numberofmediasupported"  numeric(18, 0),
    "padding"                 numeric(18, 0),
    "lastchanged"             timestamp         default (now()) not null,
    primary key ("win32_tapedriveid")
)
;



-- 
-- table: tbltapedrivehist 
--

create table tbltapedrivehist(
    "trackercode"             int4              not null,
    "assetid"                 int4              not null,
    "availability"            numeric(18, 0),
    "capabilities"            varchar(500),
    "caption"                 varchar(450),
    "compression"             numeric(18, 0),
    "defaultblocksize"        numeric(18, 0),
    "manufacturer"            varchar(450),
    "maxblocksize"            numeric(18, 0),
    "maxmediasize"            numeric(18, 0),
    "maxpartitioncount"       numeric(18, 0),
    "mediatype"               varchar(450),
    "minblocksize"            numeric(18, 0),
    "needscleaning"           boolean,
    "numberofmediasupported"  numeric(18, 0),
    "padding"                 numeric(18, 0),
    "lastchanged"             timestamp         default (now()) not null,
    "action"                  numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tbltpm 
--

create table tbltpm(
    "win32_tpmid"                  int4           not null,
    "assetid"                      int4           not null,
    "isactivated_initialvalue"     boolean,
    "isenabled_initialvalue"       boolean,
    "isowned_initialvalue"         boolean,
    "specversion"                  varchar(50),
    "manufacturerversion"          varchar(50),
    "manufacturerversioninfo"      varchar(50),
    "manufacturerid"               int4,
    "physicalpresenceversioninfo"  varchar(50),
    "lastchanged"                  timestamp      default (now()) not null,
    primary key ("win32_tpmid")
)
;



-- 
-- table: tblups 
--

create table tblups(
    "upsid"                      int4             not null,
    "assetid"                    int4             not null,
    "manufacturer"               varchar(1024),
    "model"                      varchar(1024),
    "upssoftwareversion"         varchar(1024),
    "agentsoftwareversion"       varchar(1024),
    "name"                       varchar(1024),
    "attacheddevices"            varchar(1024),
    "batterystatus"              int4,
    "secondsonbattery"           int4,
    "estimatedminutesremaining"  int4,
    "estimatedchargeremaining"   int4,
    "batteryvoltage"             int4,
    "batterycurrent"             int4,
    "batterytemperature"         int4,
    "alarmspresent"              int4,
    "lastchanged"                timestamp        default (now()) not null,
    primary key ("upsid")
)
;



-- 
-- table: tbluptime 
--

create table tbluptime(
    "uptimeid"   int4         not null,
    "assetid"    int4         not null,
    "eventtime"  timestamp    not null,
    "eventtype"  int2         not null,
    primary key ("uptimeid")
)
;



-- 
-- table: tblusbcontroller 
--

create table tblusbcontroller(
    "win32_usbcontrollerid"  int4              not null,
    "assetid"                int4              not null,
    "caption"                varchar(450),
    "manufacturer"           varchar(450),
    "protocolsupported"      numeric(18, 0),
    "lastchanged"            timestamp         default (now()) not null,
    primary key ("win32_usbcontrollerid")
)
;



-- 
-- table: tblusbcontrollerhist 
--

create table tblusbcontrollerhist(
    "trackercode"        int4              not null,
    "assetid"            int4              not null,
    "caption"            varchar(450),
    "manufacturer"       varchar(450),
    "protocolsupported"  numeric(18, 0),
    "lastchanged"        timestamp         default (now()) not null,
    "action"             numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblusbdevices 
--

create table tblusbdevices(
    "win32_usbdeviceid"  int4            not null,
    "assetid"            int4            not null,
    "name"               varchar(450),
    "manufacturer"       varchar(450),
    "deviceid"           varchar(450),
    "lastchanged"        timestamp       default (now()) not null,
    primary key ("win32_usbdeviceid")
)
;



-- 
-- table: tblusers 
--

create table tblusers(
    "userid"              int4              not null,
    "assetid"             int4,
    "accounttype"         numeric(18, 0),
    "disabled"            boolean,
    "fullname"            varchar(450),
    "lockout"             boolean,
    "name"                varchar(300),
    "passwordchangeable"  boolean,
    "passwordexpires"     boolean,
    "passwordrequired"    boolean,
    "sid"                 varchar(300),
    "status"              varchar(50),
    "lastchanged"         timestamp         default (now()) not null,
    "buildinadmin"        boolean      default (false) not null,
    primary key ("userid")
)
;



-- 
-- table: tblusershist 
--

create table tblusershist(
    "trackercode"         int4              not null,
    "assetid"             int4,
    "accounttype"         numeric(18, 0),
    "disabled"            boolean,
    "fullname"            varchar(450),
    "lockout"             boolean,
    "name"                varchar(300),
    "passwordchangeable"  boolean,
    "passwordexpires"     boolean,
    "passwordrequired"    boolean,
    "sid"                 varchar(300),
    "status"              varchar(50),
    "buildinadmin"        boolean      default (false) not null,
    "lastchanged"         timestamp         default (now()) not null,
    "action"              numeric(18, 0),
    primary key ("trackercode")
)
;



-- 
-- table: tblusersingroup 
--

create table tblusersingroup(
    "useringroupid"  int4              not null,
    "assetid"        int4              not null,
    "groupname"      varchar(300),
    "domainname"     varchar(300),
    "username"       varchar(300),
    "accounttype"    numeric(18, 0),
    "admingroup"     boolean      default (false) not null,
    "lastchanged"    timestamp         default (now()) not null,
    primary key ("useringroupid")
)
;



-- 
-- table: tblusersingrouphist 
--

create table tblusersingrouphist(
    "trackercode"  int4              not null,
    "assetid"      int4              not null,
    "groupname"    varchar(300),
    "domainname"   varchar(200),
    "username"     varchar(200),
    "accounttype"  numeric(18, 0),
    "admingroup"   boolean      default (false) not null,
    "lastchanged"  timestamp         default (now()) not null,
    "action"       numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblvideocontroller 
--

create table tblvideocontroller(
    "win32_videocontrollerid"      int4              not null,
    "assetid"                      int4              not null,
    "adaptercompatibility"         varchar(450),
    "adapterram"                   numeric(18, 0),
    "availability"                 numeric(18, 0),
    "caption"                      varchar(450),
    "currentbitsperpixel"          numeric(18, 0),
    "currenthorizontalresolution"  numeric(18, 0),
    "currentnumberofcolors"        numeric(18, 0),
    "currentrefreshrate"           numeric(18, 0),
    "currentscanmode"              numeric(18, 0),
    "currentverticalresolution"    numeric(18, 0),
    "deviceid"                     varchar(500),
    "devicespecificpens"           numeric(18, 0),
    "driverversion"                varchar(100),
    "maxrefreshrate"               numeric(18, 0),
    "minrefreshrate"               numeric(18, 0),
    "monochrome"                   boolean,
    "numberofcolorplanes"          numeric(18, 0),
    "videoarchitecture"            numeric(18, 0),
    "videomemorytype"              numeric(18, 0),
    "videomodedescription"         varchar(500),
    "lastchanged"                  timestamp         default (now()) not null,
    primary key ("win32_videocontrollerid")
)
;



-- 
-- table: tblvideocontrollerhist 
--

create table tblvideocontrollerhist(
    "trackercode"                  int4              not null,
    "assetid"                      int4              not null,
    "adaptercompatibility"         varchar(450),
    "adapterram"                   numeric(18, 0),
    "availability"                 numeric(18, 0),
    "caption"                      varchar(450),
    "currentbitsperpixel"          numeric(18, 0),
    "currenthorizontalresolution"  numeric(18, 0),
    "currentnumberofcolors"        numeric(18, 0),
    "currentrefreshrate"           numeric(18, 0),
    "currentscanmode"              numeric(18, 0),
    "currentverticalresolution"    numeric(18, 0),
    "deviceid"                     varchar(500),
    "devicespecificpens"           numeric(18, 0),
    "driverversion"                varchar(100),
    "maxrefreshrate"               numeric(18, 0),
    "minrefreshrate"               numeric(18, 0),
    "monochrome"                   boolean,
    "numberofcolorplanes"          numeric(18, 0),
    "videoarchitecture"            numeric(18, 0),
    "videomemorytype"              numeric(18, 0),
    "videomodedescription"         varchar(500),
    "lastchanged"                  timestamp         default (now()) not null,
    "action"                       numeric(18, 0)    not null,
    primary key ("trackercode")
)
;



-- 
-- table: tblvmwaredisk 
--

create table tblvmwaredisk(
    "diskid"       int8              not null,
    "assetid"      int4              not null,
    "name"         varchar(255),
    "url"          varchar(1024),
    "totalspace"   numeric(18, 0),
    "freespace"    numeric(18, 0),
    lastchanged    timestamp         default (now()),
    primary key ("diskid")
)
;



-- 
-- table: tblvmwareguest 
--

create table tblvmwareguest(
    "guestid"             int8              not null,
    "assetid"             int4              not null,
    "name"                varchar(255)      not null,
    "memory"              numeric(18, 0),
    "isrunning"           varchar(50),
    lastchanged           timestamp         default (now()),
    "toolsrunningstatus"  int2,
    "toolsversion"        varchar(50),
    "toolsversionstatus"  int2,
    "toolsstatus"         int2,
    "cpucount"            int4,
    primary key ("guestid")
)
;



-- 
-- table: tblvmwareguestnetwork 
--

create table tblvmwareguestnetwork(
    "guestnetworkid"  int8           not null,
    "guestid"         int8           not null,
    "macaddress"      varchar(50),
    lastchanged       timestamp      default (now()),
    primary key ("guestnetworkid")
)
;



-- 
-- table: tblvmwareinfo 
--

create table tblvmwareinfo(
    "vmwareid"       int8            not null,
    "assetid"        int4            not null,
    "version"        varchar(400),
    "biosversion"    varchar(255),
    "biosdate"       timestamp,
    lastchanged      timestamp       default (now()) not null,
    "numcpucores"    int4,
    "numcpupkgs"     int4,
    "numcputhreads"  int4,
    primary key ("vmwareid")
)
;



-- 
-- table: tblvmwarenetwork 
--

create table tblvmwarenetwork(
    "networkid"    int8            not null,
    "assetid"      int4            not null,
    "name"         varchar(255),
    "mac"          varchar(50),
    "ipaddress"    varchar(50),
    "subnet"       varchar(50),
    lastchanged    timestamp       default (now()),
    primary key ("networkid")
)
;



-- 
-- table: tblvolume 
--

create table tblvolume(
    "volumeid"                      int4              not null,
    "assetid"                       int4              not null,
    "automount"                     boolean,
    "blocksize"                     numeric(18, 0),
    "capacity"                      numeric(18, 0),
    "compressed"                    boolean,
    "deviceid"                      varchar(1000),
    "dirtybitset"                   boolean,
    "driveletter"                   varchar(15),
    "drivetype"                     numeric(18, 0),
    "errorcleared"                  boolean,
    "errordescription"              varchar(1000),
    "errormethodology"              varchar(1000),
    "filesystem"                    varchar(50),
    "freespace"                     numeric(18, 0),
    "indexingenabled"               boolean,
    "label"                         varchar(1000),
    "name"                          varchar(1000),
    "pagefilepresent"               boolean,
    "supportsdiskquotas"            boolean,
    "supportsfilebasedcompression"  boolean,
    "lastchanged"                   timestamp         default (now()) not null,
    primary key ("volumeid")
)
;



-- 
-- table: tblvproamt 
--

create table tblvproamt(
    "vproamdid"        int4           not null,
    "assetid"          int4           not null,
    "defaultttl"       varchar(50),
    "https"            boolean    default (false),
    "httpversion"      varchar(50),
    "rmcppingversion"  varchar(50),
    "rmcppingstatus"   varchar(50),
    "lastchanged"      timestamp      default (now()) not null,
    primary key ("vproamdid")
)
;



-- 
-- table: tblwarranty 
--

create table tblwarranty(
    "warrantyid"           int4             not null,
    "assetid"              int4             not null,
    "lastwarrantytry"      timestamp        default (now()) not null,
    "lastwarrantysuccess"  timestamp,
    "purchasecountry"      varchar(255),
    "shipdate"             timestamp,
    "forceupdate"          boolean      default (false) not null,
    "error"                varchar(1024),
    primary key ("warrantyid")
)
;



-- 
-- table: tblwarrantydetails 
--

create table tblwarrantydetails(
    "warrantydetailsid"  int4             not null,
    "warrantyid"         int4,
    "warrantystartdate"  timestamp,
    "warrantyenddate"    timestamp        not null,
    "servicetype"        varchar(1024)    not null,
    "lastchanged"        timestamp        default (now()) not null,
    primary key ("warrantydetailsid")
)
;



-- 
-- table: tblwinsat 
--

create table tblwinsat(
    "winsatid"               int4             not null,
    "assetid"                int4             not null,
    "cpuscore"               decimal(4, 1),
    "d3dscore"               decimal(4, 1),
    "diskscore"              decimal(4, 1),
    "graphicsscore"          decimal(4, 1),
    "memoryscore"            decimal(4, 1),
    "winsprlevel"            decimal(4, 1),
    "winsatassessmentstate"  int2,
    "lastchanged"            timestamp        default (now()) not null,
    primary key ("winsatid")
)
;



-- 
-- table: tsysactions 
--

create table tsysactions(
    "description"   varchar(300)      not null,
    "action"        varchar(1000)     not null,
    "icon"          varchar(50)       not null,
    sortorder       numeric(18, 0),
    enabled         boolean      default (true) not null,
    confirmation    boolean      default (false) not null,
    "advanced"      boolean,
    ishyperlink     boolean,
    "actionid"      int4              not null,
    primary key ("actionid")
)
;



-- 
-- table: tsysadmins 
--

create table tsysadmins(
    "id"         int4            not null,
    "domain"     varchar(150)    not null,
    "adminname"  varchar(150)    not null,
    primary key ("id")
)
;



-- 
-- table: tsysadsischedule 
--

create table tsysadsischedule(
    "scheduleid"     int4             not null,
    "servername"     varchar(60)      not null,
    "scantype"       int4             not null,
    "scantarget"     varchar(1024)    not null,
    "netbiosdomain"  varchar(150)     not null,
    "enabled"        boolean          not null,
    "scannow"        boolean      default (false) not null,
    "day1"           boolean      default (false) not null,
    "day2"           boolean      default (false) not null,
    "day3"           boolean      default (false) not null,
    "day4"           boolean      default (false) not null,
    "day5"           boolean      default (false) not null,
    "day6"           boolean      default (false) not null,
    "day7"           boolean      default (false) not null,
    "day1time"       timestamp        default (date_trunc('day', now())) not null,
    "day2time"       timestamp        default (date_trunc('day', now())) not null,
    "day3time"       timestamp        default (date_trunc('day', now())) not null,
    "day4time"       timestamp        default (date_trunc('day', now())) not null,
    "day5time"       timestamp        default (date_trunc('day', now())) not null,
    "day6time"       timestamp        default (date_trunc('day', now())) not null,
    "day7time"       timestamp        default (date_trunc('day', now())) not null,
    "lastscanned"    timestamp,
    "description"    varchar(1000),
    "errortext"      varchar(250),
    primary key ("scheduleid")
)
;



-- 
-- table: tsysalertschedule 
--

create table tsysalertschedule(
    "alertscheduleid"  int4            not null,
    "alertid"          varchar(150)    not null,
    "scheduleid"       int4            not null,
    "lastrun"          timestamp,
    primary key ("alertscheduleid")
)
;



-- 
-- table: tsysantivirus 
--

create table tsysantivirus(
    "software"  varchar(300)    not null,
    primary key ("software")
)
;



-- 
-- table: "tsysapikeys" 
--

create table tsysapikeys(
    keyid          int4            not null,
    key            varchar(200)    not null,
    description    varchar(150),
    primary key (keyid)
)
;



-- 
-- table: tsysasdomains 
--

create table tsysasdomains(
    "servername"   varchar(60)      not null,
    "domainname"   varchar(380)     not null,
    "netbiosname"  varchar(50)      not null,
    "description"  varchar(1000),
    "scannow"      boolean      default (false) not null,
    "lastscanned"  timestamp,
    "enabled"      boolean          default (true) not null,
    "errortext"    varchar(250),
    primary key ("servername", "domainname")
)
;



-- 
-- table: tsysasou 
--

create table tsysasou(
    "ou"          varchar(380)    not null,
    "servername"  varchar(60)     not null,
    primary key ("ou", "servername")
)
;



-- 
-- table: "tsysasservers" 
--

create table tsysasservers(
    "servername"                   varchar(60)       not null,
    "servicestarted"               timestamp,
    "servicelastpolled"            timestamp,
    "computerscanned"              numeric(18, 0),
    activescanning                 boolean      default (false) not null,
    workgroupscanning              boolean      default (false),
    "version"                      varchar(50),
    "listenport"                   numeric(18, 0)    default ((9524)) not null,
    "concurrentthreads"            numeric(18, 0)    default ((6)) not null,
    "ipscanthreads"                numeric(18, 0)    default ((6)) not null,
    "rmadcomp"                     boolean      default (false) not null,
    "naadcomp"                     boolean      default (false) not null,
    "rmaduser"                     boolean      default (false) not null,
    "makeactive"                   boolean      default (false) not null,
    "delhist"                      boolean      default (false) not null,
    "delhistdays"                  numeric(18, 0)    default ((60)) not null,
    "delcomp"                      boolean      default (false) not null,
    "delcompdays"                  numeric(18, 0)    default ((180)) not null,
    "nacomp"                       boolean      default (false) not null,
    "nacompdays"                   numeric(18, 0)    default ((180)) not null,
    "deleventdays"                 numeric(18, 0)    default ((60)) not null,
    "delsyslogdays"                numeric(18, 0)    default ((30)) not null,
    "refradcomp"                   boolean      default (false) not null,
    "refradusers"                  boolean      default (false) not null,
    "smtpserver"                   varchar(250),
    "smtpport"                     numeric(18, 0)    default ((25)),
    "smtpfrom"                     varchar(250)      default ('noreply@localhost'),
    "smtpfromdisplay"              varchar(250)      default ('lansweeper alert'),
    "smtpauthenticate"             boolean      default (false),
    "smtpusername"                 varchar(255),
    "smtppassword"                 varchar(4000),
    "sendalertreports"             boolean      default (false) not null,
    "sendeventalerts"              boolean      default (false) not null,
    "mailnow"                      boolean      default (false) not null,
    "ipscannow"                    boolean      default (false) not null,
    "day1rep"                      boolean      default (false) not null,
    "day2rep"                      boolean      default (false) not null,
    "day3rep"                      boolean      default (false) not null,
    "day4rep"                      boolean      default (false) not null,
    "day5rep"                      boolean      default (false) not null,
    "day6rep"                      boolean      default (false) not null,
    "day7rep"                      boolean      default (false) not null,
    "day1timerep"                  timestamp         default (date_trunc('day', now())) not null,
    "day2timerep"                  timestamp         default (date_trunc('day', now())) not null,
    "day3timerep"                  timestamp         default (date_trunc('day', now())) not null,
    "day4timerep"                  timestamp         default (date_trunc('day', now())) not null,
    "day5timerep"                  timestamp         default (date_trunc('day', now())) not null,
    "day6timerep"                  timestamp         default (date_trunc('day', now())) not null,
    "day7timerep"                  timestamp         default (date_trunc('day', now())) not null,
    "lastmailed"                   timestamp,
    "rmdiuser"                     boolean      default (false) not null,
    "rmdicomp"                     boolean      default (false) not null,
    "nadicomp"                     boolean      default (false) not null,
    "scanuser"                     varchar(300),
    "evinfo"                       boolean      default (false) not null,
    "evsuccess"                    boolean      default (false) not null,
    "evuptime"                     boolean      default (true) not null,
    "deluptimedays"                int4              default ((240)) not null,
    "evwarning"                    boolean      default (false) not null,
    "evfailure"                    boolean      default (false) not null,
    "dellogoninfo"                 int4              default ((240)) not null,
    "isdomain"                     boolean      default (false) not null,
    "domainname"                   varchar(50),
    "dnsname"                      varchar(300),
    "startip"                      varchar(50),
    "endip"                        varchar(50),
    "smtpusessl"                   boolean      default (false) not null,
    "enableproxy"                  boolean      default (false) not null,
    "proxyname"                    varchar(100),
    "proxyport"                    int4,
    "enableproxyauth"              boolean      default (false) not null,
    "proxylogin"                   varchar(255),
    "proxypassword"                varchar(1000),
    "proxydomain"                  varchar(255),
    "enablewarrantyscanning"       boolean      default (false) not null,
    "currentuser"                  varchar(500)      default ('') not null,
    "assetgroupsscannow"           boolean,
    "renamedcomputerdetection"     boolean      default (true) not null,
    "lastactivescan"               timestamp         default (now()) not null,
    "maxdeploymentthreads"         int4              default ((12)),
    "deldeploymentlogdays"         numeric(18, 0)    default ((60)) not null,
    "scanhistorydays"              int4              default ((-1)) not null,
    "activescanningmaxrescantime"  int4              default (((48)*(60))*(60)) not null,
    "activescanningminrescantime"  int4              default (((20)*(60))*(60)) not null,
    "activescanninginterval"       int4              default ((15)*(60)) not null,
    "clearqueue"                   boolean      default (false) not null,
    mailserver                     boolean      default (false) not null,
    "proxypasswordkeyhash"         int4,
    "encryptionkeyhash"            int4,
    "delconfigurationlogdays"      int4              default ((90)) not null,
    "delloginlogdays"              int4              default ((90)) not null,
    "proxytimeout"                 int4              default ((100)) not null,
    "dofallbackscanning"           boolean           default ('true') not null,
    primary key ("servername")
)
;



-- 
-- table: tsysasseterrortypes 
--

create table tsysasseterrortypes(
    "errortype"  int4            not null,
    "errormsg"   varchar(100)    not null,
    primary key ("errortype")
)
;



-- 
-- table: tsysassetgroupfilter 
--

create table tsysassetgroupfilter(
    "filterid"             int4             not null,
    "assetgroupid"         int4             not null,
    "compare"              int4             not null,
    "operator"             int4             not null,
    "comparevalue"         varchar(2000)    not null,
    "versioncomparevalue"  varchar(200),
    primary key ("filterid")
)
;



-- 
-- table: tsysassetgroupscan 
--

create table tsysassetgroupscan(
    "assetgroupscanid"   int4             not null,
    "servername"         varchar(60)      not null,
    "type"               int4,
    "assetgroupid"       int4,
    "assettype"          int4,
    "enabled"            boolean,
    "day1"               boolean,
    "day2"               boolean,
    "day3"               boolean,
    "day4"               boolean,
    "day5"               boolean,
    "day6"               boolean,
    "day7"               boolean,
    "day1time"           timestamp,
    "day2time"           timestamp,
    "day3time"           timestamp,
    "day4time"           timestamp,
    "day5time"           timestamp,
    "day6time"           timestamp,
    "day7time"           timestamp,
    "lastassettypescan"  timestamp,
    "dns"                boolean,
    "recurring"          boolean,
    "minutes"            boolean,
    "waittime"           int4,
    "scannow"            boolean      default (false) not null,
    "report"             varchar(200),
    "description"        varchar(1000),
    primary key ("assetgroupscanid")
)
;



-- 
-- table: tsysassetlinks 
--

create table tsysassetlinks(
    "vendor"     varchar(300)     not null,
    "assetlink"  varchar(1024)    not null,
    primary key ("vendor")
)
;



-- 
-- table: tsysassetrelationtypes 
--

create table tsysassetrelationtypes(
    "relationtypeid"      int4            not null,
    "name"                varchar(50),
    "standard"            boolean,
    "relationtypeicon10"  varchar(250),
    "relationtypeicon16"  varchar(250),
    "relationtypeicon48"  varchar(250),
    "reversename"         varchar(50),
    primary key ("relationtypeid")
)
;



-- 
-- table: tsysassettypeexclude 
--

create table tsysassettypeexclude(
    "assettypeexclusionid"  int4            not null,
    "assettype"             int4            not null,
    "servername"            varchar(60)     not null,
    "comment"               varchar(150),
    primary key ("assettypeexclusionid")
)
;



-- 
-- table: "tsysassettypes" 
--

create table tsysassettypes(
    "assettype"        int4            not null,
    "assettypename"    varchar(100)    not null,
    "assettypeicon10"  varchar(250),
    "assettypeicon16"  varchar(250),
    "assettypeicon48"  varchar(250),
    "lastchanged"      timestamp       default (now()) not null,
    primary key ("assettype")
)
;



-- 
-- table: tsysassites 
--

create table tsysassites(
    "servername"   varchar(60)     not null,
    "sitename"     varchar(300)    not null,
    "netbiosname"  varchar(50)     not null,
    primary key ("servername", "sitename", "netbiosname")
)
;



-- 
-- table: tsysasworkgroups 
--

create table tsysasworkgroups(
    "servername"   varchar(60)      not null,
    "workgroup"    varchar(50)      not null,
    "description"  varchar(1000),
    "scannow"      boolean      default (false) not null,
    "lastscanned"  timestamp,
    "enabled"      boolean          default (true) not null,
    "errortext"    varchar(250),
    primary key ("servername", "workgroup")
)
;



-- 
-- table: "tsyschassistypes" 
--

create table tsyschassistypes(
    "chassistype"  int4            not null,
    "chassisname"  varchar(255)    not null,
    img            varchar(50)     not null,
    primary key ("chassistype")
)
;



-- 
-- table: "tsysconfig" 
--

create table tsysconfig(
    "config"                     varchar(50)      not null,
    licensekey                   varchar(2000),
    datefrom                     varchar(8),
    dateto                       varchar(8),
    "wolcommand"                 varchar(500)     default (n'{actionpath}wol.exe {mac}'),
    "wolremovepoint"             boolean          default (true),
    "actionpath"                 varchar(400),
    "trialdateto"                varchar(8),
    "schemaversion"              int4,
    "trialmode"                  boolean,
    "firstrun"                   boolean          default (true) not null,
    "reportrefresh"              int4             default ((1)) not null,
    "assetdashboard"             boolean      default (false) not null,
    "updatecheck"                boolean          default (true) not null,
    "lastupdatecheck"            timestamp        default (now() - interval '15 days') not null,
    "qrcodehostname"             varchar(300),
    "masseditinfo"               boolean          default (true) not null,
    "renameworkgroupcredential"  boolean          default (true) not null,
    "wolport"                    int4             default ((7)) not null,
    "defaultpackageshare"        varchar(4000),
    "latestlspushversion"        varchar(20),
    "defaultshareusername"       varchar(100),
    "defaultsharepassword"       varchar(1000),
    "assetstate"                 varchar(200),
    "deploymentrunmode"          int4             default ((1)),
    "donotshrinklogfiles"        boolean      default (false) not null,
    "forcehttps"                 boolean      default (false),
    showbanner                   boolean      default (false),
    banner                       varchar(100)     default (''),
    adminlogin                   boolean          default (true),
    "agentstrialmode"            int4,
    "agentstrialdateto"          varchar(8),
    "websiteaccess"              varchar(4000),
    showrolechanges              boolean      default (false) not null,
    "defaultsharekeyhash"        int4,
    "defaultlanguage"            int4             default ((1)) not null,
    "languageupdate"             int4,
    "servercurrentlyupdating"    varchar(60),
    "rebuildticketindex"         boolean,
    "rebuildkbindex"             boolean,
    "usefileencryption"          boolean          default (true) not null,
    primary key ("config")
)
;



-- 
-- table: "tsyscredentials" 
--

create table tsyscredentials(
    "credid"     int4             not null,
    "credname"   varchar(100)     not null,
    "username"   varchar(510),
    "password"   varchar(1000)    not null,
    "credtype"   int4             default ((1)) not null,
    "blank"      boolean      default (false) not null,
    "flags"      int2             default ((0)) not null,
    "password2"  varchar(1000),
    "globalkey"  boolean      default (false) not null,
    "sshkey"     text,
    "keyhash"    int4,
    primary key ("credid")
)
;



-- 
-- table: tsyscurrentscans 
--

create table tsyscurrentscans(
    "scanid"      int8            not null,
    target        varchar(150)    not null,
    "scanserver"  varchar(60)     not null,
    "priority"    boolean      default (false) not null,
    "scantype"    int4            not null,
    primary key ("scanid")
)
;



-- 
-- table: "tsyscustomfieldtypes" 
--

create table tsyscustomfieldtypes(
    typeid      int4           not null,
    typename    varchar(50)    not null,
    primary key (typeid)
)
;



-- 
-- table: "tsyscustomlayout" 
--

create table tsyscustomlayout(
    loginlogo               varchar(50)     default ('logo.png'),
    loginheaderheight       int4            default ((38)) not null,
    loginheaderimg          varchar(50)     default ('bar1.png'),
    loginheadercolor        varchar(10)     default (''),
    loginfootertext         varchar(200)    default ('copyright www.lansweeper.com'),
    loginfootertextcolor    varchar(10)     default ('#ffffff'),
    loginfooterheight       int4            default ((35)) not null,
    loginfooterimg          varchar(50)     default ('bar1.png'),
    loginfootercolor        varchar(10)     default (''),
    logintitle              varchar(200)    default ('lansweeper login'),
    loginmessage            text            default (''),
    loginmessagecolor       varchar(10)     default ('#000000'),
    loginmessageposition    int4            default ((1)),
    showloginmessage        boolean,
    showloginheader         boolean,
    showloginfooter         boolean
)
;



-- 
-- table: "tsyscustomnames" 
--

create table tsyscustomnames(
    "customname"   varchar(50)      not null,
    "displayname"  varchar(100)     not null,
    "type"         int2,
    "values"       varchar(4000),
    "info"         varchar(250),
    primary key ("customname")
)
;



-- 
-- table: "tsysdbobjects" 
--

create table tsysdbobjects(
    "dbobjname"       varchar(75)     not null,
    "query"           text,
    "comment"         varchar(300),
    "displayname"     varchar(300),
    "hdoverseeronly"  boolean      default (false),
    primary key ("dbobjname")
)
;



-- 
-- table: tsysdomaincontrollers 
--

create table tsysdomaincontrollers(
    "domaincontrollerid"   int4            not null,
    "servername"           varchar(60)     not null,
    "domainnetbios"        varchar(256)    not null,
    "domaincontrollerdns"  varchar(256)    not null,
    primary key ("domaincontrollerid")
)
;



-- 
-- table: tsysdomaincredentials 
--

create table tsysdomaincredentials(
    "domainname"   varchar(150)    not null,
    "credid"       int4            not null,
    "priority"     int4,
    "isworkgroup"  boolean         not null,
    primary key ("domainname", "credid")
)
;



-- 
-- table: tsysdomainexclude 
--

create table tsysdomainexclude(
    "domainexcludeid"  int4            not null,
    "domainname"       varchar(200)    not null,
    "servername"       varchar(60)     not null,
    "comment"          varchar(150),
    primary key ("domainexcludeid")
)
;



-- 
-- table: tsysdonotscan 
--

create table tsysdonotscan(
    "assetname"         varchar(150)    not null,
    "comment"           varchar(150),
    "servername"        varchar(60),
    "assetexclusionid"  int4            not null,
    primary key ("assetexclusionid")
)
;



-- 
-- table: tsyserrors 
--

create table tsyserrors(
    "errorid"     int4             not null,
    "errortype"   int4             not null,
    "errormsg"    varchar(4000),
    "scanserver"  varchar(300),
    "added"       timestamp        default (now()) not null,
    primary key ("errorid")
)
;



-- 
-- table: tsyserrortype 
--

create table tsyserrortype(
    "errortype"  int4            not null,
    "errorname"  varchar(100)    not null,
    primary key ("errortype")
)
;



-- 
-- table: "tsyseventalerts" 
--

create table tsyseventalerts(
    "alertid"    int4            not null,
    "alertname"  varchar(500)    not null,
    "enabled"    boolean      default (false) not null,
    "mailgroup"  varchar(250),
    primary key ("alertid")
)
;



-- 
-- table: tsyseventfilter 
--

create table tsyseventfilter(
    "filterid"      int4             not null,
    "alertid"       int4             not null,
    "compare"       int4             not null,
    "operator"      int4             not null,
    "comparevalue"  varchar(1000)    not null,
    primary key ("filterid")
)
;



-- 
-- table: tsyseventignore 
--

create table tsyseventignore(
    "ignoreid"    int4            not null,
    "sourcename"  varchar(100)    not null,
    "eventcode"   int4,
    "comment"     varchar(150),
    primary key ("ignoreid")
)
;



-- 
-- table: "tsysfiles" 
--

create table tsysfiles(
    "versionid"   int4             not null,
    "searchfile"  varchar(1000)    not null,
    "enabled"     boolean          default (true) not null,
    primary key ("versionid")
)
;



-- 
-- table: tsyshisttables 
--

create table tsyshisttables(
    "display"  varchar(100)    not null,
    primary key ("display")
)
;



-- 
-- table: tsysipexclude 
--

create table tsysipexclude(
    "servername"  varchar(60)     not null,
    "ipaddress"   varchar(50)     not null,
    "comment"     varchar(150),
    primary key ("servername", "ipaddress")
)
;



-- 
-- table: tsysiplocations 
--

create table tsysiplocations(
    "startip"        numeric(18, 0)    not null,
    "endip"          numeric(18, 0)    not null,
    "iplocation"     varchar(200)      not null,
    "realstart"      varchar(20)       not null,
    "realend"        varchar(20)       not null,
    "packageshare"   varchar(2000),
    "shareusername"  varchar(100),
    "sharepassword"  varchar(1000),
    "sharekeyhash"   int4,
    "locationid"     int4              not null,
    primary key ("locationid")
)
;



-- 
-- table: tsysiprangecredentials 
--

create table tsysiprangecredentials(
    "iprangeid"  int4    not null,
    "credid"     int4    not null,
    "priority"   int4    not null,
    primary key ("iprangeid", "credid")
)
;



-- 
-- table: tsysipscanranges 
--

create table tsysipscanranges(
    "iprangeid"             int4             not null,
    "servername"            varchar(60)      not null,
    "ipstart"               varchar(50)      not null,
    "ipend"                 varchar(50)      not null,
    "enabled"               boolean          default (true) not null,
    "pingtimeout"           int4             default ((2)) not null,
    "ipignorewindows"       boolean      default (false) not null,
    "dontping"              boolean      default (false) not null,
    "day1"                  boolean      default (false) not null,
    "day2"                  boolean      default (false) not null,
    "day3"                  boolean      default (false) not null,
    "day4"                  boolean      default (false) not null,
    "day5"                  boolean      default (false) not null,
    "day6"                  boolean      default (false) not null,
    "day7"                  boolean      default (false) not null,
    "day1time"              timestamp        default (date_trunc('day', now())) not null,
    "day2time"              timestamp        default (date_trunc('day', now())) not null,
    "day3time"              timestamp        default (date_trunc('day', now())) not null,
    "day4time"              timestamp        default (date_trunc('day', now())) not null,
    "day5time"              timestamp        default (date_trunc('day', now())) not null,
    "day6time"              timestamp        default (date_trunc('day', now())) not null,
    "day7time"              timestamp        default (date_trunc('day', now())) not null,
    "lastipscan"            timestamp,
    "nossh"                 boolean      default (false) not null,
    "recurring"             boolean      default (false) not null,
    "minutes"               boolean      default (false) not null,
    "waittime"              int4             default ((1)) not null,
    "sshport"               int4             default ((22)),
    "savepingedip"          boolean      default (false) not null,
    "ipignoreknownwindows"  boolean      default (false) not null,
    "description"           varchar(1000),
    "sipport"               int4             default ((5060)) not null,
    "scannow"               boolean      default (false) not null,
    primary key ("iprangeid")
)
;



-- 
-- table: "tsyslabeldocs" 
--

create table tsyslabeldocs(
    "id"    int4       not null,
    type    char(3),
    primary key ("id")
)
;



-- 
-- table: "tsyslanguages" 
--

create table tsyslanguages(
    "languageid"    int4           not null,
    "name"          varchar(50)    not null,
    "englishname"   varchar(50)    not null,
    "languagecode"  varchar(10)    not null,
    "enabled"       boolean    default (false) not null,
    "supported"     boolean    default (false) not null,
    "culturename"   varchar(20)
)
;



-- 
-- table: tsyslastscan 
--

create table tsyslastscan(
    "assetid"   int4              not null,
    "cfgcode"   int4              not null,
    "lasttime"  timestamp         default (now()) not null,
    "scantime"  numeric(18, 2),
    primary key ("assetid", "cfgcode")
)
;



-- 
-- table: tsyslicensetype 
--

create table tsyslicensetype(
    "licensetype"      int4            not null,
    "licensetypename"  varchar(255)    not null,
    primary key ("licensetype")
)
;



-- 
-- table: tsyslogschedule 
--

create table tsyslogschedule(
    "scheduleid"     int4              not null,
    "servername"     varchar(60)       not null,
    "scantype"       numeric(18, 0)    default ((1)) not null,
    "scantarget"     varchar(1024)     not null,
    "netbiosdomain"  varchar(150)      not null,
    "everyxvalue"    numeric(18, 0)    default ((60)) not null,
    "everyx"         varchar(1)        default ('m') not null,
    "enabled"        boolean      default (false) not null,
    "lastscanned"    timestamp,
    "description"    varchar(1000),
    "scannow"        boolean      default (false) not null,
    primary key ("scheduleid")
)
;



-- 
-- table: "tsysmacblacklist" 
--

create table tsysmacblacklist(
    "macblacklistid"  int4            not null,
    "mac"             varchar(128)    not null,
    "comment"         varchar(512),
    "lastchanged"     timestamp       default (now()) not null,
    primary key ("macblacklistid")
)
;



-- 
-- table: "tsysmacvendor" 
--

create table tsysmacvendor(
    "mac"     varchar(6)      not null,
    "vendor"  varchar(300)    not null,
    primary key ("mac")
)
;



-- 
-- table: tsysmailconfig 
--

create table tsysmailconfig(
    "configid"             int4             not null,
    "servername"           varchar(60),
    "smtpserver"           varchar(250),
    "smtpport"             int4,
    "smtpfrom"             varchar(250),
    "smtpfromdisplay"      varchar(250),
    "smtpauthenticate"     boolean,
    "smtpusername"         varchar(255),
    "smtppassword"         varchar(4000),
    "sendalertreports"     boolean,
    "sendeventalerts"      boolean,
    "smtpusessl"           boolean,
    "mailnow"              boolean,
    "lastmailed"           timestamp,
    "smtppasswordkeyhash"  int4,
    "smtpssl"              int2,
    "error"                int4,
    "errortext"            varchar(4000),
    "lasttried"            timestamp
)
;



-- 
-- table: "tsysmailgroups" 
--

create table tsysmailgroups(
    "mailgroup"    varchar(250)     not null,
    "members"      varchar(1000)    not null,
    "mailgroupid"  int4             not null,
    primary key ("mailgroupid")
)
;



-- 
-- table: "tsysmanufacturertranslation" 
--

create table tsysmanufacturertranslation(
    "manufacturertranslationid"  int4            not null,
    "regex"                      varchar(256)    not null,
    "manufacturer"               varchar(256)    not null,
    primary key ("manufacturertranslationid")
)
;



-- 
-- table: "tsysmemorytypes" 
--

create table tsysmemorytypes(
    "memorytype"  int4            not null,
    "memoryname"  varchar(255)    not null,
    primary key ("memorytype")
)
;



-- 
-- table: "tsysmodeltranslation" 
--

create table tsysmodeltranslation(
    "modeltranslationid"  int4            not null,
    "regex"               varchar(256)    not null,
    "model"               varchar(256)    not null,
    primary key ("modeltranslationid")
)
;



-- 
-- table: tsysoidlookup 
--

create table tsysoidlookup(
    "oid"       varchar(300)    not null,
    "itemtype"  int4            default ((1)) not null,
    "model"     varchar(255)    not null,
    "lookupid"  int4            not null,
    primary key ("lookupid")
)
;



-- 
-- table: "tsysos" 
--

create table tsysos(
    "oscode"     varchar(50)     not null,
    "osname"     varchar(200)    not null,
    "image"      varchar(50)     not null,
    "sortorder"  int4            not null,
    primary key ("oscode")
)
;



-- 
-- table: tsyspackageexecution 
--

create table tsyspackageexecution(
    "executionid"        int4           not null,
    "packagescheduleid"  int4           not null,
    "scanserver"         varchar(60)    not null,
    "lastrun"            timestamp      default ('1900-01-01 00:00:00.000') not null,
    "executed"           boolean    default (false) not null,
    primary key ("executionid")
)
;



-- 
-- table: tsyspackagelogs 
--

create table tsyspackagelogs(
    "packagelogid"       int4             not null,
    "assetid"            int4,
    "packageid"          int4             not null,
    "success"            boolean      default (false) not null,
    "errorcode"          varchar(300),
    "destination"        varchar(300),
    "errormessage"       varchar(1000),
    "laststepid"         int4,
    "added"              timestamp        default (now()) not null,
    "typeid"             int4             not null,
    "servername"         varchar(60),
    "ipaddress"          varchar(50),
    "guid"               varchar(50),
    "version"            varchar(50),
    "executor"           varchar(100),
    "packagescheduleid"  int4,
    "runmode"            int4,
    primary key ("packagelogid")
)
;



-- 
-- table: "tsyspackagelogtype" 
--

create table tsyspackagelogtype(
    "typeid"  int4           not null,
    "name"    varchar(20)    not null,
    primary key ("typeid")
)
;



-- 
-- table: "tsyspackages" 
--

create table tsyspackages(
    "packageid"       int4             not null,
    "packagename"     varchar(255)     not null,
    "description"     varchar(1000),
    "created"         timestamp        default (now()) not null,
    "lastchanged"     timestamp,
    "createdby"       varchar(255),
    "changedby"       varchar(255),
    "enabled"         boolean          default (true) not null,
    "shutdownoption"  int4,
    "shutdowntime"    int4,
    "timeout"         int4             not null,
    "rescan"          boolean          not null,
    "runmode"         int4             default ((-1)) not null,
    primary key ("packageid")
)
;



-- 
-- table: tsyspackageschedule 
--

create table tsyspackageschedule(
    "packagescheduleid"         int4             not null,
    "linktype"                  int4,
    "scheduleid"                int4,
    "creationdate"              timestamp,
    "modificationdate"          timestamp,
    "executor"                  varchar(100),
    "creator"                   varchar(100),
    "modifier"                  varchar(100),
    "runnow"                    boolean      default (false),
    "packageid"                 int4,
    "reportquery"               varchar(200),
    "assetgroupid"              int4,
    "enabled"                   boolean          default (true) not null,
    "visible"                   boolean          default (true) not null,
    "wol"                       boolean,
    "woltime"                   int4,
    "reportparams"              varchar(200),
    "retrydate"                 timestamp,
    "retrytime"                 int4,
    "deployafterscan"           boolean,
    "runmode"                   int4,
    "packageschedulereference"  int4,
    "filters"                   varchar(2000),
    "haschanged"                boolean      default (false) not null,
    primary key ("packagescheduleid")
)
;



-- 
-- table: tsyspackagescheduleasset 
--

create table tsyspackagescheduleasset(
    "scheduleassetid"  int4    not null,
    "scheduleid"       int4    not null,
    "assetid"          int4    not null,
    primary key ("scheduleassetid")
)
;



-- 
-- table: tsyspackagestepconditionlinks 
--

create table tsyspackagestepconditionlinks(
    "conditionlinkid"  int4    not null,
    "conditiontypeid"  int4    not null,
    "conditionnameid"  int4    not null,
    primary key ("conditionlinkid")
)
;



-- 
-- table: "tsyspackagestepconditionnames" 
--

create table tsyspackagestepconditionnames(
    "conditionnameid"  int4           not null,
    "conditionname"    varchar(50)    not null,
    primary key ("conditionnameid")
)
;



-- 
-- table: tsyspackagestepconditions 
--

create table tsyspackagestepconditions(
    "conditionid"       int4             not null,
    "packagestepid"     int4,
    "conditiontypeid"   int4             not null,
    "specificationone"  varchar(1000),
    "specificationtwo"  varchar(1000),
    "conditionnameid"   int4,
    "value"             varchar(1000),
    primary key ("conditionid")
)
;



-- 
-- table: "tsyspackagestepconditiontypes" 
--

create table tsyspackagestepconditiontypes(
    "conditiontypeid"  int4           not null,
    "typename"         varchar(50)    not null,
    primary key ("conditiontypeid")
)
;



-- 
-- table: tsyspackagesteps 
--

create table tsyspackagesteps(
    "packagestepid"  int4             not null,
    "packageid"      int4             not null,
    "stepnr"         int4,
    "steptype"       int4,
    "stepname"       varchar(255),
    "onsuccess"      int4             default ((-1)),
    "onfailure"      int4             default ((-1)),
    "path"           varchar(4000),
    "parameters"     varchar(1000),
    "exitcodes"      varchar(255),
    "commandline"    varchar(1000),
    "msiparameters"  varchar(500),
    "msiname"        varchar(100),
    "msiversion"     varchar(50),
    "editmode"       boolean      default (false),
    primary key ("packagestepid")
)
;



-- 
-- table: "tsyspackagesteptypes" 
--

create table tsyspackagesteptypes(
    "steptype"      int4           not null,
    "steptypename"  varchar(50),
    primary key ("steptype")
)
;



-- 
-- table: tsyspages 
--

create table tsyspages(
    "pageid"     int4              not null,
    "pagename"   varchar(150)      not null,
    "sortorder"  numeric(18, 0),
    image        varchar(100),
    primary key ("pageid")
)
;



-- 
-- table: "tsyspermissions" 
--

create table tsyspermissions(
    "permissionid"  int4            not null,
    "name"          varchar(300)    not null,
    "icon"          varchar(300),
    primary key ("permissionid")
)
;



-- 
-- table: "tsysregistry" 
--

create table tsysregistry(
    "regid"     int4             not null,
    "rootkey"   varchar(50),
    "regpath"   varchar(1000),
    "regvalue"  varchar(200),
    "enabled"   boolean          default (true) not null,
    primary key ("regid")
)
;



-- 
-- table: "tsysremotedatabases" 
--

create table tsysremotedatabases(
    "remotedatabaseid"  int4            not null,
    "ip/dns"            varchar(150)    not null,
    "port"              int4            not null,
    "password"          varchar(250)    not null,
    "runnow"            boolean      default (false) not null,
    "enabled"           boolean      default (true) not null,
    "description"       varchar(250),
    "scheduleid"        int4            not null,
    "lastscan"          timestamp,
    primary key ("remotedatabaseid")
)
;



-- 
-- table: tsysreportpages 
--

create table tsysreportpages(
    "homepageid"     int4              not null,
    "homepagequery"  varchar(200)      not null,
    "sortorder"      numeric(18, 0)    not null,
    "priority"       numeric(18, 0)    not null,
    "showcolor"      boolean           not null,
    "pageid"         int4              default ((1)) not null,
    primary key ("homepageid")
)
;



-- 
-- table: tsysreports 
--

create table tsysreports(
    "reportquery"  varchar(200)     not null,
    "reporttitle"  varchar(1000)    not null,
    "sendmail"     boolean,
    "mailgroup"    varchar(250),
    "created"      timestamp,
    "lastchanged"  timestamp,
    "createdby"    varchar(150),
    "changedby"    varchar(150),
    "lastrun"      timestamp,
    "permissions"  varchar(1000),
    "total"        int4,
    "alerttype"    boolean,
    "exporttype"   int4,
    "overwrite"    boolean,
    "lastalert"    timestamp,
    "exporterror"  varchar(250),
    "sendnow"      boolean,
    "errordate"    timestamp,
    primary key ("reportquery")
)
;



-- 
-- table: tsysrolemembers 
--

create table tsysrolemembers(
    "memberid"  int4            not null,
    "roleid"    int4            not null,
    "member"    varchar(150),
    primary key ("memberid")
)
;



-- 
-- table: tsysrolepermissions 
--

create table tsysrolepermissions(
    "rolepermissionid"  int4    not null,
    "roleid"            int4    not null,
    "permissionid"      int4    not null,
    primary key ("rolepermissionid")
)
;



-- 
-- table: "tsysroles" 
--

create table tsysroles(
    "roleid"   int4            not null,
    "name"     varchar(300)    not null,
    "default"  boolean      default (false) not null,
    primary key ("roleid")
)
;



-- 
-- table: "tsysscanningmethods" 
--

create table tsysscanningmethods(
    "scanningmethodid"  int4            not null,
    "scanningmethod"    varchar(500),
    primary key ("scanningmethodid")
)
;



-- 
-- table: tsysscanqueue 
--

create table tsysscanqueue(
    "scanid"      int8            not null,
    "servername"  varchar(60)     not null,
    "type"        int4            not null,
    "scantarget"  varchar(300)    not null,
    primary key ("scanid")
)
;



-- 
-- table: "tsysschedule" 
--

create table tsysschedule(
    "scheduleid"     int4           not null,
    "schedulename"   varchar(50)    not null,
    "starttime"      timestamp      not null,
    "interval"       int8,
    "weekdays"       int2           default ((0)),
    "monthdays"      int4           default ((0)),
    "executionmode"  varchar(50)    not null,
    primary key ("scheduleid")
)
;



-- 
-- table: "tsysserials" 
--

create table tsysserials(
    "product"     varchar(255)      not null,
    "regkey"      varchar(400)      not null,
    "enabled"     boolean      default (true) not null,
    "serialid"    numeric(18, 0)    default ((1)) not null,
    "value"       varchar(300)      default ('digitalproductid') not null,
    "variations"  boolean      default (false) not null,
    primary key ("product")
)
;



-- 
-- table: "tsysserialtranslation" 
--

create table tsysserialtranslation(
    "serialtranslationid"  int4            not null,
    "regex"                varchar(256)    not null,
    "serial"               varchar(256)    not null,
    primary key ("serialtranslationid")
)
;



-- 
-- table: "tsyssqllicensetypes" 
--

create table tsyssqllicensetypes(
    "licensetype"      int4            not null,
    "licensetypename"  varchar(255),
    primary key ("licensetype")
)
;



-- 
-- table: "tsyssystemskutranslation" 
--

create table tsyssystemskutranslation(
    "systemskutranslationid"  int4            not null,
    "regex"                   varchar(256)    not null,
    "systemsku"               varchar(256)    not null,
    primary key ("systemskutranslationid")
)
;



-- 
-- table: tsysuniqueipcredentials 
--

create table tsysuniqueipcredentials(
    "ipaddress"  varchar(15)    not null,
    "credid"     int4           not null,
    "priority"   int4           not null,
    primary key ("ipaddress", "credid")
)
;



-- 
-- table: tsysuniquewindowscredentials 
--

create table tsysuniquewindowscredentials(
    "assetunique"  varchar(300)    not null,
    "credid"       int4            not null,
    primary key ("assetunique", "credid")
)
;



-- 
-- table: tsysupdate 
--

create table tsysupdate(
    "config"                     int4         not null,
    "credentials"                timestamp    default (now()),
    "license"                    timestamp    default (now()),
    "waittime"                   timestamp    default (now()),
    "files"                      timestamp    default (now()),
    "registry"                   timestamp    default (now()),
    "productkeys"                timestamp    default (now()),
    "eventsignore"               timestamp    default (now()),
    "eventalert"                 timestamp    default (now()),
    "mail"                       timestamp    default (now()),
    "eventscan"                  timestamp    default (now()),
    "proxy"                      timestamp    default (now()) not null,
    "macblacklist"               timestamp    default (now()),
    "manufacturertranslation"    timestamp    default (now()),
    "ipexcluxions"               timestamp    default (now()) not null,
    "renamedcomputerdetection"   timestamp    default (now()) not null,
    "deployment"                 timestamp    default (now()) not null,
    "assettypeexclusions"        timestamp    default (now()) not null,
    "domainexclusions"           timestamp    default (now()),
    "scanhistory"                timestamp    default (now()) not null,
    "domainuserscanning"         timestamp    default (now()) not null,
    "scheduledcomputerscanning"  timestamp    default (now()) not null,
    "assetgroups"                timestamp,
    "asdomains"                  timestamp,
    "asou"                       timestamp,
    "assetgroupscan"             timestamp,
    "asworkgroups"               timestamp,
    "donotscan"                  timestamp,
    "ipscanranges"               timestamp,
    "logschedule"                timestamp,
    "macvendor"                  timestamp,
    "oidlookup"                  timestamp,
    "vendoroid"                  timestamp,
    "asservers"                  timestamp,
    "tsysconfig"                 timestamp,
    "domaincontrollers"          timestamp,
    "assites"                    timestamp,
    "modeltranslation"           timestamp,
    "serialtranslation"          timestamp,
    "systemskutranslation"       timestamp,
    "helpdeskmailconfig"         timestamp    default (now()) not null,
    "iplocations"                timestamp,
    "outgoingemailtemplates"     timestamp,
    "agentoptions"               timestamp,
    "helpdeskconfig"             timestamp,
    primary key ("config")
)
;



-- 
-- table: tsysuseractions 
--

create table tsysuseractions(
    "description"   varchar(300)      not null,
    "action"        varchar(1000)     not null,
    "icon"          varchar(50)       not null,
    sortorder       numeric(18, 0),
    enabled         boolean           not null,
    confirmation    boolean           not null,
    "advanced"      boolean,
    "actionid"      int4              not null,
    primary key ("actionid")
)
;



-- 
-- table: tsysuserschedule 
--

create table tsysuserschedule(
    "scheduleid"     int4             not null,
    "servername"     varchar(60)      not null,
    "scantarget"     varchar(1024)    not null,
    "netbiosdomain"  varchar(150)     not null,
    "enabled"        boolean          not null,
    "scannow"        boolean      default (false) not null,
    "day1"           boolean      default (false) not null,
    "day2"           boolean      default (false) not null,
    "day3"           boolean      default (false) not null,
    "day4"           boolean      default (false) not null,
    "day5"           boolean      default (false) not null,
    "day6"           boolean      default (false) not null,
    "day7"           boolean      default (false) not null,
    "day1time"       timestamp        default (date_trunc('day', now())) not null,
    "day2time"       timestamp        default (date_trunc('day', now())) not null,
    "day3time"       timestamp        default (date_trunc('day', now())) not null,
    "day4time"       timestamp        default (date_trunc('day', now())) not null,
    "day5time"       timestamp        default (date_trunc('day', now())) not null,
    "day6time"       timestamp        default (date_trunc('day', now())) not null,
    "day7time"       timestamp        default (date_trunc('day', now())) not null,
    "lastscanned"    timestamp,
    "description"    varchar(1000),
    "errortext"      varchar(250),
    primary key ("scheduleid")
)
;



-- 
-- table: tsysvendorlogos 
--

create table tsysvendorlogos(
    "vendor"  varchar(200)    not null,
    logo      varchar(150),
    primary key ("vendor")
)
;



-- 
-- table: "tsysvendoroid" 
--

create table tsysvendoroid(
    "oid"     numeric(18, 0)    not null,
    "vendor"  varchar(300)      not null,
    primary key ("oid")
)
;



-- 
-- table: tsyswaitqueue 
--

create table tsyswaitqueue(
    "scanid"      int8            not null,
    "servername"  varchar(60)     not null,
    "status"      int4            not null,
    "name"        varchar(255)    not null,
    primary key ("scanid")
)
;



-- 
-- table: "tsyswaittime" 
--

create table tsyswaittime(
    "cfgcode"       int4              not null,
    "cfgname"       varchar(20)       not null,
    "waitdays"      numeric(18, 0)    not null,
    "trackchanges"  boolean,
    primary key ("cfgcode")
)
;



-- 
-- table: tsyswarrantyqueue 
--

create table tsyswarrantyqueue(
    "assetid"    int4         not null,
    "timestamp"  timestamp    default (now()) not null,
    primary key ("assetid")
)
;



-- 
-- table: "tsyswebcontrols" 
--

create table tsyswebcontrols(
    "controlid"    int4             not null,
    "controlname"  varchar(255),
    "path"         varchar(1024),
    "icon"         varchar(1024)    default ('/images/widget.png'),
    "canedit"      boolean      default (false) not null,
    "isdefault"    boolean      default (false) not null,
    "preload"      boolean      default (false) not null,
    "nohelpdesk"   boolean,
    primary key ("controlid")
)
;



-- 
-- table: "tsyswebroles" 
--

create table tsyswebroles(
    "authid"           int4             not null,
    "authdescription"  varchar(255)     not null,
    "authmembers"      varchar(4000),
    "info"             varchar(1000)    default (''),
    primary key ("authid")
)
;



-- 
-- table: tsyswebtabcontrols 
--

create table tsyswebtabcontrols(
    "tabcontrolid"  int4    not null,
    "tabid"         int4    not null,
    "controlid"     int4    not null,
    "rowid"         int4    not null,
    "columnid"      int4    not null,
    "state"         text,
    primary key ("tabcontrolid")
)
;



-- 
-- table: tsyswebtabs 
--

create table tsyswebtabs(
    "tabid"       int4            not null,
    "tabname"     varchar(255)    not null,
    "pageid"      int4            not null,
    "templateid"  int4            not null,
    "sortorder"   int4,
    "globaltabs"  boolean      default (false) not null,
    "helpdesk"    boolean,
    primary key ("tabid")
)
;



-- 
-- table: "tsyswebusers" 
--

create table tsyswebusers(
    "pageid"         int4            not null,
    "username"       varchar(150)    not null,
    "dateformat"     varchar(20),
    sortascending    boolean      default (true),
    language         int4            default ((1)) not null,
    searchnewtab     boolean      default (true) not null,
    primary key ("pageid")
)
;



-- 
-- table: tsyswebusersglobaltabs 
--

create table tsyswebusersglobaltabs(
    "pageid"     int4    not null,
    "tabid"      int4    not null,
    "sortorder"  int4    not null,
    primary key ("pageid", "tabid")
)
;



-- 
-- index: "fk_htblagentconfig_htblagents" 
--

create index "fk_htblagentconfig_htblagents" on htblagentconfig(agentid)
;
-- 
-- index: "fk_htblagents_htblusers" 
--

create index "fk_htblagents_htblusers" on htblagents(userid)
;
-- 
-- index: "fk_htblagentteam_htblagents" 
--

create index "fk_htblagentteam_htblagents" on htblagentteam(agentid)
;
-- 
-- index: "fk_htblagentteam_htblteams" 
--

create index "fk_htblagentteam_htblteams" on htblagentteam(teamid)
;
-- 
-- index: "fk_htblagentteam_htblwebroles" 
--

create index "fk_htblagentteam_htblwebroles" on htblagentteam(webroleid)
;
-- 
-- index: "fk_htblattachements_htblfiles" 
--

create index "fk_htblattachements_htblfiles" on htblattachements(fileid)
;
-- 
-- index: "fk_htblattachements_htblnotes" 
--

create index "fk_htblattachements_htblnotes" on htblattachements(noteid)
;
-- 
-- index: "fk_htblautomaticcloselang_htblautomaticclose" 
--

create index "fk_htblautomaticcloselang_htblautomaticclose" on htblautomaticcloselang(autocloseid)
;
-- 
-- index: "fk_htblautomaticcloseticketstates_htblautomaticclose" 
--

create index "fk_htblautomaticcloseticketstates_htblautomaticclose" on htblautomaticcloseticketstates(autocloseid)
;
-- 
-- index: "fk_htblautomaticcloseticketstates_htblticketstates" 
--

create index "fk_htblautomaticcloseticketstates_htblticketstates" on htblautomaticcloseticketstates(ticketstateid)
;
-- 
-- index: "fk_htblautomaticclosetickettypes_htblautomaticclose" 
--

create index "fk_htblautomaticclosetickettypes_htblautomaticclose" on htblautomaticclosetickettypes(autocloseid)
;
-- 
-- index: "fk_htblautomaticclosetickettypes_htbltickettypes" 
--

create index "fk_htblautomaticclosetickettypes_htbltickettypes" on htblautomaticclosetickettypes(tickettypeid)
;
-- 
-- index: "fk_htblcustomfieldslang_htblcustomfields" 
--

create index "fk_htblcustomfieldslang_htblcustomfields" on htblcustomfieldslang(fieldid)
;
-- 
-- index: "fk_htblcustomfieldvaluelinks_htblcustomfieldvalues" 
--

create index "fk_htblcustomfieldvaluelinks_htblcustomfieldvalues" on htblcustomfieldvaluelinks(fieldvalueid)
;
-- 
-- index: "fk_htblcustomfieldvaluelinks_htbltickettypecustomfield" 
--

create index "fk_htblcustomfieldvaluelinks_htbltickettypecustomfield" on htblcustomfieldvaluelinks(fieldid)
;
-- 
-- index: "fk_htblcustomfieldvalues_htblcustomfields" 
--

create index "fk_htblcustomfieldvalues_htblcustomfields" on htblcustomfieldvalues(fieldid)
;
-- 
-- index: "fk_htblcustomticketfilteritems_htblcustomticketfilters" 
--

create index "fk_htblcustomticketfilteritems_htblcustomticketfilters" on htblcustomticketfilteritems(filterid)
;
-- 
-- index: "fk__htblcusto__useri__628582e0" 
--

create index "fk__htblcusto__useri__628582e0" on htblcustomticketfilters(userid)
;
-- 
-- index: "fk_htblemailaccountslang_htblemailaccounts" 
--

create index "fk_htblemailaccountslang_htblemailaccounts" on htblemailaccountslang(accountid)
;
-- 
-- index: "fk_htblemailaccountsteams_htblteams" 
--

create index "fk_htblemailaccountsteams_htblteams" on htblemailaccountsteams(teamid)
;
-- 
-- index: "fk_htblemailaccountsteams_htblemailaccounts" 
--

create index "fk_htblemailaccountsteams_htblemailaccounts" on htblemailaccountsteams(accountid)
;
-- 
-- index: "fk__htblemail__templ__45151b8a" 
--

create index "fk__htblemail__templ__45151b8a" on htblemailtemplatesattachements(templateid)
;
-- 
-- index: "fk__htblemail__filei__46093fc3" 
--

create index "fk__htblemail__filei__46093fc3" on htblemailtemplatesattachements(fileid)
;
-- 
-- index: "fk_htblemailtemplateslang_htblemailtemplates" 
--

create index "fk_htblemailtemplateslang_htblemailtemplates" on htblemailtemplateslang(templateid)
;
-- 
-- index: "fk_htblemailtemplatespriorities_htblemailtemplates" 
--

create index "fk_htblemailtemplatespriorities_htblemailtemplates" on htblemailtemplatespriorities(templateid)
;
-- 
-- index: "fk_htblemailtemplatespriorities_htblpriorities" 
--

create index "fk_htblemailtemplatespriorities_htblpriorities" on htblemailtemplatespriorities(priority)
;
-- 
-- index: "fk__htblemail__templ__7286e07f" 
--

create index "fk__htblemail__templ__7286e07f" on htblemailtemplatesticketstates(templateid)
;
-- 
-- index: "fk__htblemail__ticke__737b04b8" 
--

create index "fk__htblemail__ticke__737b04b8" on htblemailtemplatesticketstates(ticketstateid)
;
-- 
-- index: "fk_htblemailtemplatestickettypes_htblemailtemplates" 
--

create index "fk_htblemailtemplatestickettypes_htblemailtemplates" on htblemailtemplatestickettypes(templateid)
;
-- 
-- index: "fk_htblemailtemplatestickettypes_htbltickettypes" 
--

create index "fk_htblemailtemplatestickettypes_htbltickettypes" on htblemailtemplatestickettypes(tickettypeid)
;
-- 
-- index: "fk_htblemailverification_htblusers" 
--

create index "fk_htblemailverification_htblusers" on htblemailverification(userid)
;
-- 
-- index: "fk_htbleventinfochecks_htblscheduleinfo" 
--

create index "fk_htbleventinfochecks_htblscheduleinfo" on htbleventinfochecks("infoid")
;
-- 
-- index: "fk_htbleventreminders_htblschedule" 
--

create index "fk_htbleventreminders_htblschedule" on htbleventreminders("eventid")
;
-- 
-- index: "fk__htblfoote__useri__76577163" 
--

create index "fk__htblfoote__useri__76577163" on htblfooterattachements(userid)
;
-- 
-- index: "fk__htblfoote__filei__774b959c" 
--

create index "fk__htblfoote__filei__774b959c" on htblfooterattachements(fileid)
;
-- 
-- index: "fk_htblhistory_htblhistorytypes" 
--

create index "fk_htblhistory_htblhistorytypes" on htblhistory(typeid)
;
-- 
-- index: "fk_htblhistory_htblusers_2" 
--

create index "fk_htblhistory_htblusers_2" on htblhistory(userid2)
;
-- 
-- index: "fk_htblhistory_htblusers_3" 
--

create index "fk_htblhistory_htblusers_3" on htblhistory(userid3)
;
-- 
-- index: "fk_htblhistory_htblagents_2" 
--

create index "fk_htblhistory_htblagents_2" on htblhistory(agentid2)
;
-- 
-- index: "fk_htblhistory_htblticket" 
--

create index "fk_htblhistory_htblticket" on htblhistory(ticketid)
;
-- 
-- index: "fk_htblhistory_htblusers" 
--

create index "fk_htblhistory_htblusers" on htblhistory(userid)
;
-- 
-- index: "fk_htblknowledgebase_htblknowledgebasecategories" 
--

create index "fk_htblknowledgebase_htblknowledgebasecategories" on htblknowledgebase(categoryid)
;
-- 
-- index: "fk_htblknowledgebaseattachments_htblfiles" 
--

create index "fk_htblknowledgebaseattachments_htblfiles" on htblknowledgebaseattachments(fileid)
;
-- 
-- index: "fk_htblknowledgebaseattachments_htblknowledgebase" 
--

create index "fk_htblknowledgebaseattachments_htblknowledgebase" on htblknowledgebaseattachments(kbid)
;
-- 
-- index: "fk_htblknowledgebasecategorieslang_htblknowledgebasecategories" 
--

create index "fk_htblknowledgebasecategorieslang_htblknowledgebasecategories" on htblknowledgebasecategorieslang(categoryid)
;
-- 
-- index: "fk_htblknowledgebasecategoriesteams_htblknowledgebasecategories" 
--

create index "fk_htblknowledgebasecategoriesteams_htblknowledgebasecategories" on htblknowledgebasecategoriesteams(categoryid)
;
-- 
-- index: "fk_htblknowledgebasecategoriesteams_htblteams" 
--

create index "fk_htblknowledgebasecategoriesteams_htblteams" on htblknowledgebasecategoriesteams(teamid)
;
-- 
-- index: "fk_htblknowledgebaselang_htblknowledgebase" 
--

create index "fk_htblknowledgebaselang_htblknowledgebase" on htblknowledgebaselang(kbid)
;
-- 
-- index: "fk_htblnewslang_htblnews" 
--

create index "fk_htblnewslang_htblnews" on htblnewslang(newsid)
;
-- 
-- index: "fk__htblnoteh__notei__3c2acfce" 
--

create index "fk__htblnoteh__notei__3c2acfce" on htblnotehistory(noteid)
;
-- 
-- index: "fk__htblnoteh__useri__3d1ef407" 
--

create index "fk__htblnoteh__useri__3d1ef407" on htblnotehistory(userid)
;
-- 
-- index: "fk_htblnotes_htblticket" 
--

create index "fk_htblnotes_htblticket" on htblnotes(ticketid)
;
-- 
-- index: "fk_htblnotes_htblusers" 
--

create index "fk_htblnotes_htblusers" on htblnotes(userid)
;
-- 
-- index: "fk__htblnotif__useri__382534c0" 
--

create index "fk__htblnotif__useri__382534c0" on htblnotificationschecked(userid)
;
-- 
-- index: "fk__htblnotif__histi__391958f9" 
--

create index "fk__htblnotif__histi__391958f9" on htblnotificationschecked(histid)
;
-- 
-- index: "fk_htbloldticketdata_htblticket" 
--

create index "fk_htbloldticketdata_htblticket" on htbloldticketdata(ticketid)
;
-- 
-- index: "fk_htbloldticketdata_htblusers" 
--

create index "fk_htbloldticketdata_htblusers" on htbloldticketdata(userid)
;
-- 
-- index: "fk_htblprioritieslang_htblpriorities" 
--

create index "fk_htblprioritieslang_htblpriorities" on htblprioritieslang(priority)
;
-- 
-- index: "fk__htblrepor__repor__12f3b011" 
--

create index "fk__htblrepor__repor__12f3b011" on htblreportslang(reportid)
;
-- 
-- index: "fk__htblsaved__useri__326c5b6a" 
--

create index "fk__htblsaved__useri__326c5b6a" on htblsavedcustomfilters(userid)
;
-- 
-- index: "fk_htblschedule_htblscheduletypes" 
--

create index "fk_htblschedule_htblscheduletypes" on htblschedule(typeid)
;
-- 
-- index: "fk_htblschedule_htblagents" 
--

create index "fk_htblschedule_htblagents" on htblschedule(createdby)
;
-- 
-- index: "fk_htblscheduleagents_htblschedule" 
--

create index "fk_htblscheduleagents_htblschedule" on htblscheduleagents(scheduleid)
;
-- 
-- index: "fk_htblscheduleinfo_htblagents" 
--

create index "fk_htblscheduleinfo_htblagents" on htblscheduleinfo(agentid)
;
-- 
-- index: "fk_htblschedulerepeat_htblschedule" 
--

create index "fk_htblschedulerepeat_htblschedule" on htblschedulerepeat(scheduleid)
;
-- 
-- index: "fk_htblscheduleteams_htblschedule" 
--

create index "fk_htblscheduleteams_htblschedule" on htblscheduleteams("scheduleid")
;
-- 
-- index: "fk_htblscheduleteams_htblteams" 
--

create index "fk_htblscheduleteams_htblteams" on htblscheduleteams("teamid")
;
-- 
-- index: "fk_htblscheduletypeslang_htblscheduletypes" 
--

create index "fk_htblscheduletypeslang_htblscheduletypes" on htblscheduletypeslang(typeid)
;
-- 
-- index: "fk__htblshort__keyid__19a0ada0" 
--

create index "fk__htblshort__keyid__19a0ada0" on htblshortcutslang(keyid)
;
-- 
-- index: "fk_htblshownclientrelations_tsysassetrelationtypes" 
--

create index "fk_htblshownclientrelations_tsysassetrelationtypes" on htblshownclientrelations("relationtypeid")
;
-- 
-- index: "fk__htblslaco__slaid__530e3526" 
--

create index "fk__htblslaco__slaid__530e3526" on htblslacompanies(slaid)
;
-- 
-- index: "fk__htblslade__slaid__54f67d98" 
--

create index "fk__htblslade__slaid__54f67d98" on htblsladepartments(slaid)
;
-- 
-- index: "fk__htblslapr__slaid__4d555bd0" 
--

create index "fk__htblslapr__slaid__4d555bd0" on htblslapriorities(slaid)
;
-- 
-- index: "fk__htblslapr__prior__4e498009" 
--

create index "fk__htblslapr__prior__4e498009" on htblslapriorities(priority)
;
-- 
-- index: "fk__htblslaso__slaid__56dec60a" 
--

create index "fk__htblslaso__slaid__56dec60a" on htblslasource(slaid)
;
-- 
-- index: "fk__htblslaso__sourc__57d2ea43" 
--

create index "fk__htblslaso__sourc__57d2ea43" on htblslasource(sourceid)
;
-- 
-- index: "fk__htblslati__slaid__4a78ef25" 
--

create index "fk__htblslati__slaid__4a78ef25" on htblslatickettypes(slaid)
;
-- 
-- index: "fk__htblslati__ticke__4b6d135e" 
--

create index "fk__htblslati__ticke__4b6d135e" on htblslatickettypes(tickettypeid)
;
-- 
-- index: "fk__htblslaus__slaid__5031c87b" 
--

create index "fk__htblslaus__slaid__5031c87b" on htblslausers(slaid)
;
-- 
-- index: "fk__htblslaus__useri__5125ecb4" 
--

create index "fk__htblslaus__useri__5125ecb4" on htblslausers(userid)
;
-- 
-- index: "fk_htblspecialrulesactions_htblspecialrules" 
--

create index "fk_htblspecialrulesactions_htblspecialrules" on htblspecialrulesactions(ruleid)
;
-- 
-- index: "fk_htblspecialrulesconditions_htblspecialrules" 
--

create index "fk_htblspecialrulesconditions_htblspecialrules" on htblspecialrulesconditions(ruleid)
;
-- 
-- index: "fk_htblspecialrulestaskagents_htblagents" 
--

create index "fk_htblspecialrulestaskagents_htblagents" on htblspecialrulestaskagents(agentid)
;
-- 
-- index: "fk_htblspecialrulestaskagents_htblspecialrulestasks" 
--

create index "fk_htblspecialrulestaskagents_htblspecialrulestasks" on htblspecialrulestaskagents(ruletaskid)
;
-- 
-- index: "fk_htblspecialrulestaskteams_htblteams" 
--

create index "fk_htblspecialrulestaskteams_htblteams" on htblspecialrulestaskteams(teamid)
;
-- 
-- index: "fk_htblspecialrulestaskteams_htblspecialrulestasks" 
--

create index "fk_htblspecialrulestaskteams_htblspecialrulestasks" on htblspecialrulestaskteams(ruletaskid)
;
-- 
-- index: "fk_htblteamslang_htblteams" 
--

create index "fk_htblteamslang_htblteams" on htblteamslang(teamid)
;
-- 
-- index: "fk_htbltemplates_htbltemplatecategories" 
--

create index "fk_htbltemplates_htbltemplatecategories" on htbltemplates(categoryid)
;
-- 
-- index: "fk_htbltemplateslang_htbltemplates" 
--

create index "fk_htbltemplateslang_htbltemplates" on htbltemplateslang(templateid)
;
-- 
-- index: "fk_htblticket_htblagents" 
--

create index "fk_htblticket_htblagents" on htblticket(agentid)
;
-- 
-- index: "fk_htblticket_htblpriorities" 
--

create index "fk_htblticket_htblpriorities" on htblticket(priority)
;
-- 
-- index: "fk_htblticket_htblticketstates" 
--

create index "fk_htblticket_htblticketstates" on htblticket(ticketstateid)
;
-- 
-- index: "fk_htblticket_htblusers" 
--

create index "fk_htblticket_htblusers" on htblticket(fromuserid)
;
-- 
-- index: "fk_htblticketasset_tblassets" 
--

create index "fk_htblticketasset_tblassets" on htblticketasset(assetid)
;
-- 
-- index: "fk_htblticketasset_htblticket" 
--

create index "fk_htblticketasset_htblticket" on htblticketasset(ticketid)
;
-- 
-- index: "fk_htblticketcustomfield_htblcustomfields" 
--

create index "fk_htblticketcustomfield_htblcustomfields" on htblticketcustomfield(fieldid)
;
-- 
-- index: "fk_htblticketcustomfield_htblticket" 
--

create index "fk_htblticketcustomfield_htblticket" on htblticketcustomfield(ticketid)
;
-- 
-- index: "fk_htblticketmerges_htblticket" 
--

create index "fk_htblticketmerges_htblticket" on htblticketmerges(newtid)
;
-- 
-- index: "fk_htblticketssummary_htblusers" 
--

create index "fk_htblticketssummary_htblusers" on htblticketssummary(userid)
;
-- 
-- index: "fk__htblticke__repla__3ffb60b2" 
--

create index "fk__htblticke__repla__3ffb60b2" on htblticketstates(replacementid)
;
-- 
-- index: "fk_htblticketstateslang_htblticketstates" 
--

create index "fk_htblticketstateslang_htblticketstates" on htblticketstateslang(ticketstateid)
;
-- 
-- index: "fk__htblticke__agent__7df8932b" 
--

create index "fk__htblticke__agent__7df8932b" on htblticketsubscribers(agentid)
;
-- 
-- index: "fk__htblticke__ticke__7d046ef2" 
--

create index "fk__htblticke__ticke__7d046ef2" on htblticketsubscribers(ticketid)
;
-- 
-- index: "fk_htblticketteam_htblteams" 
--

create index "fk_htblticketteam_htblteams" on htblticketteam(teamid)
;
-- 
-- index: "fk_htblticketteam_htblticket" 
--

create index "fk_htblticketteam_htblticket" on htblticketteam(ticketid)
;
-- 
-- index: "fk_htbltickettypecustomfield_htblcustomfields" 
--

create index "fk_htbltickettypecustomfield_htblcustomfields" on htbltickettypecustomfield(fieldid)
;
-- 
-- index: "fk_htbltickettypecustomfield_htbltickettypes" 
--

create index "fk_htbltickettypecustomfield_htbltickettypes" on htbltickettypecustomfield(tickettypeid)
;
-- 
-- index: "fk_htbltickettypes_htblagents" 
--

create index "fk_htbltickettypes_htblagents" on htbltickettypes(agentid)
;
-- 
-- index: "fk__htblticke__repla__69bc9054" 
--

create index "fk__htblticke__repla__69bc9054" on htbltickettypes(replacementid)
;
-- 
-- index: "fk_htbltickettypeslang_htbltickettypes" 
--

create index "fk_htbltickettypeslang_htbltickettypes" on htbltickettypeslang(tickettypeid)
;
-- 
-- index: "fk_htbltickettypeteams_htblteams" 
--

create index "fk_htbltickettypeteams_htblteams" on htbltickettypeteams(teamid)
;
-- 
-- index: "fk_htbltickettypeteams_htbltickettypes" 
--

create index "fk_htbltickettypeteams_htbltickettypes" on htbltickettypeteams(tickettypeid)
;
-- 
-- index: "fk__htblticke__ticke__32a16594" 
--

create index "fk__htblticke__ticke__32a16594" on htblticketuserrelation(ticketid)
;
-- 
-- index: "fk__htblticke__useri__339589cd" 
--

create index "fk__htblticke__useri__339589cd" on htblticketuserrelation(userid)
;
-- 
-- index: "fk_tbladcomputers_tbladobjects" 
--

create index "fk_tbladcomputers_tbladobjects" on tbladcomputers("adobjectid")
;
-- 
-- index: "fk_tbladcomputers_tbladobjects1" 
--

create index "fk_tbladcomputers_tbladobjects1" on tbladcomputers("manageradobjectid")
;
-- 
-- index: "fk_tbladcomputers_tblassets" 
--

create index "fk_tbladcomputers_tblassets" on tbladcomputers("assetid")
;
-- 
-- index: "fk_tbladgroups_tbladobjects" 
--

create index "fk_tbladgroups_tbladobjects" on tbladgroups("manageradobjectid")
;
-- 
-- index: "fk_tbladgroups_tbladobjects1" 
--

create index "fk_tbladgroups_tbladobjects1" on tbladgroups("adobjectid")
;
-- 
-- index: "fk_tbladmembership_tbladobject" 
--

create index "fk_tbladmembership_tbladobject" on tbladmembership("parentadobjectid")
;
-- 
-- index: "fk_tbladmembership_tbladobject1" 
--

create index "fk_tbladmembership_tbladobject1" on tbladmembership("childadobjectid")
;
-- 
-- index: "fk_tbladusers_tbladobjects" 
--

create index "fk_tbladusers_tbladobjects" on tbladusers("adobjectid")
;
-- 
-- index: "fk_tbladusers_tbladobjects1" 
--

create index "fk_tbladusers_tbladobjects1" on tbladusers("manageradobjectid")
;
-- 
-- index: "fk_tblantivirus_tblassets" 
--

create index "fk_tblantivirus_tblassets" on tblantivirus("assetid")
;
-- 
-- index: "fk_tblassetnotes_tblassets" 
--

create index "fk_tblassetnotes_tblassets" on tblassetcomments("assetid")
;
-- 
-- index: "fk_tblassetcustom_tblassets" 
--

create index "fk_tblassetcustom_tblassets" on tblassetcustom("assetid")
;
-- 
-- index: "fk_tblassetcustom_tblstate" 
--

create index "fk_tblassetcustom_tblstate" on tblassetcustom("state")
;
-- 
-- index: "fk_tblassetdocs_tblassets" 
--

create index "fk_tblassetdocs_tblassets" on tblassetdocs("assetid")
;
-- 
-- index: "fk_tblassetrolelink_tblassetroles" 
--

create index "fk_tblassetrolelink_tblassetroles" on tblassetgrouplink("assetgroupid")
;
-- 
-- index: "fk_tblassetrolelink_tblassets" 
--

create index "fk_tblassetrolelink_tblassets" on tblassetgrouplink("assetid")
;
-- 
-- index: "fk_tblassetmacaddress_tblassets" 
--

create index "fk_tblassetmacaddress_tblassets" on tblassetmacaddress("assetid")
;
-- 
-- index: "fk_tblassetrelations_tblassets" 
--

create index "fk_tblassetrelations_tblassets" on tblassetrelations("parentassetid")
;
-- 
-- index: "fk_tblassets_tsysiplocations" 
--

create index "fk_tblassets_tsysiplocations" on tblassets("locationid")
;
-- 
-- index: "fk_tblassets_tsysassettypes" 
--

create index "fk_tblassets_tsysassettypes" on tblassets("assettype")
;
-- 
-- index: "fk_tblassetuserrelations_tblassets" 
--

create index "fk_tblassetuserrelations_tblassets" on tblassetuserrelations("assetid")
;
-- 
-- index: "fk_tblassetuserrelations_tbladusers" 
--

create index "fk_tblassetuserrelations_tbladusers" on tblassetuserrelations("userdomain", "username")
;
-- 
-- index: "fk_tblautorun_tblassets" 
--

create index "fk_tblautorun_tblassets" on tblautorun("assetid")
;
-- 
-- index: "fk_tblautorun_tblautorunloc" 
--

create index "fk_tblautorun_tblautorunloc" on tblautorun("locationid")
;
-- 
-- index: "fk_tblautorun_tblautorununi" 
--

create index "fk_tblautorun_tblautorununi" on tblautorun("autorununi")
;
-- 
-- index: "fk_tblautorunhist_tblassets" 
--

create index "fk_tblautorunhist_tblassets" on tblautorunhist("assetid")
;
-- 
-- index: "fk_tblbaseboard_assets" 
--

create index "fk_tblbaseboard_assets" on tblbaseboard("assetid")
;
-- 
-- index: "fk_tblbaseboardhist_tblassets" 
--

create index "fk_tblbaseboardhist_tblassets" on tblbaseboardhist("assetid")
;
-- 
-- index: "fk_tblbattery_tblassets" 
--

create index "fk_tblbattery_tblassets" on tblbattery("assetid")
;
-- 
-- index: "fk_tblbatteryhist_tblassets" 
--

create index "fk_tblbatteryhist_tblassets" on tblbatteryhist("assetid")
;
-- 
-- index: "fk_tblbios_tblassets" 
--

create index "fk_tblbios_tblassets" on tblbios("assetid")
;
-- 
-- index: "fk_tblbioshist_tblassets" 
--

create index "fk_tblbioshist_tblassets" on tblbioshist("assetid")
;
-- 
-- index: "fk_tblbootconfiguration_tblassets" 
--

create index "fk_tblbootconfiguration_tblassets" on tblbootconfiguration("assetid")
;
-- 
-- index: "fk_tblbootconfiguration_tblbootconfigurationuni" 
--

create index "fk_tblbootconfiguration_tblbootconfigurationuni" on tblbootconfiguration("bootconfigurationuniid")
;
-- 
-- index: "fk_tblbootconfigurationhist_tblassets" 
--

create index "fk_tblbootconfigurationhist_tblassets" on tblbootconfigurationhist("assetid")
;
-- 
-- index: "fk_tblbus_tblassets" 
--

create index "fk_tblbus_tblassets" on tblbus("assetid")
;
-- 
-- index: "fk_tblbushist_tblassets" 
--

create index "fk_tblbushist_tblassets" on tblbushist("assetid")
;
-- 
-- index: "fk_tblcdromdrive_tblassets" 
--

create index "fk_tblcdromdrive_tblassets" on tblcdromdrive("assetid")
;
-- 
-- index: "fk_tblcdromdrivehist_tblassets" 
--

create index "fk_tblcdromdrivehist_tblassets" on tblcdromdrivehist("assetid")
;
-- 
-- index: "fk_tblcodecfile_tblassets" 
--

create index "fk_tblcodecfile_tblassets" on tblcodecfile("assetid")
;
-- 
-- index: "fk_tblcodecfilehist_tblassets" 
--

create index "fk_tblcodecfilehist_tblassets" on tblcodecfilehist("assetid")
;
-- 
-- index: "fk_tblcomapplication_tblassets" 
--

create index "fk_tblcomapplication_tblassets" on tblcomapplication("assetid")
;
-- 
-- index: "fk_tblcomapplicationhist_tblassets" 
--

create index "fk_tblcomapplicationhist_tblassets" on tblcomapplicationhist("assetid")
;
-- 
-- index: "fk_tblcomponentcategory_tblassets" 
--

create index "fk_tblcomponentcategory_tblassets" on tblcomponentcategory("assetid")
;
-- 
-- index: "fk_tblcomponentcategoryhist_tblassets" 
--

create index "fk_tblcomponentcategoryhist_tblassets" on tblcomponentcategoryhist("assetid")
;
-- 
-- index: "fk_tblcomputersystem_tblassets" 
--

create index "fk_tblcomputersystem_tblassets" on tblcomputersystem("assetid")
;
-- 
-- index: "fk_tblcomputersystem_tbldomainroles" 
--

create index "fk_tblcomputersystem_tbldomainroles" on tblcomputersystem("domainrole")
;
-- 
-- index: "fk_tblcomputersystemhist_tblassets" 
--

create index "fk_tblcomputersystemhist_tblassets" on tblcomputersystemhist("assetid")
;
-- 
-- index: "fk_tblcomputersystemproduct_tblassets" 
--

create index "fk_tblcomputersystemproduct_tblassets" on tblcomputersystemproduct("assetid")
;
-- 
-- index: "fk_tblcomputersystemproducthist_tblassets" 
--

create index "fk_tblcomputersystemproducthist_tblassets" on tblcomputersystemproducthist("assetid")
;
-- 
-- index: "fk_tblcplogoninfo_tblassets" 
--

create index "fk_tblcplogoninfo_tblassets" on tblcplogoninfo("assetid")
;
-- 
-- index: "fk_tblcustdevprinter_tblassets" 
--

create index "fk_tblcustdevprinter_tblassets" on tblcustdevprinter("assetid")
;
-- 
-- index: "fk_tbldcomapplication_tblassets" 
--

create index "fk_tbldcomapplication_tblassets" on tbldcomapplication("assetid")
;
-- 
-- index: "fk_tbldcomapplicationhist_tblassets" 
--

create index "fk_tbldcomapplicationhist_tblassets" on tbldcomapplicationhist("assetid")
;
-- 
-- index: "fk_tbldesktop_tblassets" 
--

create index "fk_tbldesktop_tblassets" on tbldesktop("assetid")
;
-- 
-- index: "fk_tbldesktopmonitor_tblassets" 
--

create index "fk_tbldesktopmonitor_tblassets" on tbldesktopmonitor("assetid")
;
-- 
-- index: "fk_tbldesktopmonitorhist_tblassets" 
--

create index "fk_tbldesktopmonitorhist_tblassets" on tbldesktopmonitorhist("assetid")
;
-- 
-- index: "fk_tbldiskdrives_tblassets" 
--

create index "fk_tbldiskdrives_tblassets" on tbldiskdrives("assetid")
;
-- 
-- index: "fk_tbldiskpartition_tblassets" 
--

create index "fk_tbldiskpartition_tblassets" on tbldiskpartition("assetid")
;
-- 
-- index: "fk_tbldiskpartitionhist_tblassets" 
--

create index "fk_tbldiskpartitionhist_tblassets" on tbldiskpartitionhist("assetid")
;
-- 
-- index: "fk_tbldisplayconfiguration_tblassets" 
--

create index "fk_tbldisplayconfiguration_tblassets" on tbldisplayconfiguration("assetid")
;
-- 
-- index: "fk_tbldisplayconfigurationhist_tblassets" 
--

create index "fk_tbldisplayconfigurationhist_tblassets" on tbldisplayconfigurationhist("assetid")
;
-- 
-- index: "fk_tbldisplaycontrollerconfiguration_tblassets" 
--

create index "fk_tbldisplaycontrollerconfiguration_tblassets" on tbldisplaycontrollerconfiguration("assetid")
;
-- 
-- index: "fk_tbldisplaycontrollerconfigurationhist_tblassets" 
--

create index "fk_tbldisplaycontrollerconfigurationhist_tblassets" on tbldisplaycontrollerconfigurationhist("assetid")
;
-- 
-- index: "fk_tblencryptablevolume_tblassets" 
--

create index "fk_tblencryptablevolume_tblassets" on tblencryptablevolume("assetid")
;
-- 
-- index: "fk_tblenvironment_tblassets" 
--

create index "fk_tblenvironment_tblassets" on tblenvironment("assetid")
;
-- 
-- index: "fk_tblerrors_tblassets" 
--

create index "fk_tblerrors_tblassets" on tblerrors("assetid")
;
-- 
-- index: "fk_tblerrors_tsysasseterrortypes" 
--

create index "fk_tblerrors_tsysasseterrortypes" on tblerrors("errortype")
;
-- 
-- index: "fk_tblfeature_tblassets" 
--

create index "fk_tblfeature_tblassets" on tblfeature("assetid")
;
-- 
-- index: "fk_tblfeature_tbluniquefeature" 
--

create index "fk_tblfeature_tbluniquefeature" on tblfeature("featuniid")
;
-- 
-- index: "fk_tblfileversions_tblassets" 
--

create index "fk_tblfileversions_tblassets" on tblfileversions("assetid")
;
-- 
-- index: "fk_tblfloppy_tblassets" 
--

create index "fk_tblfloppy_tblassets" on tblfloppy("assetid")
;
-- 
-- index: "fk_tblfloppyhist_tblassets" 
--

create index "fk_tblfloppyhist_tblassets" on tblfloppyhist("assetid")
;
-- 
-- index: "fk_tblgroups_tblassets" 
--

create index "fk_tblgroups_tblassets" on tblgroups("assetid")
;
-- 
-- index: "fk_tblgroups_tblgroupuni" 
--

create index "fk_tblgroups_tblgroupuni" on tblgroups("groupid")
;
-- 
-- index: "fk_tblgroupshist_tblassets" 
--

create index "fk_tblgroupshist_tblassets" on tblgroupshist("assetid")
;
-- 
-- index: "fk_tblhypervguest_tblassets" 
--

create index "fk_tblhypervguest_tblassets" on tblhypervguest("assetid")
;
-- 
-- index: "fk_tblhypervguestnetwork_tblhypervguest" 
--

create index "fk_tblhypervguestnetwork_tblhypervguest" on tblhypervguestnetwork("hypervguestid")
;
-- 
-- index: "fk_tblidecontroller_tblassets" 
--

create index "fk_tblidecontroller_tblassets" on tblidecontroller("assetid")
;
-- 
-- index: "fk_tblidecontrollerhist_tblassets" 
--

create index "fk_tblidecontrollerhist_tblassets" on tblidecontrollerhist("assetid")
;
-- 
-- index: "fk_tblieactivex_tblassets" 
--

create index "fk_tblieactivex_tblassets" on tblieactivex("assetid")
;
-- 
-- index: "fk_tblieactivexhist_tblassets" 
--

create index "fk_tblieactivexhist_tblassets" on tblieactivexhist("assetid")
;
-- 
-- index: "fk_tbliebars_tblassets" 
--

create index "fk_tbliebars_tblassets" on tbliebars("assetid")
;
-- 
-- index: "fk_tbliebarshist_tblassets" 
--

create index "fk_tbliebarshist_tblassets" on tbliebarshist("assetid")
;
-- 
-- index: "fk_tbliebho_tblassets" 
--

create index "fk_tbliebho_tblassets" on tbliebho("assetid")
;
-- 
-- index: "fk_tbliebhohist_tblassets" 
--

create index "fk_tbliebhohist_tblassets" on tbliebhohist("assetid")
;
-- 
-- index: "fk_tblieextensions_tblassets" 
--

create index "fk_tblieextensions_tblassets" on tblieextensions("assetid")
;
-- 
-- index: "fk_tblieextensionshist_tblassets" 
--

create index "fk_tblieextensionshist_tblassets" on tblieextensionshist("assetid")
;
-- 
-- index: "fk_tblinfrareddevice_tblassets" 
--

create index "fk_tblinfrareddevice_tblassets" on tblinfrareddevice("assetid")
;
-- 
-- index: "fk_tblinfrareddevicehist_tblassets" 
--

create index "fk_tblinfrareddevicehist_tblassets" on tblinfrareddevicehist("assetid")
;
-- 
-- index: "fk_tblkeyboard_tblassets" 
--

create index "fk_tblkeyboard_tblassets" on tblkeyboard("assetid")
;
-- 
-- index: "fk_tblkeyboardhist_tblassets" 
--

create index "fk_tblkeyboardhist_tblassets" on tblkeyboardhist("assetid")
;
-- 
-- index: "fk_tbllicenses_tsyslicensetype" 
--

create index "fk_tbllicenses_tsyslicensetype" on tbllicenses("licensetype")
;
-- 
-- index: "fk_tbllinuxbaseboard_tblassets" 
--

create index "fk_tbllinuxbaseboard_tblassets" on tbllinuxbaseboard("assetid")
;
-- 
-- index: "fk_tbllinuxbios_tblassets" 
--

create index "fk_tbllinuxbios_tblassets" on tbllinuxbios("assetid")
;
-- 
-- index: "fk_tbllinuxenclosure_tblassets" 
--

create index "fk_tbllinuxenclosure_tblassets" on tbllinuxenclosure("assetid")
;
-- 
-- index: "fk_tbllinuxgraphicscards_tblassets" 
--

create index "fk_tbllinuxgraphicscards_tblassets" on tbllinuxgraphicscards("assetid")
;
-- 
-- index: "fk_tbllinuxharddisks_tblassets" 
--

create index "fk_tbllinuxharddisks_tblassets" on tbllinuxharddisks("assetid")
;
-- 
-- index: "fk_tbllinuxmemorycontroller_tblassets" 
--

create index "fk_tbllinuxmemorycontroller_tblassets" on tbllinuxmemorycontroller("assetid")
;
-- 
-- index: "fk_tbllinuxmemorydevices_tblassets" 
--

create index "fk_tbllinuxmemorydevices_tblassets" on tbllinuxmemorydevices("assetid")
;
-- 
-- index: "fk_tbllinuxmemorymodules_tblassets" 
--

create index "fk_tbllinuxmemorymodules_tblassets" on tbllinuxmemorymodules("assetid")
;
-- 
-- index: "fk_tbllinuxnetworkdetection_tblassets" 
--

create index "fk_tbllinuxnetworkdetection_tblassets" on tbllinuxnetworkdetection("assetid")
;
-- 
-- index: "fk_tbllinuxopticaldrives_tblassets" 
--

create index "fk_tbllinuxopticaldrives_tblassets" on tbllinuxopticaldrives("assetid")
;
-- 
-- index: "fk_tbllinuxpcicards_tblassets" 
--

create index "fk_tbllinuxpcicards_tblassets" on tbllinuxpcicards("assetid")
;
-- 
-- index: "fk_tbllinuxprocessors_tblassets" 
--

create index "fk_tbllinuxprocessors_tblassets" on tbllinuxprocessors("assetid")
;
-- 
-- index: "fk_tbllinuxsoftware_tblassets" 
--

create index "fk_tbllinuxsoftware_tblassets" on tbllinuxsoftware("assetid")
;
-- 
-- index: "fk_tbllinuxsoftware_tblsoftwareuni" 
--

create index "fk_tbllinuxsoftware_tblsoftwareuni" on tbllinuxsoftware("softwareuniid")
;
-- 
-- index: "fk_tbllinuxsoundcards_tblassets" 
--

create index "fk_tbllinuxsoundcards_tblassets" on tbllinuxsoundcards("assetid")
;
-- 
-- index: "fk_tbllinuxsystem_tblassets" 
--

create index "fk_tbllinuxsystem_tblassets" on tbllinuxsystem("assetid")
;
-- 
-- index: "fk_tbllinuxvolumes_tblassets" 
--

create index "fk_tbllinuxvolumes_tblassets" on tbllinuxvolumes("assetid")
;
-- 
-- index: "fk_tblmacapplications_tblassets" 
--

create index "fk_tblmacapplications_tblassets" on tblmacapplications("assetid")
;
-- 
-- index: "fk_tblmacdiscburning_tblassets" 
--

create index "fk_tblmacdiscburning_tblassets" on tblmacdiscburning("assetid")
;
-- 
-- index: "fk_tblmacdisplays_tblassets" 
--

create index "fk_tblmacdisplays_tblassets" on tblmacdisplays("assetid")
;
-- 
-- index: "fk_tblmacfirewires_tblassets" 
--

create index "fk_tblmacfirewires_tblassets" on tblmacfirewires("assetid")
;
-- 
-- index: "fk_tblmachwoverview_tblassets" 
--

create index "fk_tblmachwoverview_tblassets" on tblmachwoverview("assetid")
;
-- 
-- index: "fk_tblmacmemory_tblassets" 
--

create index "fk_tblmacmemory_tblassets" on tblmacmemory("assetid")
;
-- 
-- index: "fk_tblmacmodems_tblassets" 
--

create index "fk_tblmacmodems_tblassets" on tblmacmodems("assetid")
;
-- 
-- index: "fk_tblmacnetwork_tblassets" 
--

create index "fk_tblmacnetwork_tblassets" on tblmacnetwork("assetid")
;
-- 
-- index: "fk_tblmacnetworkvolumes_tblassets" 
--

create index "fk_tblmacnetworkvolumes_tblassets" on tblmacnetworkvolumes("assetid")
;
-- 
-- index: "fk_tblmacosinfo_tblassets" 
--

create index "fk_tblmacosinfo_tblassets" on tblmacosinfo("assetid")
;
-- 
-- index: "fk_tblmacpartitions_tblassets" 
--

create index "fk_tblmacpartitions_tblassets" on tblmacpartitions("assetid")
;
-- 
-- index: "fk_tblmappeddrives_tblassets" 
--

create index "fk_tblmappeddrives_tblassets" on tblmappeddrives("assetid")
;
-- 
-- index: "fk_tblmonitor_tblassets" 
--

create index "fk_tblmonitor_tblassets" on tblmonitor("assetid")
;
-- 
-- index: "fk_tblmonitorhist_tblassets" 
--

create index "fk_tblmonitorhist_tblassets" on tblmonitorhist("assetid")
;
-- 
-- index: "fk_tblnetwork_tblassets" 
--

create index "fk_tblnetwork_tblassets" on tblnetwork("assetid")
;
-- 
-- index: "fk_tblnetworkadapter_tblassets" 
--

create index "fk_tblnetworkadapter_tblassets" on tblnetworkadapter("assetid")
;
-- 
-- index: "fk_tblnetworkclient_tblassets" 
--

create index "fk_tblnetworkclient_tblassets" on tblnetworkclient("assetid")
;
-- 
-- index: "fk_tblnetworkclienthist_tblassets" 
--

create index "fk_tblnetworkclienthist_tblassets" on tblnetworkclienthist("assetid")
;
-- 
-- index: "fk_tblnetworkhist_tblassets" 
--

create index "fk_tblnetworkhist_tblassets" on tblnetworkhist("assetid")
;
-- 
-- index: "fk_tblntlog_tblassets" 
--

create index "fk_tblntlog_tblassets" on tblntlog("assetid")
;
-- 
-- index: "fk_tblntlog_tblntlogfile" 
--

create index "fk_tblntlog_tblntlogfile" on tblntlog("logfileid")
;
-- 
-- index: "fk_tblntlog_tblntlogmessage" 
--

create index "fk_tblntlog_tblntlogmessage" on tblntlog("messageid")
;
-- 
-- index: "fk_tblntlog_tblntlogsource" 
--

create index "fk_tblntlog_tblntlogsource" on tblntlog("sourcenameid")
;
-- 
-- index: "fk_tblntlog_tblntloguser" 
--

create index "fk_tblntlog_tblntloguser" on tblntlog("loguserid")
;
-- 
-- index: "fk_tblonboarddevice_tblassets" 
--

create index "fk_tblonboarddevice_tblassets" on tblonboarddevice("assetid")
;
-- 
-- index: "fk_tblonboarddevicehist_tblassets" 
--

create index "fk_tblonboarddevicehist_tblassets" on tblonboarddevicehist("assetid")
;
-- 
-- index: "fk_tbloperatingsystem_tblassets" 
--

create index "fk_tbloperatingsystem_tblassets" on tbloperatingsystem("assetid")
;
-- 
-- index: "fk_tbloperatingsystemhist_tblassets" 
--

create index "fk_tbloperatingsystemhist_tblassets" on tbloperatingsystemhist("assetid")
;
-- 
-- index: "fk_tblosrecoveryconfiguration_tblassets" 
--

create index "fk_tblosrecoveryconfiguration_tblassets" on tblosrecoveryconfiguration("assetid")
;
-- 
-- index: "fk_tblosrecoveryconfigurationhist_tblcomputers" 
--

create index "fk_tblosrecoveryconfigurationhist_tblcomputers" on tblosrecoveryconfigurationhist("assetid")
;
-- 
-- index: "fk_tblossublicensedocs_tbloslicenses" 
--

create index "fk_tblossublicensedocs_tbloslicenses" on tblossublicensedocs("oslicenseidid")
;
-- 
-- index: "fk_tblossublicenses_tbloslicenses" 
--

create index "fk_tblossublicenses_tbloslicenses" on tblossublicenses("oslicenseidid")
;
-- 
-- index: "fk_tblossublicensesorders_tbloslicenses" 
--

create index "fk_tblossublicensesorders_tbloslicenses" on tblossublicensesorders("oslicenseidid")
;
-- 
-- index: "fk_tblpagefile_tblassets" 
--

create index "fk_tblpagefile_tblassets" on tblpagefile("assetid")
;
-- 
-- index: "fk_tblpagefilehist_tblassets" 
--

create index "fk_tblpagefilehist_tblassets" on tblpagefilehist("assetid")
;
-- 
-- index: "fk_tblparallelport_tblassets" 
--

create index "fk_tblparallelport_tblassets" on tblparallelport("assetid")
;
-- 
-- index: "fk_tblparallelporthist_tblassets" 
--

create index "fk_tblparallelporthist_tblassets" on tblparallelporthist("assetid")
;
-- 
-- index: "fk_tblpcmciacontroller_tblassets" 
--

create index "fk_tblpcmciacontroller_tblassets" on tblpcmciacontroller("assetid")
;
-- 
-- index: "fk_tblpcmciacontrollerhist_tblassets" 
--

create index "fk_tblpcmciacontrollerhist_tblassets" on tblpcmciacontrollerhist("assetid")
;
-- 
-- index: "fk_tblphysicalmemory_tblassets" 
--

create index "fk_tblphysicalmemory_tblassets" on tblphysicalmemory("assetid")
;
-- 
-- index: "fk_tblphysicalmemoryarray_tblassets" 
--

create index "fk_tblphysicalmemoryarray_tblassets" on tblphysicalmemoryarray("assetid")
;
-- 
-- index: "fk_tblphysicalmemoryarrayhist_tblassets" 
--

create index "fk_tblphysicalmemoryarrayhist_tblassets" on tblphysicalmemoryarrayhist("assetid")
;
-- 
-- index: "fk_tblphysicalmemoryhist_tblassets" 
--

create index "fk_tblphysicalmemoryhist_tblassets" on tblphysicalmemoryhist("assetid")
;
-- 
-- index: "fk_tblpointingdevice_tblassets" 
--

create index "fk_tblpointingdevice_tblassets" on tblpointingdevice("assetid")
;
-- 
-- index: "fk_tblpointingdevicehist_tblassets" 
--

create index "fk_tblpointingdevicehist_tblassets" on tblpointingdevicehist("assetid")
;
-- 
-- index: "fk_tblportablebattery_tblassets" 
--

create index "fk_tblportablebattery_tblassets" on tblportablebattery("assetid")
;
-- 
-- index: "fk_tblportablebatteryhist_tblassets" 
--

create index "fk_tblportablebatteryhist_tblassets" on tblportablebatteryhist("assetid")
;
-- 
-- index: "fk_tblportconnector_tblassets" 
--

create index "fk_tblportconnector_tblassets" on tblportconnector("assetid")
;
-- 
-- index: "fk_tblportconnectorhist_tblassets" 
--

create index "fk_tblportconnectorhist_tblassets" on tblportconnectorhist("assetid")
;
-- 
-- index: "fk_tblpotsmodem_tblassets" 
--

create index "fk_tblpotsmodem_tblassets" on tblpotsmodem("assetid")
;
-- 
-- index: "fk_tblpotsmodemhist_tblassets" 
--

create index "fk_tblpotsmodemhist_tblassets" on tblpotsmodemhist("assetid")
;
-- 
-- index: "fk_tblprinters_tblassets" 
--

create index "fk_tblprinters_tblassets" on tblprinters("assetid")
;
-- 
-- index: "fk_tblprintershist_tblassets" 
--

create index "fk_tblprintershist_tblassets" on tblprintershist("assetid")
;
-- 
-- index: "fk_tblprocesses_tblassets" 
--

create index "fk_tblprocesses_tblassets" on tblprocesses("assetid")
;
-- 
-- index: "fk_tblprocessor_tblassets" 
--

create index "fk_tblprocessor_tblassets" on tblprocessor("assetid")
;
-- 
-- index: "fk_tblprocessorhist_tblassets" 
--

create index "fk_tblprocessorhist_tblassets" on tblprocessorhist("assetid")
;
-- 
-- index: "fk_tblproxy_tblassets" 
--

create index "fk_tblproxy_tblassets" on tblproxy("assetid")
;
-- 
-- index: "fk_tblquickfixengineering_tblassets" 
--

create index "fk_tblquickfixengineering_tblassets" on tblquickfixengineering("assetid")
;
-- 
-- index: "fk_tblquickfixengineering_tblqfeinstalledby" 
--

create index "fk_tblquickfixengineering_tblqfeinstalledby" on tblquickfixengineering("installedbyid")
;
-- 
-- index: "fk_tblquickfixengineering_tblqfeunique" 
--

create index "fk_tblquickfixengineering_tblqfeunique" on tblquickfixengineering("qfeid")
;
-- 
-- index: "fk_tblquickfixengineeringhist_tblassets" 
--

create index "fk_tblquickfixengineeringhist_tblassets" on tblquickfixengineeringhist("assetid")
;
-- 
-- index: "fk_tblregistry_tblassets" 
--

create index "fk_tblregistry_tblassets" on tblregistry("assetid")
;
-- 
-- index: "fk_tblscanhistory_tblassets" 
--

create index "fk_tblscanhistory_tblassets" on tblscanhistory("assetid")
;
-- 
-- index: "fk_tblscanhistory_tsysscanningmethods" 
--

create index "fk_tblscanhistory_tsysscanningmethods" on tblscanhistory("scanningmethodid")
;
-- 
-- index: "fk_tblscsicontroller_tblassets" 
--

create index "fk_tblscsicontroller_tblassets" on tblscsicontroller("assetid")
;
-- 
-- index: "fk_tblscsicontrollerhist_tblassets" 
--

create index "fk_tblscsicontrollerhist_tblassets" on tblscsicontrollerhist("assetid")
;
-- 
-- index: "fk_tblserialnumber_tblassets" 
--

create index "fk_tblserialnumber_tblassets" on tblserialnumber("assetid")
;
-- 
-- index: "fk_tblserialport_tblassets" 
--

create index "fk_tblserialport_tblassets" on tblserialport("assetid")
;
-- 
-- index: "fk_tblserialporthist_tblassets" 
--

create index "fk_tblserialporthist_tblassets" on tblserialporthist("assetid")
;
-- 
-- index: "fk_tblservices_tblassets" 
--

create index "fk_tblservices_tblassets" on tblservices("assetid")
;
-- 
-- index: "fk_tblservices_tblservicestartmode" 
--

create index "fk_tblservices_tblservicestartmode" on tblservices("startid")
;
-- 
-- index: "fk_tblservices_tblservicestate" 
--

create index "fk_tblservices_tblservicestate" on tblservices("stateid")
;
-- 
-- index: "fk_tblservices_tbluniqueservices" 
--

create index "fk_tblservices_tbluniqueservices" on tblservices("serviceuniqueid")
;
-- 
-- index: "fk_tblsharepermissions_tblshares" 
--

create index "fk_tblsharepermissions_tblshares" on tblsharepermissions("shareid")
;
-- 
-- index: "fk_tblshares_tblassets" 
--

create index "fk_tblshares_tblassets" on tblshares("assetid")
;
-- 
-- index: "fk_tblshares_tblsharesuni" 
--

create index "fk_tblshares_tblsharesuni" on tblshares("shareuniqueid")
;
-- 
-- index: "fk_tblshareshist_tblassets" 
--

create index "fk_tblshareshist_tblassets" on tblshareshist("assetid")
;
-- 
-- index: "fk_tblshareshist_tblsharesuni" 
--

create index "fk_tblshareshist_tblsharesuni" on tblshareshist("shareuniqueid")
;
-- 
-- index: "fk_tblsnmpassetmac_tblassets" 
--

create index "fk_tblsnmpassetmac_tblassets" on tblsnmpassetmac("assetid")
;
-- 
-- index: "fk_tblsnmpinfo_tblassets" 
--

create index "fk_tblsnmpinfo_tblassets" on tblsnmpinfo("assetid")
;
-- 
-- index: "fk_tblsoftware_tblassets" 
--

create index "fk_tblsoftware_tblassets" on tblsoftware("assetid")
;
-- 
-- index: "fk_tblsoftware_tbluniquesoftware" 
--

create index "fk_tblsoftware_tbluniquesoftware" on tblsoftware("softid")
;
-- 
-- index: "fk_tblsoftwarehist_tblassets" 
--

create index "fk_tblsoftwarehist_tblassets" on tblsoftwarehist("assetid")
;
-- 
-- index: "fk_tblsounddevice_tblassets" 
--

create index "fk_tblsounddevice_tblassets" on tblsounddevice("assetid")
;
-- 
-- index: "fk_tblsounddevicehist_tblassets" 
--

create index "fk_tblsounddevicehist_tblassets" on tblsounddevicehist("assetid")
;
-- 
-- index: "fk_tblsqldatabases_tblsqlservers" 
--

create index "fk_tblsqldatabases_tblsqlservers" on tblsqldatabases("sqlserverid")
;
-- 
-- index: "fk_tblsqllicensedocs_tblsqllicenses" 
--

create index "fk_tblsqllicensedocs_tblsqllicenses" on tblsqllicensedocs("licenseid")
;
-- 
-- index: "fk_tblsqllicenses_tsyssqllicensetypes" 
--

create index "fk_tblsqllicenses_tsyssqllicensetypes" on tblsqllicenses("licensetype")
;
-- 
-- index: "fk_tblsqllicensesorders_tblsqllicenses" 
--

create index "fk_tblsqllicensesorders_tblsqllicenses" on tblsqllicensesorders("licenseid")
;
-- 
-- index: "fk_tblsqllicensesserverorders_tblsqllicenses" 
--

create index "fk_tblsqllicensesserverorders_tblsqllicenses" on tblsqllicensesserverorders("licenseid")
;
-- 
-- index: "fk_tblsqlservers_tblassets" 
--

create index "fk_tblsqlservers_tblassets" on tblsqlservers("assetid")
;
-- 
-- index: "fk_tblsqlsubservers_tblsqllicenses" 
--

create index "fk_tblsqlsubservers_tblsqllicenses" on tblsqlsubservers("licenseid")
;
-- 
-- index: "fk_tblsublicensedocs_tbllicenses" 
--

create index "fk_tblsublicensedocs_tbllicenses" on tblsublicensedocs("licenseidid")
;
-- 
-- index: "fk_tblsublicenses_tbllicenses" 
--

create index "fk_tblsublicenses_tbllicenses" on tblsublicenses("licenseidid")
;
-- 
-- index: "fk_tblsublicensesorders_tbllicenses" 
--

create index "fk_tblsublicensesorders_tbllicenses" on tblsublicensesorders("licenseidid")
;
-- 
-- index: "fk_tblsystemenclosure_tblassets" 
--

create index "fk_tblsystemenclosure_tblassets" on tblsystemenclosure("assetid")
;
-- 
-- index: "fk_tblsystemenclosurehist_tblassets" 
--

create index "fk_tblsystemenclosurehist_tblassets" on tblsystemenclosurehist("assetid")
;
-- 
-- index: "fk_tbltapedrive_tblassets" 
--

create index "fk_tbltapedrive_tblassets" on tbltapedrive("assetid")
;
-- 
-- index: "fk_tbltapedrivehist_tblassets" 
--

create index "fk_tbltapedrivehist_tblassets" on tbltapedrivehist("assetid")
;
-- 
-- index: "fk_tbltpm_tblassets" 
--

create index "fk_tbltpm_tblassets" on tbltpm("assetid")
;
-- 
-- index: "fk_tblups_tblassets" 
--

create index "fk_tblups_tblassets" on tblups("assetid")
;
-- 
-- index: "fk_tbluptime_tblassets" 
--

create index "fk_tbluptime_tblassets" on tbluptime("assetid")
;
-- 
-- index: "fk_tblusbcontroller_tblassets" 
--

create index "fk_tblusbcontroller_tblassets" on tblusbcontroller("assetid")
;
-- 
-- index: "fk_tblusbcontrollerhist_tblassets" 
--

create index "fk_tblusbcontrollerhist_tblassets" on tblusbcontrollerhist("assetid")
;
-- 
-- index: "fk_tblusbdevices_tblassets" 
--

create index "fk_tblusbdevices_tblassets" on tblusbdevices("assetid")
;
-- 
-- index: "fk_tblusers_tblassets" 
--

create index "fk_tblusers_tblassets" on tblusers("assetid")
;
-- 
-- index: "fk_tblusershist_tblassets" 
--

create index "fk_tblusershist_tblassets" on tblusershist("assetid")
;
-- 
-- index: "fk_tblusersingroup_tblassets" 
--

create index "fk_tblusersingroup_tblassets" on tblusersingroup("assetid")
;
-- 
-- index: "fk_tblusersingrouphist_tblassets" 
--

create index "fk_tblusersingrouphist_tblassets" on tblusersingrouphist("assetid")
;
-- 
-- index: "fk_tblvideocontroller_tblassets" 
--

create index "fk_tblvideocontroller_tblassets" on tblvideocontroller("assetid")
;
-- 
-- index: "fk_tblvideocontrollerhist_tblassets" 
--

create index "fk_tblvideocontrollerhist_tblassets" on tblvideocontrollerhist("assetid")
;
-- 
-- index: "fk_tblvmwaredisk_tblassets" 
--

create index "fk_tblvmwaredisk_tblassets" on tblvmwaredisk("assetid")
;
-- 
-- index: "fk_tblvmwareguest_tblassets" 
--

create index "fk_tblvmwareguest_tblassets" on tblvmwareguest("assetid")
;
-- 
-- index: "fk_tblvmwareguestnetwork_tblvmwareguest" 
--

create index "fk_tblvmwareguestnetwork_tblvmwareguest" on tblvmwareguestnetwork("guestid")
;
-- 
-- index: "fk_tblvmwareinfo_tblassets" 
--

create index "fk_tblvmwareinfo_tblassets" on tblvmwareinfo("assetid")
;
-- 
-- index: "fk_tblvmwarenetwork_tblassets" 
--

create index "fk_tblvmwarenetwork_tblassets" on tblvmwarenetwork("assetid")
;
-- 
-- index: "fk_tblvolume_tblassets" 
--

create index "fk_tblvolume_tblassets" on tblvolume("assetid")
;
-- 
-- index: "fk_tblvproamt_tblassets" 
--

create index "fk_tblvproamt_tblassets" on tblvproamt("assetid")
;
-- 
-- index: "fk_tblwarranty_tblassets" 
--

create index "fk_tblwarranty_tblassets" on tblwarranty("assetid")
;
-- 
-- index: "fk_tblwarrantydetails_tblwarranty" 
--

create index "fk_tblwarrantydetails_tblwarranty" on tblwarrantydetails("warrantyid")
;
-- 
-- index: "fk_tblwinsat_tblassets" 
--

create index "fk_tblwinsat_tblassets" on tblwinsat("assetid")
;
-- 
-- index: "fk_tsysadsischedule_tsysasservers" 
--

create index "fk_tsysadsischedule_tsysasservers" on tsysadsischedule("servername")
;
-- 
-- index: "fk_tsysalertschedule_tsysschedule" 
--

create index "fk_tsysalertschedule_tsysschedule" on tsysalertschedule("scheduleid")
;
-- 
-- index: "fk_tsysasdomains_tsysasservers" 
--

create index "fk_tsysasdomains_tsysasservers" on tsysasdomains("servername")
;
-- 
-- index: "fk_tsysasou_tsysasservers" 
--

create index "fk_tsysasou_tsysasservers" on tsysasou("servername")
;
-- 
-- index: "fk_tsysassetgroupfilter_tblassetgroups" 
--

create index "fk_tsysassetgroupfilter_tblassetgroups" on tsysassetgroupfilter("assetgroupid")
;
-- 
-- index: "fk_tsysassetgroupscan_tblassetgroups" 
--

create index "fk_tsysassetgroupscan_tblassetgroups" on tsysassetgroupscan("assetgroupid")
;
-- 
-- index: "fk_tsysassetgroupscan_tsysreports" 
--

create index "fk_tsysassetgroupscan_tsysreports" on tsysassetgroupscan("report")
;
-- 
-- index: "fk_tsysassetgroupscan_tsysasservers" 
--

create index "fk_tsysassetgroupscan_tsysasservers" on tsysassetgroupscan("servername")
;
-- 
-- index: "fk_tsysassettypeexclude_tsysassettypes" 
--

create index "fk_tsysassettypeexclude_tsysassettypes" on tsysassettypeexclude("assettype")
;
-- 
-- index: "fk_tsysassettypeexclude_tsysasservers" 
--

create index "fk_tsysassettypeexclude_tsysasservers" on tsysassettypeexclude("servername")
;
-- 
-- index: "fk_tsysassites_tsysasservers" 
--

create index "fk_tsysassites_tsysasservers" on tsysassites("servername")
;
-- 
-- index: "fk_tsysasworkgroups_tsysasservers" 
--

create index "fk_tsysasworkgroups_tsysasservers" on tsysasworkgroups("servername")
;
-- 
-- index: "fk_tsyscurrentscans_tsysasservers" 
--

create index "fk_tsyscurrentscans_tsysasservers" on tsyscurrentscans("scanserver")
;
-- 
-- index: "fk_tsysdomaincontrollers_tsysasservers" 
--

create index "fk_tsysdomaincontrollers_tsysasservers" on tsysdomaincontrollers("servername")
;
-- 
-- index: "fk_tsysdomaincredentials_tsyscredentials" 
--

create index "fk_tsysdomaincredentials_tsyscredentials" on tsysdomaincredentials("credid")
;
-- 
-- index: "fk_tsysdomainexclude_tsysasservers" 
--

create index "fk_tsysdomainexclude_tsysasservers" on tsysdomainexclude("servername")
;
-- 
-- index: "fk_tsysdonotscan_tsysasservers" 
--

create index "fk_tsysdonotscan_tsysasservers" on tsysdonotscan("servername")
;
-- 
-- index: "fk_tsyserrors_tsyserrortype" 
--

create index "fk_tsyserrors_tsyserrortype" on tsyserrors("errortype")
;
-- 
-- index: "fk_tsyseventfilter_tsyseventalerts" 
--

create index "fk_tsyseventfilter_tsyseventalerts" on tsyseventfilter("alertid")
;
-- 
-- index: "fk_tsysipexclude_tsysasservers" 
--

create index "fk_tsysipexclude_tsysasservers" on tsysipexclude("servername")
;
-- 
-- index: "fk_tsysiprangecredentials_tsyscredentials" 
--

create index "fk_tsysiprangecredentials_tsyscredentials" on tsysiprangecredentials("credid")
;
-- 
-- index: "fk_tsysiprangecredentials_tsysipscanranges" 
--

create index "fk_tsysiprangecredentials_tsysipscanranges" on tsysiprangecredentials("iprangeid")
;
-- 
-- index: "fk_tsysipscanranges_tsysasservers" 
--

create index "fk_tsysipscanranges_tsysasservers" on tsysipscanranges("servername")
;
-- 
-- index: "fk_tsyslastscan_tblassets" 
--

create index "fk_tsyslastscan_tblassets" on tsyslastscan("assetid")
;
-- 
-- index: "fk_tsyslastscan_tsyswaittime" 
--

create index "fk_tsyslastscan_tsyswaittime" on tsyslastscan("cfgcode")
;
-- 
-- index: "fk_tsyslogschedule_tsysasservers" 
--

create index "fk_tsyslogschedule_tsysasservers" on tsyslogschedule("servername")
;
-- 
-- index: "fk_tsysmailconfig_tsysasservers" 
--

create index "fk_tsysmailconfig_tsysasservers" on tsysmailconfig("servername")
;
-- 
-- index: "fk_tsysoidlookup_tsysassettypes" 
--

create index "fk_tsysoidlookup_tsysassettypes" on tsysoidlookup("itemtype")
;
-- 
-- index: "fk_tsyspackageexecution_tsyspackageschedule" 
--

create index "fk_tsyspackageexecution_tsyspackageschedule" on tsyspackageexecution("packagescheduleid")
;
-- 
-- index: "fk_tsyspackageexecution_tsysasservers" 
--

create index "fk_tsyspackageexecution_tsysasservers" on tsyspackageexecution("scanserver")
;
-- 
-- index: "fk_tsyspackagelogs_tsysasservers" 
--

create index "fk_tsyspackagelogs_tsysasservers" on tsyspackagelogs("servername")
;
-- 
-- index: "fk_tsyspackagelogs_tsyspackages" 
--

create index "fk_tsyspackagelogs_tsyspackages" on tsyspackagelogs("typeid")
;
-- 
-- index: "fk_tsyspackageschedule_tblassetgroups" 
--

create index "fk_tsyspackageschedule_tblassetgroups" on tsyspackageschedule("assetgroupid")
;
-- 
-- index: "fk_tsyspackageschedule_tsyspackages" 
--

create index "fk_tsyspackageschedule_tsyspackages" on tsyspackageschedule("packageid")
;
-- 
-- index: "fk_tsyspackageschedule_tsysschedule" 
--

create index "fk_tsyspackageschedule_tsysschedule" on tsyspackageschedule("scheduleid")
;
-- 
-- index: "fk_tsyspackagescheduleasset_tblassets" 
--

create index "fk_tsyspackagescheduleasset_tblassets" on tsyspackagescheduleasset("assetid")
;
-- 
-- index: "fk_tsyspackagescheduleasset_tsyspackageschedule" 
--

create index "fk_tsyspackagescheduleasset_tsyspackageschedule" on tsyspackagescheduleasset("scheduleid")
;
-- 
-- index: "fk_tsyspackagestepconditionlink_tsyspackagestepconditionnames" 
--

create index "fk_tsyspackagestepconditionlink_tsyspackagestepconditionnames" on tsyspackagestepconditionlinks("conditionnameid")
;
-- 
-- index: "fk_tsyspackagestepconditionlink_tsyspackagestepconditiontypes" 
--

create index "fk_tsyspackagestepconditionlink_tsyspackagestepconditiontypes" on tsyspackagestepconditionlinks("conditiontypeid")
;
-- 
-- index: "fk_tsyspackagestepconditions_tsyspackagestepconditiontypes" 
--

create index "fk_tsyspackagestepconditions_tsyspackagestepconditiontypes" on tsyspackagestepconditions("conditiontypeid")
;
-- 
-- index: "fk_tsyspackagestepconditions_tsyspackagesteps" 
--

create index "fk_tsyspackagestepconditions_tsyspackagesteps" on tsyspackagestepconditions("packagestepid")
;
-- 
-- index: "fk_tsyspackagestepconditions_tsyspackagestepconditionnames" 
--

create index "fk_tsyspackagestepconditions_tsyspackagestepconditionnames" on tsyspackagestepconditions("conditionnameid")
;
-- 
-- index: "fk_tsyspackagesteps_tsyspackages" 
--

create index "fk_tsyspackagesteps_tsyspackages" on tsyspackagesteps("packageid")
;
-- 
-- index: "fk_tsyspackagesteps_tsyspackagesteptypes" 
--

create index "fk_tsyspackagesteps_tsyspackagesteptypes" on tsyspackagesteps("steptype")
;
-- 
-- index: "fk_tsysreportpages_tsyspages" 
--

create index "fk_tsysreportpages_tsyspages" on tsysreportpages("pageid")
;
-- 
-- index: "fk_tsysreportpages_tsysreports" 
--

create index "fk_tsysreportpages_tsysreports" on tsysreportpages("homepagequery")
;
-- 
-- index: "fk_tsysrolemembers_tsysroles" 
--

create index "fk_tsysrolemembers_tsysroles" on tsysrolemembers("roleid")
;
-- 
-- index: "fk_tsysrolepermissions_tsyspermissions" 
--

create index "fk_tsysrolepermissions_tsyspermissions" on tsysrolepermissions("permissionid")
;
-- 
-- index: "fk_tsysrolepermissions_tsysrolepermissions" 
--

create index "fk_tsysrolepermissions_tsysrolepermissions" on tsysrolepermissions("roleid")
;
-- 
-- index: "fk_tsysscanqueue_tsysasservers" 
--

create index "fk_tsysscanqueue_tsysasservers" on tsysscanqueue("servername")
;
-- 
-- index: "fk_tsysuniqueipcredentials_tsyscredentials" 
--

create index "fk_tsysuniqueipcredentials_tsyscredentials" on tsysuniqueipcredentials("credid")
;
-- 
-- index: "fk_tsysuniquewindowscredentials_tsyscredentials" 
--

create index "fk_tsysuniquewindowscredentials_tsyscredentials" on tsysuniquewindowscredentials("credid")
;
-- 
-- index: "fk_tsysuserschedule_tsysasservers" 
--

create index "fk_tsysuserschedule_tsysasservers" on tsysuserschedule("servername")
;
-- 
-- index: "fk_tsyswaitqueue_tsysasservers" 
--

create index "fk_tsyswaitqueue_tsysasservers" on tsyswaitqueue("servername")
;
-- 
-- index: "fk_tsyswarrantyqueue_tblassets" 
--

create index "fk_tsyswarrantyqueue_tblassets" on tsyswarrantyqueue("assetid")
;
-- 
-- index: "fk_tsyswebtabcontrols_tsyswebcontrols" 
--

create index "fk_tsyswebtabcontrols_tsyswebcontrols" on tsyswebtabcontrols("controlid")
;
-- 
-- index: "fk_tsyswebtabcontrols_tsyswebtabs" 
--

create index "fk_tsyswebtabcontrols_tsyswebtabs" on tsyswebtabcontrols("tabid")
;
-- 
-- index: "fk_tsyswebtabs_tsyswebusers" 
--

create index "fk_tsyswebtabs_tsyswebusers" on tsyswebtabs("pageid")
;
-- 
-- index: "fk_tsyswebusersglobaltabs_tsyswebtabs" 
--

create index "fk_tsyswebusersglobaltabs_tsyswebtabs" on tsyswebusersglobaltabs("tabid")
;
-- 
-- table: htblagentconfig 
--

alter table htblagentconfig add 
    foreign key (agentid)
    references htblagents(agentid) on delete cascade
;


-- 
-- table: htblagents 
--

alter table htblagents add 
    foreign key (userid)
    references htblusers(userid) on delete cascade
;


-- 
-- table: htblagentteam 
--

alter table htblagentteam add 
    foreign key (agentid)
    references htblagents(agentid) on delete cascade
;

alter table htblagentteam add 
    foreign key (teamid)
    references htblteams(teamid) on delete cascade
;

alter table htblagentteam add 
    foreign key (webroleid)
    references htblwebroles(webroleid) on delete cascade
;


-- 
-- table: htblattachements 
--

alter table htblattachements add 
    foreign key (fileid)
    references htblfiles(fileid) on delete cascade
;

alter table htblattachements add 
    foreign key (noteid)
    references htblnotes(noteid) on delete cascade
;


-- 
-- table: htblautomaticcloselang 
--

alter table htblautomaticcloselang add 
    foreign key (autocloseid)
    references htblautomaticclose(autocloseid) on delete cascade
;


-- 
-- table: htblautomaticcloseticketstates 
--

alter table htblautomaticcloseticketstates add 
    foreign key (autocloseid)
    references htblautomaticclose(autocloseid) on delete cascade
;

alter table htblautomaticcloseticketstates add 
    foreign key (ticketstateid)
    references htblticketstates(ticketstateid) on delete cascade
;


-- 
-- table: htblautomaticclosetickettypes 
--

alter table htblautomaticclosetickettypes add 
    foreign key (autocloseid)
    references htblautomaticclose(autocloseid) on delete cascade
;

alter table htblautomaticclosetickettypes add 
    foreign key (tickettypeid)
    references htbltickettypes(tickettypeid) on delete cascade
;


-- 
-- table: htblcustomfieldslang 
--

alter table htblcustomfieldslang add 
    foreign key (fieldid)
    references htblcustomfields(fieldid) on delete cascade
;


-- 
-- table: htblcustomfieldvaluelinks 
--

alter table htblcustomfieldvaluelinks add 
    foreign key (fieldvalueid)
    references htblcustomfieldvalues(fieldvalueid)
;

alter table htblcustomfieldvaluelinks add 
    foreign key (fieldid)
    references htbltickettypecustomfield(tickettypecustomfieldid) on delete cascade on update cascade
;


-- 
-- table: htblcustomfieldvalues 
--

alter table htblcustomfieldvalues add 
    foreign key (fieldid)
    references htblcustomfields(fieldid) on delete cascade
;


-- 
-- table: htblcustomticketfilteritems 
--

alter table htblcustomticketfilteritems add 
    foreign key (filterid)
    references htblcustomticketfilters(filterid) on delete cascade
;


-- 
-- table: htblcustomticketfilters 
--

alter table htblcustomticketfilters add 
    foreign key (userid)
    references htblusers(userid) on delete cascade
;


-- 
-- table: htblemailaccountslang 
--

alter table htblemailaccountslang add 
    foreign key (accountid)
    references htblemailaccounts(accountid) on delete cascade
;


-- 
-- table: htblemailaccountsteams 
--

alter table htblemailaccountsteams add 
    foreign key (accountid)
    references htblemailaccounts(accountid) on delete cascade
;

alter table htblemailaccountsteams add 
    foreign key (teamid)
    references htblteams(teamid) on delete cascade
;


-- 
-- table: htblemailtemplatesattachements 
--

alter table htblemailtemplatesattachements add 
    foreign key (fileid)
    references htblfiles(fileid) on delete cascade
;

alter table htblemailtemplatesattachements add 
    foreign key (templateid)
    references htblemailtemplates(templateid) on delete cascade
;


-- 
-- table: htblemailtemplateslang 
--

alter table htblemailtemplateslang add 
    foreign key (templateid)
    references htblemailtemplates(templateid) on delete cascade
;


-- 
-- table: htblemailtemplatespriorities 
--

alter table htblemailtemplatespriorities add 
    foreign key (templateid)
    references htblemailtemplates(templateid) on delete cascade
;

alter table htblemailtemplatespriorities add 
    foreign key (priority)
    references htblpriorities(priority) on delete cascade
;


-- 
-- table: htblemailtemplatesticketstates 
--

alter table htblemailtemplatesticketstates add 
    foreign key (templateid)
    references htblemailtemplates(templateid) on delete cascade
;

alter table htblemailtemplatesticketstates add 
    foreign key (ticketstateid)
    references htblticketstates(ticketstateid) on delete cascade
;


-- 
-- table: htblemailtemplatestickettypes 
--

alter table htblemailtemplatestickettypes add 
    foreign key (templateid)
    references htblemailtemplates(templateid) on delete cascade
;

alter table htblemailtemplatestickettypes add 
    foreign key (tickettypeid)
    references htbltickettypes(tickettypeid) on delete cascade
;


-- 
-- table: htblemailverification 
--

alter table htblemailverification add 
    foreign key (userid)
    references htblusers(userid) on delete cascade
;


-- 
-- table: htbleventinfochecks 
--

alter table htbleventinfochecks add 
    foreign key ("infoid")
    references htblscheduleinfo(infoid) on delete cascade on update cascade
;


-- 
-- table: htbleventreminders 
--

alter table htbleventreminders add 
    foreign key ("eventid")
    references htblschedule(scheduleid) on delete cascade
;


-- 
-- table: htblfooterattachements 
--

alter table htblfooterattachements add 
    foreign key (fileid)
    references htblfiles(fileid) on delete cascade
;

alter table htblfooterattachements add 
    foreign key (userid)
    references htblusers(userid) on delete cascade
;


-- 
-- table: htblhistory 
--

alter table htblhistory add 
    foreign key (agentid2)
    references htblagents(agentid)
;

alter table htblhistory add 
    foreign key (typeid)
    references htblhistorytypes(typeid) on delete cascade
;

alter table htblhistory add 
    foreign key (ticketid)
    references htblticket(ticketid) on delete cascade
;

alter table htblhistory add 
    foreign key (userid)
    references htblusers(userid)
;

alter table htblhistory add 
    foreign key (userid2)
    references htblusers(userid)
;

alter table htblhistory add 
    foreign key (userid3)
    references htblusers(userid)
;


-- 
-- table: htblknowledgebase 
--

alter table htblknowledgebase add 
    foreign key (categoryid)
    references htblknowledgebasecategories(categoryid)
;


-- 
-- table: htblknowledgebaseattachments 
--

alter table htblknowledgebaseattachments add 
    foreign key (fileid)
    references htblfiles(fileid) on delete cascade
;

alter table htblknowledgebaseattachments add 
    foreign key (kbid)
    references htblknowledgebase(kbid) on delete cascade
;


-- 
-- table: htblknowledgebasecategorieslang 
--

alter table htblknowledgebasecategorieslang add 
    foreign key (categoryid)
    references htblknowledgebasecategories(categoryid) on delete cascade
;


-- 
-- table: htblknowledgebasecategoriesteams 
--

alter table htblknowledgebasecategoriesteams add 
    foreign key (categoryid)
    references htblknowledgebasecategories(categoryid) on delete cascade
;

alter table htblknowledgebasecategoriesteams add 
    foreign key (teamid)
    references htblteams(teamid) on delete cascade
;


-- 
-- table: htblknowledgebaselang 
--

alter table htblknowledgebaselang add 
    foreign key (kbid)
    references htblknowledgebase(kbid) on delete cascade
;


-- 
-- table: htblnewslang 
--

alter table htblnewslang add 
    foreign key (newsid)
    references htblnews(newsid) on delete cascade
;


-- 
-- table: htblnotehistory 
--

alter table htblnotehistory add 
    foreign key (noteid)
    references htblnotes(noteid) on delete cascade
;

alter table htblnotehistory add 
    foreign key (userid)
    references htblusers(userid) on delete cascade
;


-- 
-- table: htblnotes 
--

alter table htblnotes add 
    foreign key (ticketid)
    references htblticket(ticketid) on delete cascade
;

alter table htblnotes add 
    foreign key (userid)
    references htblusers(userid)
;


-- 
-- table: htblnotificationschecked 
--

alter table htblnotificationschecked add 
    foreign key (histid)
    references htblhistory(histid) on delete cascade
;

alter table htblnotificationschecked add 
    foreign key (userid)
    references htblusers(userid) on delete cascade
;


-- 
-- table: htbloldticketdata 
--

alter table htbloldticketdata add 
    foreign key (ticketid)
    references htblticket(ticketid) on delete cascade
;

alter table htbloldticketdata add 
    foreign key (userid)
    references htblusers(userid)
;


-- 
-- table: htblprioritieslang 
--

alter table htblprioritieslang add 
    foreign key (priority)
    references htblpriorities(priority) on delete cascade
;


-- 
-- table: htblreportslang 
--

alter table htblreportslang add 
    foreign key (reportid)
    references htblreports(reportid) on delete cascade
;


-- 
-- table: htblsavedcustomfilters 
--

alter table htblsavedcustomfilters add 
    foreign key (userid)
    references htblusers(userid) on delete cascade
;


-- 
-- table: htblschedule 
--

alter table htblschedule add 
    foreign key (createdby)
    references htblagents(agentid) on delete cascade
;

alter table htblschedule add 
    foreign key (typeid)
    references htblscheduletypes(typeid) on delete cascade
;


-- 
-- table: htblscheduleagents 
--

alter table htblscheduleagents add 
    foreign key (scheduleid)
    references htblschedule(scheduleid) on delete cascade on update cascade
;


-- 
-- table: htblscheduleinfo 
--

alter table htblscheduleinfo add 
    foreign key (agentid)
    references htblagents(agentid) on delete cascade
;


-- 
-- table: htblschedulerepeat 
--

alter table htblschedulerepeat add 
    foreign key (scheduleid)
    references htblschedule(scheduleid) on delete cascade
;


-- 
-- table: htblscheduleteams 
--

alter table htblscheduleteams add 
    foreign key ("scheduleid")
    references htblschedule(scheduleid) on delete cascade on update cascade
;

alter table htblscheduleteams add 
    foreign key ("teamid")
    references htblteams(teamid) on delete cascade on update cascade
;


-- 
-- table: htblscheduletypeslang 
--

alter table htblscheduletypeslang add 
    foreign key (typeid)
    references htblscheduletypes(typeid) on delete cascade
;


-- 
-- table: htblshortcutslang 
--

alter table htblshortcutslang add 
    foreign key (keyid)
    references htblshortcuts(keyid) on delete cascade
;


-- 
-- table: htblshownclientrelations 
--

alter table htblshownclientrelations add 
    foreign key ("relationtypeid")
    references tsysassetrelationtypes("relationtypeid") on delete cascade
;


-- 
-- table: htblslacompanies 
--

alter table htblslacompanies add 
    foreign key (slaid)
    references htblsla(slaid) on delete cascade
;


-- 
-- table: htblsladepartments 
--

alter table htblsladepartments add 
    foreign key (slaid)
    references htblsla(slaid) on delete cascade
;


-- 
-- table: htblslapriorities 
--

alter table htblslapriorities add 
    foreign key (priority)
    references htblpriorities(priority) on delete cascade
;

alter table htblslapriorities add 
    foreign key (slaid)
    references htblsla(slaid) on delete cascade
;


-- 
-- table: htblslasource 
--

alter table htblslasource add 
    foreign key (slaid)
    references htblsla(slaid) on delete cascade
;

alter table htblslasource add 
    foreign key (sourceid)
    references htblsource(sourceid) on delete cascade
;


-- 
-- table: htblslatickettypes 
--

alter table htblslatickettypes add 
    foreign key (slaid)
    references htblsla(slaid) on delete cascade
;

alter table htblslatickettypes add 
    foreign key (tickettypeid)
    references htbltickettypes(tickettypeid) on delete cascade
;


-- 
-- table: htblslausers 
--

alter table htblslausers add 
    foreign key (slaid)
    references htblsla(slaid) on delete cascade
;

alter table htblslausers add 
    foreign key (userid)
    references htblusers(userid) on delete cascade
;


-- 
-- table: htblspecialrulesactions 
--

alter table htblspecialrulesactions add 
    foreign key (ruleid)
    references htblspecialrules(ruleid) on delete cascade
;


-- 
-- table: htblspecialrulesconditions 
--

alter table htblspecialrulesconditions add 
    foreign key (ruleid)
    references htblspecialrules(ruleid) on delete cascade
;


-- 
-- table: htblspecialrulestaskagents 
--

alter table htblspecialrulestaskagents add 
    foreign key (agentid)
    references htblagents(agentid) on delete cascade on update cascade
;

alter table htblspecialrulestaskagents add 
    foreign key (ruletaskid)
    references htblspecialrulestasks(taskid) on delete cascade on update cascade
;


-- 
-- table: htblspecialrulestaskteams 
--

alter table htblspecialrulestaskteams add 
    foreign key (ruletaskid)
    references htblspecialrulestasks(taskid) on delete cascade on update cascade
;

alter table htblspecialrulestaskteams add 
    foreign key (teamid)
    references htblteams(teamid) on delete cascade on update cascade
;


-- 
-- table: htblteamslang 
--

alter table htblteamslang add 
    foreign key (teamid)
    references htblteams(teamid) on delete cascade
;


-- 
-- table: htbltemplates 
--

alter table htbltemplates add 
    foreign key (categoryid)
    references htbltemplatecategories(categoryid) on delete cascade
;


-- 
-- table: htbltemplateslang 
--

alter table htbltemplateslang add 
    foreign key (templateid)
    references htbltemplates(templateid) on delete cascade
;


-- 
-- table: htblticket 
--

alter table htblticket add 
    foreign key (agentid)
    references htblagents(agentid)
;

alter table htblticket add 
    foreign key (priority)
    references htblpriorities(priority) on delete cascade
;

alter table htblticket add 
    foreign key (ticketstateid)
    references htblticketstates(ticketstateid) on delete cascade
;

alter table htblticket add 
    foreign key (fromuserid)
    references htblusers(userid)
;


-- 
-- table: htblticketasset 
--

alter table htblticketasset add 
    foreign key (ticketid)
    references htblticket(ticketid) on delete cascade
;

alter table htblticketasset add 
    foreign key (assetid)
    references tblassets("assetid") on delete cascade
;


-- 
-- table: htblticketcustomfield 
--

alter table htblticketcustomfield add 
    foreign key (fieldid)
    references htblcustomfields(fieldid) on delete cascade
;

alter table htblticketcustomfield add 
    foreign key (ticketid)
    references htblticket(ticketid) on delete cascade
;


-- 
-- table: htblticketmerges 
--

alter table htblticketmerges add 
    foreign key (newtid)
    references htblticket(ticketid) on delete cascade on update cascade
;


-- 
-- table: htblticketssummary 
--

alter table htblticketssummary add 
    foreign key (userid)
    references htblusers(userid) on delete cascade
;


-- 
-- table: htblticketstates 
--

/*alter table htblticketstates add 
    foreign key (replacementid)
    references htblticketstates(ticketstateid)
;
*/

-- 
-- table: htblticketstateslang 
--

alter table htblticketstateslang add 
    foreign key (ticketstateid)
    references htblticketstates(ticketstateid) on delete cascade
;


-- 
-- table: htblticketsubscribers 
--

alter table htblticketsubscribers add 
    foreign key (agentid)
    references htblagents(agentid) on delete cascade
;

alter table htblticketsubscribers add 
    foreign key (ticketid)
    references htblticket(ticketid) on delete cascade
;


-- 
-- table: htblticketteam 
--

alter table htblticketteam add 
    foreign key (teamid)
    references htblteams(teamid) on delete cascade
;

alter table htblticketteam add 
    foreign key (ticketid)
    references htblticket(ticketid) on delete cascade
;


-- 
-- table: htbltickettypecustomfield 
--

alter table htbltickettypecustomfield add 
    foreign key (fieldid)
    references htblcustomfields(fieldid) on delete cascade
;

alter table htbltickettypecustomfield add 
    foreign key (tickettypeid)
    references htbltickettypes(tickettypeid) on delete cascade
;


-- 
-- table: htbltickettypes 
--

/*alter table htbltickettypes add 
    foreign key (replacementid)
    references htbltickettypes(tickettypeid)
;
*/
alter table htbltickettypes add 
    foreign key (agentid)
    references htblagents(agentid)
;


-- 
-- table: htbltickettypeslang 
--

alter table htbltickettypeslang add 
    foreign key (tickettypeid)
    references htbltickettypes(tickettypeid) on delete cascade
;


-- 
-- table: htbltickettypeteams 
--

alter table htbltickettypeteams add 
    foreign key (teamid)
    references htblteams(teamid) on delete cascade
;

alter table htbltickettypeteams add 
    foreign key (tickettypeid)
    references htbltickettypes(tickettypeid) on delete cascade
;


-- 
-- table: htblticketuserrelation 
--

alter table htblticketuserrelation add 
    foreign key (ticketid)
    references htblticket(ticketid) on delete cascade
;

alter table htblticketuserrelation add 
    foreign key (userid)
    references htblusers(userid) on delete cascade
;


-- 
-- table: tbladcomputers 
--

alter table tbladcomputers add 
    foreign key ("adobjectid")
    references tbladobjects("adobjectid") on delete cascade
;

alter table tbladcomputers add 
    foreign key ("manageradobjectid")
    references tbladobjects("adobjectid")
;

alter table tbladcomputers add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbladgroups 
--

alter table tbladgroups add 
    foreign key ("manageradobjectid")
    references tbladobjects("adobjectid")
;

alter table tbladgroups add 
    foreign key ("adobjectid")
    references tbladobjects("adobjectid") on delete cascade
;


-- 
-- table: tbladmembership 
--

alter table tbladmembership add 
    foreign key ("parentadobjectid")
    references tbladobjects("adobjectid") on delete cascade
;

alter table tbladmembership add 
    foreign key ("childadobjectid")
    references tbladobjects("adobjectid")
;


-- 
-- table: tbladusers 
--

alter table tbladusers add 
    foreign key ("adobjectid")
    references tbladobjects("adobjectid") on delete cascade
;

alter table tbladusers add 
    foreign key ("manageradobjectid")
    references tbladobjects("adobjectid")
;


-- 
-- table: tblantivirus 
--

alter table tblantivirus add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblassetcomments 
--

alter table tblassetcomments add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblassetcustom 
--

alter table tblassetcustom add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade on update cascade
;

alter table tblassetcustom add 
    foreign key ("state")
    references tblstate("state")
;


-- 
-- table: tblassetdocs 
--

alter table tblassetdocs add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblassetgrouplink 
--

alter table tblassetgrouplink add 
    foreign key ("assetgroupid")
    references tblassetgroups("assetgroupid") on delete cascade on update cascade
;

alter table tblassetgrouplink add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblassetmacaddress 
--

alter table tblassetmacaddress add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblassetrelations 
--

alter table tblassetrelations add 
    foreign key ("parentassetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblassets 
--

alter table tblassets add 
    foreign key ("assettype")
    references tsysassettypes("assettype")
;

alter table tblassets add 
    foreign key ("locationid")
    references tsysiplocations("locationid")
;


-- 
-- table: tblassetuserrelations 
--

alter table tblassetuserrelations add 
    foreign key ("username", "userdomain")
    references tbladusers("username", "userdomain") on delete cascade
;

alter table tblassetuserrelations add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblautorun 
--

alter table tblautorun add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;

alter table tblautorun add 
    foreign key ("locationid")
    references tblautorunloc("locationid")
;

alter table tblautorun add 
    foreign key ("autorununi")
    references tblautorununi("autorununi")
;


-- 
-- table: tblautorunhist 
--

alter table tblautorunhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblbaseboard 
--

alter table tblbaseboard add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblbaseboardhist 
--

alter table tblbaseboardhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblbattery 
--

alter table tblbattery add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblbatteryhist 
--

alter table tblbatteryhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblbios 
--

alter table tblbios add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblbioshist 
--

alter table tblbioshist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblbootconfiguration 
--

alter table tblbootconfiguration add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;

alter table tblbootconfiguration add 
    foreign key ("bootconfigurationuniid")
    references tblbootconfigurationuni("bootconfigurationuniid") on delete cascade on update cascade
;


-- 
-- table: tblbootconfigurationhist 
--

alter table tblbootconfigurationhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblbus 
--

alter table tblbus add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblbushist 
--

alter table tblbushist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblcdromdrive 
--

alter table tblcdromdrive add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblcdromdrivehist 
--

alter table tblcdromdrivehist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblcodecfile 
--

alter table tblcodecfile add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblcodecfilehist 
--

alter table tblcodecfilehist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblcomapplication 
--

alter table tblcomapplication add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblcomapplicationhist 
--

alter table tblcomapplicationhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblcomponentcategory 
--

alter table tblcomponentcategory add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblcomponentcategoryhist 
--

alter table tblcomponentcategoryhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblcomputersystem 
--

alter table tblcomputersystem add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;

alter table tblcomputersystem add 
    foreign key ("domainrole")
    references tbldomainroles("domainrole")
;


-- 
-- table: tblcomputersystemhist 
--

alter table tblcomputersystemhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblcomputersystemproduct 
--

alter table tblcomputersystemproduct add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblcomputersystemproducthist 
--

alter table tblcomputersystemproducthist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblcplogoninfo 
--

alter table tblcplogoninfo add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblcustdevprinter 
--

alter table tblcustdevprinter add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbldcomapplication 
--

alter table tbldcomapplication add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbldcomapplicationhist 
--

alter table tbldcomapplicationhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbldesktop 
--

alter table tbldesktop add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbldesktopmonitor 
--

alter table tbldesktopmonitor add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbldesktopmonitorhist 
--

alter table tbldesktopmonitorhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbldiskdrives 
--

alter table tbldiskdrives add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbldiskpartition 
--

alter table tbldiskpartition add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbldiskpartitionhist 
--

alter table tbldiskpartitionhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbldisplayconfiguration 
--

alter table tbldisplayconfiguration add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbldisplayconfigurationhist 
--

alter table tbldisplayconfigurationhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbldisplaycontrollerconfiguration 
--

alter table tbldisplaycontrollerconfiguration add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbldisplaycontrollerconfigurationhist 
--

alter table tbldisplaycontrollerconfigurationhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblencryptablevolume 
--

alter table tblencryptablevolume add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblenvironment 
--

alter table tblenvironment add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblerrors 
--

alter table tblerrors add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;

alter table tblerrors add 
    foreign key ("errortype")
    references tsysasseterrortypes("errortype")
;


-- 
-- table: tblfeature 
--

alter table tblfeature add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;

alter table tblfeature add 
    foreign key ("featuniid")
    references tblfeatureuni("featuniid")
;


-- 
-- table: tblfileversions 
--

alter table tblfileversions add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblfloppy 
--

alter table tblfloppy add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblfloppyhist 
--

alter table tblfloppyhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblgroups 
--

alter table tblgroups add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;

alter table tblgroups add 
    foreign key ("groupid")
    references tblgroupuni("groupid") on delete cascade on update cascade
;


-- 
-- table: tblgroupshist 
--

alter table tblgroupshist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblhypervguest 
--

alter table tblhypervguest add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblhypervguestnetwork 
--

alter table tblhypervguestnetwork add 
    foreign key ("hypervguestid")
    references tblhypervguest("hypervguestid") on delete cascade
;


-- 
-- table: tblidecontroller 
--

alter table tblidecontroller add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblidecontrollerhist 
--

alter table tblidecontrollerhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblieactivex 
--

alter table tblieactivex add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblieactivexhist 
--

alter table tblieactivexhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbliebars 
--

alter table tbliebars add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbliebarshist 
--

alter table tbliebarshist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbliebho 
--

alter table tbliebho add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbliebhohist 
--

alter table tbliebhohist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblieextensions 
--

alter table tblieextensions add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblieextensionshist 
--

alter table tblieextensionshist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblinfrareddevice 
--

alter table tblinfrareddevice add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblinfrareddevicehist 
--

alter table tblinfrareddevicehist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblkeyboard 
--

alter table tblkeyboard add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblkeyboardhist 
--

alter table tblkeyboardhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbllicenses 
--

alter table tbllicenses add 
    foreign key ("licensetype")
    references tsyslicensetype("licensetype")
;


-- 
-- table: tbllinuxbaseboard 
--

alter table tbllinuxbaseboard add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbllinuxbios 
--

alter table tbllinuxbios add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbllinuxenclosure 
--

alter table tbllinuxenclosure add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbllinuxgraphicscards 
--

alter table tbllinuxgraphicscards add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbllinuxharddisks 
--

alter table tbllinuxharddisks add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbllinuxmemorycontroller 
--

alter table tbllinuxmemorycontroller add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbllinuxmemorydevices 
--

alter table tbllinuxmemorydevices add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbllinuxmemorymodules 
--

alter table tbllinuxmemorymodules add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbllinuxnetworkdetection 
--

alter table tbllinuxnetworkdetection add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbllinuxopticaldrives 
--

alter table tbllinuxopticaldrives add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbllinuxpcicards 
--

alter table tbllinuxpcicards add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbllinuxprocessors 
--

alter table tbllinuxprocessors add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbllinuxsoftware 
--

alter table tbllinuxsoftware add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;

alter table tbllinuxsoftware add 
    foreign key ("softwareuniid")
    references tblsoftwareuni("softid")
;


-- 
-- table: tbllinuxsoundcards 
--

alter table tbllinuxsoundcards add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbllinuxsystem 
--

alter table tbllinuxsystem add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbllinuxvolumes 
--

alter table tbllinuxvolumes add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblmacapplications 
--

alter table tblmacapplications add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblmacdiscburning 
--

alter table tblmacdiscburning add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblmacdisplays 
--

alter table tblmacdisplays add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblmacfirewires 
--

alter table tblmacfirewires add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblmachwoverview 
--

alter table tblmachwoverview add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblmacmemory 
--

alter table tblmacmemory add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblmacmodems 
--

alter table tblmacmodems add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblmacnetwork 
--

alter table tblmacnetwork add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblmacnetworkvolumes 
--

alter table tblmacnetworkvolumes add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblmacosinfo 
--

alter table tblmacosinfo add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblmacpartitions 
--

alter table tblmacpartitions add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblmappeddrives 
--

alter table tblmappeddrives add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblmonitor 
--

alter table tblmonitor add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblmonitorhist 
--

alter table tblmonitorhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblnetwork 
--

alter table tblnetwork add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblnetworkadapter 
--

alter table tblnetworkadapter add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblnetworkclient 
--

alter table tblnetworkclient add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblnetworkclienthist 
--

alter table tblnetworkclienthist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblnetworkhist 
--

alter table tblnetworkhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblntlog 
--

alter table tblntlog add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;

alter table tblntlog add 
    foreign key ("logfileid")
    references tblntlogfile("logfileid")
;

alter table tblntlog add 
    foreign key ("messageid")
    references tblntlogmessage("messageid")
;

alter table tblntlog add 
    foreign key ("sourcenameid")
    references tblntlogsource("sourcenameid")
;

alter table tblntlog add 
    foreign key ("loguserid")
    references tblntloguser("loguserid")
;


-- 
-- table: tblonboarddevice 
--

alter table tblonboarddevice add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblonboarddevicehist 
--

alter table tblonboarddevicehist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbloperatingsystem 
--

alter table tbloperatingsystem add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbloperatingsystemhist 
--

alter table tbloperatingsystemhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblosrecoveryconfiguration 
--

alter table tblosrecoveryconfiguration add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblosrecoveryconfigurationhist 
--

alter table tblosrecoveryconfigurationhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblossublicensedocs 
--

alter table tblossublicensedocs add 
    foreign key ("oslicenseidid")
    references tbloslicenses("oslicenseidid") on delete cascade on update cascade
;


-- 
-- table: tblossublicenses 
--

alter table tblossublicenses add 
    foreign key ("oslicenseidid")
    references tbloslicenses("oslicenseidid") on delete cascade on update cascade
;


-- 
-- table: tblossublicensesorders 
--

alter table tblossublicensesorders add 
    foreign key ("oslicenseidid")
    references tbloslicenses("oslicenseidid") on delete cascade on update cascade
;


-- 
-- table: tblpagefile 
--

alter table tblpagefile add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblpagefilehist 
--

alter table tblpagefilehist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblparallelport 
--

alter table tblparallelport add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblparallelporthist 
--

alter table tblparallelporthist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblpcmciacontroller 
--

alter table tblpcmciacontroller add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblpcmciacontrollerhist 
--

alter table tblpcmciacontrollerhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblphysicalmemory 
--

alter table tblphysicalmemory add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblphysicalmemoryarray 
--

alter table tblphysicalmemoryarray add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblphysicalmemoryarrayhist 
--

alter table tblphysicalmemoryarrayhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblphysicalmemoryhist 
--

alter table tblphysicalmemoryhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblpointingdevice 
--

alter table tblpointingdevice add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblpointingdevicehist 
--

alter table tblpointingdevicehist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblportablebattery 
--

alter table tblportablebattery add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblportablebatteryhist 
--

alter table tblportablebatteryhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblportconnector 
--

alter table tblportconnector add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblportconnectorhist 
--

alter table tblportconnectorhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblpotsmodem 
--

alter table tblpotsmodem add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblpotsmodemhist 
--

alter table tblpotsmodemhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblprinters 
--

alter table tblprinters add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblprintershist 
--

alter table tblprintershist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblprocesses 
--

alter table tblprocesses add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblprocessor 
--

alter table tblprocessor add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblprocessorhist 
--

alter table tblprocessorhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblproxy 
--

alter table tblproxy add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblquickfixengineering 
--

alter table tblquickfixengineering add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;

alter table tblquickfixengineering add 
    foreign key ("installedbyid")
    references tblquickfixengineeringinstalledby("installedbyid")
;

alter table tblquickfixengineering add 
    foreign key ("qfeid")
    references tblquickfixengineeringuni("qfeid")
;


-- 
-- table: tblquickfixengineeringhist 
--

alter table tblquickfixengineeringhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblregistry 
--

alter table tblregistry add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblscanhistory 
--

alter table tblscanhistory add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;

alter table tblscanhistory add 
    foreign key ("scanningmethodid")
    references tsysscanningmethods("scanningmethodid") on delete cascade
;


-- 
-- table: tblscsicontroller 
--

alter table tblscsicontroller add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblscsicontrollerhist 
--

alter table tblscsicontrollerhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblserialnumber 
--

alter table tblserialnumber add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblserialport 
--

alter table tblserialport add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblserialporthist 
--

alter table tblserialporthist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblservices 
--

alter table tblservices add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;

alter table tblservices add 
    foreign key ("startid")
    references tblservicestartmode("startid")
;

alter table tblservices add 
    foreign key ("stateid")
    references tblservicestate("stateid")
;

alter table tblservices add 
    foreign key ("serviceuniqueid")
    references tblservicesuni("serviceuniqueid")
;


-- 
-- table: tblsharepermissions 
--

alter table tblsharepermissions add 
    foreign key ("shareid")
    references tblshares("shareid") on delete cascade
;


-- 
-- table: tblshares 
--

alter table tblshares add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;

alter table tblshares add 
    foreign key ("shareuniqueid")
    references tblsharesuni("shareuniqueid") on delete cascade on update cascade
;


-- 
-- table: tblshareshist 
--

alter table tblshareshist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;

alter table tblshareshist add 
    foreign key ("shareuniqueid")
    references tblsharesuni("shareuniqueid") on delete cascade on update cascade
;


-- 
-- table: tblsnmpassetmac 
--

alter table tblsnmpassetmac add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade on update cascade
;


-- 
-- table: tblsnmpinfo 
--

alter table tblsnmpinfo add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade on update cascade
;


-- 
-- table: tblsoftware 
--

alter table tblsoftware add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;

alter table tblsoftware add 
    foreign key ("softid")
    references tblsoftwareuni("softid")
;


-- 
-- table: tblsoftwarehist 
--

alter table tblsoftwarehist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblsounddevice 
--

alter table tblsounddevice add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblsounddevicehist 
--

alter table tblsounddevicehist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblsqldatabases 
--

alter table tblsqldatabases add 
    foreign key ("sqlserverid")
    references tblsqlservers("sqlserverid") on delete cascade
;


-- 
-- table: tblsqllicensedocs 
--

alter table tblsqllicensedocs add 
    foreign key ("licenseid")
    references tblsqllicenses("licenseid") on delete cascade
;


-- 
-- table: tblsqllicenses 
--

alter table tblsqllicenses add 
    foreign key ("licensetype")
    references tsyssqllicensetypes("licensetype")
;


-- 
-- table: tblsqllicensesorders 
--

alter table tblsqllicensesorders add 
    foreign key ("licenseid")
    references tblsqllicenses("licenseid") on delete cascade
;


-- 
-- table: tblsqllicensesserverorders 
--

alter table tblsqllicensesserverorders add 
    foreign key ("licenseid")
    references tblsqllicenses("licenseid") on delete cascade
;


-- 
-- table: tblsqlservers 
--

alter table tblsqlservers add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblsqlsubservers 
--

alter table tblsqlsubservers add 
    foreign key ("licenseid")
    references tblsqllicenses("licenseid") on delete cascade
;


-- 
-- table: tblsublicensedocs 
--

alter table tblsublicensedocs add 
    foreign key ("licenseidid")
    references tbllicenses("licenseidid") on delete cascade on update cascade
;


-- 
-- table: tblsublicenses 
--

alter table tblsublicenses add 
    foreign key ("licenseidid")
    references tbllicenses("licenseidid") on delete cascade on update cascade
;


-- 
-- table: tblsublicensesorders 
--

alter table tblsublicensesorders add 
    foreign key ("licenseidid")
    references tbllicenses("licenseidid") on delete cascade on update cascade
;


-- 
-- table: tblsystemenclosure 
--

alter table tblsystemenclosure add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblsystemenclosurehist 
--

alter table tblsystemenclosurehist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbltapedrive 
--

alter table tbltapedrive add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbltapedrivehist 
--

alter table tbltapedrivehist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbltpm 
--

alter table tbltpm add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblups 
--

alter table tblups add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tbluptime 
--

alter table tbluptime add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblusbcontroller 
--

alter table tblusbcontroller add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblusbcontrollerhist 
--

alter table tblusbcontrollerhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblusbdevices 
--

alter table tblusbdevices add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblusers 
--

alter table tblusers add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblusershist 
--

alter table tblusershist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblusersingroup 
--

alter table tblusersingroup add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblusersingrouphist 
--

alter table tblusersingrouphist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblvideocontroller 
--

alter table tblvideocontroller add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblvideocontrollerhist 
--

alter table tblvideocontrollerhist add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblvmwaredisk 
--

alter table tblvmwaredisk add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade on update cascade
;


-- 
-- table: tblvmwareguest 
--

alter table tblvmwareguest add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade on update cascade
;


-- 
-- table: tblvmwareguestnetwork 
--

alter table tblvmwareguestnetwork add 
    foreign key ("guestid")
    references tblvmwareguest("guestid") on delete cascade on update cascade
;


-- 
-- table: tblvmwareinfo 
--

alter table tblvmwareinfo add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade on update cascade
;


-- 
-- table: tblvmwarenetwork 
--

alter table tblvmwarenetwork add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade on update cascade
;


-- 
-- table: tblvolume 
--

alter table tblvolume add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade on update cascade
;


-- 
-- table: tblvproamt 
--

alter table tblvproamt add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblwarranty 
--

alter table tblwarranty add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tblwarrantydetails 
--

alter table tblwarrantydetails add 
    foreign key ("warrantyid")
    references tblwarranty("warrantyid") on delete cascade
;


-- 
-- table: tblwinsat 
--

alter table tblwinsat add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tsysadsischedule 
--

alter table tsysadsischedule add 
    foreign key ("servername")
    references tsysasservers("servername") on delete cascade on update cascade
;


-- 
-- table: tsysalertschedule 
--

alter table tsysalertschedule add 
    foreign key ("scheduleid")
    references tsysschedule("scheduleid") on delete cascade
;


-- 
-- table: tsysasdomains 
--

alter table tsysasdomains add 
    foreign key ("servername")
    references tsysasservers("servername") on delete cascade on update cascade
;


-- 
-- table: tsysasou 
--

alter table tsysasou add 
    foreign key ("servername")
    references tsysasservers("servername") on delete cascade on update cascade
;


-- 
-- table: tsysassetgroupfilter 
--

alter table tsysassetgroupfilter add 
    foreign key ("assetgroupid")
    references tblassetgroups("assetgroupid") on delete cascade
;


-- 
-- table: tsysassetgroupscan 
--

alter table tsysassetgroupscan add 
    foreign key ("assetgroupid")
    references tblassetgroups("assetgroupid") on delete cascade
;

alter table tsysassetgroupscan add 
    foreign key ("servername")
    references tsysasservers("servername") on delete cascade on update cascade
;

alter table tsysassetgroupscan add 
    foreign key ("report")
    references tsysreports("reportquery") on delete cascade
;


-- 
-- table: tsysassettypeexclude 
--

alter table tsysassettypeexclude add 
    foreign key ("servername")
    references tsysasservers("servername") on delete cascade on update cascade
;

alter table tsysassettypeexclude add 
    foreign key ("assettype")
    references tsysassettypes("assettype")
;


-- 
-- table: tsysassites 
--

alter table tsysassites add 
    foreign key ("servername")
    references tsysasservers("servername") on delete cascade on update cascade
;


-- 
-- table: tsysasworkgroups 
--

alter table tsysasworkgroups add 
    foreign key ("servername")
    references tsysasservers("servername") on delete cascade on update cascade
;


-- 
-- table: tsyscurrentscans 
--

alter table tsyscurrentscans add 
    foreign key ("scanserver")
    references tsysasservers("servername") on delete cascade on update cascade
;


-- 
-- table: tsysdomaincontrollers 
--

alter table tsysdomaincontrollers add 
    foreign key ("servername")
    references tsysasservers("servername") on delete cascade on update cascade
;


-- 
-- table: tsysdomaincredentials 
--

alter table tsysdomaincredentials add 
    foreign key ("credid")
    references tsyscredentials("credid") on delete cascade on update cascade
;


-- 
-- table: tsysdomainexclude 
--

alter table tsysdomainexclude add 
    foreign key ("servername")
    references tsysasservers("servername") on delete cascade on update cascade
;


-- 
-- table: tsysdonotscan 
--

alter table tsysdonotscan add 
    foreign key ("servername")
    references tsysasservers("servername") on delete cascade on update cascade
;


-- 
-- table: tsyserrors 
--

alter table tsyserrors add 
    foreign key ("errortype")
    references tsyserrortype("errortype")
;


-- 
-- table: tsyseventfilter 
--

alter table tsyseventfilter add 
    foreign key ("alertid")
    references tsyseventalerts("alertid") on delete cascade
;


-- 
-- table: tsysipexclude 
--

alter table tsysipexclude add 
    foreign key ("servername")
    references tsysasservers("servername") on delete cascade on update cascade
;


-- 
-- table: tsysiprangecredentials 
--

alter table tsysiprangecredentials add 
    foreign key ("credid")
    references tsyscredentials("credid") on delete cascade on update cascade
;

alter table tsysiprangecredentials add 
    foreign key ("iprangeid")
    references tsysipscanranges("iprangeid") on delete cascade
;


-- 
-- table: tsysipscanranges 
--

alter table tsysipscanranges add 
    foreign key ("servername")
    references tsysasservers("servername") on delete cascade on update cascade
;


-- 
-- table: tsyslastscan 
--

alter table tsyslastscan add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;

alter table tsyslastscan add 
    foreign key ("cfgcode")
    references tsyswaittime("cfgcode")
;


-- 
-- table: tsyslogschedule 
--

alter table tsyslogschedule add 
    foreign key ("servername")
    references tsysasservers("servername") on delete cascade on update cascade
;


-- 
-- table: tsysmailconfig 
--

alter table tsysmailconfig add 
    foreign key ("servername")
    references tsysasservers("servername") on delete cascade on update cascade
;


-- 
-- table: tsysoidlookup 
--

alter table tsysoidlookup add 
    foreign key ("itemtype")
    references tsysassettypes("assettype") on delete cascade
;


-- 
-- table: tsyspackageexecution 
--

alter table tsyspackageexecution add 
    foreign key ("scanserver")
    references tsysasservers("servername") on delete cascade on update cascade
;

alter table tsyspackageexecution add 
    foreign key ("packagescheduleid")
    references tsyspackageschedule("packagescheduleid") on delete cascade on update cascade
;


-- 
-- table: tsyspackagelogs 
--

alter table tsyspackagelogs add 
    foreign key ("servername")
    references tsysasservers("servername") on delete cascade on update cascade
;

alter table tsyspackagelogs add 
    foreign key ("typeid")
    references tsyspackagelogtype("typeid") on delete cascade
;


-- 
-- table: tsyspackageschedule 
--

alter table tsyspackageschedule add 
    foreign key ("assetgroupid")
    references tblassetgroups("assetgroupid") on delete cascade
;

alter table tsyspackageschedule add 
    foreign key ("packageid")
    references tsyspackages("packageid")
;

alter table tsyspackageschedule add 
    foreign key ("scheduleid")
    references tsysschedule("scheduleid")
;


-- 
-- table: tsyspackagescheduleasset 
--

alter table tsyspackagescheduleasset add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;

alter table tsyspackagescheduleasset add 
    foreign key ("scheduleid")
    references tsyspackageschedule("packagescheduleid") on delete cascade
;


-- 
-- table: tsyspackagestepconditionlinks 
--

alter table tsyspackagestepconditionlinks add 
    foreign key ("conditionnameid")
    references tsyspackagestepconditionnames("conditionnameid")
;

alter table tsyspackagestepconditionlinks add 
    foreign key ("conditiontypeid")
    references tsyspackagestepconditiontypes("conditiontypeid")
;


-- 
-- table: tsyspackagestepconditions 
--

alter table tsyspackagestepconditions add 
    foreign key ("conditionnameid")
    references tsyspackagestepconditionnames("conditionnameid")
;

alter table tsyspackagestepconditions add 
    foreign key ("conditiontypeid")
    references tsyspackagestepconditiontypes("conditiontypeid")
;

alter table tsyspackagestepconditions add 
    foreign key ("packagestepid")
    references tsyspackagesteps("packagestepid") on delete cascade
;


-- 
-- table: tsyspackagesteps 
--

alter table tsyspackagesteps add 
    foreign key ("packageid")
    references tsyspackages("packageid") on delete cascade
;

alter table tsyspackagesteps add 
    foreign key ("steptype")
    references tsyspackagesteptypes("steptype")
;


-- 
-- table: tsysreportpages 
--

alter table tsysreportpages add 
    foreign key ("pageid")
    references tsyspages("pageid")
;

alter table tsysreportpages add 
    foreign key ("homepagequery")
    references tsysreports("reportquery") on delete cascade on update cascade
;


-- 
-- table: tsysrolemembers 
--

alter table tsysrolemembers add 
    foreign key ("roleid")
    references tsysroles("roleid") on delete cascade
;


-- 
-- table: tsysrolepermissions 
--

alter table tsysrolepermissions add 
    foreign key ("permissionid")
    references tsyspermissions("permissionid") on delete cascade on update cascade
;

alter table tsysrolepermissions add 
    foreign key ("roleid")
    references tsysroles("roleid") on delete cascade on update cascade
;


-- 
-- table: tsysscanqueue 
--

alter table tsysscanqueue add 
    foreign key ("servername")
    references tsysasservers("servername") on delete cascade on update cascade
;


-- 
-- table: tsysuniqueipcredentials 
--

alter table tsysuniqueipcredentials add 
    foreign key ("credid")
    references tsyscredentials("credid") on delete cascade on update cascade
;


-- 
-- table: tsysuniquewindowscredentials 
--

alter table tsysuniquewindowscredentials add 
    foreign key ("credid")
    references tsyscredentials("credid") on delete cascade on update cascade
;


-- 
-- table: tsysuserschedule 
--

alter table tsysuserschedule add 
    foreign key ("servername")
    references tsysasservers("servername") on delete cascade on update cascade
;


-- 
-- table: tsyswaitqueue 
--

alter table tsyswaitqueue add 
    foreign key ("servername")
    references tsysasservers("servername") on delete cascade on update cascade
;


-- 
-- table: tsyswarrantyqueue 
--

alter table tsyswarrantyqueue add 
    foreign key ("assetid")
    references tblassets("assetid") on delete cascade
;


-- 
-- table: tsyswebtabcontrols 
--

alter table tsyswebtabcontrols add 
    foreign key ("controlid")
    references tsyswebcontrols("controlid") on delete cascade on update cascade
;

alter table tsyswebtabcontrols add 
    foreign key ("tabid")
    references tsyswebtabs("tabid") on delete cascade on update cascade
;


-- 
-- table: tsyswebtabs 
--

alter table tsyswebtabs add 
    foreign key ("pageid")
    references tsyswebusers("pageid") on delete cascade on update cascade
;


-- 
-- table: tsyswebusersglobaltabs 
--

alter table tsyswebusersglobaltabs add 
    foreign key ("tabid")
    references tsyswebtabs("tabid") on delete cascade
;

-- step 2 - dropping all existing indexes

-- 
-- drop index: "fk_htblagentconfig_htblagents" 
--

drop index if exists public."fk_htblagentconfig_htblagents"
;
-- 
-- drop index: "fk_htblagents_htblusers" 
--

drop index if exists public."fk_htblagents_htblusers"
;
-- 
-- drop index: "fk_htblagentteam_htblagents" 
--

drop index if exists public."fk_htblagentteam_htblagents"
;
-- 
-- drop index: "fk_htblagentteam_htblteams" 
--

drop index if exists public."fk_htblagentteam_htblteams"
;
-- 
-- drop index: "fk_htblagentteam_htblwebroles" 
--

drop index if exists public."fk_htblagentteam_htblwebroles"
;
-- 
-- drop index: "fk_htblattachements_htblfiles" 
--

drop index if exists public."fk_htblattachements_htblfiles"
;
-- 
-- drop index: "fk_htblattachements_htblnotes" 
--

drop index if exists public."fk_htblattachements_htblnotes"
;
-- 
-- drop index: "fk_htblautomaticcloselang_htblautomaticclose" 
--

drop index if exists public."fk_htblautomaticcloselang_htblautomaticclose"
;
-- 
-- drop index: "fk_htblautomaticcloseticketstates_htblautomaticclose" 
--

drop index if exists public."fk_htblautomaticcloseticketstates_htblautomaticclose"
;
-- 
-- drop index: "fk_htblautomaticcloseticketstates_htblticketstates" 
--

drop index if exists public."fk_htblautomaticcloseticketstates_htblticketstates"
;
-- 
-- drop index: "fk_htblautomaticclosetickettypes_htblautomaticclose" 
--

drop index if exists public."fk_htblautomaticclosetickettypes_htblautomaticclose"
;
-- 
-- drop index: "fk_htblautomaticclosetickettypes_htbltickettypes" 
--

drop index if exists public."fk_htblautomaticclosetickettypes_htbltickettypes"
;
-- 
-- drop index: "fk_htblcustomfieldslang_htblcustomfields" 
--

drop index if exists public."fk_htblcustomfieldslang_htblcustomfields"
;
-- 
-- drop index: "fk_htblcustomfieldvaluelinks_htblcustomfieldvalues" 
--

drop index if exists public."fk_htblcustomfieldvaluelinks_htblcustomfieldvalues"
;
-- 
-- drop index: "fk_htblcustomfieldvaluelinks_htbltickettypecustomfield" 
--

drop index if exists public."fk_htblcustomfieldvaluelinks_htbltickettypecustomfield"
;
-- 
-- drop index: "fk_htblcustomfieldvalues_htblcustomfields" 
--

drop index if exists public."fk_htblcustomfieldvalues_htblcustomfields"
;
-- 
-- drop index: "fk_htblcustomticketfilteritems_htblcustomticketfilters" 
--

drop index if exists public."fk_htblcustomticketfilteritems_htblcustomticketfilters"
;
-- 
-- drop index: "fk__htblcusto__useri__628582e0" 
--

drop index if exists public."fk__htblcusto__useri__628582e0"
;
-- 
-- drop index: "fk_htblemailaccountslang_htblemailaccounts" 
--

drop index if exists public."fk_htblemailaccountslang_htblemailaccounts"
;
-- 
-- drop index: "fk_htblemailaccountsteams_htblteams" 
--

drop index if exists public."fk_htblemailaccountsteams_htblteams"
;
-- 
-- drop index: "fk_htblemailaccountsteams_htblemailaccounts" 
--

drop index if exists public."fk_htblemailaccountsteams_htblemailaccounts"
;
-- 
-- drop index: "fk__htblemail__templ__45151b8a" 
--

drop index if exists public."fk__htblemail__templ__45151b8a"
;
-- 
-- drop index: "fk__htblemail__filei__46093fc3" 
--

drop index if exists public."fk__htblemail__filei__46093fc3"
;
-- 
-- drop index: "fk_htblemailtemplateslang_htblemailtemplates" 
--

drop index if exists public."fk_htblemailtemplateslang_htblemailtemplates"
;
-- 
-- drop index: "fk_htblemailtemplatespriorities_htblemailtemplates" 
--

drop index if exists public."fk_htblemailtemplatespriorities_htblemailtemplates"
;
-- 
-- drop index: "fk_htblemailtemplatespriorities_htblpriorities" 
--

drop index if exists public."fk_htblemailtemplatespriorities_htblpriorities"
;
-- 
-- drop index: "fk__htblemail__templ__7286e07f" 
--

drop index if exists public."fk__htblemail__templ__7286e07f"
;
-- 
-- drop index: "fk__htblemail__ticke__737b04b8" 
--

drop index if exists public."fk__htblemail__ticke__737b04b8"
;
-- 
-- drop index: "fk_htblemailtemplatestickettypes_htblemailtemplates" 
--

drop index if exists public."fk_htblemailtemplatestickettypes_htblemailtemplates"
;
-- 
-- drop index: "fk_htblemailtemplatestickettypes_htbltickettypes" 
--

drop index if exists public."fk_htblemailtemplatestickettypes_htbltickettypes"
;
-- 
-- drop index: "fk_htblemailverification_htblusers" 
--

drop index if exists public."fk_htblemailverification_htblusers"
;
-- 
-- drop index: "fk_htbleventinfochecks_htblscheduleinfo" 
--

drop index if exists public."fk_htbleventinfochecks_htblscheduleinfo"
;
-- 
-- drop index: "fk_htbleventreminders_htblschedule" 
--

drop index if exists public."fk_htbleventreminders_htblschedule"
;
-- 
-- drop index: "fk__htblfoote__useri__76577163" 
--

drop index if exists public."fk__htblfoote__useri__76577163"
;
-- 
-- drop index: "fk__htblfoote__filei__774b959c" 
--

drop index if exists public."fk__htblfoote__filei__774b959c"
;
-- 
-- drop index: "fk_htblhistory_htblhistorytypes" 
--

drop index if exists public."fk_htblhistory_htblhistorytypes"
;
-- 
-- drop index: "fk_htblhistory_htblusers_2" 
--

drop index if exists public."fk_htblhistory_htblusers_2"
;
-- 
-- drop index: "fk_htblhistory_htblusers_3" 
--

drop index if exists public."fk_htblhistory_htblusers_3"
;
-- 
-- drop index: "fk_htblhistory_htblagents_2" 
--

drop index if exists public."fk_htblhistory_htblagents_2"
;
-- 
-- drop index: "fk_htblhistory_htblticket" 
--

drop index if exists public."fk_htblhistory_htblticket"
;
-- 
-- drop index: "fk_htblhistory_htblusers" 
--

drop index if exists public."fk_htblhistory_htblusers"
;
-- 
-- drop index: "fk_htblknowledgebase_htblknowledgebasecategories" 
--

drop index if exists public."fk_htblknowledgebase_htblknowledgebasecategories"
;
-- 
-- drop index: "fk_htblknowledgebaseattachments_htblfiles" 
--

drop index if exists public."fk_htblknowledgebaseattachments_htblfiles"
;
-- 
-- drop index: "fk_htblknowledgebaseattachments_htblknowledgebase" 
--

drop index if exists public."fk_htblknowledgebaseattachments_htblknowledgebase"
;
-- 
-- drop index: "fk_htblknowledgebasecategorieslang_htblknowledgebasecategories" 
--

drop index if exists public."fk_htblknowledgebasecategorieslang_htblknowledgebasecategories"
;
-- 
-- drop index: "fk_htblknowledgebasecategoriesteams_htblknowledgebasecategories" 
--

drop index if exists public."fk_htblknowledgebasecategoriesteams_htblknowledgebasecategories"
;
-- 
-- drop index: "fk_htblknowledgebasecategoriesteams_htblteams" 
--

drop index if exists public."fk_htblknowledgebasecategoriesteams_htblteams"
;
-- 
-- drop index: "fk_htblknowledgebaselang_htblknowledgebase" 
--

drop index if exists public."fk_htblknowledgebaselang_htblknowledgebase"
;
-- 
-- drop index: "fk_htblnewslang_htblnews" 
--

drop index if exists public."fk_htblnewslang_htblnews"
;
-- 
-- drop index: "fk__htblnoteh__notei__3c2acfce" 
--

drop index if exists public."fk__htblnoteh__notei__3c2acfce"
;
-- 
-- drop index: "fk__htblnoteh__useri__3d1ef407" 
--

drop index if exists public."fk__htblnoteh__useri__3d1ef407"
;
-- 
-- drop index: "fk_htblnotes_htblticket" 
--

drop index if exists public."fk_htblnotes_htblticket"
;
-- 
-- drop index: "fk_htblnotes_htblusers" 
--

drop index if exists public."fk_htblnotes_htblusers"
;
-- 
-- drop index: "fk__htblnotif__useri__382534c0" 
--

drop index if exists public."fk__htblnotif__useri__382534c0"
;
-- 
-- drop index: "fk__htblnotif__histi__391958f9" 
--

drop index if exists public."fk__htblnotif__histi__391958f9"
;
-- 
-- drop index: "fk_htbloldticketdata_htblticket" 
--

drop index if exists public."fk_htbloldticketdata_htblticket"
;
-- 
-- drop index: "fk_htbloldticketdata_htblusers" 
--

drop index if exists public."fk_htbloldticketdata_htblusers"
;
-- 
-- drop index: "fk_htblprioritieslang_htblpriorities" 
--

drop index if exists public."fk_htblprioritieslang_htblpriorities"
;
-- 
-- drop index: "fk__htblrepor__repor__12f3b011" 
--

drop index if exists public."fk__htblrepor__repor__12f3b011"
;
-- 
-- drop index: "fk__htblsaved__useri__326c5b6a" 
--

drop index if exists public."fk__htblsaved__useri__326c5b6a"
;
-- 
-- drop index: "fk_htblschedule_htblscheduletypes" 
--

drop index if exists public."fk_htblschedule_htblscheduletypes"
;
-- 
-- drop index: "fk_htblschedule_htblagents" 
--

drop index if exists public."fk_htblschedule_htblagents"
;
-- 
-- drop index: "fk_htblscheduleagents_htblschedule" 
--

drop index if exists public."fk_htblscheduleagents_htblschedule"
;
-- 
-- drop index: "fk_htblscheduleinfo_htblagents" 
--

drop index if exists public."fk_htblscheduleinfo_htblagents"
;
-- 
-- drop index: "fk_htblschedulerepeat_htblschedule" 
--

drop index if exists public."fk_htblschedulerepeat_htblschedule"
;
-- 
-- drop index: "fk_htblscheduleteams_htblschedule" 
--

drop index if exists public."fk_htblscheduleteams_htblschedule"
;
-- 
-- drop index: "fk_htblscheduleteams_htblteams" 
--

drop index if exists public."fk_htblscheduleteams_htblteams"
;
-- 
-- drop index: "fk_htblscheduletypeslang_htblscheduletypes" 
--

drop index if exists public."fk_htblscheduletypeslang_htblscheduletypes"
;
-- 
-- drop index: "fk__htblshort__keyid__19a0ada0" 
--

drop index if exists public."fk__htblshort__keyid__19a0ada0"
;
-- 
-- drop index: "fk_htblshownclientrelations_tsysassetrelationtypes" 
--

drop index if exists public."fk_htblshownclientrelations_tsysassetrelationtypes"
;
-- 
-- drop index: "fk__htblslaco__slaid__530e3526" 
--

drop index if exists public."fk__htblslaco__slaid__530e3526"
;
-- 
-- drop index: "fk__htblslade__slaid__54f67d98" 
--

drop index if exists public."fk__htblslade__slaid__54f67d98"
;
-- 
-- drop index: "fk__htblslapr__slaid__4d555bd0" 
--

drop index if exists public."fk__htblslapr__slaid__4d555bd0"
;
-- 
-- drop index: "fk__htblslapr__prior__4e498009" 
--

drop index if exists public."fk__htblslapr__prior__4e498009"
;
-- 
-- drop index: "fk__htblslaso__slaid__56dec60a" 
--

drop index if exists public."fk__htblslaso__slaid__56dec60a"
;
-- 
-- drop index: "fk__htblslaso__sourc__57d2ea43" 
--

drop index if exists public."fk__htblslaso__sourc__57d2ea43"
;
-- 
-- drop index: "fk__htblslati__slaid__4a78ef25" 
--

drop index if exists public."fk__htblslati__slaid__4a78ef25"
;
-- 
-- drop index: "fk__htblslati__ticke__4b6d135e" 
--

drop index if exists public."fk__htblslati__ticke__4b6d135e"
;
-- 
-- drop index: "fk__htblslaus__slaid__5031c87b" 
--

drop index if exists public."fk__htblslaus__slaid__5031c87b"
;
-- 
-- drop index: "fk__htblslaus__useri__5125ecb4" 
--

drop index if exists public."fk__htblslaus__useri__5125ecb4"
;
-- 
-- drop index: "fk_htblspecialrulesactions_htblspecialrules" 
--

drop index if exists public."fk_htblspecialrulesactions_htblspecialrules"
;
-- 
-- drop index: "fk_htblspecialrulesconditions_htblspecialrules" 
--

drop index if exists public."fk_htblspecialrulesconditions_htblspecialrules"
;
-- 
-- drop index: "fk_htblspecialrulestaskagents_htblagents" 
--

drop index if exists public."fk_htblspecialrulestaskagents_htblagents"
;
-- 
-- drop index: "fk_htblspecialrulestaskagents_htblspecialrulestasks" 
--

drop index if exists public."fk_htblspecialrulestaskagents_htblspecialrulestasks"
;
-- 
-- drop index: "fk_htblspecialrulestaskteams_htblteams" 
--

drop index if exists public."fk_htblspecialrulestaskteams_htblteams"
;
-- 
-- drop index: "fk_htblspecialrulestaskteams_htblspecialrulestasks" 
--

drop index if exists public."fk_htblspecialrulestaskteams_htblspecialrulestasks"
;
-- 
-- drop index: "fk_htblteamslang_htblteams" 
--

drop index if exists public."fk_htblteamslang_htblteams"
;
-- 
-- drop index: "fk_htbltemplates_htbltemplatecategories" 
--

drop index if exists public."fk_htbltemplates_htbltemplatecategories"
;
-- 
-- drop index: "fk_htbltemplateslang_htbltemplates" 
--

drop index if exists public."fk_htbltemplateslang_htbltemplates"
;
-- 
-- drop index: "fk_htblticket_htblagents" 
--

drop index if exists public."fk_htblticket_htblagents"
;
-- 
-- drop index: "fk_htblticket_htblpriorities" 
--

drop index if exists public."fk_htblticket_htblpriorities"
;
-- 
-- drop index: "fk_htblticket_htblticketstates" 
--

drop index if exists public."fk_htblticket_htblticketstates"
;
-- 
-- drop index: "fk_htblticket_htblusers" 
--

drop index if exists public."fk_htblticket_htblusers"
;
-- 
-- drop index: "fk_htblticketasset_tblassets" 
--

drop index if exists public."fk_htblticketasset_tblassets"
;
-- 
-- drop index: "fk_htblticketasset_htblticket" 
--

drop index if exists public."fk_htblticketasset_htblticket"
;
-- 
-- drop index: "fk_htblticketcustomfield_htblcustomfields" 
--

drop index if exists public."fk_htblticketcustomfield_htblcustomfields"
;
-- 
-- drop index: "fk_htblticketcustomfield_htblticket" 
--

drop index if exists public."fk_htblticketcustomfield_htblticket"
;
-- 
-- drop index: "fk_htblticketmerges_htblticket" 
--

drop index if exists public."fk_htblticketmerges_htblticket"
;
-- 
-- drop index: "fk_htblticketssummary_htblusers" 
--

drop index if exists public."fk_htblticketssummary_htblusers"
;
-- 
-- drop index: "fk__htblticke__repla__3ffb60b2" 
--

drop index if exists public."fk__htblticke__repla__3ffb60b2"
;
-- 
-- drop index: "fk_htblticketstateslang_htblticketstates" 
--

drop index if exists public."fk_htblticketstateslang_htblticketstates"
;
-- 
-- drop index: "fk__htblticke__agent__7df8932b" 
--

drop index if exists public."fk__htblticke__agent__7df8932b"
;
-- 
-- drop index: "fk__htblticke__ticke__7d046ef2" 
--

drop index if exists public."fk__htblticke__ticke__7d046ef2"
;
-- 
-- drop index: "fk_htblticketteam_htblteams" 
--

drop index if exists public."fk_htblticketteam_htblteams"
;
-- 
-- drop index: "fk_htblticketteam_htblticket" 
--

drop index if exists public."fk_htblticketteam_htblticket"
;
-- 
-- drop index: "fk_htbltickettypecustomfield_htblcustomfields" 
--

drop index if exists public."fk_htbltickettypecustomfield_htblcustomfields"
;
-- 
-- drop index: "fk_htbltickettypecustomfield_htbltickettypes" 
--

drop index if exists public."fk_htbltickettypecustomfield_htbltickettypes"
;
-- 
-- drop index: "fk_htbltickettypes_htblagents" 
--

drop index if exists public."fk_htbltickettypes_htblagents"
;
-- 
-- drop index: "fk__htblticke__repla__69bc9054" 
--

drop index if exists public."fk__htblticke__repla__69bc9054"
;
-- 
-- drop index: "fk_htbltickettypeslang_htbltickettypes" 
--

drop index if exists public."fk_htbltickettypeslang_htbltickettypes"
;
-- 
-- drop index: "fk_htbltickettypeteams_htblteams" 
--

drop index if exists public."fk_htbltickettypeteams_htblteams"
;
-- 
-- drop index: "fk_htbltickettypeteams_htbltickettypes" 
--

drop index if exists public."fk_htbltickettypeteams_htbltickettypes"
;
-- 
-- drop index: "fk__htblticke__ticke__32a16594" 
--

drop index if exists public."fk__htblticke__ticke__32a16594"
;
-- 
-- drop index: "fk__htblticke__useri__339589cd" 
--

drop index if exists public."fk__htblticke__useri__339589cd"
;
-- 
-- drop index: "fk_tbladcomputers_tbladobjects" 
--

drop index if exists public."fk_tbladcomputers_tbladobjects"
;
-- 
-- drop index: "fk_tbladcomputers_tbladobjects1" 
--

drop index if exists public."fk_tbladcomputers_tbladobjects1"
;
-- 
-- drop index: "fk_tbladcomputers_tblassets" 
--

drop index if exists public."fk_tbladcomputers_tblassets"
;
-- 
-- drop index: "fk_tbladgroups_tbladobjects" 
--

drop index if exists public."fk_tbladgroups_tbladobjects"
;
-- 
-- drop index: "fk_tbladgroups_tbladobjects1" 
--

drop index if exists public."fk_tbladgroups_tbladobjects1"
;
-- 
-- drop index: "fk_tbladmembership_tbladobject" 
--

drop index if exists public."fk_tbladmembership_tbladobject"
;
-- 
-- drop index: "fk_tbladmembership_tbladobject1" 
--

drop index if exists public."fk_tbladmembership_tbladobject1"
;
-- 
-- drop index: "fk_tbladusers_tbladobjects" 
--

drop index if exists public."fk_tbladusers_tbladobjects"
;
-- 
-- drop index: "fk_tbladusers_tbladobjects1" 
--

drop index if exists public."fk_tbladusers_tbladobjects1"
;
-- 
-- drop index: "fk_tblantivirus_tblassets" 
--

drop index if exists public."fk_tblantivirus_tblassets"
;
-- 
-- drop index: "fk_tblassetnotes_tblassets" 
--

drop index if exists public."fk_tblassetnotes_tblassets"
;
-- 
-- drop index: "fk_tblassetcustom_tblassets" 
--

drop index if exists public."fk_tblassetcustom_tblassets"
;
-- 
-- drop index: "fk_tblassetcustom_tblstate" 
--

drop index if exists public."fk_tblassetcustom_tblstate"
;
-- 
-- drop index: "fk_tblassetdocs_tblassets" 
--

drop index if exists public."fk_tblassetdocs_tblassets"
;
-- 
-- drop index: "fk_tblassetrolelink_tblassetroles" 
--

drop index if exists public."fk_tblassetrolelink_tblassetroles"
;
-- 
-- drop index: "fk_tblassetrolelink_tblassets" 
--

drop index if exists public."fk_tblassetrolelink_tblassets"
;
-- 
-- drop index: "fk_tblassetmacaddress_tblassets" 
--

drop index if exists public."fk_tblassetmacaddress_tblassets"
;
-- 
-- drop index: "fk_tblassetrelations_tblassets" 
--

drop index if exists public."fk_tblassetrelations_tblassets"
;
-- 
-- drop index: "fk_tblassets_tsysiplocations" 
--

drop index if exists public."fk_tblassets_tsysiplocations"
;
-- 
-- drop index: "fk_tblassets_tsysassettypes" 
--

drop index if exists public."fk_tblassets_tsysassettypes"
;
-- 
-- drop index: "fk_tblassetuserrelations_tblassets" 
--

drop index if exists public."fk_tblassetuserrelations_tblassets"
;
-- 
-- drop index: "fk_tblassetuserrelations_tbladusers" 
--

drop index if exists public."fk_tblassetuserrelations_tbladusers"
;
-- 
-- drop index: "fk_tblautorun_tblassets" 
--

drop index if exists public."fk_tblautorun_tblassets"
;
-- 
-- drop index: "fk_tblautorun_tblautorunloc" 
--

drop index if exists public."fk_tblautorun_tblautorunloc"
;
-- 
-- drop index: "fk_tblautorun_tblautorununi" 
--

drop index if exists public."fk_tblautorun_tblautorununi"
;
-- 
-- drop index: "fk_tblautorunhist_tblassets" 
--

drop index if exists public."fk_tblautorunhist_tblassets"
;
-- 
-- drop index: "fk_tblbaseboard_assets" 
--

drop index if exists public."fk_tblbaseboard_assets"
;
-- 
-- drop index: "fk_tblbaseboardhist_tblassets" 
--

drop index if exists public."fk_tblbaseboardhist_tblassets"
;
-- 
-- drop index: "fk_tblbattery_tblassets" 
--

drop index if exists public."fk_tblbattery_tblassets"
;
-- 
-- drop index: "fk_tblbatteryhist_tblassets" 
--

drop index if exists public."fk_tblbatteryhist_tblassets"
;
-- 
-- drop index: "fk_tblbios_tblassets" 
--

drop index if exists public."fk_tblbios_tblassets"
;
-- 
-- drop index: "fk_tblbioshist_tblassets" 
--

drop index if exists public."fk_tblbioshist_tblassets"
;
-- 
-- drop index: "fk_tblbootconfiguration_tblassets" 
--

drop index if exists public."fk_tblbootconfiguration_tblassets"
;
-- 
-- drop index: "fk_tblbootconfiguration_tblbootconfigurationuni" 
--

drop index if exists public."fk_tblbootconfiguration_tblbootconfigurationuni"
;
-- 
-- drop index: "fk_tblbootconfigurationhist_tblassets" 
--

drop index if exists public."fk_tblbootconfigurationhist_tblassets"
;
-- 
-- drop index: "fk_tblbus_tblassets" 
--

drop index if exists public."fk_tblbus_tblassets"
;
-- 
-- drop index: "fk_tblbushist_tblassets" 
--

drop index if exists public."fk_tblbushist_tblassets"
;
-- 
-- drop index: "fk_tblcdromdrive_tblassets" 
--

drop index if exists public."fk_tblcdromdrive_tblassets"
;
-- 
-- drop index: "fk_tblcdromdrivehist_tblassets" 
--

drop index if exists public."fk_tblcdromdrivehist_tblassets"
;
-- 
-- drop index: "fk_tblcodecfile_tblassets" 
--

drop index if exists public."fk_tblcodecfile_tblassets"
;
-- 
-- drop index: "fk_tblcodecfilehist_tblassets" 
--

drop index if exists public."fk_tblcodecfilehist_tblassets"
;
-- 
-- drop index: "fk_tblcomapplication_tblassets" 
--

drop index if exists public."fk_tblcomapplication_tblassets"
;
-- 
-- drop index: "fk_tblcomapplicationhist_tblassets" 
--

drop index if exists public."fk_tblcomapplicationhist_tblassets"
;
-- 
-- drop index: "fk_tblcomponentcategory_tblassets" 
--

drop index if exists public."fk_tblcomponentcategory_tblassets"
;
-- 
-- drop index: "fk_tblcomponentcategoryhist_tblassets" 
--

drop index if exists public."fk_tblcomponentcategoryhist_tblassets"
;
-- 
-- drop index: "fk_tblcomputersystem_tblassets" 
--

drop index if exists public."fk_tblcomputersystem_tblassets"
;
-- 
-- drop index: "fk_tblcomputersystem_tbldomainroles" 
--

drop index if exists public."fk_tblcomputersystem_tbldomainroles"
;
-- 
-- drop index: "fk_tblcomputersystemhist_tblassets" 
--

drop index if exists public."fk_tblcomputersystemhist_tblassets"
;
-- 
-- drop index: "fk_tblcomputersystemproduct_tblassets" 
--

drop index if exists public."fk_tblcomputersystemproduct_tblassets"
;
-- 
-- drop index: "fk_tblcomputersystemproducthist_tblassets" 
--

drop index if exists public."fk_tblcomputersystemproducthist_tblassets"
;
-- 
-- drop index: "fk_tblcplogoninfo_tblassets" 
--

drop index if exists public."fk_tblcplogoninfo_tblassets"
;
-- 
-- drop index: "fk_tblcustdevprinter_tblassets" 
--

drop index if exists public."fk_tblcustdevprinter_tblassets"
;
-- 
-- drop index: "fk_tbldcomapplication_tblassets" 
--

drop index if exists public."fk_tbldcomapplication_tblassets"
;
-- 
-- drop index: "fk_tbldcomapplicationhist_tblassets" 
--

drop index if exists public."fk_tbldcomapplicationhist_tblassets"
;
-- 
-- drop index: "fk_tbldesktop_tblassets" 
--

drop index if exists public."fk_tbldesktop_tblassets"
;
-- 
-- drop index: "fk_tbldesktopmonitor_tblassets" 
--

drop index if exists public."fk_tbldesktopmonitor_tblassets"
;
-- 
-- drop index: "fk_tbldesktopmonitorhist_tblassets" 
--

drop index if exists public."fk_tbldesktopmonitorhist_tblassets"
;
-- 
-- drop index: "fk_tbldiskdrives_tblassets" 
--

drop index if exists public."fk_tbldiskdrives_tblassets"
;
-- 
-- drop index: "fk_tbldiskpartition_tblassets" 
--

drop index if exists public."fk_tbldiskpartition_tblassets"
;
-- 
-- drop index: "fk_tbldiskpartitionhist_tblassets" 
--

drop index if exists public."fk_tbldiskpartitionhist_tblassets"
;
-- 
-- drop index: "fk_tbldisplayconfiguration_tblassets" 
--

drop index if exists public."fk_tbldisplayconfiguration_tblassets"
;
-- 
-- drop index: "fk_tbldisplayconfigurationhist_tblassets" 
--

drop index if exists public."fk_tbldisplayconfigurationhist_tblassets"
;
-- 
-- drop index: "fk_tbldisplaycontrollerconfiguration_tblassets" 
--

drop index if exists public."fk_tbldisplaycontrollerconfiguration_tblassets"
;
-- 
-- drop index: "fk_tbldisplaycontrollerconfigurationhist_tblassets" 
--

drop index if exists public."fk_tbldisplaycontrollerconfigurationhist_tblassets"
;
-- 
-- drop index: "fk_tblencryptablevolume_tblassets" 
--

drop index if exists public."fk_tblencryptablevolume_tblassets"
;
-- 
-- drop index: "fk_tblenvironment_tblassets" 
--

drop index if exists public."fk_tblenvironment_tblassets"
;
-- 
-- drop index: "fk_tblerrors_tblassets" 
--

drop index if exists public."fk_tblerrors_tblassets"
;
-- 
-- drop index: "fk_tblerrors_tsysasseterrortypes" 
--

drop index if exists public."fk_tblerrors_tsysasseterrortypes"
;
-- 
-- drop index: "fk_tblfeature_tblassets" 
--

drop index if exists public."fk_tblfeature_tblassets"
;
-- 
-- drop index: "fk_tblfeature_tbluniquefeature" 
--

drop index if exists public."fk_tblfeature_tbluniquefeature"
;
-- 
-- drop index: "fk_tblfileversions_tblassets" 
--

drop index if exists public."fk_tblfileversions_tblassets"
;
-- 
-- drop index: "fk_tblfloppy_tblassets" 
--

drop index if exists public."fk_tblfloppy_tblassets"
;
-- 
-- drop index: "fk_tblfloppyhist_tblassets" 
--

drop index if exists public."fk_tblfloppyhist_tblassets"
;
-- 
-- drop index: "fk_tblgroups_tblassets" 
--

drop index if exists public."fk_tblgroups_tblassets"
;
-- 
-- drop index: "fk_tblgroups_tblgroupuni" 
--

drop index if exists public."fk_tblgroups_tblgroupuni"
;
-- 
-- drop index: "fk_tblgroupshist_tblassets" 
--

drop index if exists public."fk_tblgroupshist_tblassets"
;
-- 
-- drop index: "fk_tblhypervguest_tblassets" 
--

drop index if exists public."fk_tblhypervguest_tblassets"
;
-- 
-- drop index: "fk_tblhypervguestnetwork_tblhypervguest" 
--

drop index if exists public."fk_tblhypervguestnetwork_tblhypervguest"
;
-- 
-- drop index: "fk_tblidecontroller_tblassets" 
--

drop index if exists public."fk_tblidecontroller_tblassets"
;
-- 
-- drop index: "fk_tblidecontrollerhist_tblassets" 
--

drop index if exists public."fk_tblidecontrollerhist_tblassets"
;
-- 
-- drop index: "fk_tblieactivex_tblassets" 
--

drop index if exists public."fk_tblieactivex_tblassets"
;
-- 
-- drop index: "fk_tblieactivexhist_tblassets" 
--

drop index if exists public."fk_tblieactivexhist_tblassets"
;
-- 
-- drop index: "fk_tbliebars_tblassets" 
--

drop index if exists public."fk_tbliebars_tblassets"
;
-- 
-- drop index: "fk_tbliebarshist_tblassets" 
--

drop index if exists public."fk_tbliebarshist_tblassets"
;
-- 
-- drop index: "fk_tbliebho_tblassets" 
--

drop index if exists public."fk_tbliebho_tblassets"
;
-- 
-- drop index: "fk_tbliebhohist_tblassets" 
--

drop index if exists public."fk_tbliebhohist_tblassets"
;
-- 
-- drop index: "fk_tblieextensions_tblassets" 
--

drop index if exists public."fk_tblieextensions_tblassets"
;
-- 
-- drop index: "fk_tblieextensionshist_tblassets" 
--

drop index if exists public."fk_tblieextensionshist_tblassets"
;
-- 
-- drop index: "fk_tblinfrareddevice_tblassets" 
--

drop index if exists public."fk_tblinfrareddevice_tblassets"
;
-- 
-- drop index: "fk_tblinfrareddevicehist_tblassets" 
--

drop index if exists public."fk_tblinfrareddevicehist_tblassets"
;
-- 
-- drop index: "fk_tblkeyboard_tblassets" 
--

drop index if exists public."fk_tblkeyboard_tblassets"
;
-- 
-- drop index: "fk_tblkeyboardhist_tblassets" 
--

drop index if exists public."fk_tblkeyboardhist_tblassets"
;
-- 
-- drop index: "fk_tbllicenses_tsyslicensetype" 
--

drop index if exists public."fk_tbllicenses_tsyslicensetype"
;
-- 
-- drop index: "fk_tbllinuxbaseboard_tblassets" 
--

drop index if exists public."fk_tbllinuxbaseboard_tblassets"
;
-- 
-- drop index: "fk_tbllinuxbios_tblassets" 
--

drop index if exists public."fk_tbllinuxbios_tblassets"
;
-- 
-- drop index: "fk_tbllinuxenclosure_tblassets" 
--

drop index if exists public."fk_tbllinuxenclosure_tblassets"
;
-- 
-- drop index: "fk_tbllinuxgraphicscards_tblassets" 
--

drop index if exists public."fk_tbllinuxgraphicscards_tblassets"
;
-- 
-- drop index: "fk_tbllinuxharddisks_tblassets" 
--

drop index if exists public."fk_tbllinuxharddisks_tblassets"
;
-- 
-- drop index: "fk_tbllinuxmemorycontroller_tblassets" 
--

drop index if exists public."fk_tbllinuxmemorycontroller_tblassets"
;
-- 
-- drop index: "fk_tbllinuxmemorydevices_tblassets" 
--

drop index if exists public."fk_tbllinuxmemorydevices_tblassets"
;
-- 
-- drop index: "fk_tbllinuxmemorymodules_tblassets" 
--

drop index if exists public."fk_tbllinuxmemorymodules_tblassets"
;
-- 
-- drop index: "fk_tbllinuxnetworkdetection_tblassets" 
--

drop index if exists public."fk_tbllinuxnetworkdetection_tblassets"
;
-- 
-- drop index: "fk_tbllinuxopticaldrives_tblassets" 
--

drop index if exists public."fk_tbllinuxopticaldrives_tblassets"
;
-- 
-- drop index: "fk_tbllinuxpcicards_tblassets" 
--

drop index if exists public."fk_tbllinuxpcicards_tblassets"
;
-- 
-- drop index: "fk_tbllinuxprocessors_tblassets" 
--

drop index if exists public."fk_tbllinuxprocessors_tblassets"
;
-- 
-- drop index: "fk_tbllinuxsoftware_tblassets" 
--

drop index if exists public."fk_tbllinuxsoftware_tblassets"
;
-- 
-- drop index: "fk_tbllinuxsoftware_tblsoftwareuni" 
--

drop index if exists public."fk_tbllinuxsoftware_tblsoftwareuni"
;
-- 
-- drop index: "fk_tbllinuxsoundcards_tblassets" 
--

drop index if exists public."fk_tbllinuxsoundcards_tblassets"
;
-- 
-- drop index: "fk_tbllinuxsystem_tblassets" 
--

drop index if exists public."fk_tbllinuxsystem_tblassets"
;
-- 
-- drop index: "fk_tbllinuxvolumes_tblassets" 
--

drop index if exists public."fk_tbllinuxvolumes_tblassets"
;
-- 
-- drop index: "fk_tblmacapplications_tblassets" 
--

drop index if exists public."fk_tblmacapplications_tblassets"
;
-- 
-- drop index: "fk_tblmacdiscburning_tblassets" 
--

drop index if exists public."fk_tblmacdiscburning_tblassets"
;
-- 
-- drop index: "fk_tblmacdisplays_tblassets" 
--

drop index if exists public."fk_tblmacdisplays_tblassets"
;
-- 
-- drop index: "fk_tblmacfirewires_tblassets" 
--

drop index if exists public."fk_tblmacfirewires_tblassets"
;
-- 
-- drop index: "fk_tblmachwoverview_tblassets" 
--

drop index if exists public."fk_tblmachwoverview_tblassets"
;
-- 
-- drop index: "fk_tblmacmemory_tblassets" 
--

drop index if exists public."fk_tblmacmemory_tblassets"
;
-- 
-- drop index: "fk_tblmacmodems_tblassets" 
--

drop index if exists public."fk_tblmacmodems_tblassets"
;
-- 
-- drop index: "fk_tblmacnetwork_tblassets" 
--

drop index if exists public."fk_tblmacnetwork_tblassets"
;
-- 
-- drop index: "fk_tblmacnetworkvolumes_tblassets" 
--

drop index if exists public."fk_tblmacnetworkvolumes_tblassets"
;
-- 
-- drop index: "fk_tblmacosinfo_tblassets" 
--

drop index if exists public."fk_tblmacosinfo_tblassets"
;
-- 
-- drop index: "fk_tblmacpartitions_tblassets" 
--

drop index if exists public."fk_tblmacpartitions_tblassets"
;
-- 
-- drop index: "fk_tblmappeddrives_tblassets" 
--

drop index if exists public."fk_tblmappeddrives_tblassets"
;
-- 
-- drop index: "fk_tblmonitor_tblassets" 
--

drop index if exists public."fk_tblmonitor_tblassets"
;
-- 
-- drop index: "fk_tblmonitorhist_tblassets" 
--

drop index if exists public."fk_tblmonitorhist_tblassets"
;
-- 
-- drop index: "fk_tblnetwork_tblassets" 
--

drop index if exists public."fk_tblnetwork_tblassets"
;
-- 
-- drop index: "fk_tblnetworkadapter_tblassets" 
--

drop index if exists public."fk_tblnetworkadapter_tblassets"
;
-- 
-- drop index: "fk_tblnetworkclient_tblassets" 
--

drop index if exists public."fk_tblnetworkclient_tblassets"
;
-- 
-- drop index: "fk_tblnetworkclienthist_tblassets" 
--

drop index if exists public."fk_tblnetworkclienthist_tblassets"
;
-- 
-- drop index: "fk_tblnetworkhist_tblassets" 
--

drop index if exists public."fk_tblnetworkhist_tblassets"
;
-- 
-- drop index: "fk_tblntlog_tblassets" 
--

drop index if exists public."fk_tblntlog_tblassets"
;
-- 
-- drop index: "fk_tblntlog_tblntlogfile" 
--

drop index if exists public."fk_tblntlog_tblntlogfile"
;
-- 
-- drop index: "fk_tblntlog_tblntlogmessage" 
--

drop index if exists public."fk_tblntlog_tblntlogmessage"
;
-- 
-- drop index: "fk_tblntlog_tblntlogsource" 
--

drop index if exists public."fk_tblntlog_tblntlogsource"
;
-- 
-- drop index: "fk_tblntlog_tblntloguser" 
--

drop index if exists public."fk_tblntlog_tblntloguser"
;
-- 
-- drop index: "fk_tblonboarddevice_tblassets" 
--

drop index if exists public."fk_tblonboarddevice_tblassets"
;
-- 
-- drop index: "fk_tblonboarddevicehist_tblassets" 
--

drop index if exists public."fk_tblonboarddevicehist_tblassets"
;
-- 
-- drop index: "fk_tbloperatingsystem_tblassets" 
--

drop index if exists public."fk_tbloperatingsystem_tblassets"
;
-- 
-- drop index: "fk_tbloperatingsystemhist_tblassets" 
--

drop index if exists public."fk_tbloperatingsystemhist_tblassets"
;
-- 
-- drop index: "fk_tblosrecoveryconfiguration_tblassets" 
--

drop index if exists public."fk_tblosrecoveryconfiguration_tblassets"
;
-- 
-- drop index: "fk_tblosrecoveryconfigurationhist_tblcomputers" 
--

drop index if exists public."fk_tblosrecoveryconfigurationhist_tblcomputers"
;
-- 
-- drop index: "fk_tblossublicensedocs_tbloslicenses" 
--

drop index if exists public."fk_tblossublicensedocs_tbloslicenses"
;
-- 
-- drop index: "fk_tblossublicenses_tbloslicenses" 
--

drop index if exists public."fk_tblossublicenses_tbloslicenses"
;
-- 
-- drop index: "fk_tblossublicensesorders_tbloslicenses" 
--

drop index if exists public."fk_tblossublicensesorders_tbloslicenses"
;
-- 
-- drop index: "fk_tblpagefile_tblassets" 
--

drop index if exists public."fk_tblpagefile_tblassets"
;
-- 
-- drop index: "fk_tblpagefilehist_tblassets" 
--

drop index if exists public."fk_tblpagefilehist_tblassets"
;
-- 
-- drop index: "fk_tblparallelport_tblassets" 
--

drop index if exists public."fk_tblparallelport_tblassets"
;
-- 
-- drop index: "fk_tblparallelporthist_tblassets" 
--

drop index if exists public."fk_tblparallelporthist_tblassets"
;
-- 
-- drop index: "fk_tblpcmciacontroller_tblassets" 
--

drop index if exists public."fk_tblpcmciacontroller_tblassets"
;
-- 
-- drop index: "fk_tblpcmciacontrollerhist_tblassets" 
--

drop index if exists public."fk_tblpcmciacontrollerhist_tblassets"
;
-- 
-- drop index: "fk_tblphysicalmemory_tblassets" 
--

drop index if exists public."fk_tblphysicalmemory_tblassets"
;
-- 
-- drop index: "fk_tblphysicalmemoryarray_tblassets" 
--

drop index if exists public."fk_tblphysicalmemoryarray_tblassets"
;
-- 
-- drop index: "fk_tblphysicalmemoryarrayhist_tblassets" 
--

drop index if exists public."fk_tblphysicalmemoryarrayhist_tblassets"
;
-- 
-- drop index: "fk_tblphysicalmemoryhist_tblassets" 
--

drop index if exists public."fk_tblphysicalmemoryhist_tblassets"
;
-- 
-- drop index: "fk_tblpointingdevice_tblassets" 
--

drop index if exists public."fk_tblpointingdevice_tblassets"
;
-- 
-- drop index: "fk_tblpointingdevicehist_tblassets" 
--

drop index if exists public."fk_tblpointingdevicehist_tblassets"
;
-- 
-- drop index: "fk_tblportablebattery_tblassets" 
--

drop index if exists public."fk_tblportablebattery_tblassets"
;
-- 
-- drop index: "fk_tblportablebatteryhist_tblassets" 
--

drop index if exists public."fk_tblportablebatteryhist_tblassets"
;
-- 
-- drop index: "fk_tblportconnector_tblassets" 
--

drop index if exists public."fk_tblportconnector_tblassets"
;
-- 
-- drop index: "fk_tblportconnectorhist_tblassets" 
--

drop index if exists public."fk_tblportconnectorhist_tblassets"
;
-- 
-- drop index: "fk_tblpotsmodem_tblassets" 
--

drop index if exists public."fk_tblpotsmodem_tblassets"
;
-- 
-- drop index: "fk_tblpotsmodemhist_tblassets" 
--

drop index if exists public."fk_tblpotsmodemhist_tblassets"
;
-- 
-- drop index: "fk_tblprinters_tblassets" 
--

drop index if exists public."fk_tblprinters_tblassets"
;
-- 
-- drop index: "fk_tblprintershist_tblassets" 
--

drop index if exists public."fk_tblprintershist_tblassets"
;
-- 
-- drop index: "fk_tblprocesses_tblassets" 
--

drop index if exists public."fk_tblprocesses_tblassets"
;
-- 
-- drop index: "fk_tblprocessor_tblassets" 
--

drop index if exists public."fk_tblprocessor_tblassets"
;
-- 
-- drop index: "fk_tblprocessorhist_tblassets" 
--

drop index if exists public."fk_tblprocessorhist_tblassets"
;
-- 
-- drop index: "fk_tblproxy_tblassets" 
--

drop index if exists public."fk_tblproxy_tblassets"
;
-- 
-- drop index: "fk_tblquickfixengineering_tblassets" 
--

drop index if exists public."fk_tblquickfixengineering_tblassets"
;
-- 
-- drop index: "fk_tblquickfixengineering_tblqfeinstalledby" 
--

drop index if exists public."fk_tblquickfixengineering_tblqfeinstalledby"
;
-- 
-- drop index: "fk_tblquickfixengineering_tblqfeunique" 
--

drop index if exists public."fk_tblquickfixengineering_tblqfeunique"
;
-- 
-- drop index: "fk_tblquickfixengineeringhist_tblassets" 
--

drop index if exists public."fk_tblquickfixengineeringhist_tblassets"
;
-- 
-- drop index: "fk_tblregistry_tblassets" 
--

drop index if exists public."fk_tblregistry_tblassets"
;
-- 
-- drop index: "fk_tblscanhistory_tblassets" 
--

drop index if exists public."fk_tblscanhistory_tblassets"
;
-- 
-- drop index: "fk_tblscanhistory_tsysscanningmethods" 
--

drop index if exists public."fk_tblscanhistory_tsysscanningmethods"
;
-- 
-- drop index: "fk_tblscsicontroller_tblassets" 
--

drop index if exists public."fk_tblscsicontroller_tblassets"
;
-- 
-- drop index: "fk_tblscsicontrollerhist_tblassets" 
--

drop index if exists public."fk_tblscsicontrollerhist_tblassets"
;
-- 
-- drop index: "fk_tblserialnumber_tblassets" 
--

drop index if exists public."fk_tblserialnumber_tblassets"
;
-- 
-- drop index: "fk_tblserialport_tblassets" 
--

drop index if exists public."fk_tblserialport_tblassets"
;
-- 
-- drop index: "fk_tblserialporthist_tblassets" 
--

drop index if exists public."fk_tblserialporthist_tblassets"
;
-- 
-- drop index: "fk_tblservices_tblassets" 
--

drop index if exists public."fk_tblservices_tblassets"
;
-- 
-- drop index: "fk_tblservices_tblservicestartmode" 
--

drop index if exists public."fk_tblservices_tblservicestartmode"
;
-- 
-- drop index: "fk_tblservices_tblservicestate" 
--

drop index if exists public."fk_tblservices_tblservicestate"
;
-- 
-- drop index: "fk_tblservices_tbluniqueservices" 
--

drop index if exists public."fk_tblservices_tbluniqueservices"
;
-- 
-- drop index: "fk_tblsharepermissions_tblshares" 
--

drop index if exists public."fk_tblsharepermissions_tblshares"
;
-- 
-- drop index: "fk_tblshares_tblassets" 
--

drop index if exists public."fk_tblshares_tblassets"
;
-- 
-- drop index: "fk_tblshares_tblsharesuni" 
--

drop index if exists public."fk_tblshares_tblsharesuni"
;
-- 
-- drop index: "fk_tblshareshist_tblassets" 
--

drop index if exists public."fk_tblshareshist_tblassets"
;
-- 
-- drop index: "fk_tblshareshist_tblsharesuni" 
--

drop index if exists public."fk_tblshareshist_tblsharesuni"
;
-- 
-- drop index: "fk_tblsnmpassetmac_tblassets" 
--

drop index if exists public."fk_tblsnmpassetmac_tblassets"
;
-- 
-- drop index: "fk_tblsnmpinfo_tblassets" 
--

drop index if exists public."fk_tblsnmpinfo_tblassets"
;
-- 
-- drop index: "fk_tblsoftware_tblassets" 
--

drop index if exists public."fk_tblsoftware_tblassets"
;
-- 
-- drop index: "fk_tblsoftware_tbluniquesoftware" 
--

drop index if exists public."fk_tblsoftware_tbluniquesoftware"
;
-- 
-- drop index: "fk_tblsoftwarehist_tblassets" 
--

drop index if exists public."fk_tblsoftwarehist_tblassets"
;
-- 
-- drop index: "fk_tblsounddevice_tblassets" 
--

drop index if exists public."fk_tblsounddevice_tblassets"
;
-- 
-- drop index: "fk_tblsounddevicehist_tblassets" 
--

drop index if exists public."fk_tblsounddevicehist_tblassets"
;
-- 
-- drop index: "fk_tblsqldatabases_tblsqlservers" 
--

drop index if exists public."fk_tblsqldatabases_tblsqlservers"
;
-- 
-- drop index: "fk_tblsqllicensedocs_tblsqllicenses" 
--

drop index if exists public."fk_tblsqllicensedocs_tblsqllicenses"
;
-- 
-- drop index: "fk_tblsqllicenses_tsyssqllicensetypes" 
--

drop index if exists public."fk_tblsqllicenses_tsyssqllicensetypes"
;
-- 
-- drop index: "fk_tblsqllicensesorders_tblsqllicenses" 
--

drop index if exists public."fk_tblsqllicensesorders_tblsqllicenses"
;
-- 
-- drop index: "fk_tblsqllicensesserverorders_tblsqllicenses" 
--

drop index if exists public."fk_tblsqllicensesserverorders_tblsqllicenses"
;
-- 
-- drop index: "fk_tblsqlservers_tblassets" 
--

drop index if exists public."fk_tblsqlservers_tblassets"
;
-- 
-- drop index: "fk_tblsqlsubservers_tblsqllicenses" 
--

drop index if exists public."fk_tblsqlsubservers_tblsqllicenses"
;
-- 
-- drop index: "fk_tblsublicensedocs_tbllicenses" 
--

drop index if exists public."fk_tblsublicensedocs_tbllicenses"
;
-- 
-- drop index: "fk_tblsublicenses_tbllicenses" 
--

drop index if exists public."fk_tblsublicenses_tbllicenses"
;
-- 
-- drop index: "fk_tblsublicensesorders_tbllicenses" 
--

drop index if exists public."fk_tblsublicensesorders_tbllicenses"
;
-- 
-- drop index: "fk_tblsystemenclosure_tblassets" 
--

drop index if exists public."fk_tblsystemenclosure_tblassets"
;
-- 
-- drop index: "fk_tblsystemenclosurehist_tblassets" 
--

drop index if exists public."fk_tblsystemenclosurehist_tblassets"
;
-- 
-- drop index: "fk_tbltapedrive_tblassets" 
--

drop index if exists public."fk_tbltapedrive_tblassets"
;
-- 
-- drop index: "fk_tbltapedrivehist_tblassets" 
--

drop index if exists public."fk_tbltapedrivehist_tblassets"
;
-- 
-- drop index: "fk_tbltpm_tblassets" 
--

drop index if exists public."fk_tbltpm_tblassets"
;
-- 
-- drop index: "fk_tblups_tblassets" 
--

drop index if exists public."fk_tblups_tblassets"
;
-- 
-- drop index: "fk_tbluptime_tblassets" 
--

drop index if exists public."fk_tbluptime_tblassets"
;
-- 
-- drop index: "fk_tblusbcontroller_tblassets" 
--

drop index if exists public."fk_tblusbcontroller_tblassets"
;
-- 
-- drop index: "fk_tblusbcontrollerhist_tblassets" 
--

drop index if exists public."fk_tblusbcontrollerhist_tblassets"
;
-- 
-- drop index: "fk_tblusbdevices_tblassets" 
--

drop index if exists public."fk_tblusbdevices_tblassets"
;
-- 
-- drop index: "fk_tblusers_tblassets" 
--

drop index if exists public."fk_tblusers_tblassets"
;
-- 
-- drop index: "fk_tblusershist_tblassets" 
--

drop index if exists public."fk_tblusershist_tblassets"
;
-- 
-- drop index: "fk_tblusersingroup_tblassets" 
--

drop index if exists public."fk_tblusersingroup_tblassets"
;
-- 
-- drop index: "fk_tblusersingrouphist_tblassets" 
--

drop index if exists public."fk_tblusersingrouphist_tblassets"
;
-- 
-- drop index: "fk_tblvideocontroller_tblassets" 
--

drop index if exists public."fk_tblvideocontroller_tblassets"
;
-- 
-- drop index: "fk_tblvideocontrollerhist_tblassets" 
--

drop index if exists public."fk_tblvideocontrollerhist_tblassets"
;
-- 
-- drop index: "fk_tblvmwaredisk_tblassets" 
--

drop index if exists public."fk_tblvmwaredisk_tblassets"
;
-- 
-- drop index: "fk_tblvmwareguest_tblassets" 
--

drop index if exists public."fk_tblvmwareguest_tblassets"
;
-- 
-- drop index: "fk_tblvmwareguestnetwork_tblvmwareguest" 
--

drop index if exists public."fk_tblvmwareguestnetwork_tblvmwareguest"
;
-- 
-- drop index: "fk_tblvmwareinfo_tblassets" 
--

drop index if exists public."fk_tblvmwareinfo_tblassets"
;
-- 
-- drop index: "fk_tblvmwarenetwork_tblassets" 
--

drop index if exists public."fk_tblvmwarenetwork_tblassets"
;
-- 
-- drop index: "fk_tblvolume_tblassets" 
--

drop index if exists public."fk_tblvolume_tblassets"
;
-- 
-- drop index: "fk_tblvproamt_tblassets" 
--

drop index if exists public."fk_tblvproamt_tblassets"
;
-- 
-- drop index: "fk_tblwarranty_tblassets" 
--

drop index if exists public."fk_tblwarranty_tblassets"
;
-- 
-- drop index: "fk_tblwarrantydetails_tblwarranty" 
--

drop index if exists public."fk_tblwarrantydetails_tblwarranty"
;
-- 
-- drop index: "fk_tblwinsat_tblassets" 
--

drop index if exists public."fk_tblwinsat_tblassets"
;
-- 
-- drop index: "fk_tsysadsischedule_tsysasservers" 
--

drop index if exists public."fk_tsysadsischedule_tsysasservers"
;
-- 
-- drop index: "fk_tsysalertschedule_tsysschedule" 
--

drop index if exists public."fk_tsysalertschedule_tsysschedule"
;
-- 
-- drop index: "fk_tsysasdomains_tsysasservers" 
--

drop index if exists public."fk_tsysasdomains_tsysasservers"
;
-- 
-- drop index: "fk_tsysasou_tsysasservers" 
--

drop index if exists public."fk_tsysasou_tsysasservers"
;
-- 
-- drop index: "fk_tsysassetgroupfilter_tblassetgroups" 
--

drop index if exists public."fk_tsysassetgroupfilter_tblassetgroups"
;
-- 
-- drop index: "fk_tsysassetgroupscan_tblassetgroups" 
--

drop index if exists public."fk_tsysassetgroupscan_tblassetgroups"
;
-- 
-- drop index: "fk_tsysassetgroupscan_tsysreports" 
--

drop index if exists public."fk_tsysassetgroupscan_tsysreports"
;
-- 
-- drop index: "fk_tsysassetgroupscan_tsysasservers" 
--

drop index if exists public."fk_tsysassetgroupscan_tsysasservers"
;
-- 
-- drop index: "fk_tsysassettypeexclude_tsysassettypes" 
--

drop index if exists public."fk_tsysassettypeexclude_tsysassettypes"
;
-- 
-- drop index: "fk_tsysassettypeexclude_tsysasservers" 
--

drop index if exists public."fk_tsysassettypeexclude_tsysasservers"
;
-- 
-- drop index: "fk_tsysassites_tsysasservers" 
--

drop index if exists public."fk_tsysassites_tsysasservers"
;
-- 
-- drop index: "fk_tsysasworkgroups_tsysasservers" 
--

drop index if exists public."fk_tsysasworkgroups_tsysasservers"
;
-- 
-- drop index: "fk_tsyscurrentscans_tsysasservers" 
--

drop index if exists public."fk_tsyscurrentscans_tsysasservers"
;
-- 
-- drop index: "fk_tsysdomaincontrollers_tsysasservers" 
--

drop index if exists public."fk_tsysdomaincontrollers_tsysasservers"
;
-- 
-- drop index: "fk_tsysdomaincredentials_tsyscredentials" 
--

drop index if exists public."fk_tsysdomaincredentials_tsyscredentials"
;
-- 
-- drop index: "fk_tsysdomainexclude_tsysasservers" 
--

drop index if exists public."fk_tsysdomainexclude_tsysasservers"
;
-- 
-- drop index: "fk_tsysdonotscan_tsysasservers" 
--

drop index if exists public."fk_tsysdonotscan_tsysasservers"
;
-- 
-- drop index: "fk_tsyserrors_tsyserrortype" 
--

drop index if exists public."fk_tsyserrors_tsyserrortype"
;
-- 
-- drop index: "fk_tsyseventfilter_tsyseventalerts" 
--

drop index if exists public."fk_tsyseventfilter_tsyseventalerts"
;
-- 
-- drop index: "fk_tsysipexclude_tsysasservers" 
--

drop index if exists public."fk_tsysipexclude_tsysasservers"
;
-- 
-- drop index: "fk_tsysiprangecredentials_tsyscredentials" 
--

drop index if exists public."fk_tsysiprangecredentials_tsyscredentials"
;
-- 
-- drop index: "fk_tsysiprangecredentials_tsysipscanranges" 
--

drop index if exists public."fk_tsysiprangecredentials_tsysipscanranges"
;
-- 
-- drop index: "fk_tsysipscanranges_tsysasservers" 
--

drop index if exists public."fk_tsysipscanranges_tsysasservers"
;
-- 
-- drop index: "fk_tsyslastscan_tblassets" 
--

drop index if exists public."fk_tsyslastscan_tblassets"
;
-- 
-- drop index: "fk_tsyslastscan_tsyswaittime" 
--

drop index if exists public."fk_tsyslastscan_tsyswaittime"
;
-- 
-- drop index: "fk_tsyslogschedule_tsysasservers" 
--

drop index if exists public."fk_tsyslogschedule_tsysasservers"
;
-- 
-- drop index: "fk_tsysmailconfig_tsysasservers" 
--

drop index if exists public."fk_tsysmailconfig_tsysasservers"
;
-- 
-- drop index: "fk_tsysoidlookup_tsysassettypes" 
--

drop index if exists public."fk_tsysoidlookup_tsysassettypes"
;
-- 
-- drop index: "fk_tsyspackageexecution_tsyspackageschedule" 
--

drop index if exists public."fk_tsyspackageexecution_tsyspackageschedule"
;
-- 
-- drop index: "fk_tsyspackageexecution_tsysasservers" 
--

drop index if exists public."fk_tsyspackageexecution_tsysasservers"
;
-- 
-- drop index: "fk_tsyspackagelogs_tsysasservers" 
--

drop index if exists public."fk_tsyspackagelogs_tsysasservers"
;
-- 
-- drop index: "fk_tsyspackagelogs_tsyspackages" 
--

drop index if exists public."fk_tsyspackagelogs_tsyspackages"
;
-- 
-- drop index: "fk_tsyspackageschedule_tblassetgroups" 
--

drop index if exists public."fk_tsyspackageschedule_tblassetgroups"
;
-- 
-- drop index: "fk_tsyspackageschedule_tsyspackages" 
--

drop index if exists public."fk_tsyspackageschedule_tsyspackages"
;
-- 
-- drop index: "fk_tsyspackageschedule_tsysschedule" 
--

drop index if exists public."fk_tsyspackageschedule_tsysschedule"
;
-- 
-- drop index: "fk_tsyspackagescheduleasset_tblassets" 
--

drop index if exists public."fk_tsyspackagescheduleasset_tblassets"
;
-- 
-- drop index: "fk_tsyspackagescheduleasset_tsyspackageschedule" 
--

drop index if exists public."fk_tsyspackagescheduleasset_tsyspackageschedule"
;
-- 
-- drop index: "fk_tsyspackagestepconditionlink_tsyspackagestepconditionnames" 
--

drop index if exists public."fk_tsyspackagestepconditionlink_tsyspackagestepconditionnames"
;
-- 
-- drop index: "fk_tsyspackagestepconditionlink_tsyspackagestepconditiontypes" 
--

drop index if exists public."fk_tsyspackagestepconditionlink_tsyspackagestepconditiontypes"
;
-- 
-- drop index: "fk_tsyspackagestepconditions_tsyspackagestepconditiontypes" 
--

drop index if exists public."fk_tsyspackagestepconditions_tsyspackagestepconditiontypes"
;
-- 
-- drop index: "fk_tsyspackagestepconditions_tsyspackagesteps" 
--

drop index if exists public."fk_tsyspackagestepconditions_tsyspackagesteps"
;
-- 
-- drop index: "fk_tsyspackagestepconditions_tsyspackagestepconditionnames" 
--

drop index if exists public."fk_tsyspackagestepconditions_tsyspackagestepconditionnames"
;
-- 
-- drop index: "fk_tsyspackagesteps_tsyspackages" 
--

drop index if exists public."fk_tsyspackagesteps_tsyspackages"
;
-- 
-- drop index: "fk_tsyspackagesteps_tsyspackagesteptypes" 
--

drop index if exists public."fk_tsyspackagesteps_tsyspackagesteptypes"
;
-- 
-- drop index: "fk_tsysreportpages_tsyspages" 
--

drop index if exists public."fk_tsysreportpages_tsyspages"
;
-- 
-- drop index: "fk_tsysreportpages_tsysreports" 
--

drop index if exists public."fk_tsysreportpages_tsysreports"
;
-- 
-- drop index: "fk_tsysrolemembers_tsysroles" 
--

drop index if exists public."fk_tsysrolemembers_tsysroles"
;
-- 
-- drop index: "fk_tsysrolepermissions_tsyspermissions" 
--

drop index if exists public."fk_tsysrolepermissions_tsyspermissions"
;
-- 
-- drop index: "fk_tsysrolepermissions_tsysrolepermissions" 
--

drop index if exists public."fk_tsysrolepermissions_tsysrolepermissions"
;
-- 
-- drop index: "fk_tsysscanqueue_tsysasservers" 
--

drop index if exists public."fk_tsysscanqueue_tsysasservers"
;
-- 
-- drop index: "fk_tsysuniqueipcredentials_tsyscredentials" 
--

drop index if exists public."fk_tsysuniqueipcredentials_tsyscredentials"
;
-- 
-- drop index: "fk_tsysuniquewindowscredentials_tsyscredentials" 
--

drop index if exists public."fk_tsysuniquewindowscredentials_tsyscredentials"
;
-- 
-- drop index: "fk_tsysuserschedule_tsysasservers" 
--

drop index if exists public."fk_tsysuserschedule_tsysasservers"
;
-- 
-- drop index: "fk_tsyswaitqueue_tsysasservers" 
--

drop index if exists public."fk_tsyswaitqueue_tsysasservers"
;
-- 
-- drop index: "fk_tsyswarrantyqueue_tblassets" 
--

drop index if exists public."fk_tsyswarrantyqueue_tblassets"
;
-- 
-- drop index: "fk_tsyswebtabcontrols_tsyswebcontrols" 
--

drop index if exists public."fk_tsyswebtabcontrols_tsyswebcontrols"
;
-- 
-- drop index: "fk_tsyswebtabcontrols_tsyswebtabs" 
--

drop index if exists public."fk_tsyswebtabcontrols_tsyswebtabs"
;
-- 
-- drop index: "fk_tsyswebtabs_tsyswebusers" 
--

drop index if exists public."fk_tsyswebtabs_tsyswebusers"
;
-- 
-- drop index: "fk_tsyswebusersglobaltabs_tsyswebtabs" 
--

drop index if exists public."fk_tsyswebusersglobaltabs_tsyswebtabs"
;

-- step 3

-- create extension if not exists pgcrypto with schema public;

-- step 4 - create tablenamekey column on all tables

do
$$
declare
  tname record;
begin
  for tname in select t.table_schema, t.table_name
               from information_schema.tables t
               where table_schema = 'public'
                 and not exists (select * 
                                 from information_schema.columns c
                                 where (c.table_schema, c.table_name) = (t.table_schema, t.table_name)
                                   and c.column_name = 'coltest') 
  loop
    -- change column definition in the following string
    execute format('alter table %I.%I add column %Ikey bigserial not null;', tname.table_schema, tname.table_name,tname.table_name);
  end loop;
end;
$$;

-- step 5 - create clientkey on all tables

do
$$
declare
  tname record;
begin
  for tname in select t.table_schema, t.table_name
               from information_schema.tables t
               where table_schema = 'public' --<< change schema name here
                 and not exists (select * 
                                 from information_schema.columns c
                                 where (c.table_schema, c.table_name) = (t.table_schema, t.table_name)
                                   and c.column_name = 'coltest') 
  loop
    -- change column definition in the following string
    execute format('alter table %I.%I add column clientkey bigint not null;', tname.table_schema, tname.table_name);
  end loop;
end;
$$;

-- step 6 - create unique index on previous primary key columns plus clientkey

create unique index htblagentconfig_uidx on public.htblagentconfig ( "agentconfigid",clientkey );
create unique index htblagentlicenses_uidx on public.htblagentlicenses ( "licenseid",clientkey );
create unique index htblagents_uidx on public.htblagents ( "agentid",clientkey );
create unique index htblagentteam_uidx on public.htblagentteam ( "agentid", "teamid", "webroleid",clientkey );
create unique index htblassignexclusions_uidx on public.htblassignexclusions ( "assignexclusionid",clientkey );
create unique index htblattachements_uidx on public.htblattachements ( "attachmentid",clientkey );
create unique index htblautomaticclose_uidx on public.htblautomaticclose ( "autocloseid",clientkey );
create unique index htblautomaticcloselang_uidx on public.htblautomaticcloselang ( "autocloseid", "language",clientkey );
create unique index htblautomaticcloseticketstates_uidx on public.htblautomaticcloseticketstates ( "autocloseid", "ticketstateid",clientkey );
create unique index htblautomaticclosetickettypes_uidx on public.htblautomaticclosetickettypes ( "autocloseid", "tickettypeid",clientkey );
create unique index htblcalendarsettings_uidx on public.htblcalendarsettings ( "settingid",clientkey );
create unique index htblcustomfields_uidx on public.htblcustomfields ( "fieldid",clientkey );
create unique index htblcustomfieldslang_uidx on public.htblcustomfieldslang ( "fieldid", "language",clientkey );
create unique index htblcustomfieldvaluelinks_uidx on public.htblcustomfieldvaluelinks ( "linkid",clientkey );
create unique index htblcustomfieldvalues_uidx on public.htblcustomfieldvalues ( "fieldvalueid",clientkey );
create unique index htblcustomticketfilteritems_uidx on public.htblcustomticketfilteritems ( "filteritemid",clientkey );
create unique index htblcustomticketfilters_uidx on public.htblcustomticketfilters ( "filterid",clientkey );
create unique index htbldeadlines_uidx on public.htbldeadlines ( "deadlineid",clientkey );
create unique index htblemailaccounts_uidx on public.htblemailaccounts ( "accountid",clientkey );
create unique index htblemailaccountslang_uidx on public.htblemailaccountslang ( "accountid", "language",clientkey );
create unique index htblemailaccountsteams_uidx on public.htblemailaccountsteams ( "teamid", "accountid",clientkey );
create unique index htblemailfilters_uidx on public.htblemailfilters ( "filterid",clientkey );
create unique index htblemailtemplates_uidx on public.htblemailtemplates ( "templateid",clientkey );
create unique index htblemailtemplatesattachements_uidx on public.htblemailtemplatesattachements ( "attachmentid",clientkey );
create unique index htblemailtemplateslang_uidx on public.htblemailtemplateslang ( "templateid", "language",clientkey );
create unique index htblemailtemplatespriorities_uidx on public.htblemailtemplatespriorities ( "templateid", "priority",clientkey );
create unique index htblemailtemplatesticketstates_uidx on public.htblemailtemplatesticketstates ( "templateid", "ticketstateid",clientkey );
create unique index htblemailtemplatestickettypes_uidx on public.htblemailtemplatestickettypes ( "templateid", "tickettypeid",clientkey );
create unique index htblemailverification_uidx on public.htblemailverification ( "verificationid",clientkey );
create unique index htbleventinfochecks_uidx on public.htbleventinfochecks ( "eventcheckid",clientkey );
create unique index htbleventreminders_uidx on public.htbleventreminders ( "eventreminderid",clientkey );
create unique index htblfiles_uidx on public.htblfiles ( "fileid",clientkey );
create unique index htblfooterattachements_uidx on public.htblfooterattachements ( "attachmentid",clientkey );
create unique index htblhistory_uidx on public.htblhistory ( "histid",clientkey );
create unique index htblhistorytypes_uidx on public.htblhistorytypes ( "typeid",clientkey );
create unique index htblknowledgebase_uidx on public.htblknowledgebase ( "kbid",clientkey );
create unique index htblknowledgebaseattachments_uidx on public.htblknowledgebaseattachments ( "attachmentid",clientkey );
create unique index htblknowledgebasecategories_uidx on public.htblknowledgebasecategories ( "categoryid",clientkey );
create unique index htblknowledgebasecategorieslang_uidx on public.htblknowledgebasecategorieslang ( "categoryid", "language",clientkey );
create unique index htblknowledgebasecategoriesteams_uidx on public.htblknowledgebasecategoriesteams ( "linkid",clientkey );
create unique index htblknowledgebaselang_uidx on public.htblknowledgebaselang ( "kbid", "language",clientkey );
create unique index htblnews_uidx on public.htblnews ( "newsid",clientkey );
create unique index htblnewslang_uidx on public.htblnewslang ( "newsid", "language",clientkey );
create unique index htblnotehistory_uidx on public.htblnotehistory ( "notehistoryid",clientkey );
create unique index htblnotes_uidx on public.htblnotes ( "noteid",clientkey );
create unique index htblnotificationschecked_uidx on public.htblnotificationschecked ( "checkid",clientkey );
create unique index htbloldticketdata_uidx on public.htbloldticketdata ( "oldid",clientkey );
create unique index htblpriorities_uidx on public.htblpriorities ( "priority",clientkey );
create unique index htblprioritieslang_uidx on public.htblprioritieslang ( "priority", "language",clientkey );
create unique index htblreports_uidx on public.htblreports ( "reportid",clientkey );
create unique index htblreportslang_uidx on public.htblreportslang ( "reportid", "language",clientkey );
create unique index htblsavedcustomfilters_uidx on public.htblsavedcustomfilters ( "saveid",clientkey );
create unique index htblschedule_uidx on public.htblschedule ( "scheduleid",clientkey );
create unique index htblscheduleagents_uidx on public.htblscheduleagents ( "scheduleagentid",clientkey );
create unique index htblscheduleinfo_uidx on public.htblscheduleinfo ( "infoid",clientkey );
create unique index htblschedulerepeat_uidx on public.htblschedulerepeat ( "repeatid",clientkey );
create unique index htblscheduleteams_uidx on public.htblscheduleteams ( "scheduleteamid",clientkey );
create unique index htblscheduletypes_uidx on public.htblscheduletypes ( "typeid",clientkey );
create unique index htblscheduletypeslang_uidx on public.htblscheduletypeslang ( "typeid", "language",clientkey );
create unique index htblserviceactions_uidx on public.htblserviceactions ( "actionid",clientkey );
create unique index htblshortcuts_uidx on public.htblshortcuts ( "keyid",clientkey );
create unique index htblshortcutslang_uidx on public.htblshortcutslang ( "keyid", "language",clientkey );
create unique index htblshownclientrelations_uidx on public.htblshownclientrelations ( "relationtypeid",clientkey );
create unique index htblsla_uidx on public.htblsla ( "slaid",clientkey );
create unique index htblslasource_uidx on public.htblslasource ( "slaid", "sourceid",clientkey );
create unique index htblslatickettypes_uidx on public.htblslatickettypes ( "slaid", "tickettypeid",clientkey );
create unique index htblslausers_uidx on public.htblslausers ( "slaid", "userid",clientkey );
create unique index htblsource_uidx on public.htblsource ( "sourceid",clientkey );
create unique index htblsourcelang_uidx on public.htblsourcelang ( "sourceid", "language",clientkey );
create unique index htblspecialrules_uidx on public.htblspecialrules ( "ruleid",clientkey );
create unique index htblspecialrulesactions_uidx on public.htblspecialrulesactions ( "actionid",clientkey );
create unique index htblspecialrulesconditions_uidx on public.htblspecialrulesconditions ( "conditionid",clientkey );
create unique index htblspecialrulestaskagents_uidx on public.htblspecialrulestaskagents ( "ruletaskagentid",clientkey );
create unique index htblspecialrulestasks_uidx on public.htblspecialrulestasks ( "taskid",clientkey );
create unique index htblspecialrulestaskteams_uidx on public.htblspecialrulestaskteams ( "ruletaskteamid",clientkey );
create unique index htblteams_uidx on public.htblteams ( "teamid",clientkey );
create unique index htblteamslang_uidx on public.htblteamslang ( "teamid", "language",clientkey );
create unique index htbltemplatecategories_uidx on public.htbltemplatecategories ( "categoryid",clientkey );
create unique index htbltemplates_uidx on public.htbltemplates ( "templateid",clientkey );
create unique index htbltemplateslang_uidx on public.htbltemplateslang ( "templateid", "language",clientkey );
create unique index htblticket_uidx on public.htblticket ( "ticketid",clientkey );
create unique index htblticketasset_uidx on public.htblticketasset ( "ticketid", "assetid",clientkey );
create unique index htblticketcustomfield_uidx on public.htblticketcustomfield ( "ticketcustomfieldid",clientkey );
create unique index htblticketmerges_uidx on public.htblticketmerges ( "mergeid",clientkey );
create unique index htblticketsfilter_uidx on public.htblticketsfilter ( "filterid",clientkey );
create unique index htblticketssummary_uidx on public.htblticketssummary ( "summaryid",clientkey );
create unique index htblticketssummaryfilter_uidx on public.htblticketssummaryfilter ( "summaryid",clientkey );
create unique index htblticketstates_uidx on public.htblticketstates ( "ticketstateid",clientkey );
create unique index htblticketstateslang_uidx on public.htblticketstateslang ( "ticketstateid", "language",clientkey );
create unique index htblticketsubscribers_uidx on public.htblticketsubscribers ( "subscriberid",clientkey );
create unique index htblticketteam_uidx on public.htblticketteam ( "ticketid", "teamid",clientkey );
create unique index htbltickettypecustomfield_uidx on public.htbltickettypecustomfield ( "tickettypecustomfieldid",clientkey );
create unique index htbltickettypes_uidx on public.htbltickettypes ( "tickettypeid",clientkey );
create unique index htbltickettypeslang_uidx on public.htbltickettypeslang ( "tickettypeid", "language",clientkey );
create unique index htbltickettypeteams_uidx on public.htbltickettypeteams ( "teamid", "tickettypeid",clientkey );
create unique index htblticketuserrelation_uidx on public.htblticketuserrelation ( "ticketuserrelationid",clientkey );
create unique index htblusers_uidx on public.htblusers ( "userid",clientkey );
create unique index htblwebroles_uidx on public.htblwebroles ( "webroleid",clientkey );
create unique index htblzones_uidx on public.htblzones ( "zoneid",clientkey );
create unique index tbladcomputers_uidx on public.tbladcomputers ( "adcomputerid",clientkey );
create unique index tbladgroups_uidx on public.tbladgroups ( "adgroupid",clientkey );
create unique index tbladmembership_uidx on public.tbladmembership ( "childadobjectid", "parentadobjectid",clientkey );
create unique index tbladobjects_uidx on public.tbladobjects ( "adobjectid",clientkey );
create unique index tbladusers_uidx on public.tbladusers ( "username", "userdomain",clientkey );
create unique index tblantivirus_uidx on public.tblantivirus ( "antivirusid",clientkey );
create unique index tblassetcomments_uidx on public.tblassetcomments ( "commentid",clientkey );
create unique index tblassetcustom_uidx on public.tblassetcustom ( "custid",clientkey );
create unique index tblassetdocs_uidx on public.tblassetdocs ( "docsid",clientkey );
create unique index tblassetgrouplink_uidx on public.tblassetgrouplink ( "assetgrouplinkid",clientkey );
create unique index tblassetgroups_uidx on public.tblassetgroups ( "assetgroupid",clientkey );
create unique index tblassetmacaddress_uidx on public.tblassetmacaddress ( "macid",clientkey );
create unique index tblassetmergelinks_uidx on public.tblassetmergelinks ( "assetmergelinkid",clientkey );
create unique index tblassetrelations_uidx on public.tblassetrelations ( "relationid",clientkey );
create unique index tblassets_uidx on public.tblassets ( "assetid",clientkey );
create unique index tblassetuserrelations_uidx on public.tblassetuserrelations ( "relationid",clientkey );
create unique index tblautorun_uidx on public.tblautorun ( "autorunid",clientkey );
create unique index tblautorunhist_uidx on public.tblautorunhist ( "trackercode",clientkey );
create unique index tblautorunloc_uidx on public.tblautorunloc ( "locationid",clientkey );
create unique index tblautorununi_uidx on public.tblautorununi ( "autorununi",clientkey );
create unique index tblbaseboard_uidx on public.tblbaseboard ( "win32_baseboardid",clientkey );
create unique index tblbaseboardhist_uidx on public.tblbaseboardhist ( "trackercode",clientkey );
create unique index tblbattery_uidx on public.tblbattery ( "win32_batteryid",clientkey );
create unique index tblbatteryhist_uidx on public.tblbatteryhist ( "trackercode",clientkey );
create unique index tblbios_uidx on public.tblbios ( "win32_biosid",clientkey );
create unique index tblbioshist_uidx on public.tblbioshist ( "trackercode",clientkey );
create unique index tblbootconfiguration_uidx on public.tblbootconfiguration ( "win32_bootconfigurationid",clientkey );
create unique index tblbootconfigurationhist_uidx on public.tblbootconfigurationhist ( "trackercode",clientkey );
create unique index tblbootconfigurationuni_uidx on public.tblbootconfigurationuni ( "bootconfigurationuniid",clientkey );
create unique index tblbus_uidx on public.tblbus ( "win32_busid",clientkey );
create unique index tblbushist_uidx on public.tblbushist ( "trackercode",clientkey );
create unique index tblcdromdrive_uidx on public.tblcdromdrive ( "win32_cdromdriveid",clientkey );
create unique index tblcdromdrivehist_uidx on public.tblcdromdrivehist ( "trackercode",clientkey );
create unique index tblcodecfile_uidx on public.tblcodecfile ( "win32_codecfileid",clientkey );
create unique index tblcodecfilehist_uidx on public.tblcodecfilehist ( "trackercode",clientkey );
create unique index tblcomapplication_uidx on public.tblcomapplication ( "win32_comapplicationid",clientkey );
create unique index tblcomapplicationhist_uidx on public.tblcomapplicationhist ( "trackercode",clientkey );
create unique index tblcomponentcategory_uidx on public.tblcomponentcategory ( "win32_componentcategoryid",clientkey );
create unique index tblcomponentcategoryhist_uidx on public.tblcomponentcategoryhist ( "trackercode",clientkey );
create unique index tblcomputersystem_uidx on public.tblcomputersystem ( "computersystemid",clientkey );
create unique index tblcomputersystemhist_uidx on public.tblcomputersystemhist ( "trackercode",clientkey );
create unique index tblcomputersystemproduct_uidx on public.tblcomputersystemproduct ( "win32_computersystemproductid",clientkey );
create unique index tblcomputersystemproducthist_uidx on public.tblcomputersystemproducthist ( "trackercode",clientkey );
create unique index tblconfiglog_uidx on public.tblconfiglog ( "logid",clientkey );
create unique index tblcplogoninfo_uidx on public.tblcplogoninfo ( "id",clientkey );
create unique index tblcustdevprinter_uidx on public.tblcustdevprinter ( "devprintid",clientkey );
create unique index tbldcomapplication_uidx on public.tbldcomapplication ( "win32_dcomapplicationid",clientkey );
create unique index tbldcomapplicationhist_uidx on public.tbldcomapplicationhist ( "trackercode",clientkey );
create unique index tbldesktop_uidx on public.tbldesktop ( "win32_desktopid",clientkey );
create unique index tbldesktopmonitor_uidx on public.tbldesktopmonitor ( "win32_desktopmonitorid",clientkey );
create unique index tbldesktopmonitorhist_uidx on public.tbldesktopmonitorhist ( "trackercode",clientkey );
create unique index tbldiskdrives_uidx on public.tbldiskdrives ( "diskid",clientkey );
create unique index tbldiskpartition_uidx on public.tbldiskpartition ( "win32_diskpartitionid",clientkey );
create unique index tbldiskpartitionhist_uidx on public.tbldiskpartitionhist ( "trackercode",clientkey );
create unique index tbldisplayconfiguration_uidx on public.tbldisplayconfiguration ( "win32_displayconfigurationid",clientkey );
create unique index tbldisplayconfigurationhist_uidx on public.tbldisplayconfigurationhist ( "trackercode",clientkey );
create unique index tbldisplaycontrollerconfiguration_uidx on public.tbldisplaycontrollerconfiguration ( "win32_displaycontrollerconfigurationid",clientkey );
create unique index tbldisplaycontrollerconfigurationhist_uidx on public.tbldisplaycontrollerconfigurationhist ( "trackercode",clientkey );
create unique index tbldomainroles_uidx on public.tbldomainroles ( "domainrole",clientkey );
create unique index tblencryptablevolume_uidx on public.tblencryptablevolume ( "win32_encryptablevolumeid",clientkey );
create unique index tblenvironment_uidx on public.tblenvironment ( "win32_environmentid",clientkey );
create unique index tblerrors_uidx on public.tblerrors ( "teller",clientkey );
create unique index tblfeature_uidx on public.tblfeature ( "featureid",clientkey );
create unique index tblfeatureuni_uidx on public.tblfeatureuni ( "featuniid",clientkey );
create unique index tblfileversions_uidx on public.tblfileversions ( "versionid",clientkey );
create unique index tblfloppy_uidx on public.tblfloppy ( "floppyid",clientkey );
create unique index tblfloppyhist_uidx on public.tblfloppyhist ( "trackercode",clientkey );
create unique index tblgroups_uidx on public.tblgroups ( "userid",clientkey );
create unique index tblgroupshist_uidx on public.tblgroupshist ( "trackercode",clientkey );
create unique index tblgroupuni_uidx on public.tblgroupuni ( "groupid",clientkey );
create unique index tblhypervguest_uidx on public.tblhypervguest ( "hypervguestid",clientkey );
create unique index tblhypervguestnetwork_uidx on public.tblhypervguestnetwork ( "hypervguestnetworkid",clientkey );
create unique index tblidecontroller_uidx on public.tblidecontroller ( "win32_idecontrollerid",clientkey );
create unique index tblidecontrollerhist_uidx on public.tblidecontrollerhist ( "trackercode",clientkey );
create unique index tblieactivex_uidx on public.tblieactivex ( "ieactivexid",clientkey );
create unique index tblieactivexhist_uidx on public.tblieactivexhist ( "trackercode",clientkey );
create unique index tbliebars_uidx on public.tbliebars ( "iebarid",clientkey );
create unique index tbliebarshist_uidx on public.tbliebarshist ( "trackercode",clientkey );
create unique index tbliebho_uidx on public.tbliebho ( "iebhoid",clientkey );
create unique index tbliebhohist_uidx on public.tbliebhohist ( "trackercode",clientkey );
create unique index tblieextensions_uidx on public.tblieextensions ( "ieextid",clientkey );
create unique index tblieextensionshist_uidx on public.tblieextensionshist ( "trackercode",clientkey );
create unique index tblinfrareddevice_uidx on public.tblinfrareddevice ( "win32_infrareddeviceid",clientkey );
create unique index tblinfrareddevicehist_uidx on public.tblinfrareddevicehist ( "trackercode",clientkey );
create unique index tblkeyboard_uidx on public.tblkeyboard ( "win32_keyboardid",clientkey );
create unique index tblkeyboardhist_uidx on public.tblkeyboardhist ( "trackercode",clientkey );
create unique index tbllanguages_uidx on public.tbllanguages ( "languagecode",clientkey );
create unique index tbllicenses_uidx on public.tbllicenses ( "licenseidid",clientkey );
create unique index tbllinuxbaseboard_uidx on public.tbllinuxbaseboard ( "baseboardid",clientkey );
create unique index tbllinuxbios_uidx on public.tbllinuxbios ( "biosid",clientkey );
create unique index tbllinuxenclosure_uidx on public.tbllinuxenclosure ( "linuxenclosureid",clientkey );
create unique index tbllinuxgraphicscards_uidx on public.tbllinuxgraphicscards ( "graphicsid",clientkey );
create unique index tbllinuxharddisks_uidx on public.tbllinuxharddisks ( "harddiskid",clientkey );
create unique index tbllinuxmemorycontroller_uidx on public.tbllinuxmemorycontroller ( "controllerid",clientkey );
create unique index tbllinuxmemorydevices_uidx on public.tbllinuxmemorydevices ( "memorydeviceid",clientkey );
create unique index tbllinuxmemorymodules_uidx on public.tbllinuxmemorymodules ( "memorymoduleid",clientkey );
create unique index tbllinuxnetworkdetection_uidx on public.tbllinuxnetworkdetection ( "networkid",clientkey );
create unique index tbllinuxopticaldrives_uidx on public.tbllinuxopticaldrives ( "opticaldriveid",clientkey );
create unique index tbllinuxpcicards_uidx on public.tbllinuxpcicards ( "pciid",clientkey );
create unique index tbllinuxprocessors_uidx on public.tbllinuxprocessors ( "processorid",clientkey );
create unique index tbllinuxsoftware_uidx on public.tbllinuxsoftware ( "softwareid",clientkey );
create unique index tbllinuxsoundcards_uidx on public.tbllinuxsoundcards ( "soundid",clientkey );
create unique index tbllinuxsystem_uidx on public.tbllinuxsystem ( "systemid",clientkey );
create unique index tbllinuxvolumes_uidx on public.tbllinuxvolumes ( "volumeid",clientkey );
create unique index tblloginlog_uidx on public.tblloginlog ( "logid",clientkey );
create unique index tblmacapplications_uidx on public.tblmacapplications ( "applicationid",clientkey );
create unique index tblmacdiscburning_uidx on public.tblmacdiscburning ( "discburningid",clientkey );
create unique index tblmacdisplays_uidx on public.tblmacdisplays ( "displayid",clientkey );
create unique index tblmacfirewires_uidx on public.tblmacfirewires ( "firewireid",clientkey );
create unique index tblmachwoverview_uidx on public.tblmachwoverview ( "hwoverviewid",clientkey );
create unique index tblmacmemory_uidx on public.tblmacmemory ( "memoryid",clientkey );
create unique index tblmacmodems_uidx on public.tblmacmodems ( "modemid",clientkey );
create unique index tblmacnetwork_uidx on public.tblmacnetwork ( "networkid",clientkey );
create unique index tblmacnetworkvolumes_uidx on public.tblmacnetworkvolumes ( "networkvolumeid",clientkey );
create unique index tblmacosinfo_uidx on public.tblmacosinfo ( "macosinfoid",clientkey );
create unique index tblmacpartitions_uidx on public.tblmacpartitions ( "harddiskid",clientkey );
create unique index tblmappeddrives_uidx on public.tblmappeddrives ( "driveid",clientkey );
create unique index tblmonitor_uidx on public.tblmonitor ( "monitorid",clientkey );
create unique index tblmonitorhist_uidx on public.tblmonitorhist ( "trackercode",clientkey );
create unique index tblnetwork_uidx on public.tblnetwork ( "networkid",clientkey );
create unique index tblnetworkadapter_uidx on public.tblnetworkadapter ( "networkadapterid",clientkey );
create unique index tblnetworkclient_uidx on public.tblnetworkclient ( "win32_networkclientid",clientkey );
create unique index tblnetworkclienthist_uidx on public.tblnetworkclienthist ( "trackercode",clientkey );
create unique index tblnetworkhist_uidx on public.tblnetworkhist ( "trackercode",clientkey );
create unique index tblntlog_uidx on public.tblntlog ( "eventlogid",clientkey );
create unique index tblntlogfile_uidx on public.tblntlogfile ( "logfileid",clientkey );
create unique index tblntlogmessage_uidx on public.tblntlogmessage ( "messageid",clientkey );
create unique index tblntlogsource_uidx on public.tblntlogsource ( "sourcenameid",clientkey );
create unique index tblntloguser_uidx on public.tblntloguser ( "loguserid",clientkey );
create unique index tblonboarddevice_uidx on public.tblonboarddevice ( "win32_onboarddeviceid",clientkey );
create unique index tblonboarddevicehist_uidx on public.tblonboarddevicehist ( "trackercode",clientkey );
create unique index tbloperatingsystem_uidx on public.tbloperatingsystem ( "osid",clientkey );
create unique index tbloperatingsystemhist_uidx on public.tbloperatingsystemhist ( "trackercode",clientkey );
create unique index tbloslicenses_uidx on public.tbloslicenses ( "oslicenseidid",clientkey );
create unique index tblosrecoveryconfiguration_uidx on public.tblosrecoveryconfiguration ( "win32_osrecoveryconfigurationid",clientkey );
create unique index tblosrecoveryconfigurationhist_uidx on public.tblosrecoveryconfigurationhist ( "trackercode",clientkey );
create unique index tblossublicensedocs_uidx on public.tblossublicensedocs ( "oslicensesubdocid",clientkey );
create unique index tblossublicenses_uidx on public.tblossublicenses ( "oslicensesubid",clientkey );
create unique index tblossublicensesorders_uidx on public.tblossublicensesorders ( "oslicensesuborderid",clientkey );
create unique index tblpagefile_uidx on public.tblpagefile ( "win32_pagefileid",clientkey );
create unique index tblpagefilehist_uidx on public.tblpagefilehist ( "trackercode",clientkey );
create unique index tblparallelport_uidx on public.tblparallelport ( "win32_parallelportid",clientkey );
create unique index tblparallelporthist_uidx on public.tblparallelporthist ( "trackercode",clientkey );
create unique index tblpcmciacontroller_uidx on public.tblpcmciacontroller ( "win32_pcmciacontrollerid",clientkey );
create unique index tblpcmciacontrollerhist_uidx on public.tblpcmciacontrollerhist ( "trackercode",clientkey );
create unique index tblphysicalmemory_uidx on public.tblphysicalmemory ( "win32_physicalmemoryid",clientkey );
create unique index tblphysicalmemoryarray_uidx on public.tblphysicalmemoryarray ( "win32_physicalmemoryarrayid",clientkey );
create unique index tblphysicalmemoryarrayhist_uidx on public.tblphysicalmemoryarrayhist ( "trackercode",clientkey );
create unique index tblphysicalmemoryhist_uidx on public.tblphysicalmemoryhist ( "trackercode",clientkey );
create unique index tblpointingdevice_uidx on public.tblpointingdevice ( "win32_pointingdeviceid",clientkey );
create unique index tblpointingdevicehist_uidx on public.tblpointingdevicehist ( "trackercode",clientkey );
create unique index tblportablebattery_uidx on public.tblportablebattery ( "win32_portablebatteryid",clientkey );
create unique index tblportablebatteryhist_uidx on public.tblportablebatteryhist ( "trackercode",clientkey );
create unique index tblportconnector_uidx on public.tblportconnector ( "win32_portconnectorid",clientkey );
create unique index tblportconnectorhist_uidx on public.tblportconnectorhist ( "trackercode",clientkey );
create unique index tblpotsmodem_uidx on public.tblpotsmodem ( "win32_potsmodemid",clientkey );
create unique index tblpotsmodemhist_uidx on public.tblpotsmodemhist ( "trackercode",clientkey );
create unique index tblprinters_uidx on public.tblprinters ( "printerid",clientkey );
create unique index tblprintershist_uidx on public.tblprintershist ( "trackercode",clientkey );
create unique index tblprocesses_uidx on public.tblprocesses ( "processid",clientkey );
create unique index tblprocessor_uidx on public.tblprocessor ( "win32_processorid",clientkey );
create unique index tblprocessorhist_uidx on public.tblprocessorhist ( "trackercode",clientkey );
create unique index tblproxy_uidx on public.tblproxy ( "proxyid",clientkey );
create unique index tblquickfixengineering_uidx on public.tblquickfixengineering ( "win32_quickfixengineeringid",clientkey );
create unique index tblquickfixengineeringhist_uidx on public.tblquickfixengineeringhist ( "trackercode",clientkey );
create unique index tblquickfixengineeringinstalledby_uidx on public.tblquickfixengineeringinstalledby ( "installedbyid",clientkey );
create unique index tblquickfixengineeringuni_uidx on public.tblquickfixengineeringuni ( "qfeid",clientkey );
create unique index tblregistry_uidx on public.tblregistry ( "registryid",clientkey );
create unique index tblsafeguids_uidx on public.tblsafeguids ( "guid",clientkey );
create unique index tblscanhistory_uidx on public.tblscanhistory ( "scanhistoryid",clientkey );
create unique index tblscsicontroller_uidx on public.tblscsicontroller ( "win32_scsicontrollerid",clientkey );
create unique index tblscsicontrollerhist_uidx on public.tblscsicontrollerhist ( "trackercode",clientkey );
create unique index tblserialnumber_uidx on public.tblserialnumber ( "serialid",clientkey );
create unique index tblserialport_uidx on public.tblserialport ( "win32_serialportid",clientkey );
create unique index tblserialporthist_uidx on public.tblserialporthist ( "trackercode",clientkey );
create unique index tblservices_uidx on public.tblservices ( "serviceid",clientkey );
create unique index tblservicestartmode_uidx on public.tblservicestartmode ( "startid",clientkey );
create unique index tblservicestate_uidx on public.tblservicestate ( "stateid",clientkey );
create unique index tblservicesuni_uidx on public.tblservicesuni ( "serviceuniqueid",clientkey );
create unique index tblsharepermissions_uidx on public.tblsharepermissions ( "permissionid",clientkey );
create unique index tblshares_uidx on public.tblshares ( "shareid",clientkey );
create unique index tblshareshist_uidx on public.tblshareshist ( "trackercode",clientkey );
create unique index tblsharesuni_uidx on public.tblsharesuni ( "shareuniqueid",clientkey );
create unique index tblsnmpassetmac_uidx on public.tblsnmpassetmac ( "snmpmacid",clientkey );
create unique index tblsnmpiftypes_uidx on public.tblsnmpiftypes ( "iftype",clientkey );
create unique index tblsnmpinfo_uidx on public.tblsnmpinfo ( "snmpinfoid",clientkey );
create unique index tblsoftware_uidx on public.tblsoftware ( "softwareid",clientkey );
create unique index tblsoftwarehist_uidx on public.tblsoftwarehist ( "trackercode",clientkey );
create unique index tblsoftwareuni_uidx on public.tblsoftwareuni ( "softid",clientkey );
create unique index tblsounddevice_uidx on public.tblsounddevice ( "win32_sounddeviceid",clientkey );
create unique index tblsounddevicehist_uidx on public.tblsounddevicehist ( "trackercode",clientkey );
create unique index tblsqldatabases_uidx on public.tblsqldatabases ( "sqldatabaseid",clientkey );
create unique index tblsqllicensedocs_uidx on public.tblsqllicensedocs ( "docid",clientkey );
create unique index tblsqllicenses_uidx on public.tblsqllicenses ( "licenseid",clientkey );
create unique index tblsqllicensesorders_uidx on public.tblsqllicensesorders ( "licenseorderid",clientkey );
create unique index tblsqllicensesserverorders_uidx on public.tblsqllicensesserverorders ( "licenseorderid",clientkey );
create unique index tblsqlservers_uidx on public.tblsqlservers ( "sqlserverid",clientkey );
create unique index tblsqlsubservers_uidx on public.tblsqlsubservers ( "subserverid",clientkey );
create unique index tblstate_uidx on public.tblstate ( "state",clientkey );
create unique index tblsublicensedocs_uidx on public.tblsublicensedocs ( "licensesubdocid",clientkey );
create unique index tblsublicenses_uidx on public.tblsublicenses ( "licensesubid",clientkey );
create unique index tblsublicensesorders_uidx on public.tblsublicensesorders ( "licensesuborderid",clientkey );
create unique index tblsystemenclosure_uidx on public.tblsystemenclosure ( "win32_systemenclosureid",clientkey );
create unique index tblsystemenclosurehist_uidx on public.tblsystemenclosurehist ( "trackercode",clientkey );
create unique index tbltapedrive_uidx on public.tbltapedrive ( "win32_tapedriveid",clientkey );
create unique index tbltapedrivehist_uidx on public.tbltapedrivehist ( "trackercode",clientkey );
create unique index tbltpm_uidx on public.tbltpm ( "win32_tpmid",clientkey );
create unique index tblups_uidx on public.tblups ( "upsid",clientkey );
create unique index tbluptime_uidx on public.tbluptime ( "uptimeid",clientkey );
create unique index tblusbcontroller_uidx on public.tblusbcontroller ( "win32_usbcontrollerid",clientkey );
create unique index tblusbcontrollerhist_uidx on public.tblusbcontrollerhist ( "trackercode",clientkey );
create unique index tblusbdevices_uidx on public.tblusbdevices ( "win32_usbdeviceid",clientkey );
create unique index tblusers_uidx on public.tblusers ( "userid",clientkey );
create unique index tblusershist_uidx on public.tblusershist ( "trackercode",clientkey );
create unique index tblusersingroup_uidx on public.tblusersingroup ( "useringroupid",clientkey );
create unique index tblusersingrouphist_uidx on public.tblusersingrouphist ( "trackercode",clientkey );
create unique index tblvideocontroller_uidx on public.tblvideocontroller ( "win32_videocontrollerid",clientkey );
create unique index tblvideocontrollerhist_uidx on public.tblvideocontrollerhist ( "trackercode",clientkey );
create unique index tblvmwaredisk_uidx on public.tblvmwaredisk ( "diskid",clientkey );
create unique index tblvmwareguest_uidx on public.tblvmwareguest ( "guestid",clientkey );
create unique index tblvmwareguestnetwork_uidx on public.tblvmwareguestnetwork ( "guestnetworkid",clientkey );
create unique index tblvmwareinfo_uidx on public.tblvmwareinfo ( "vmwareid",clientkey );
create unique index tblvmwarenetwork_uidx on public.tblvmwarenetwork ( "networkid",clientkey );
create unique index tblvolume_uidx on public.tblvolume ( "volumeid",clientkey );
create unique index tblvproamt_uidx on public.tblvproamt ( "vproamdid",clientkey );
create unique index tblwarranty_uidx on public.tblwarranty ( "warrantyid",clientkey );
create unique index tblwarrantydetails_uidx on public.tblwarrantydetails ( "warrantydetailsid",clientkey );
create unique index tblwinsat_uidx on public.tblwinsat ( "winsatid",clientkey );
create unique index tsysactions_uidx on public.tsysactions ( "actionid",clientkey );
create unique index tsysadmins_uidx on public.tsysadmins ( "id",clientkey );
create unique index tsysadsischedule_uidx on public.tsysadsischedule ( "scheduleid",clientkey );
create unique index tsysalertschedule_uidx on public.tsysalertschedule ( "alertscheduleid",clientkey );
create unique index tsysantivirus_uidx on public.tsysantivirus ( "software",clientkey );
create unique index tsysapikeys_uidx on public.tsysapikeys ( "keyid",clientkey );
create unique index tsysasdomains_uidx on public.tsysasdomains ( "servername", "domainname",clientkey );
create unique index tsysasou_uidx on public.tsysasou ( "ou", "servername",clientkey );
create unique index tsysasservers_uidx on public.tsysasservers ( "servername",clientkey );
create unique index tsysasseterrortypes_uidx on public.tsysasseterrortypes ( "errortype",clientkey );
create unique index tsysassetgroupfilter_uidx on public.tsysassetgroupfilter ( "filterid",clientkey );
create unique index tsysassetgroupscan_uidx on public.tsysassetgroupscan ( "assetgroupscanid",clientkey );
create unique index tsysassetlinks_uidx on public.tsysassetlinks ( "vendor",clientkey );
create unique index tsysassetrelationtypes_uidx on public.tsysassetrelationtypes ( "relationtypeid",clientkey );
create unique index tsysassettypeexclude_uidx on public.tsysassettypeexclude ( "assettypeexclusionid",clientkey );
create unique index tsysassettypes_uidx on public.tsysassettypes ( "assettype",clientkey );
create unique index tsysassites_uidx on public.tsysassites ( "servername", "sitename", "netbiosname",clientkey );
create unique index tsysasworkgroups_uidx on public.tsysasworkgroups ( "servername", "workgroup",clientkey );
create unique index tsyschassistypes_uidx on public.tsyschassistypes ( "chassistype",clientkey );
create unique index tsysconfig_uidx on public.tsysconfig ( "config",clientkey );
create unique index tsyscredentials_uidx on public.tsyscredentials ( "credid",clientkey );
create unique index tsyscurrentscans_uidx on public.tsyscurrentscans ( "scanid",clientkey );
create unique index tsyscustomfieldtypes_uidx on public.tsyscustomfieldtypes ( "typeid",clientkey );
create unique index tsyscustomnames_uidx on public.tsyscustomnames ( "customname",clientkey );
create unique index tsysdbobjects_uidx on public.tsysdbobjects ( "dbobjname",clientkey );
create unique index tsysdomaincontrollers_uidx on public.tsysdomaincontrollers ( "domaincontrollerid",clientkey );
create unique index tsysdomaincredentials_uidx on public.tsysdomaincredentials ( "domainname", "credid",clientkey );
create unique index tsysdomainexclude_uidx on public.tsysdomainexclude ( "domainexcludeid",clientkey );
create unique index tsysdonotscan_uidx on public.tsysdonotscan ( "assetexclusionid",clientkey );
create unique index tsyserrors_uidx on public.tsyserrors ( "errorid",clientkey );
create unique index tsyserrortype_uidx on public.tsyserrortype ( "errortype",clientkey );
create unique index tsyseventalerts_uidx on public.tsyseventalerts ( "alertid",clientkey );
create unique index tsyseventfilter_uidx on public.tsyseventfilter ( "filterid",clientkey );
create unique index tsyseventignore_uidx on public.tsyseventignore ( "ignoreid",clientkey );
create unique index tsysfiles_uidx on public.tsysfiles ( "versionid",clientkey );
create unique index tsyshisttables_uidx on public.tsyshisttables ( "display",clientkey );
create unique index tsysipexclude_uidx on public.tsysipexclude ( "servername", "ipaddress",clientkey );
create unique index tsysiplocations_uidx on public.tsysiplocations ( "locationid",clientkey );
create unique index tsysiprangecredentials_uidx on public.tsysiprangecredentials ( "iprangeid", "credid",clientkey );
create unique index tsysipscanranges_uidx on public.tsysipscanranges ( "iprangeid",clientkey );
create unique index tsyslabeldocs_uidx on public.tsyslabeldocs ( "id",clientkey );
create unique index tsyslastscan_uidx on public.tsyslastscan ( "assetid", "cfgcode",clientkey );
create unique index tsyslicensetype_uidx on public.tsyslicensetype ( "licensetype",clientkey );
create unique index tsyslogschedule_uidx on public.tsyslogschedule ( "scheduleid",clientkey );
create unique index tsysmacblacklist_uidx on public.tsysmacblacklist ( "macblacklistid",clientkey );
create unique index tsysmacvendor_uidx on public.tsysmacvendor ( "mac",clientkey );
create unique index tsysmailgroups_uidx on public.tsysmailgroups ( "mailgroupid",clientkey );
create unique index tsysmanufacturertranslation_uidx on public.tsysmanufacturertranslation ( "manufacturertranslationid",clientkey );
create unique index tsysmemorytypes_uidx on public.tsysmemorytypes ( "memorytype",clientkey );
create unique index tsysmodeltranslation_uidx on public.tsysmodeltranslation ( "modeltranslationid",clientkey );
create unique index tsysoidlookup_uidx on public.tsysoidlookup ( "lookupid",clientkey );
create unique index tsysos_uidx on public.tsysos ( "oscode",clientkey );
create unique index tsyspackageexecution_uidx on public.tsyspackageexecution ( "executionid",clientkey );
create unique index tsyspackagelogs_uidx on public.tsyspackagelogs ( "packagelogid",clientkey );
create unique index tsyspackagelogtype_uidx on public.tsyspackagelogtype ( "typeid",clientkey );
create unique index tsyspackages_uidx on public.tsyspackages ( "packageid",clientkey );
create unique index tsyspackageschedule_uidx on public.tsyspackageschedule ( "packagescheduleid",clientkey );
create unique index tsyspackagescheduleasset_uidx on public.tsyspackagescheduleasset ( "scheduleassetid",clientkey );
create unique index tsyspackagestepconditionlinks_uidx on public.tsyspackagestepconditionlinks ( "conditionlinkid",clientkey );
create unique index tsyspackagestepconditionnames_uidx on public.tsyspackagestepconditionnames ( "conditionnameid",clientkey );
create unique index tsyspackagestepconditions_uidx on public.tsyspackagestepconditions ( "conditionid",clientkey );
create unique index tsyspackagestepconditiontypes_uidx on public.tsyspackagestepconditiontypes ( "conditiontypeid",clientkey );
create unique index tsyspackagesteps_uidx on public.tsyspackagesteps ( "packagestepid",clientkey );
create unique index tsyspackagesteptypes_uidx on public.tsyspackagesteptypes ( "steptype",clientkey );
create unique index tsyspages_uidx on public.tsyspages ( "pageid",clientkey );
create unique index tsyspermissions_uidx on public.tsyspermissions ( "permissionid",clientkey );
create unique index tsysregistry_uidx on public.tsysregistry ( "regid",clientkey );
create unique index tsysremotedatabases_uidx on public.tsysremotedatabases ( "remotedatabaseid",clientkey );
create unique index tsysreportpages_uidx on public.tsysreportpages ( "homepageid",clientkey );
create unique index tsysreports_uidx on public.tsysreports ( "reportquery",clientkey );
create unique index tsysrolemembers_uidx on public.tsysrolemembers ( "memberid",clientkey );
create unique index tsysrolepermissions_uidx on public.tsysrolepermissions ( "rolepermissionid",clientkey );
create unique index tsysroles_uidx on public.tsysroles ( "roleid",clientkey );
create unique index tsysscanningmethods_uidx on public.tsysscanningmethods ( "scanningmethodid",clientkey );
create unique index tsysscanqueue_uidx on public.tsysscanqueue ( "scanid",clientkey );
create unique index tsysschedule_uidx on public.tsysschedule ( "scheduleid",clientkey );
create unique index tsysserials_uidx on public.tsysserials ( "product",clientkey );
create unique index tsysserialtranslation_uidx on public.tsysserialtranslation ( "serialtranslationid",clientkey );
create unique index tsyssqllicensetypes_uidx on public.tsyssqllicensetypes ( "licensetype",clientkey );
create unique index tsyssystemskutranslation_uidx on public.tsyssystemskutranslation ( "systemskutranslationid",clientkey );
create unique index tsysuniqueipcredentials_uidx on public.tsysuniqueipcredentials ( "ipaddress", "credid",clientkey );
create unique index tsysuniquewindowscredentials_uidx on public.tsysuniquewindowscredentials ( "assetunique", "credid",clientkey );
create unique index tsysupdate_uidx on public.tsysupdate ( "config",clientkey );
create unique index tsysuseractions_uidx on public.tsysuseractions ( "actionid",clientkey );
create unique index tsysuserschedule_uidx on public.tsysuserschedule ( "scheduleid",clientkey );
create unique index tsysvendorlogos_uidx on public.tsysvendorlogos ( "vendor",clientkey );
create unique index tsysvendoroid_uidx on public.tsysvendoroid ( "oid",clientkey );
create unique index tsyswaitqueue_uidx on public.tsyswaitqueue ( "scanid",clientkey );
create unique index tsyswaittime_uidx on public.tsyswaittime ( "cfgcode",clientkey );
create unique index tsyswarrantyqueue_uidx on public.tsyswarrantyqueue ( "assetid",clientkey );
create unique index tsyswebcontrols_uidx on public.tsyswebcontrols ( "controlid",clientkey );
create unique index tsyswebroles_uidx on public.tsyswebroles ( "authid",clientkey );
create unique index tsyswebtabcontrols_uidx on public.tsyswebtabcontrols ( "tabcontrolid",clientkey );
create unique index tsyswebtabs_uidx on public.tsyswebtabs ( "tabid",clientkey );
create unique index tsyswebusers_uidx on public.tsyswebusers ( "pageid",clientkey );
create unique index tsyswebusersglobaltabs_uidx on public.tsyswebusersglobaltabs ( "pageid", "tabid",clientkey );

-- step 7 - create new foreign key columns in all tables

alter table public."htblagentconfig" add column "agentid_key" bigint not null;
alter table public."htblagents" add column "userid_key" bigint not null;
alter table public."htblagentteam" add column "agentid_key" bigint not null;
alter table public."htblagentteam" add column "teamid_key" bigint not null;
alter table public."htblagentteam" add column "webroleid_key" bigint not null;
alter table public."htblattachements" add column "fileid_key" bigint not null;
alter table public."htblattachements" add column "noteid_key" bigint not null;
alter table public.htblautomaticcloselang add column "autocloseid_key" bigint not null;
alter table public."htblautomaticcloseticketstates" add column "autocloseid_key" bigint not null;
alter table public."htblautomaticcloseticketstates" add column "ticketstateid_key" bigint not null;
alter table public."htblautomaticclosetickettypes" add column "autocloseid_key" bigint not null;
alter table public."htblautomaticclosetickettypes" add column "tickettypeid_key" bigint not null;
alter table public.htblcustomfieldslang add column "fieldid_key" bigint not null;
alter table public."htblcustomfieldvaluelinks" add column "fieldid_key" bigint not null;
alter table public."htblcustomfieldvaluelinks" add column "fieldvalueid_key" bigint not null;
alter table public."htblcustomfieldvalues" add column "fieldid_key" bigint not null;
alter table public."htblcustomticketfilteritems" add column "filterid_key" bigint not null;
alter table public."htblcustomticketfilters" add column "userid_key" bigint not null;
alter table public.htblemailaccountslang add column "accountid_key" bigint not null;
alter table public."htblemailaccountsteams" add column "accountid_key" bigint not null;
alter table public."htblemailaccountsteams" add column "teamid_key" bigint not null;
alter table public."htblemailtemplatesattachements" add column "fileid_key" bigint not null;
alter table public."htblemailtemplatesattachements" add column "templateid_key" bigint not null;
alter table public.htblemailtemplateslang add column "templateid_key" bigint not null;
alter table public."htblemailtemplatespriorities" add column "priority_key" bigint not null;
alter table public."htblemailtemplatespriorities" add column "templateid_key" bigint not null;
alter table public."htblemailtemplatesticketstates" add column "templateid_key" bigint not null;
alter table public."htblemailtemplatesticketstates" add column "ticketstateid_key" bigint not null;
alter table public."htblemailtemplatestickettypes" add column "templateid_key" bigint not null;
alter table public."htblemailtemplatestickettypes" add column "tickettypeid_key" bigint not null;
alter table public."htblemailverification" add column "userid_key" bigint not null;
alter table public."htbleventinfochecks" add column "infoid_key" bigint not null;
alter table public."htbleventreminders" add column "eventid_key" bigint not null;
alter table public."htblfooterattachements" add column "fileid_key" bigint not null;
alter table public."htblfooterattachements" add column "userid_key" bigint not null;
alter table public."htblhistory" add column "agentid2_key" bigint not null;
alter table public."htblhistory" add column "ticketid_key" bigint not null;
alter table public."htblhistory" add column "typeid_key" bigint not null;
alter table public."htblhistory" add column "userid_key" bigint not null;
alter table public."htblhistory" add column "userid2_key" bigint not null;
alter table public."htblhistory" add column "userid3_key" bigint not null;
alter table public."htblknowledgebase" add column "categoryid_key" bigint not null;
alter table public."htblknowledgebaseattachments" add column "fileid_key" bigint not null;
alter table public."htblknowledgebaseattachments" add column "kbid_key" bigint not null;
alter table public.htblknowledgebasecategorieslang add column "categoryid_key" bigint not null;
alter table public."htblknowledgebasecategoriesteams" add column "categoryid_key" bigint not null;
alter table public."htblknowledgebasecategoriesteams" add column "teamid_key" bigint not null;
alter table public.htblknowledgebaselang add column "kbid_key" bigint not null;
alter table public.htblnewslang add column "newsid_key" bigint not null;
alter table public."htblnotehistory" add column "noteid_key" bigint not null;
alter table public."htblnotehistory" add column "userid_key" bigint not null;
alter table public."htblnotes" add column "ticketid_key" bigint not null;
alter table public."htblnotes" add column "userid_key" bigint not null;
alter table public."htblnotificationschecked" add column "histid_key" bigint not null;
alter table public."htblnotificationschecked" add column "userid_key" bigint not null;
alter table public."htbloldticketdata" add column "ticketid_key" bigint not null;
alter table public."htbloldticketdata" add column "userid_key" bigint not null;
alter table public.htblprioritieslang add column "priority_key" bigint not null;
alter table public.htblreportslang add column "reportid_key" bigint not null;
alter table public."htblsavedcustomfilters" add column "userid_key" bigint not null;
alter table public."htblschedule" add column "createdby_key" bigint not null;
alter table public."htblschedule" add column "typeid_key" bigint not null;
alter table public."htblscheduleagents" add column "scheduleid_key" bigint not null;
alter table public."htblscheduleinfo" add column "agentid_key" bigint not null;
alter table public."htblschedulerepeat" add column "scheduleid_key" bigint not null;
alter table public."htblscheduleteams" add column "scheduleid_key" bigint not null;
alter table public."htblscheduleteams" add column "teamid_key" bigint not null;
alter table public.htblscheduletypeslang add column "typeid_key" bigint not null;
alter table public.htblshortcutslang add column "keyid_key" bigint not null;
alter table public."htblshownclientrelations" add column "relationtypeid_key" bigint not null;
alter table public."htblslacompanies" add column "slaid_key" bigint not null;
alter table public."htblsladepartments" add column "slaid_key" bigint not null;
alter table public."htblslapriorities" add column "priority_key" bigint not null;
alter table public."htblslapriorities" add column "slaid_key" bigint not null;
alter table public."htblslasource" add column "slaid_key" bigint not null;
alter table public."htblslasource" add column "sourceid_key" bigint not null;
alter table public."htblslatickettypes" add column "slaid_key" bigint not null;
alter table public."htblslatickettypes" add column "tickettypeid_key" bigint not null;
alter table public."htblslausers" add column "slaid_key" bigint not null;
alter table public."htblslausers" add column "userid_key" bigint not null;
alter table public."htblspecialrulesactions" add column "ruleid_key" bigint not null;
alter table public."htblspecialrulesconditions" add column "ruleid_key" bigint not null;
alter table public."htblspecialrulestaskagents" add column "agentid_key" bigint not null;
alter table public."htblspecialrulestaskagents" add column "ruletaskid_key" bigint not null;
alter table public."htblspecialrulestaskteams" add column "ruletaskid_key" bigint not null;
alter table public."htblspecialrulestaskteams" add column "teamid_key" bigint not null;
alter table public.htblteamslang add column "teamid_key" bigint not null;
alter table public."htbltemplates" add column "categoryid_key" bigint not null;
alter table public.htbltemplateslang add column "templateid_key" bigint not null;
alter table public."htblticket" add column "agentid_key" bigint not null;
alter table public."htblticket" add column "fromuserid_key" bigint not null;
alter table public."htblticket" add column "priority_key" bigint not null;
alter table public."htblticket" add column "ticketstateid_key" bigint not null;
alter table public."htblticketasset" add column "assetid_key" bigint not null;
alter table public."htblticketasset" add column "ticketid_key" bigint not null;
alter table public."htblticketcustomfield" add column "fieldid_key" bigint not null;
alter table public."htblticketcustomfield" add column "ticketid_key" bigint not null;
alter table public."htblticketmerges" add column "newtid_key" bigint not null;
alter table public."htblticketssummary" add column "userid_key" bigint not null;
alter table public."htblticketstates" add column "replacementid_key" bigint not null;
alter table public.htblticketstateslang add column "ticketstateid_key" bigint not null;
alter table public."htblticketsubscribers" add column "agentid_key" bigint not null;
alter table public."htblticketsubscribers" add column "ticketid_key" bigint not null;
alter table public."htblticketteam" add column "teamid_key" bigint not null;
alter table public."htblticketteam" add column "ticketid_key" bigint not null;
alter table public."htbltickettypecustomfield" add column "fieldid_key" bigint not null;
alter table public."htbltickettypecustomfield" add column "tickettypeid_key" bigint not null;
alter table public."htbltickettypes" add column "agentid_key" bigint not null;
alter table public."htbltickettypes" add column "replacementid_key" bigint not null;
alter table public.htbltickettypeslang add column "tickettypeid_key" bigint not null;
alter table public."htbltickettypeteams" add column "teamid_key" bigint not null;
alter table public."htbltickettypeteams" add column "tickettypeid_key" bigint not null;
alter table public."htblticketuserrelation" add column "ticketid_key" bigint not null;
alter table public."htblticketuserrelation" add column "userid_key" bigint not null;
alter table public.tbladcomputers add column "adobjectid_key" bigint not null;
alter table public.tbladcomputers add column "assetid_key" bigint not null;
alter table public.tbladcomputers add column "manageradobjectid_key" bigint not null;
alter table public.tbladgroups add column "adobjectid_key" bigint not null;
alter table public.tbladgroups add column "manageradobjectid_key" bigint not null;
alter table public.tbladmembership add column "childadobjectid_key" bigint not null;
alter table public.tbladmembership add column "parentadobjectid_key" bigint not null;
alter table public.tbladusers add column "adobjectid_key" bigint not null;
alter table public.tbladusers add column "manageradobjectid_key" bigint not null;
alter table public.tblantivirus add column "assetid_key" bigint not null;
alter table public.tblassetcomments add column "assetid_key" bigint not null;
alter table public.tblassetcustom add column "assetid_key" bigint not null;
alter table public.tblassetcustom add column "state_key" bigint not null;
alter table public.tblassetdocs add column "assetid_key" bigint not null;
alter table public.tblassetgrouplink add column "assetgroupid_key" bigint not null;
alter table public.tblassetgrouplink add column "assetid_key" bigint not null;
alter table public.tblassetmacaddress add column "assetid_key" bigint not null;
alter table public.tblassetrelations add column "parentassetid_key" bigint not null;
alter table public.tblassets add column "assettype_key" bigint not null;
alter table public.tblassets add column "locationid_key" bigint not null;
alter table public.tblassetuserrelations add column "assetid_key" bigint not null;
alter table public.tblassetuserrelations add column "userdomain_username_key" bigint not null;
alter table public.tblautorun add column "assetid_key" bigint not null;
alter table public.tblautorun add column "autorununi_key" bigint not null;
alter table public.tblautorun add column "locationid_key" bigint not null;
alter table public.tblautorunhist add column "assetid_key" bigint not null;
alter table public.tblbaseboard add column "assetid_key" bigint not null;
alter table public.tblbaseboardhist add column "assetid_key" bigint not null;
alter table public.tblbattery add column "assetid_key" bigint not null;
alter table public.tblbatteryhist add column "assetid_key" bigint not null;
alter table public.tblbios add column "assetid_key" bigint not null;
alter table public.tblbioshist add column "assetid_key" bigint not null;
alter table public.tblbootconfiguration add column "assetid_key" bigint not null;
alter table public.tblbootconfiguration add column "bootconfigurationuniid_key" bigint not null;
alter table public.tblbootconfigurationhist add column "assetid_key" bigint not null;
alter table public.tblbus add column "assetid_key" bigint not null;
alter table public.tblbushist add column "assetid_key" bigint not null;
alter table public.tblcdromdrive add column "assetid_key" bigint not null;
alter table public.tblcdromdrivehist add column "assetid_key" bigint not null;
alter table public.tblcodecfile add column "assetid_key" bigint not null;
alter table public.tblcodecfilehist add column "assetid_key" bigint not null;
alter table public.tblcomapplication add column "assetid_key" bigint not null;
alter table public.tblcomapplicationhist add column "assetid_key" bigint not null;
alter table public.tblcomponentcategory add column "assetid_key" bigint not null;
alter table public.tblcomponentcategoryhist add column "assetid_key" bigint not null;
alter table public.tblcomputersystem add column "assetid_key" bigint not null;
alter table public.tblcomputersystem add column "domainrole_key" bigint not null;
alter table public.tblcomputersystemhist add column "assetid_key" bigint not null;
alter table public.tblcomputersystemproduct add column "assetid_key" bigint not null;
alter table public.tblcomputersystemproducthist add column "assetid_key" bigint not null;
alter table public.tblcplogoninfo add column "assetid_key" bigint not null;
alter table public.tblcustdevprinter add column "assetid_key" bigint not null;
alter table public.tbldcomapplication add column "assetid_key" bigint not null;
alter table public.tbldcomapplicationhist add column "assetid_key" bigint not null;
alter table public.tbldesktop add column "assetid_key" bigint not null;
alter table public.tbldesktopmonitor add column "assetid_key" bigint not null;
alter table public.tbldesktopmonitorhist add column "assetid_key" bigint not null;
alter table public.tbldiskdrives add column "assetid_key" bigint not null;
alter table public.tbldiskpartition add column "assetid_key" bigint not null;
alter table public.tbldiskpartitionhist add column "assetid_key" bigint not null;
alter table public.tbldisplayconfiguration add column "assetid_key" bigint not null;
alter table public.tbldisplayconfigurationhist add column "assetid_key" bigint not null;
alter table public.tbldisplaycontrollerconfiguration add column "assetid_key" bigint not null;
alter table public.tbldisplaycontrollerconfigurationhist add column "assetid_key" bigint not null;
alter table public.tblencryptablevolume add column "assetid_key" bigint not null;
alter table public.tblenvironment add column "assetid_key" bigint not null;
alter table public.tblerrors add column "assetid_key" bigint not null;
alter table public.tblerrors add column "errortype_key" bigint not null;
alter table public.tblfeature add column "assetid_key" bigint not null;
alter table public.tblfeature add column "featuniid_key" bigint not null;
alter table public.tblfileversions add column "assetid_key" bigint not null;
alter table public.tblfloppy add column "assetid_key" bigint not null;
alter table public.tblfloppyhist add column "assetid_key" bigint not null;
alter table public.tblgroups add column "assetid_key" bigint not null;
alter table public.tblgroups add column "groupid_key" bigint not null;
alter table public.tblgroupshist add column "assetid_key" bigint not null;
alter table public.tblhypervguest add column "assetid_key" bigint not null;
alter table public.tblhypervguestnetwork add column "hypervguestid_key" bigint not null;
alter table public.tblidecontroller add column "assetid_key" bigint not null;
alter table public.tblidecontrollerhist add column "assetid_key" bigint not null;
alter table public.tblieactivex add column "assetid_key" bigint not null;
alter table public.tblieactivexhist add column "assetid_key" bigint not null;
alter table public.tbliebars add column "assetid_key" bigint not null;
alter table public.tbliebarshist add column "assetid_key" bigint not null;
alter table public.tbliebho add column "assetid_key" bigint not null;
alter table public.tbliebhohist add column "assetid_key" bigint not null;
alter table public.tblieextensions add column "assetid_key" bigint not null;
alter table public.tblieextensionshist add column "assetid_key" bigint not null;
alter table public.tblinfrareddevice add column "assetid_key" bigint not null;
alter table public.tblinfrareddevicehist add column "assetid_key" bigint not null;
alter table public.tblkeyboard add column "assetid_key" bigint not null;
alter table public.tblkeyboardhist add column "assetid_key" bigint not null;
alter table public.tbllicenses add column "licensetype_key" bigint not null;
alter table public.tbllinuxbaseboard add column "assetid_key" bigint not null;
alter table public.tbllinuxbios add column "assetid_key" bigint not null;
alter table public.tbllinuxenclosure add column "assetid_key" bigint not null;
alter table public.tbllinuxgraphicscards add column "assetid_key" bigint not null;
alter table public.tbllinuxharddisks add column "assetid_key" bigint not null;
alter table public.tbllinuxmemorycontroller add column "assetid_key" bigint not null;
alter table public.tbllinuxmemorydevices add column "assetid_key" bigint not null;
alter table public.tbllinuxmemorymodules add column "assetid_key" bigint not null;
alter table public.tbllinuxnetworkdetection add column "assetid_key" bigint not null;
alter table public.tbllinuxopticaldrives add column "assetid_key" bigint not null;
alter table public.tbllinuxpcicards add column "assetid_key" bigint not null;
alter table public.tbllinuxprocessors add column "assetid_key" bigint not null;
alter table public.tbllinuxsoftware add column "assetid_key" bigint not null;
alter table public.tbllinuxsoftware add column "softwareuniid_key" bigint not null;
alter table public.tbllinuxsoundcards add column "assetid_key" bigint not null;
alter table public.tbllinuxsystem add column "assetid_key" bigint not null;
alter table public.tbllinuxvolumes add column "assetid_key" bigint not null;
alter table public.tblmacapplications add column "assetid_key" bigint not null;
alter table public.tblmacdiscburning add column "assetid_key" bigint not null;
alter table public.tblmacdisplays add column "assetid_key" bigint not null;
alter table public.tblmacfirewires add column "assetid_key" bigint not null;
alter table public.tblmachwoverview add column "assetid_key" bigint not null;
alter table public.tblmacmemory add column "assetid_key" bigint not null;
alter table public.tblmacmodems add column "assetid_key" bigint not null;
alter table public.tblmacnetwork add column "assetid_key" bigint not null;
alter table public.tblmacnetworkvolumes add column "assetid_key" bigint not null;
alter table public.tblmacosinfo add column "assetid_key" bigint not null;
alter table public.tblmacpartitions add column "assetid_key" bigint not null;
alter table public.tblmappeddrives add column "assetid_key" bigint not null;
alter table public.tblmonitor add column "assetid_key" bigint not null;
alter table public.tblmonitorhist add column "assetid_key" bigint not null;
alter table public.tblnetwork add column "assetid_key" bigint not null;
alter table public.tblnetworkadapter add column "assetid_key" bigint not null;
alter table public.tblnetworkclient add column "assetid_key" bigint not null;
alter table public.tblnetworkclienthist add column "assetid_key" bigint not null;
alter table public.tblnetworkhist add column "assetid_key" bigint not null;
alter table public.tblntlog add column "assetid_key" bigint not null;
alter table public.tblntlog add column "logfileid_key" bigint not null;
alter table public.tblntlog add column "loguserid_key" bigint not null;
alter table public.tblntlog add column "messageid_key" bigint not null;
alter table public.tblntlog add column "sourcenameid_key" bigint not null;
alter table public.tblonboarddevice add column "assetid_key" bigint not null;
alter table public.tblonboarddevicehist add column "assetid_key" bigint not null;
alter table public.tbloperatingsystem add column "assetid_key" bigint not null;
alter table public.tbloperatingsystemhist add column "assetid_key" bigint not null;
alter table public.tblosrecoveryconfiguration add column "assetid_key" bigint not null;
alter table public.tblosrecoveryconfigurationhist add column "assetid_key" bigint not null;
alter table public.tblossublicensedocs add column "oslicenseidid_key" bigint not null;
alter table public.tblossublicenses add column "oslicenseidid_key" bigint not null;
alter table public.tblossublicensesorders add column "oslicenseidid_key" bigint not null;
alter table public.tblpagefile add column "assetid_key" bigint not null;
alter table public.tblpagefilehist add column "assetid_key" bigint not null;
alter table public.tblparallelport add column "assetid_key" bigint not null;
alter table public.tblparallelporthist add column "assetid_key" bigint not null;
alter table public.tblpcmciacontroller add column "assetid_key" bigint not null;
alter table public.tblpcmciacontrollerhist add column "assetid_key" bigint not null;
alter table public.tblphysicalmemory add column "assetid_key" bigint not null;
alter table public.tblphysicalmemoryarray add column "assetid_key" bigint not null;
alter table public.tblphysicalmemoryarrayhist add column "assetid_key" bigint not null;
alter table public.tblphysicalmemoryhist add column "assetid_key" bigint not null;
alter table public.tblpointingdevice add column "assetid_key" bigint not null;
alter table public.tblpointingdevicehist add column "assetid_key" bigint not null;
alter table public.tblportablebattery add column "assetid_key" bigint not null;
alter table public.tblportablebatteryhist add column "assetid_key" bigint not null;
alter table public.tblportconnector add column "assetid_key" bigint not null;
alter table public.tblportconnectorhist add column "assetid_key" bigint not null;
alter table public.tblpotsmodem add column "assetid_key" bigint not null;
alter table public.tblpotsmodemhist add column "assetid_key" bigint not null;
alter table public.tblprinters add column "assetid_key" bigint not null;
alter table public.tblprintershist add column "assetid_key" bigint not null;
alter table public.tblprocesses add column "assetid_key" bigint not null;
alter table public.tblprocessor add column "assetid_key" bigint not null;
alter table public.tblprocessorhist add column "assetid_key" bigint not null;
alter table public.tblproxy add column "assetid_key" bigint not null;
alter table public.tblquickfixengineering add column "assetid_key" bigint not null;
alter table public.tblquickfixengineering add column "installedbyid_key" bigint not null;
alter table public.tblquickfixengineering add column "qfeid_key" bigint not null;
alter table public.tblquickfixengineeringhist add column "assetid_key" bigint not null;
alter table public.tblregistry add column "assetid_key" bigint not null;
alter table public.tblscanhistory add column "assetid_key" bigint not null;
alter table public.tblscanhistory add column "scanningmethodid_key" bigint not null;
alter table public.tblscsicontroller add column "assetid_key" bigint not null;
alter table public.tblscsicontrollerhist add column "assetid_key" bigint not null;
alter table public.tblserialnumber add column "assetid_key" bigint not null;
alter table public.tblserialport add column "assetid_key" bigint not null;
alter table public.tblserialporthist add column "assetid_key" bigint not null;
alter table public.tblservices add column "assetid_key" bigint not null;
alter table public.tblservices add column "serviceuniqueid_key" bigint not null;
alter table public.tblservices add column "startid_key" bigint not null;
alter table public.tblservices add column "stateid_key" bigint not null;
alter table public.tblsharepermissions add column "shareid_key" bigint not null;
alter table public.tblshares add column "assetid_key" bigint not null;
alter table public.tblshares add column "shareuniqueid_key" bigint not null;
alter table public.tblshareshist add column "assetid_key" bigint not null;
alter table public.tblshareshist add column "shareuniqueid_key" bigint not null;
alter table public.tblsnmpassetmac add column "assetid_key" bigint not null;
alter table public.tblsnmpinfo add column "assetid_key" bigint not null;
alter table public.tblsoftware add column "assetid_key" bigint not null;
alter table public.tblsoftware add column "softid_key" bigint not null;
alter table public.tblsoftwarehist add column "assetid_key" bigint not null;
alter table public.tblsounddevice add column "assetid_key" bigint not null;
alter table public.tblsounddevicehist add column "assetid_key" bigint not null;
alter table public.tblsqldatabases add column "sqlserverid_key" bigint not null;
alter table public.tblsqllicensedocs add column "licenseid_key" bigint not null;
alter table public.tblsqllicenses add column "licensetype_key" bigint not null;
alter table public.tblsqllicensesorders add column "licenseid_key" bigint not null;
alter table public.tblsqllicensesserverorders add column "licenseid_key" bigint not null;
alter table public.tblsqlservers add column "assetid_key" bigint not null;
alter table public.tblsqlsubservers add column "licenseid_key" bigint not null;
alter table public.tblsublicensedocs add column "licenseidid_key" bigint not null;
alter table public.tblsublicenses add column "licenseidid_key" bigint not null;
alter table public.tblsublicensesorders add column "licenseidid_key" bigint not null;
alter table public.tblsystemenclosure add column "assetid_key" bigint not null;
alter table public.tblsystemenclosurehist add column "assetid_key" bigint not null;
alter table public.tbltapedrive add column "assetid_key" bigint not null;
alter table public.tbltapedrivehist add column "assetid_key" bigint not null;
alter table public.tbltpm add column "assetid_key" bigint not null;
alter table public.tblups add column "assetid_key" bigint not null;
alter table public.tbluptime add column "assetid_key" bigint not null;
alter table public.tblusbcontroller add column "assetid_key" bigint not null;
alter table public.tblusbcontrollerhist add column "assetid_key" bigint not null;
alter table public.tblusbdevices add column "assetid_key" bigint not null;
alter table public.tblusers add column "assetid_key" bigint not null;
alter table public.tblusershist add column "assetid_key" bigint not null;
alter table public.tblusersingroup add column "assetid_key" bigint not null;
alter table public.tblusersingrouphist add column "assetid_key" bigint not null;
alter table public.tblvideocontroller add column "assetid_key" bigint not null;
alter table public.tblvideocontrollerhist add column "assetid_key" bigint not null;
alter table public.tblvmwaredisk add column "assetid_key" bigint not null;
alter table public.tblvmwareguest add column "assetid_key" bigint not null;
alter table public.tblvmwareguestnetwork add column "guestid_key" bigint not null;
alter table public.tblvmwareinfo add column "assetid_key" bigint not null;
alter table public.tblvmwarenetwork add column "assetid_key" bigint not null;
alter table public.tblvolume add column "assetid_key" bigint not null;
alter table public.tblvproamt add column "assetid_key" bigint not null;
alter table public.tblwarranty add column "assetid_key" bigint not null;
alter table public.tblwarrantydetails add column "warrantyid_key" bigint not null;
alter table public.tblwinsat add column "assetid_key" bigint not null;
alter table public.tsysadsischedule add column "servername_key" bigint not null;
alter table public.tsysalertschedule add column "scheduleid_key" bigint not null;
alter table public.tsysasdomains add column "servername_key" bigint not null;
alter table public.tsysasou add column "servername_key" bigint not null;
alter table public.tsysassetgroupfilter add column "assetgroupid_key" bigint not null;
alter table public.tsysassetgroupscan add column "assetgroupid_key" bigint not null;
alter table public.tsysassetgroupscan add column "report_key" bigint not null;
alter table public.tsysassetgroupscan add column "servername_key" bigint not null;
alter table public.tsysassettypeexclude add column "assettype_key" bigint not null;
alter table public.tsysassettypeexclude add column "servername_key" bigint not null;
alter table public.tsysassites add column "servername_key" bigint not null;
alter table public.tsysasworkgroups add column "servername_key" bigint not null;
alter table public.tsyscurrentscans add column "scanserver_key" bigint not null;
alter table public.tsysdomaincontrollers add column "servername_key" bigint not null;
alter table public.tsysdomaincredentials add column "credid_key" bigint not null;
alter table public.tsysdomainexclude add column "servername_key" bigint not null;
alter table public.tsysdonotscan add column "servername_key" bigint not null;
alter table public."tsyserrors" add column "errortype_key" bigint not null;
alter table public.tsyseventfilter add column "alertid_key" bigint not null;
alter table public.tsysipexclude add column "servername_key" bigint not null;
alter table public.tsysiprangecredentials add column "credid_key" bigint not null;
alter table public.tsysiprangecredentials add column "iprangeid_key" bigint not null;
alter table public.tsysipscanranges add column "servername_key" bigint not null;
alter table public.tsyslastscan add column "assetid_key" bigint not null;
alter table public.tsyslastscan add column "cfgcode_key" bigint not null;
alter table public."tsyslogschedule" add column "servername_key" bigint not null;
alter table public.tsysmailconfig add column "servername_key" bigint not null;
alter table public.tsysoidlookup add column "itemtype_key" bigint not null;
alter table public.tsyspackageexecution add column "packagescheduleid_key" bigint not null;
alter table public.tsyspackageexecution add column "scanserver_key" bigint not null;
alter table public.tsyspackagelogs add column "servername_key" bigint not null;
alter table public.tsyspackagelogs add column "typeid_key" bigint not null;
alter table public.tsyspackageschedule add column "assetgroupid_key" bigint not null;
alter table public.tsyspackageschedule add column "packageid_key" bigint not null;
alter table public.tsyspackageschedule add column "scheduleid_key" bigint not null;
alter table public.tsyspackagescheduleasset add column "assetid_key" bigint not null;
alter table public.tsyspackagescheduleasset add column "scheduleid_key" bigint not null;
alter table public.tsyspackagestepconditionlinks add column "conditionnameid_key" bigint not null;
alter table public.tsyspackagestepconditionlinks add column "conditiontypeid_key" bigint not null;
alter table public.tsyspackagestepconditions add column "conditionnameid_key" bigint not null;
alter table public.tsyspackagestepconditions add column "conditiontypeid_key" bigint not null;
alter table public.tsyspackagestepconditions add column "packagestepid_key" bigint not null;
alter table public.tsyspackagesteps add column "packageid_key" bigint not null;
alter table public.tsyspackagesteps add column "steptype_key" bigint not null;
alter table public."tsysreportpages" add column "homepagequery_key" bigint not null;
alter table public."tsysreportpages" add column "pageid_key" bigint not null;
alter table public.tsysrolemembers add column "roleid_key" bigint not null;
alter table public.tsysrolepermissions add column "permissionid_key" bigint not null;
alter table public.tsysrolepermissions add column "roleid_key" bigint not null;
alter table public."tsysscanqueue" add column "servername_key" bigint not null;
alter table public.tsysuniqueipcredentials add column "credid_key" bigint not null;
alter table public.tsysuniquewindowscredentials add column "credid_key" bigint not null;
alter table public.tsysuserschedule add column "servername_key" bigint not null;
alter table public.tsyswaitqueue add column "servername_key" bigint not null;
alter table public.tsyswarrantyqueue add column "assetid_key" bigint not null;
alter table public.tsyswebtabcontrols add column "controlid_key" bigint not null;
alter table public.tsyswebtabcontrols add column "tabid_key" bigint not null;
alter table public.tsyswebtabs add column "pageid_key" bigint not null;
alter table public.tsyswebusersglobaltabs add column "tabid_key" bigint not null;

-- step 8 remove all foreign keys and primary keys

alter table "public"."htblagentconfig" drop constraint "htblagentconfig_agentid_fkey";
alter table "public"."htblagents" drop constraint "htblagents_userid_fkey";
alter table "public"."htblagentteam" drop constraint "htblagentteam_agentid_fkey";
alter table "public"."htblagentteam" drop constraint "htblagentteam_teamid_fkey";
alter table "public"."htblagentteam" drop constraint "htblagentteam_webroleid_fkey";
alter table "public"."htblattachements" drop constraint "htblattachements_fileid_fkey";
alter table "public"."htblattachements" drop constraint "htblattachements_noteid_fkey";
alter table "public"."htblautomaticcloselang" drop constraint "htblautomaticcloselang_autocloseid_fkey";
alter table "public"."htblautomaticcloseticketstates" drop constraint "htblautomaticcloseticketstates_autocloseid_fkey";
alter table "public"."htblautomaticcloseticketstates" drop constraint "htblautomaticcloseticketstates_ticketstateid_fkey";
alter table "public"."htblautomaticclosetickettypes" drop constraint "htblautomaticclosetickettypes_autocloseid_fkey";
alter table "public"."htblautomaticclosetickettypes" drop constraint "htblautomaticclosetickettypes_tickettypeid_fkey";
alter table "public"."htblcustomfieldslang" drop constraint "htblcustomfieldslang_fieldid_fkey";
alter table "public"."htblcustomfieldvaluelinks" drop constraint "htblcustomfieldvaluelinks_fieldid_fkey";
alter table "public"."htblcustomfieldvaluelinks" drop constraint "htblcustomfieldvaluelinks_fieldvalueid_fkey";
alter table "public"."htblcustomfieldvalues" drop constraint "htblcustomfieldvalues_fieldid_fkey";
alter table "public"."htblcustomticketfilteritems" drop constraint "htblcustomticketfilteritems_filterid_fkey";
alter table "public"."htblcustomticketfilters" drop constraint "htblcustomticketfilters_userid_fkey";
alter table "public"."htblemailaccountslang" drop constraint "htblemailaccountslang_accountid_fkey";
alter table "public"."htblemailaccountsteams" drop constraint "htblemailaccountsteams_accountid_fkey";
alter table "public"."htblemailaccountsteams" drop constraint "htblemailaccountsteams_teamid_fkey";
alter table "public"."htblemailtemplatesattachements" drop constraint "htblemailtemplatesattachements_fileid_fkey";
alter table "public"."htblemailtemplatesattachements" drop constraint "htblemailtemplatesattachements_templateid_fkey";
alter table "public"."htblemailtemplateslang" drop constraint "htblemailtemplateslang_templateid_fkey";
alter table "public"."htblemailtemplatespriorities" drop constraint "htblemailtemplatespriorities_priority_fkey";
alter table "public"."htblemailtemplatespriorities" drop constraint "htblemailtemplatespriorities_templateid_fkey";
alter table "public"."htblemailtemplatesticketstates" drop constraint "htblemailtemplatesticketstates_templateid_fkey";
alter table "public"."htblemailtemplatesticketstates" drop constraint "htblemailtemplatesticketstates_ticketstateid_fkey";
alter table "public"."htblemailtemplatestickettypes" drop constraint "htblemailtemplatestickettypes_templateid_fkey";
alter table "public"."htblemailtemplatestickettypes" drop constraint "htblemailtemplatestickettypes_tickettypeid_fkey";
alter table "public"."htblemailverification" drop constraint "htblemailverification_userid_fkey";
alter table "public"."htbleventinfochecks" drop constraint "htbleventinfochecks_infoid_fkey";
alter table "public"."htbleventreminders" drop constraint "htbleventreminders_eventid_fkey";
alter table "public"."htblfooterattachements" drop constraint "htblfooterattachements_fileid_fkey";
alter table "public"."htblfooterattachements" drop constraint "htblfooterattachements_userid_fkey";
alter table "public"."htblhistory" drop constraint "htblhistory_agentid2_fkey";
alter table "public"."htblhistory" drop constraint "htblhistory_ticketid_fkey";
alter table "public"."htblhistory" drop constraint "htblhistory_typeid_fkey";
alter table "public"."htblhistory" drop constraint "htblhistory_userid2_fkey";
alter table "public"."htblhistory" drop constraint "htblhistory_userid3_fkey";
alter table "public"."htblhistory" drop constraint "htblhistory_userid_fkey";
alter table "public"."htblknowledgebase" drop constraint "htblknowledgebase_categoryid_fkey";
alter table "public"."htblknowledgebaseattachments" drop constraint "htblknowledgebaseattachments_fileid_fkey";
alter table "public"."htblknowledgebaseattachments" drop constraint "htblknowledgebaseattachments_kbid_fkey";
alter table "public"."htblknowledgebasecategorieslang" drop constraint "htblknowledgebasecategorieslang_categoryid_fkey";
alter table "public"."htblknowledgebasecategoriesteams" drop constraint "htblknowledgebasecategoriesteams_categoryid_fkey";
alter table "public"."htblknowledgebasecategoriesteams" drop constraint "htblknowledgebasecategoriesteams_teamid_fkey";
alter table "public"."htblknowledgebaselang" drop constraint "htblknowledgebaselang_kbid_fkey";
alter table "public"."htblnewslang" drop constraint "htblnewslang_newsid_fkey";
alter table "public"."htblnotehistory" drop constraint "htblnotehistory_noteid_fkey";
alter table "public"."htblnotehistory" drop constraint "htblnotehistory_userid_fkey";
alter table "public"."htblnotes" drop constraint "htblnotes_ticketid_fkey";
alter table "public"."htblnotes" drop constraint "htblnotes_userid_fkey";
alter table "public"."htblnotificationschecked" drop constraint "htblnotificationschecked_histid_fkey";
alter table "public"."htblnotificationschecked" drop constraint "htblnotificationschecked_userid_fkey";
alter table "public"."htbloldticketdata" drop constraint "htbloldticketdata_ticketid_fkey";
alter table "public"."htbloldticketdata" drop constraint "htbloldticketdata_userid_fkey";
alter table "public"."htblprioritieslang" drop constraint "htblprioritieslang_priority_fkey";
alter table "public"."htblreportslang" drop constraint "htblreportslang_reportid_fkey";
alter table "public"."htblsavedcustomfilters" drop constraint "htblsavedcustomfilters_userid_fkey";
alter table "public"."htblschedule" drop constraint "htblschedule_createdby_fkey";
alter table "public"."htblschedule" drop constraint "htblschedule_typeid_fkey";
alter table "public"."htblscheduleagents" drop constraint "htblscheduleagents_scheduleid_fkey";
alter table "public"."htblscheduleinfo" drop constraint "htblscheduleinfo_agentid_fkey";
alter table "public"."htblschedulerepeat" drop constraint "htblschedulerepeat_scheduleid_fkey";
alter table "public"."htblscheduleteams" drop constraint "htblscheduleteams_scheduleid_fkey";
alter table "public"."htblscheduleteams" drop constraint "htblscheduleteams_teamid_fkey";
alter table "public"."htblscheduletypeslang" drop constraint "htblscheduletypeslang_typeid_fkey";
alter table "public"."htblshortcutslang" drop constraint "htblshortcutslang_keyid_fkey";
alter table "public"."htblshownclientrelations" drop constraint "htblshownclientrelations_relationtypeid_fkey";
alter table "public"."htblslacompanies" drop constraint "htblslacompanies_slaid_fkey";
alter table "public"."htblsladepartments" drop constraint "htblsladepartments_slaid_fkey";
alter table "public"."htblslapriorities" drop constraint "htblslapriorities_priority_fkey";
alter table "public"."htblslapriorities" drop constraint "htblslapriorities_slaid_fkey";
alter table "public"."htblslasource" drop constraint "htblslasource_slaid_fkey";
alter table "public"."htblslasource" drop constraint "htblslasource_sourceid_fkey";
alter table "public"."htblslatickettypes" drop constraint "htblslatickettypes_slaid_fkey";
alter table "public"."htblslatickettypes" drop constraint "htblslatickettypes_tickettypeid_fkey";
alter table "public"."htblslausers" drop constraint "htblslausers_slaid_fkey";
alter table "public"."htblslausers" drop constraint "htblslausers_userid_fkey";
alter table "public"."htblspecialrulesactions" drop constraint "htblspecialrulesactions_ruleid_fkey";
alter table "public"."htblspecialrulesconditions" drop constraint "htblspecialrulesconditions_ruleid_fkey";
alter table "public"."htblspecialrulestaskagents" drop constraint "htblspecialrulestaskagents_agentid_fkey";
alter table "public"."htblspecialrulestaskagents" drop constraint "htblspecialrulestaskagents_ruletaskid_fkey";
alter table "public"."htblspecialrulestaskteams" drop constraint "htblspecialrulestaskteams_ruletaskid_fkey";
alter table "public"."htblspecialrulestaskteams" drop constraint "htblspecialrulestaskteams_teamid_fkey";
alter table "public"."htblteamslang" drop constraint "htblteamslang_teamid_fkey";
alter table "public"."htbltemplates" drop constraint "htbltemplates_categoryid_fkey";
alter table "public"."htbltemplateslang" drop constraint "htbltemplateslang_templateid_fkey";
alter table "public"."htblticket" drop constraint "htblticket_agentid_fkey";
alter table "public"."htblticket" drop constraint "htblticket_fromuserid_fkey";
alter table "public"."htblticket" drop constraint "htblticket_priority_fkey";
alter table "public"."htblticket" drop constraint "htblticket_ticketstateid_fkey";
alter table "public"."htblticketasset" drop constraint "htblticketasset_assetid_fkey";
alter table "public"."htblticketasset" drop constraint "htblticketasset_ticketid_fkey";
alter table "public"."htblticketcustomfield" drop constraint "htblticketcustomfield_fieldid_fkey";
alter table "public"."htblticketcustomfield" drop constraint "htblticketcustomfield_ticketid_fkey";
alter table "public"."htblticketmerges" drop constraint "htblticketmerges_newtid_fkey";
alter table "public"."htblticketssummary" drop constraint "htblticketssummary_userid_fkey";
-- alter table "public"."htblticketstates" drop constraint "htblticketstates_replacementid_fkey";
alter table "public"."htblticketstateslang" drop constraint "htblticketstateslang_ticketstateid_fkey";
alter table "public"."htblticketsubscribers" drop constraint "htblticketsubscribers_agentid_fkey";
alter table "public"."htblticketsubscribers" drop constraint "htblticketsubscribers_ticketid_fkey";
alter table "public"."htblticketteam" drop constraint "htblticketteam_teamid_fkey";
alter table "public"."htblticketteam" drop constraint "htblticketteam_ticketid_fkey";
alter table "public"."htbltickettypecustomfield" drop constraint "htbltickettypecustomfield_fieldid_fkey";
alter table "public"."htbltickettypecustomfield" drop constraint "htbltickettypecustomfield_tickettypeid_fkey";
alter table "public"."htbltickettypes" drop constraint "htbltickettypes_agentid_fkey";
-- alter table "public"."htbltickettypes" drop constraint "htbltickettypes_replacementid_fkey";
alter table "public"."htbltickettypeslang" drop constraint "htbltickettypeslang_tickettypeid_fkey";
alter table "public"."htbltickettypeteams" drop constraint "htbltickettypeteams_teamid_fkey";
alter table "public"."htbltickettypeteams" drop constraint "htbltickettypeteams_tickettypeid_fkey";
alter table "public"."htblticketuserrelation" drop constraint "htblticketuserrelation_ticketid_fkey";
alter table "public"."htblticketuserrelation" drop constraint "htblticketuserrelation_userid_fkey";
alter table "public"."tbladcomputers" drop constraint "tbladcomputers_adobjectid_fkey";
alter table "public"."tbladcomputers" drop constraint "tbladcomputers_assetid_fkey";
alter table "public"."tbladcomputers" drop constraint "tbladcomputers_manageradobjectid_fkey";
alter table "public"."tbladgroups" drop constraint "tbladgroups_adobjectid_fkey";
alter table "public"."tbladgroups" drop constraint "tbladgroups_manageradobjectid_fkey";
alter table "public"."tbladmembership" drop constraint "tbladmembership_childadobjectid_fkey";
alter table "public"."tbladmembership" drop constraint "tbladmembership_parentadobjectid_fkey";
alter table "public"."tbladusers" drop constraint "tbladusers_adobjectid_fkey";
alter table "public"."tbladusers" drop constraint "tbladusers_manageradobjectid_fkey";
alter table "public"."tblantivirus" drop constraint "tblantivirus_assetid_fkey";
alter table "public"."tblassetcomments" drop constraint "tblassetcomments_assetid_fkey";
alter table "public"."tblassetcustom" drop constraint "tblassetcustom_assetid_fkey";
alter table "public"."tblassetcustom" drop constraint "tblassetcustom_state_fkey";
alter table "public"."tblassetdocs" drop constraint "tblassetdocs_assetid_fkey";
alter table "public"."tblassetgrouplink" drop constraint "tblassetgrouplink_assetgroupid_fkey";
alter table "public"."tblassetgrouplink" drop constraint "tblassetgrouplink_assetid_fkey";
alter table "public"."tblassetmacaddress" drop constraint "tblassetmacaddress_assetid_fkey";
alter table "public"."tblassetrelations" drop constraint "tblassetrelations_parentassetid_fkey";
alter table "public"."tblassets" drop constraint "tblassets_assettype_fkey";
alter table "public"."tblassets" drop constraint "tblassets_locationid_fkey";
alter table "public"."tblassetuserrelations" drop constraint "tblassetuserrelations_assetid_fkey";
alter table "public"."tblassetuserrelations" drop constraint "tblassetuserrelations_username_fkey";
alter table "public"."tblautorun" drop constraint "tblautorun_assetid_fkey";
alter table "public"."tblautorun" drop constraint "tblautorun_autorununi_fkey";
alter table "public"."tblautorun" drop constraint "tblautorun_locationid_fkey";
alter table "public"."tblautorunhist" drop constraint "tblautorunhist_assetid_fkey";
alter table "public"."tblbaseboard" drop constraint "tblbaseboard_assetid_fkey";
alter table "public"."tblbaseboardhist" drop constraint "tblbaseboardhist_assetid_fkey";
alter table "public"."tblbattery" drop constraint "tblbattery_assetid_fkey";
alter table "public"."tblbatteryhist" drop constraint "tblbatteryhist_assetid_fkey";
alter table "public"."tblbios" drop constraint "tblbios_assetid_fkey";
alter table "public"."tblbioshist" drop constraint "tblbioshist_assetid_fkey";
alter table "public"."tblbootconfiguration" drop constraint "tblbootconfiguration_assetid_fkey";
alter table "public"."tblbootconfiguration" drop constraint "tblbootconfiguration_bootconfigurationuniid_fkey";
alter table "public"."tblbootconfigurationhist" drop constraint "tblbootconfigurationhist_assetid_fkey";
alter table "public"."tblbus" drop constraint "tblbus_assetid_fkey";
alter table "public"."tblbushist" drop constraint "tblbushist_assetid_fkey";
alter table "public"."tblcdromdrive" drop constraint "tblcdromdrive_assetid_fkey";
alter table "public"."tblcdromdrivehist" drop constraint "tblcdromdrivehist_assetid_fkey";
alter table "public"."tblcodecfile" drop constraint "tblcodecfile_assetid_fkey";
alter table "public"."tblcodecfilehist" drop constraint "tblcodecfilehist_assetid_fkey";
alter table "public"."tblcomapplication" drop constraint "tblcomapplication_assetid_fkey";
alter table "public"."tblcomapplicationhist" drop constraint "tblcomapplicationhist_assetid_fkey";
alter table "public"."tblcomponentcategory" drop constraint "tblcomponentcategory_assetid_fkey";
alter table "public"."tblcomponentcategoryhist" drop constraint "tblcomponentcategoryhist_assetid_fkey";
alter table "public"."tblcomputersystem" drop constraint "tblcomputersystem_assetid_fkey";
alter table "public"."tblcomputersystem" drop constraint "tblcomputersystem_domainrole_fkey";
alter table "public"."tblcomputersystemhist" drop constraint "tblcomputersystemhist_assetid_fkey";
alter table "public"."tblcomputersystemproduct" drop constraint "tblcomputersystemproduct_assetid_fkey";
alter table "public"."tblcomputersystemproducthist" drop constraint "tblcomputersystemproducthist_assetid_fkey";
alter table "public"."tblcplogoninfo" drop constraint "tblcplogoninfo_assetid_fkey";
alter table "public"."tblcustdevprinter" drop constraint "tblcustdevprinter_assetid_fkey";
alter table "public"."tbldcomapplication" drop constraint "tbldcomapplication_assetid_fkey";
alter table "public"."tbldcomapplicationhist" drop constraint "tbldcomapplicationhist_assetid_fkey";
alter table "public"."tbldesktop" drop constraint "tbldesktop_assetid_fkey";
alter table "public"."tbldesktopmonitor" drop constraint "tbldesktopmonitor_assetid_fkey";
alter table "public"."tbldesktopmonitorhist" drop constraint "tbldesktopmonitorhist_assetid_fkey";
alter table "public"."tbldiskdrives" drop constraint "tbldiskdrives_assetid_fkey";
alter table "public"."tbldiskpartition" drop constraint "tbldiskpartition_assetid_fkey";
alter table "public"."tbldiskpartitionhist" drop constraint "tbldiskpartitionhist_assetid_fkey";
alter table "public"."tbldisplayconfiguration" drop constraint "tbldisplayconfiguration_assetid_fkey";
alter table "public"."tbldisplayconfigurationhist" drop constraint "tbldisplayconfigurationhist_assetid_fkey";
alter table "public"."tbldisplaycontrollerconfiguration" drop constraint "tbldisplaycontrollerconfiguration_assetid_fkey";
alter table "public"."tbldisplaycontrollerconfigurationhist" drop constraint "tbldisplaycontrollerconfigurationhist_assetid_fkey";
alter table "public"."tblencryptablevolume" drop constraint "tblencryptablevolume_assetid_fkey";
alter table "public"."tblenvironment" drop constraint "tblenvironment_assetid_fkey";
alter table "public"."tblerrors" drop constraint "tblerrors_assetid_fkey";
alter table "public"."tblerrors" drop constraint "tblerrors_errortype_fkey";
alter table "public"."tblfeature" drop constraint "tblfeature_assetid_fkey";
alter table "public"."tblfeature" drop constraint "tblfeature_featuniid_fkey";
alter table "public"."tblfileversions" drop constraint "tblfileversions_assetid_fkey";
alter table "public"."tblfloppy" drop constraint "tblfloppy_assetid_fkey";
alter table "public"."tblfloppyhist" drop constraint "tblfloppyhist_assetid_fkey";
alter table "public"."tblgroups" drop constraint "tblgroups_assetid_fkey";
alter table "public"."tblgroups" drop constraint "tblgroups_groupid_fkey";
alter table "public"."tblgroupshist" drop constraint "tblgroupshist_assetid_fkey";
alter table "public"."tblhypervguest" drop constraint "tblhypervguest_assetid_fkey";
alter table "public"."tblhypervguestnetwork" drop constraint "tblhypervguestnetwork_hypervguestid_fkey";
alter table "public"."tblidecontroller" drop constraint "tblidecontroller_assetid_fkey";
alter table "public"."tblidecontrollerhist" drop constraint "tblidecontrollerhist_assetid_fkey";
alter table "public"."tblieactivex" drop constraint "tblieactivex_assetid_fkey";
alter table "public"."tblieactivexhist" drop constraint "tblieactivexhist_assetid_fkey";
alter table "public"."tbliebars" drop constraint "tbliebars_assetid_fkey";
alter table "public"."tbliebarshist" drop constraint "tbliebarshist_assetid_fkey";
alter table "public"."tbliebho" drop constraint "tbliebho_assetid_fkey";
alter table "public"."tbliebhohist" drop constraint "tbliebhohist_assetid_fkey";
alter table "public"."tblieextensions" drop constraint "tblieextensions_assetid_fkey";
alter table "public"."tblieextensionshist" drop constraint "tblieextensionshist_assetid_fkey";
alter table "public"."tblinfrareddevice" drop constraint "tblinfrareddevice_assetid_fkey";
alter table "public"."tblinfrareddevicehist" drop constraint "tblinfrareddevicehist_assetid_fkey";
alter table "public"."tblkeyboard" drop constraint "tblkeyboard_assetid_fkey";
alter table "public"."tblkeyboardhist" drop constraint "tblkeyboardhist_assetid_fkey";
alter table "public"."tbllicenses" drop constraint "tbllicenses_licensetype_fkey";
alter table "public"."tbllinuxbaseboard" drop constraint "tbllinuxbaseboard_assetid_fkey";
alter table "public"."tbllinuxbios" drop constraint "tbllinuxbios_assetid_fkey";
alter table "public"."tbllinuxenclosure" drop constraint "tbllinuxenclosure_assetid_fkey";
alter table "public"."tbllinuxgraphicscards" drop constraint "tbllinuxgraphicscards_assetid_fkey";
alter table "public"."tbllinuxharddisks" drop constraint "tbllinuxharddisks_assetid_fkey";
alter table "public"."tbllinuxmemorycontroller" drop constraint "tbllinuxmemorycontroller_assetid_fkey";
alter table "public"."tbllinuxmemorydevices" drop constraint "tbllinuxmemorydevices_assetid_fkey";
alter table "public"."tbllinuxmemorymodules" drop constraint "tbllinuxmemorymodules_assetid_fkey";
alter table "public"."tbllinuxnetworkdetection" drop constraint "tbllinuxnetworkdetection_assetid_fkey";
alter table "public"."tbllinuxopticaldrives" drop constraint "tbllinuxopticaldrives_assetid_fkey";
alter table "public"."tbllinuxpcicards" drop constraint "tbllinuxpcicards_assetid_fkey";
alter table "public"."tbllinuxprocessors" drop constraint "tbllinuxprocessors_assetid_fkey";
alter table "public"."tbllinuxsoftware" drop constraint "tbllinuxsoftware_assetid_fkey";
alter table "public"."tbllinuxsoftware" drop constraint "tbllinuxsoftware_softwareuniid_fkey";
alter table "public"."tbllinuxsoundcards" drop constraint "tbllinuxsoundcards_assetid_fkey";
alter table "public"."tbllinuxsystem" drop constraint "tbllinuxsystem_assetid_fkey";
alter table "public"."tbllinuxvolumes" drop constraint "tbllinuxvolumes_assetid_fkey";
alter table "public"."tblmacapplications" drop constraint "tblmacapplications_assetid_fkey";
alter table "public"."tblmacdiscburning" drop constraint "tblmacdiscburning_assetid_fkey";
alter table "public"."tblmacdisplays" drop constraint "tblmacdisplays_assetid_fkey";
alter table "public"."tblmacfirewires" drop constraint "tblmacfirewires_assetid_fkey";
alter table "public"."tblmachwoverview" drop constraint "tblmachwoverview_assetid_fkey";
alter table "public"."tblmacmemory" drop constraint "tblmacmemory_assetid_fkey";
alter table "public"."tblmacmodems" drop constraint "tblmacmodems_assetid_fkey";
alter table "public"."tblmacnetwork" drop constraint "tblmacnetwork_assetid_fkey";
alter table "public"."tblmacnetworkvolumes" drop constraint "tblmacnetworkvolumes_assetid_fkey";
alter table "public"."tblmacosinfo" drop constraint "tblmacosinfo_assetid_fkey";
alter table "public"."tblmacpartitions" drop constraint "tblmacpartitions_assetid_fkey";
alter table "public"."tblmappeddrives" drop constraint "tblmappeddrives_assetid_fkey";
alter table "public"."tblmonitor" drop constraint "tblmonitor_assetid_fkey";
alter table "public"."tblmonitorhist" drop constraint "tblmonitorhist_assetid_fkey";
alter table "public"."tblnetwork" drop constraint "tblnetwork_assetid_fkey";
alter table "public"."tblnetworkadapter" drop constraint "tblnetworkadapter_assetid_fkey";
alter table "public"."tblnetworkclient" drop constraint "tblnetworkclient_assetid_fkey";
alter table "public"."tblnetworkclienthist" drop constraint "tblnetworkclienthist_assetid_fkey";
alter table "public"."tblnetworkhist" drop constraint "tblnetworkhist_assetid_fkey";
alter table "public"."tblntlog" drop constraint "tblntlog_assetid_fkey";
alter table "public"."tblntlog" drop constraint "tblntlog_logfileid_fkey";
alter table "public"."tblntlog" drop constraint "tblntlog_loguserid_fkey";
alter table "public"."tblntlog" drop constraint "tblntlog_messageid_fkey";
alter table "public"."tblntlog" drop constraint "tblntlog_sourcenameid_fkey";
alter table "public"."tblonboarddevice" drop constraint "tblonboarddevice_assetid_fkey";
alter table "public"."tblonboarddevicehist" drop constraint "tblonboarddevicehist_assetid_fkey";
alter table "public"."tbloperatingsystem" drop constraint "tbloperatingsystem_assetid_fkey";
alter table "public"."tbloperatingsystemhist" drop constraint "tbloperatingsystemhist_assetid_fkey";
alter table "public"."tblosrecoveryconfiguration" drop constraint "tblosrecoveryconfiguration_assetid_fkey";
alter table "public"."tblosrecoveryconfigurationhist" drop constraint "tblosrecoveryconfigurationhist_assetid_fkey";
alter table "public"."tblossublicensedocs" drop constraint "tblossublicensedocs_oslicenseidid_fkey";
alter table "public"."tblossublicenses" drop constraint "tblossublicenses_oslicenseidid_fkey";
alter table "public"."tblossublicensesorders" drop constraint "tblossublicensesorders_oslicenseidid_fkey";
alter table "public"."tblpagefile" drop constraint "tblpagefile_assetid_fkey";
alter table "public"."tblpagefilehist" drop constraint "tblpagefilehist_assetid_fkey";
alter table "public"."tblparallelport" drop constraint "tblparallelport_assetid_fkey";
alter table "public"."tblparallelporthist" drop constraint "tblparallelporthist_assetid_fkey";
alter table "public"."tblpcmciacontroller" drop constraint "tblpcmciacontroller_assetid_fkey";
alter table "public"."tblpcmciacontrollerhist" drop constraint "tblpcmciacontrollerhist_assetid_fkey";
alter table "public"."tblphysicalmemory" drop constraint "tblphysicalmemory_assetid_fkey";
alter table "public"."tblphysicalmemoryarray" drop constraint "tblphysicalmemoryarray_assetid_fkey";
alter table "public"."tblphysicalmemoryarrayhist" drop constraint "tblphysicalmemoryarrayhist_assetid_fkey";
alter table "public"."tblphysicalmemoryhist" drop constraint "tblphysicalmemoryhist_assetid_fkey";
alter table "public"."tblpointingdevice" drop constraint "tblpointingdevice_assetid_fkey";
alter table "public"."tblpointingdevicehist" drop constraint "tblpointingdevicehist_assetid_fkey";
alter table "public"."tblportablebattery" drop constraint "tblportablebattery_assetid_fkey";
alter table "public"."tblportablebatteryhist" drop constraint "tblportablebatteryhist_assetid_fkey";
alter table "public"."tblportconnector" drop constraint "tblportconnector_assetid_fkey";
alter table "public"."tblportconnectorhist" drop constraint "tblportconnectorhist_assetid_fkey";
alter table "public"."tblpotsmodem" drop constraint "tblpotsmodem_assetid_fkey";
alter table "public"."tblpotsmodemhist" drop constraint "tblpotsmodemhist_assetid_fkey";
alter table "public"."tblprinters" drop constraint "tblprinters_assetid_fkey";
alter table "public"."tblprintershist" drop constraint "tblprintershist_assetid_fkey";
alter table "public"."tblprocesses" drop constraint "tblprocesses_assetid_fkey";
alter table "public"."tblprocessor" drop constraint "tblprocessor_assetid_fkey";
alter table "public"."tblprocessorhist" drop constraint "tblprocessorhist_assetid_fkey";
alter table "public"."tblproxy" drop constraint "tblproxy_assetid_fkey";
alter table "public"."tblquickfixengineering" drop constraint "tblquickfixengineering_assetid_fkey";
alter table "public"."tblquickfixengineering" drop constraint "tblquickfixengineering_installedbyid_fkey";
alter table "public"."tblquickfixengineering" drop constraint "tblquickfixengineering_qfeid_fkey";
alter table "public"."tblquickfixengineeringhist" drop constraint "tblquickfixengineeringhist_assetid_fkey";
alter table "public"."tblregistry" drop constraint "tblregistry_assetid_fkey";
alter table "public"."tblscanhistory" drop constraint "tblscanhistory_assetid_fkey";
alter table "public"."tblscanhistory" drop constraint "tblscanhistory_scanningmethodid_fkey";
alter table "public"."tblscsicontroller" drop constraint "tblscsicontroller_assetid_fkey";
alter table "public"."tblscsicontrollerhist" drop constraint "tblscsicontrollerhist_assetid_fkey";
alter table "public"."tblserialnumber" drop constraint "tblserialnumber_assetid_fkey";
alter table "public"."tblserialport" drop constraint "tblserialport_assetid_fkey";
alter table "public"."tblserialporthist" drop constraint "tblserialporthist_assetid_fkey";
alter table "public"."tblservices" drop constraint "tblservices_assetid_fkey";
alter table "public"."tblservices" drop constraint "tblservices_serviceuniqueid_fkey";
alter table "public"."tblservices" drop constraint "tblservices_startid_fkey";
alter table "public"."tblservices" drop constraint "tblservices_stateid_fkey";
alter table "public"."tblsharepermissions" drop constraint "tblsharepermissions_shareid_fkey";
alter table "public"."tblshares" drop constraint "tblshares_assetid_fkey";
alter table "public"."tblshares" drop constraint "tblshares_shareuniqueid_fkey";
alter table "public"."tblshareshist" drop constraint "tblshareshist_assetid_fkey";
alter table "public"."tblshareshist" drop constraint "tblshareshist_shareuniqueid_fkey";
alter table "public"."tblsnmpassetmac" drop constraint "tblsnmpassetmac_assetid_fkey";
alter table "public"."tblsnmpinfo" drop constraint "tblsnmpinfo_assetid_fkey";
alter table "public"."tblsoftware" drop constraint "tblsoftware_assetid_fkey";
alter table "public"."tblsoftware" drop constraint "tblsoftware_softid_fkey";
alter table "public"."tblsoftwarehist" drop constraint "tblsoftwarehist_assetid_fkey";
alter table "public"."tblsounddevice" drop constraint "tblsounddevice_assetid_fkey";
alter table "public"."tblsounddevicehist" drop constraint "tblsounddevicehist_assetid_fkey";
alter table "public"."tblsqldatabases" drop constraint "tblsqldatabases_sqlserverid_fkey";
alter table "public"."tblsqllicensedocs" drop constraint "tblsqllicensedocs_licenseid_fkey";
alter table "public"."tblsqllicenses" drop constraint "tblsqllicenses_licensetype_fkey";
alter table "public"."tblsqllicensesorders" drop constraint "tblsqllicensesorders_licenseid_fkey";
alter table "public"."tblsqllicensesserverorders" drop constraint "tblsqllicensesserverorders_licenseid_fkey";
alter table "public"."tblsqlservers" drop constraint "tblsqlservers_assetid_fkey";
alter table "public"."tblsqlsubservers" drop constraint "tblsqlsubservers_licenseid_fkey";
alter table "public"."tblsublicensedocs" drop constraint "tblsublicensedocs_licenseidid_fkey";
alter table "public"."tblsublicenses" drop constraint "tblsublicenses_licenseidid_fkey";
alter table "public"."tblsublicensesorders" drop constraint "tblsublicensesorders_licenseidid_fkey";
alter table "public"."tblsystemenclosure" drop constraint "tblsystemenclosure_assetid_fkey";
alter table "public"."tblsystemenclosurehist" drop constraint "tblsystemenclosurehist_assetid_fkey";
alter table "public"."tbltapedrive" drop constraint "tbltapedrive_assetid_fkey";
alter table "public"."tbltapedrivehist" drop constraint "tbltapedrivehist_assetid_fkey";
alter table "public"."tbltpm" drop constraint "tbltpm_assetid_fkey";
alter table "public"."tblups" drop constraint "tblups_assetid_fkey";
alter table "public"."tbluptime" drop constraint "tbluptime_assetid_fkey";
alter table "public"."tblusbcontroller" drop constraint "tblusbcontroller_assetid_fkey";
alter table "public"."tblusbcontrollerhist" drop constraint "tblusbcontrollerhist_assetid_fkey";
alter table "public"."tblusbdevices" drop constraint "tblusbdevices_assetid_fkey";
alter table "public"."tblusers" drop constraint "tblusers_assetid_fkey";
alter table "public"."tblusershist" drop constraint "tblusershist_assetid_fkey";
alter table "public"."tblusersingroup" drop constraint "tblusersingroup_assetid_fkey";
alter table "public"."tblusersingrouphist" drop constraint "tblusersingrouphist_assetid_fkey";
alter table "public"."tblvideocontroller" drop constraint "tblvideocontroller_assetid_fkey";
alter table "public"."tblvideocontrollerhist" drop constraint "tblvideocontrollerhist_assetid_fkey";
alter table "public"."tblvmwaredisk" drop constraint "tblvmwaredisk_assetid_fkey";
alter table "public"."tblvmwareguest" drop constraint "tblvmwareguest_assetid_fkey";
alter table "public"."tblvmwareguestnetwork" drop constraint "tblvmwareguestnetwork_guestid_fkey";
alter table "public"."tblvmwareinfo" drop constraint "tblvmwareinfo_assetid_fkey";
alter table "public"."tblvmwarenetwork" drop constraint "tblvmwarenetwork_assetid_fkey";
alter table "public"."tblvolume" drop constraint "tblvolume_assetid_fkey";
alter table "public"."tblvproamt" drop constraint "tblvproamt_assetid_fkey";
alter table "public"."tblwarranty" drop constraint "tblwarranty_assetid_fkey";
alter table "public"."tblwarrantydetails" drop constraint "tblwarrantydetails_warrantyid_fkey";
alter table "public"."tblwinsat" drop constraint "tblwinsat_assetid_fkey";
alter table "public"."tsysadsischedule" drop constraint "tsysadsischedule_servername_fkey";
alter table "public"."tsysalertschedule" drop constraint "tsysalertschedule_scheduleid_fkey";
alter table "public"."tsysasdomains" drop constraint "tsysasdomains_servername_fkey";
alter table "public"."tsysasou" drop constraint "tsysasou_servername_fkey";
alter table "public"."tsysassetgroupfilter" drop constraint "tsysassetgroupfilter_assetgroupid_fkey";
alter table "public"."tsysassetgroupscan" drop constraint "tsysassetgroupscan_assetgroupid_fkey";
alter table "public"."tsysassetgroupscan" drop constraint "tsysassetgroupscan_report_fkey";
alter table "public"."tsysassetgroupscan" drop constraint "tsysassetgroupscan_servername_fkey";
alter table "public"."tsysassettypeexclude" drop constraint "tsysassettypeexclude_assettype_fkey";
alter table "public"."tsysassettypeexclude" drop constraint "tsysassettypeexclude_servername_fkey";
alter table "public"."tsysassites" drop constraint "tsysassites_servername_fkey";
alter table "public"."tsysasworkgroups" drop constraint "tsysasworkgroups_servername_fkey";
alter table "public"."tsyscurrentscans" drop constraint "tsyscurrentscans_scanserver_fkey";
alter table "public"."tsysdomaincontrollers" drop constraint "tsysdomaincontrollers_servername_fkey";
alter table "public"."tsysdomaincredentials" drop constraint "tsysdomaincredentials_credid_fkey";
alter table "public"."tsysdomainexclude" drop constraint "tsysdomainexclude_servername_fkey";
alter table "public"."tsysdonotscan" drop constraint "tsysdonotscan_servername_fkey";
alter table "public"."tsyserrors" drop constraint "tsyserrors_errortype_fkey";
alter table "public"."tsyseventfilter" drop constraint "tsyseventfilter_alertid_fkey";
alter table "public"."tsysipexclude" drop constraint "tsysipexclude_servername_fkey";
alter table "public"."tsysiprangecredentials" drop constraint "tsysiprangecredentials_credid_fkey";
alter table "public"."tsysiprangecredentials" drop constraint "tsysiprangecredentials_iprangeid_fkey";
alter table "public"."tsysipscanranges" drop constraint "tsysipscanranges_servername_fkey";
alter table "public"."tsyslastscan" drop constraint "tsyslastscan_assetid_fkey";
alter table "public"."tsyslastscan" drop constraint "tsyslastscan_cfgcode_fkey";
alter table "public"."tsyslogschedule" drop constraint "tsyslogschedule_servername_fkey";
alter table "public"."tsysmailconfig" drop constraint "tsysmailconfig_servername_fkey";
alter table "public"."tsysoidlookup" drop constraint "tsysoidlookup_itemtype_fkey";
alter table "public"."tsyspackageexecution" drop constraint "tsyspackageexecution_packagescheduleid_fkey";
alter table "public"."tsyspackageexecution" drop constraint "tsyspackageexecution_scanserver_fkey";
alter table "public"."tsyspackagelogs" drop constraint "tsyspackagelogs_servername_fkey";
alter table "public"."tsyspackagelogs" drop constraint "tsyspackagelogs_typeid_fkey";
alter table "public"."tsyspackageschedule" drop constraint "tsyspackageschedule_assetgroupid_fkey";
alter table "public"."tsyspackageschedule" drop constraint "tsyspackageschedule_packageid_fkey";
alter table "public"."tsyspackageschedule" drop constraint "tsyspackageschedule_scheduleid_fkey";
alter table "public"."tsyspackagescheduleasset" drop constraint "tsyspackagescheduleasset_assetid_fkey";
alter table "public"."tsyspackagescheduleasset" drop constraint "tsyspackagescheduleasset_scheduleid_fkey";
alter table "public"."tsyspackagestepconditionlinks" drop constraint "tsyspackagestepconditionlinks_conditionnameid_fkey";
alter table "public"."tsyspackagestepconditionlinks" drop constraint "tsyspackagestepconditionlinks_conditiontypeid_fkey";
alter table "public"."tsyspackagestepconditions" drop constraint "tsyspackagestepconditions_conditionnameid_fkey";
alter table "public"."tsyspackagestepconditions" drop constraint "tsyspackagestepconditions_conditiontypeid_fkey";
alter table "public"."tsyspackagestepconditions" drop constraint "tsyspackagestepconditions_packagestepid_fkey";
alter table "public"."tsyspackagesteps" drop constraint "tsyspackagesteps_packageid_fkey";
alter table "public"."tsyspackagesteps" drop constraint "tsyspackagesteps_steptype_fkey";
alter table "public"."tsysreportpages" drop constraint "tsysreportpages_homepagequery_fkey";
alter table "public"."tsysreportpages" drop constraint "tsysreportpages_pageid_fkey";
alter table "public"."tsysrolemembers" drop constraint "tsysrolemembers_roleid_fkey";
alter table "public"."tsysrolepermissions" drop constraint "tsysrolepermissions_permissionid_fkey";
alter table "public"."tsysrolepermissions" drop constraint "tsysrolepermissions_roleid_fkey";
alter table "public"."tsysscanqueue" drop constraint "tsysscanqueue_servername_fkey";
alter table "public"."tsysuniqueipcredentials" drop constraint "tsysuniqueipcredentials_credid_fkey";
alter table "public"."tsysuniquewindowscredentials" drop constraint "tsysuniquewindowscredentials_credid_fkey";
alter table "public"."tsysuserschedule" drop constraint "tsysuserschedule_servername_fkey";
alter table "public"."tsyswaitqueue" drop constraint "tsyswaitqueue_servername_fkey";
alter table "public"."tsyswarrantyqueue" drop constraint "tsyswarrantyqueue_assetid_fkey";
alter table "public"."tsyswebtabcontrols" drop constraint "tsyswebtabcontrols_controlid_fkey";
alter table "public"."tsyswebtabcontrols" drop constraint "tsyswebtabcontrols_tabid_fkey";
alter table "public"."tsyswebtabs" drop constraint "tsyswebtabs_pageid_fkey";
alter table "public"."tsyswebusersglobaltabs" drop constraint "tsyswebusersglobaltabs_tabid_fkey";
alter table "public"."htblagentconfig" drop constraint "htblagentconfig_pkey";
alter table "public"."htblagentlicenses" drop constraint "htblagentlicenses_pkey";
alter table "public"."htblagents" drop constraint "htblagents_pkey";
alter table "public"."htblagentteam" drop constraint "htblagentteam_pkey";
alter table "public"."htblassignexclusions" drop constraint "htblassignexclusions_pkey";
alter table "public"."htblattachements" drop constraint "htblattachements_pkey";
alter table "public"."htblautomaticclose" drop constraint "htblautomaticclose_pkey";
alter table "public"."htblautomaticcloselang" drop constraint "htblautomaticcloselang_pkey";
alter table "public"."htblautomaticcloseticketstates" drop constraint "htblautomaticcloseticketstates_pkey";
alter table "public"."htblautomaticclosetickettypes" drop constraint "htblautomaticclosetickettypes_pkey";
alter table "public"."htblcalendarsettings" drop constraint "htblcalendarsettings_pkey";
alter table "public"."htblcustomfields" drop constraint "htblcustomfields_pkey";
alter table "public"."htblcustomfieldslang" drop constraint "htblcustomfieldslang_pkey";
alter table "public"."htblcustomfieldvaluelinks" drop constraint "htblcustomfieldvaluelinks_pkey";
alter table "public"."htblcustomfieldvalues" drop constraint "htblcustomfieldvalues_pkey";
alter table "public"."htblcustomticketfilteritems" drop constraint "htblcustomticketfilteritems_pkey";
alter table "public"."htblcustomticketfilters" drop constraint "htblcustomticketfilters_pkey";
alter table "public"."htbldeadlines" drop constraint "htbldeadlines_pkey";
alter table "public"."htblemailaccounts" drop constraint "htblemailaccounts_pkey";
alter table "public"."htblemailaccountslang" drop constraint "htblemailaccountslang_pkey";
alter table "public"."htblemailaccountsteams" drop constraint "htblemailaccountsteams_pkey";
alter table "public"."htblemailfilters" drop constraint "htblemailfilters_pkey";
alter table "public"."htblemailtemplates" drop constraint "htblemailtemplates_pkey";
alter table "public"."htblemailtemplatesattachements" drop constraint "htblemailtemplatesattachements_pkey";
alter table "public"."htblemailtemplateslang" drop constraint "htblemailtemplateslang_pkey";
alter table "public"."htblemailtemplatespriorities" drop constraint "htblemailtemplatespriorities_pkey";
alter table "public"."htblemailtemplatesticketstates" drop constraint "htblemailtemplatesticketstates_pkey";
alter table "public"."htblemailtemplatestickettypes" drop constraint "htblemailtemplatestickettypes_pkey";
alter table "public"."htblemailverification" drop constraint "htblemailverification_pkey";
alter table "public"."htbleventinfochecks" drop constraint "htbleventinfochecks_pkey";
alter table "public"."htbleventreminders" drop constraint "htbleventreminders_pkey";
alter table "public"."htblfiles" drop constraint "htblfiles_pkey";
alter table "public"."htblfooterattachements" drop constraint "htblfooterattachements_pkey";
alter table "public"."htblhistory" drop constraint "htblhistory_pkey";
alter table "public"."htblhistorytypes" drop constraint "htblhistorytypes_pkey";
alter table "public"."htblknowledgebase" drop constraint "htblknowledgebase_pkey";
alter table "public"."htblknowledgebaseattachments" drop constraint "htblknowledgebaseattachments_pkey";
alter table "public"."htblknowledgebasecategories" drop constraint "htblknowledgebasecategories_pkey";
alter table "public"."htblknowledgebasecategorieslang" drop constraint "htblknowledgebasecategorieslang_pkey";
alter table "public"."htblknowledgebasecategoriesteams" drop constraint "htblknowledgebasecategoriesteams_pkey";
alter table "public"."htblknowledgebaselang" drop constraint "htblknowledgebaselang_pkey";
alter table "public"."htblnews" drop constraint "htblnews_pkey";
alter table "public"."htblnewslang" drop constraint "htblnewslang_pkey";
alter table "public"."htblnotehistory" drop constraint "htblnotehistory_pkey";
alter table "public"."htblnotes" drop constraint "htblnotes_pkey";
alter table "public"."htblnotificationschecked" drop constraint "htblnotificationschecked_pkey";
alter table "public"."htbloldticketdata" drop constraint "htbloldticketdata_pkey";
alter table "public"."htblpriorities" drop constraint "htblpriorities_pkey";
alter table "public"."htblprioritieslang" drop constraint "htblprioritieslang_pkey";
alter table "public"."htblreports" drop constraint "htblreports_pkey";
alter table "public"."htblreportslang" drop constraint "htblreportslang_pkey";
alter table "public"."htblsavedcustomfilters" drop constraint "htblsavedcustomfilters_pkey";
alter table "public"."htblschedule" drop constraint "htblschedule_pkey";
alter table "public"."htblscheduleagents" drop constraint "htblscheduleagents_pkey";
alter table "public"."htblscheduleinfo" drop constraint "htblscheduleinfo_pkey";
alter table "public"."htblschedulerepeat" drop constraint "htblschedulerepeat_pkey";
alter table "public"."htblscheduleteams" drop constraint "htblscheduleteams_pkey";
alter table "public"."htblscheduletypes" drop constraint "htblscheduletypes_pkey";
alter table "public"."htblscheduletypeslang" drop constraint "htblscheduletypeslang_pkey";
alter table "public"."htblserviceactions" drop constraint "htblserviceactions_pkey";
alter table "public"."htblshortcuts" drop constraint "htblshortcuts_pkey";
alter table "public"."htblshortcutslang" drop constraint "htblshortcutslang_pkey";
alter table "public"."htblshownclientrelations" drop constraint "htblshownclientrelations_pkey";
alter table "public"."htblsla" drop constraint "htblsla_pkey";
alter table "public"."htblslasource" drop constraint "htblslasource_pkey";
alter table "public"."htblslatickettypes" drop constraint "htblslatickettypes_pkey";
alter table "public"."htblslausers" drop constraint "htblslausers_pkey";
alter table "public"."htblsource" drop constraint "htblsource_pkey";
alter table "public"."htblsourcelang" drop constraint "htblsourcelang_pkey";
alter table "public"."htblspecialrules" drop constraint "htblspecialrules_pkey";
alter table "public"."htblspecialrulesactions" drop constraint "htblspecialrulesactions_pkey";
alter table "public"."htblspecialrulesconditions" drop constraint "htblspecialrulesconditions_pkey";
alter table "public"."htblspecialrulestaskagents" drop constraint "htblspecialrulestaskagents_pkey";
alter table "public"."htblspecialrulestasks" drop constraint "htblspecialrulestasks_pkey";
alter table "public"."htblspecialrulestaskteams" drop constraint "htblspecialrulestaskteams_pkey";
alter table "public"."htblteams" drop constraint "htblteams_pkey";
alter table "public"."htblteamslang" drop constraint "htblteamslang_pkey";
alter table "public"."htbltemplatecategories" drop constraint "htbltemplatecategories_pkey";
alter table "public"."htbltemplates" drop constraint "htbltemplates_pkey";
alter table "public"."htbltemplateslang" drop constraint "htbltemplateslang_pkey";
alter table "public"."htblticket" drop constraint "htblticket_pkey";
alter table "public"."htblticketasset" drop constraint "htblticketasset_pkey";
alter table "public"."htblticketcustomfield" drop constraint "htblticketcustomfield_pkey";
alter table "public"."htblticketmerges" drop constraint "htblticketmerges_pkey";
alter table "public"."htblticketsfilter" drop constraint "htblticketsfilter_pkey";
alter table "public"."htblticketssummary" drop constraint "htblticketssummary_pkey";
alter table "public"."htblticketssummaryfilter" drop constraint "htblticketssummaryfilter_pkey";
alter table "public"."htblticketstates" drop constraint "htblticketstates_pkey";
alter table "public"."htblticketstateslang" drop constraint "htblticketstateslang_pkey";
alter table "public"."htblticketsubscribers" drop constraint "htblticketsubscribers_pkey";
alter table "public"."htblticketteam" drop constraint "htblticketteam_pkey";
alter table "public"."htbltickettypecustomfield" drop constraint "htbltickettypecustomfield_pkey";
alter table "public"."htbltickettypes" drop constraint "htbltickettypes_pkey";
alter table "public"."htbltickettypeslang" drop constraint "htbltickettypeslang_pkey";
alter table "public"."htbltickettypeteams" drop constraint "htbltickettypeteams_pkey";
alter table "public"."htblticketuserrelation" drop constraint "htblticketuserrelation_pkey";
alter table "public"."htblusers" drop constraint "htblusers_pkey";
alter table "public"."htblwebroles" drop constraint "htblwebroles_pkey";
alter table "public"."htblzones" drop constraint "htblzones_pkey";
alter table "public"."tbladcomputers" drop constraint "tbladcomputers_pkey";
alter table "public"."tbladgroups" drop constraint "tbladgroups_pkey";
alter table "public"."tbladmembership" drop constraint "tbladmembership_pkey";
alter table "public"."tbladobjects" drop constraint "tbladobjects_pkey";
alter table "public"."tbladusers" drop constraint "tbladusers_pkey";
alter table "public"."tblantivirus" drop constraint "tblantivirus_pkey";
alter table "public"."tblassetcomments" drop constraint "tblassetcomments_pkey";
alter table "public"."tblassetcustom" drop constraint "tblassetcustom_pkey";
alter table "public"."tblassetdocs" drop constraint "tblassetdocs_pkey";
alter table "public"."tblassetgrouplink" drop constraint "tblassetgrouplink_pkey";
alter table "public"."tblassetgroups" drop constraint "tblassetgroups_pkey";
alter table "public"."tblassetmacaddress" drop constraint "tblassetmacaddress_pkey";
alter table "public"."tblassetmergelinks" drop constraint "tblassetmergelinks_pkey";
alter table "public"."tblassetrelations" drop constraint "tblassetrelations_pkey";
alter table "public"."tblassets" drop constraint "tblassets_pkey";
alter table "public"."tblassetuserrelations" drop constraint "tblassetuserrelations_pkey";
alter table "public"."tblautorun" drop constraint "tblautorun_pkey";
alter table "public"."tblautorunhist" drop constraint "tblautorunhist_pkey";
alter table "public"."tblautorunloc" drop constraint "tblautorunloc_pkey";
alter table "public"."tblautorununi" drop constraint "tblautorununi_pkey";
alter table "public"."tblbaseboard" drop constraint "tblbaseboard_pkey";
alter table "public"."tblbaseboardhist" drop constraint "tblbaseboardhist_pkey";
alter table "public"."tblbattery" drop constraint "tblbattery_pkey";
alter table "public"."tblbatteryhist" drop constraint "tblbatteryhist_pkey";
alter table "public"."tblbios" drop constraint "tblbios_pkey";
alter table "public"."tblbioshist" drop constraint "tblbioshist_pkey";
alter table "public"."tblbootconfiguration" drop constraint "tblbootconfiguration_pkey";
alter table "public"."tblbootconfigurationhist" drop constraint "tblbootconfigurationhist_pkey";
alter table "public"."tblbootconfigurationuni" drop constraint "tblbootconfigurationuni_pkey";
alter table "public"."tblbus" drop constraint "tblbus_pkey";
alter table "public"."tblbushist" drop constraint "tblbushist_pkey";
alter table "public"."tblcdromdrive" drop constraint "tblcdromdrive_pkey";
alter table "public"."tblcdromdrivehist" drop constraint "tblcdromdrivehist_pkey";
alter table "public"."tblcodecfile" drop constraint "tblcodecfile_pkey";
alter table "public"."tblcodecfilehist" drop constraint "tblcodecfilehist_pkey";
alter table "public"."tblcomapplication" drop constraint "tblcomapplication_pkey";
alter table "public"."tblcomapplicationhist" drop constraint "tblcomapplicationhist_pkey";
alter table "public"."tblcomponentcategory" drop constraint "tblcomponentcategory_pkey";
alter table "public"."tblcomponentcategoryhist" drop constraint "tblcomponentcategoryhist_pkey";
alter table "public"."tblcomputersystem" drop constraint "tblcomputersystem_pkey";
alter table "public"."tblcomputersystemhist" drop constraint "tblcomputersystemhist_pkey";
alter table "public"."tblcomputersystemproduct" drop constraint "tblcomputersystemproduct_pkey";
alter table "public"."tblcomputersystemproducthist" drop constraint "tblcomputersystemproducthist_pkey";
alter table "public"."tblconfiglog" drop constraint "tblconfiglog_pkey";
alter table "public"."tblcplogoninfo" drop constraint "tblcplogoninfo_pkey";
alter table "public"."tblcustdevprinter" drop constraint "tblcustdevprinter_pkey";
alter table "public"."tbldcomapplication" drop constraint "tbldcomapplication_pkey";
alter table "public"."tbldcomapplicationhist" drop constraint "tbldcomapplicationhist_pkey";
alter table "public"."tbldesktop" drop constraint "tbldesktop_pkey";
alter table "public"."tbldesktopmonitor" drop constraint "tbldesktopmonitor_pkey";
alter table "public"."tbldesktopmonitorhist" drop constraint "tbldesktopmonitorhist_pkey";
alter table "public"."tbldiskdrives" drop constraint "tbldiskdrives_pkey";
alter table "public"."tbldiskpartition" drop constraint "tbldiskpartition_pkey";
alter table "public"."tbldiskpartitionhist" drop constraint "tbldiskpartitionhist_pkey";
alter table "public"."tbldisplayconfiguration" drop constraint "tbldisplayconfiguration_pkey";
alter table "public"."tbldisplayconfigurationhist" drop constraint "tbldisplayconfigurationhist_pkey";
alter table "public"."tbldisplaycontrollerconfiguration" drop constraint "tbldisplaycontrollerconfiguration_pkey";
alter table "public"."tbldisplaycontrollerconfigurationhist" drop constraint "tbldisplaycontrollerconfigurationhist_pkey";
alter table "public"."tbldomainroles" drop constraint "tbldomainroles_pkey";
alter table "public"."tblencryptablevolume" drop constraint "tblencryptablevolume_pkey";
alter table "public"."tblenvironment" drop constraint "tblenvironment_pkey";
alter table "public"."tblerrors" drop constraint "tblerrors_pkey";
alter table "public"."tblfeature" drop constraint "tblfeature_pkey";
alter table "public"."tblfeatureuni" drop constraint "tblfeatureuni_pkey";
alter table "public"."tblfileversions" drop constraint "tblfileversions_pkey";
alter table "public"."tblfloppy" drop constraint "tblfloppy_pkey";
alter table "public"."tblfloppyhist" drop constraint "tblfloppyhist_pkey";
alter table "public"."tblgroups" drop constraint "tblgroups_pkey";
alter table "public"."tblgroupshist" drop constraint "tblgroupshist_pkey";
alter table "public"."tblgroupuni" drop constraint "tblgroupuni_pkey";
alter table "public"."tblhypervguest" drop constraint "tblhypervguest_pkey";
alter table "public"."tblhypervguestnetwork" drop constraint "tblhypervguestnetwork_pkey";
alter table "public"."tblidecontroller" drop constraint "tblidecontroller_pkey";
alter table "public"."tblidecontrollerhist" drop constraint "tblidecontrollerhist_pkey";
alter table "public"."tblieactivex" drop constraint "tblieactivex_pkey";
alter table "public"."tblieactivexhist" drop constraint "tblieactivexhist_pkey";
alter table "public"."tbliebars" drop constraint "tbliebars_pkey";
alter table "public"."tbliebarshist" drop constraint "tbliebarshist_pkey";
alter table "public"."tbliebho" drop constraint "tbliebho_pkey";
alter table "public"."tbliebhohist" drop constraint "tbliebhohist_pkey";
alter table "public"."tblieextensions" drop constraint "tblieextensions_pkey";
alter table "public"."tblieextensionshist" drop constraint "tblieextensionshist_pkey";
alter table "public"."tblinfrareddevice" drop constraint "tblinfrareddevice_pkey";
alter table "public"."tblinfrareddevicehist" drop constraint "tblinfrareddevicehist_pkey";
alter table "public"."tblkeyboard" drop constraint "tblkeyboard_pkey";
alter table "public"."tblkeyboardhist" drop constraint "tblkeyboardhist_pkey";
alter table "public"."tbllanguages" drop constraint "tbllanguages_pkey";
alter table "public"."tbllicenses" drop constraint "tbllicenses_pkey";
alter table "public"."tbllinuxbaseboard" drop constraint "tbllinuxbaseboard_pkey";
alter table "public"."tbllinuxbios" drop constraint "tbllinuxbios_pkey";
alter table "public"."tbllinuxenclosure" drop constraint "tbllinuxenclosure_pkey";
alter table "public"."tbllinuxgraphicscards" drop constraint "tbllinuxgraphicscards_pkey";
alter table "public"."tbllinuxharddisks" drop constraint "tbllinuxharddisks_pkey";
alter table "public"."tbllinuxmemorycontroller" drop constraint "tbllinuxmemorycontroller_pkey";
alter table "public"."tbllinuxmemorydevices" drop constraint "tbllinuxmemorydevices_pkey";
alter table "public"."tbllinuxmemorymodules" drop constraint "tbllinuxmemorymodules_pkey";
alter table "public"."tbllinuxnetworkdetection" drop constraint "tbllinuxnetworkdetection_pkey";
alter table "public"."tbllinuxopticaldrives" drop constraint "tbllinuxopticaldrives_pkey";
alter table "public"."tbllinuxpcicards" drop constraint "tbllinuxpcicards_pkey";
alter table "public"."tbllinuxprocessors" drop constraint "tbllinuxprocessors_pkey";
alter table "public"."tbllinuxsoftware" drop constraint "tbllinuxsoftware_pkey";
alter table "public"."tbllinuxsoundcards" drop constraint "tbllinuxsoundcards_pkey";
alter table "public"."tbllinuxsystem" drop constraint "tbllinuxsystem_pkey";
alter table "public"."tbllinuxvolumes" drop constraint "tbllinuxvolumes_pkey";
alter table "public"."tblloginlog" drop constraint "tblloginlog_pkey";
alter table "public"."tblmacapplications" drop constraint "tblmacapplications_pkey";
alter table "public"."tblmacdiscburning" drop constraint "tblmacdiscburning_pkey";
alter table "public"."tblmacdisplays" drop constraint "tblmacdisplays_pkey";
alter table "public"."tblmacfirewires" drop constraint "tblmacfirewires_pkey";
alter table "public"."tblmachwoverview" drop constraint "tblmachwoverview_pkey";
alter table "public"."tblmacmemory" drop constraint "tblmacmemory_pkey";
alter table "public"."tblmacmodems" drop constraint "tblmacmodems_pkey";
alter table "public"."tblmacnetwork" drop constraint "tblmacnetwork_pkey";
alter table "public"."tblmacnetworkvolumes" drop constraint "tblmacnetworkvolumes_pkey";
alter table "public"."tblmacosinfo" drop constraint "tblmacosinfo_pkey";
alter table "public"."tblmacpartitions" drop constraint "tblmacpartitions_pkey";
alter table "public"."tblmappeddrives" drop constraint "tblmappeddrives_pkey";
alter table "public"."tblmonitor" drop constraint "tblmonitor_pkey";
alter table "public"."tblmonitorhist" drop constraint "tblmonitorhist_pkey";
alter table "public"."tblnetwork" drop constraint "tblnetwork_pkey";
alter table "public"."tblnetworkadapter" drop constraint "tblnetworkadapter_pkey";
alter table "public"."tblnetworkclient" drop constraint "tblnetworkclient_pkey";
alter table "public"."tblnetworkclienthist" drop constraint "tblnetworkclienthist_pkey";
alter table "public"."tblnetworkhist" drop constraint "tblnetworkhist_pkey";
alter table "public"."tblntlog" drop constraint "tblntlog_pkey";
alter table "public"."tblntlogfile" drop constraint "tblntlogfile_pkey";
alter table "public"."tblntlogmessage" drop constraint "tblntlogmessage_pkey";
alter table "public"."tblntlogsource" drop constraint "tblntlogsource_pkey";
alter table "public"."tblntloguser" drop constraint "tblntloguser_pkey";
alter table "public"."tblonboarddevice" drop constraint "tblonboarddevice_pkey";
alter table "public"."tblonboarddevicehist" drop constraint "tblonboarddevicehist_pkey";
alter table "public"."tbloperatingsystem" drop constraint "tbloperatingsystem_pkey";
alter table "public"."tbloperatingsystemhist" drop constraint "tbloperatingsystemhist_pkey";
alter table "public"."tbloslicenses" drop constraint "tbloslicenses_pkey";
alter table "public"."tblosrecoveryconfiguration" drop constraint "tblosrecoveryconfiguration_pkey";
alter table "public"."tblosrecoveryconfigurationhist" drop constraint "tblosrecoveryconfigurationhist_pkey";
alter table "public"."tblossublicensedocs" drop constraint "tblossublicensedocs_pkey";
alter table "public"."tblossublicenses" drop constraint "tblossublicenses_pkey";
alter table "public"."tblossublicensesorders" drop constraint "tblossublicensesorders_pkey";
alter table "public"."tblpagefile" drop constraint "tblpagefile_pkey";
alter table "public"."tblpagefilehist" drop constraint "tblpagefilehist_pkey";
alter table "public"."tblparallelport" drop constraint "tblparallelport_pkey";
alter table "public"."tblparallelporthist" drop constraint "tblparallelporthist_pkey";
alter table "public"."tblpcmciacontroller" drop constraint "tblpcmciacontroller_pkey";
alter table "public"."tblpcmciacontrollerhist" drop constraint "tblpcmciacontrollerhist_pkey";
alter table "public"."tblphysicalmemory" drop constraint "tblphysicalmemory_pkey";
alter table "public"."tblphysicalmemoryarray" drop constraint "tblphysicalmemoryarray_pkey";
alter table "public"."tblphysicalmemoryarrayhist" drop constraint "tblphysicalmemoryarrayhist_pkey";
alter table "public"."tblphysicalmemoryhist" drop constraint "tblphysicalmemoryhist_pkey";
alter table "public"."tblpointingdevice" drop constraint "tblpointingdevice_pkey";
alter table "public"."tblpointingdevicehist" drop constraint "tblpointingdevicehist_pkey";
alter table "public"."tblportablebattery" drop constraint "tblportablebattery_pkey";
alter table "public"."tblportablebatteryhist" drop constraint "tblportablebatteryhist_pkey";
alter table "public"."tblportconnector" drop constraint "tblportconnector_pkey";
alter table "public"."tblportconnectorhist" drop constraint "tblportconnectorhist_pkey";
alter table "public"."tblpotsmodem" drop constraint "tblpotsmodem_pkey";
alter table "public"."tblpotsmodemhist" drop constraint "tblpotsmodemhist_pkey";
alter table "public"."tblprinters" drop constraint "tblprinters_pkey";
alter table "public"."tblprintershist" drop constraint "tblprintershist_pkey";
alter table "public"."tblprocesses" drop constraint "tblprocesses_pkey";
alter table "public"."tblprocessor" drop constraint "tblprocessor_pkey";
alter table "public"."tblprocessorhist" drop constraint "tblprocessorhist_pkey";
alter table "public"."tblproxy" drop constraint "tblproxy_pkey";
alter table "public"."tblquickfixengineering" drop constraint "tblquickfixengineering_pkey";
alter table "public"."tblquickfixengineeringhist" drop constraint "tblquickfixengineeringhist_pkey";
alter table "public"."tblquickfixengineeringinstalledby" drop constraint "tblquickfixengineeringinstalledby_pkey";
alter table "public"."tblquickfixengineeringuni" drop constraint "tblquickfixengineeringuni_pkey";
alter table "public"."tblregistry" drop constraint "tblregistry_pkey";
alter table "public"."tblsafeguids" drop constraint "tblsafeguids_pkey";
alter table "public"."tblscanhistory" drop constraint "tblscanhistory_pkey";
alter table "public"."tblscsicontroller" drop constraint "tblscsicontroller_pkey";
alter table "public"."tblscsicontrollerhist" drop constraint "tblscsicontrollerhist_pkey";
alter table "public"."tblserialnumber" drop constraint "tblserialnumber_pkey";
alter table "public"."tblserialport" drop constraint "tblserialport_pkey";
alter table "public"."tblserialporthist" drop constraint "tblserialporthist_pkey";
alter table "public"."tblservices" drop constraint "tblservices_pkey";
alter table "public"."tblservicestartmode" drop constraint "tblservicestartmode_pkey";
alter table "public"."tblservicestate" drop constraint "tblservicestate_pkey";
alter table "public"."tblservicesuni" drop constraint "tblservicesuni_pkey";
alter table "public"."tblsharepermissions" drop constraint "tblsharepermissions_pkey";
alter table "public"."tblshares" drop constraint "tblshares_pkey";
alter table "public"."tblshareshist" drop constraint "tblshareshist_pkey";
alter table "public"."tblsharesuni" drop constraint "tblsharesuni_pkey";
alter table "public"."tblsnmpassetmac" drop constraint "tblsnmpassetmac_pkey";
alter table "public"."tblsnmpiftypes" drop constraint "tblsnmpiftypes_pkey";
alter table "public"."tblsnmpinfo" drop constraint "tblsnmpinfo_pkey";
alter table "public"."tblsoftware" drop constraint "tblsoftware_pkey";
alter table "public"."tblsoftwarehist" drop constraint "tblsoftwarehist_pkey";
alter table "public"."tblsoftwareuni" drop constraint "tblsoftwareuni_pkey";
alter table "public"."tblsounddevice" drop constraint "tblsounddevice_pkey";
alter table "public"."tblsounddevicehist" drop constraint "tblsounddevicehist_pkey";
alter table "public"."tblsqldatabases" drop constraint "tblsqldatabases_pkey";
alter table "public"."tblsqllicensedocs" drop constraint "tblsqllicensedocs_pkey";
alter table "public"."tblsqllicenses" drop constraint "tblsqllicenses_pkey";
alter table "public"."tblsqllicensesorders" drop constraint "tblsqllicensesorders_pkey";
alter table "public"."tblsqllicensesserverorders" drop constraint "tblsqllicensesserverorders_pkey";
alter table "public"."tblsqlservers" drop constraint "tblsqlservers_pkey";
alter table "public"."tblsqlsubservers" drop constraint "tblsqlsubservers_pkey";
alter table "public"."tblstate" drop constraint "tblstate_pkey";
alter table "public"."tblsublicensedocs" drop constraint "tblsublicensedocs_pkey";
alter table "public"."tblsublicenses" drop constraint "tblsublicenses_pkey";
alter table "public"."tblsublicensesorders" drop constraint "tblsublicensesorders_pkey";
alter table "public"."tblsystemenclosure" drop constraint "tblsystemenclosure_pkey";
alter table "public"."tblsystemenclosurehist" drop constraint "tblsystemenclosurehist_pkey";
alter table "public"."tbltapedrive" drop constraint "tbltapedrive_pkey";
alter table "public"."tbltapedrivehist" drop constraint "tbltapedrivehist_pkey";
alter table "public"."tbltpm" drop constraint "tbltpm_pkey";
alter table "public"."tblups" drop constraint "tblups_pkey";
alter table "public"."tbluptime" drop constraint "tbluptime_pkey";
alter table "public"."tblusbcontroller" drop constraint "tblusbcontroller_pkey";
alter table "public"."tblusbcontrollerhist" drop constraint "tblusbcontrollerhist_pkey";
alter table "public"."tblusbdevices" drop constraint "tblusbdevices_pkey";
alter table "public"."tblusers" drop constraint "tblusers_pkey";
alter table "public"."tblusershist" drop constraint "tblusershist_pkey";
alter table "public"."tblusersingroup" drop constraint "tblusersingroup_pkey";
alter table "public"."tblusersingrouphist" drop constraint "tblusersingrouphist_pkey";
alter table "public"."tblvideocontroller" drop constraint "tblvideocontroller_pkey";
alter table "public"."tblvideocontrollerhist" drop constraint "tblvideocontrollerhist_pkey";
alter table "public"."tblvmwaredisk" drop constraint "tblvmwaredisk_pkey";
alter table "public"."tblvmwareguest" drop constraint "tblvmwareguest_pkey";
alter table "public"."tblvmwareguestnetwork" drop constraint "tblvmwareguestnetwork_pkey";
alter table "public"."tblvmwareinfo" drop constraint "tblvmwareinfo_pkey";
alter table "public"."tblvmwarenetwork" drop constraint "tblvmwarenetwork_pkey";
alter table "public"."tblvolume" drop constraint "tblvolume_pkey";
alter table "public"."tblvproamt" drop constraint "tblvproamt_pkey";
alter table "public"."tblwarranty" drop constraint "tblwarranty_pkey";
alter table "public"."tblwarrantydetails" drop constraint "tblwarrantydetails_pkey";
alter table "public"."tblwinsat" drop constraint "tblwinsat_pkey";
alter table "public"."tsysactions" drop constraint "tsysactions_pkey";
alter table "public"."tsysadmins" drop constraint "tsysadmins_pkey";
alter table "public"."tsysadsischedule" drop constraint "tsysadsischedule_pkey";
alter table "public"."tsysalertschedule" drop constraint "tsysalertschedule_pkey";
alter table "public"."tsysantivirus" drop constraint "tsysantivirus_pkey";
alter table "public"."tsysapikeys" drop constraint "tsysapikeys_pkey";
alter table "public"."tsysasdomains" drop constraint "tsysasdomains_pkey";
alter table "public"."tsysasou" drop constraint "tsysasou_pkey";
alter table "public"."tsysasservers" drop constraint "tsysasservers_pkey";
alter table "public"."tsysasseterrortypes" drop constraint "tsysasseterrortypes_pkey";
alter table "public"."tsysassetgroupfilter" drop constraint "tsysassetgroupfilter_pkey";
alter table "public"."tsysassetgroupscan" drop constraint "tsysassetgroupscan_pkey";
alter table "public"."tsysassetlinks" drop constraint "tsysassetlinks_pkey";
alter table "public"."tsysassetrelationtypes" drop constraint "tsysassetrelationtypes_pkey";
alter table "public"."tsysassettypeexclude" drop constraint "tsysassettypeexclude_pkey";
alter table "public"."tsysassettypes" drop constraint "tsysassettypes_pkey";
alter table "public"."tsysassites" drop constraint "tsysassites_pkey";
alter table "public"."tsysasworkgroups" drop constraint "tsysasworkgroups_pkey";
alter table "public"."tsyschassistypes" drop constraint "tsyschassistypes_pkey";
alter table "public"."tsysconfig" drop constraint "tsysconfig_pkey";
alter table "public"."tsyscredentials" drop constraint "tsyscredentials_pkey";
alter table "public"."tsyscurrentscans" drop constraint "tsyscurrentscans_pkey";
alter table "public"."tsyscustomfieldtypes" drop constraint "tsyscustomfieldtypes_pkey";
alter table "public"."tsyscustomnames" drop constraint "tsyscustomnames_pkey";
alter table "public"."tsysdbobjects" drop constraint "tsysdbobjects_pkey";
alter table "public"."tsysdomaincontrollers" drop constraint "tsysdomaincontrollers_pkey";
alter table "public"."tsysdomaincredentials" drop constraint "tsysdomaincredentials_pkey";
alter table "public"."tsysdomainexclude" drop constraint "tsysdomainexclude_pkey";
alter table "public"."tsysdonotscan" drop constraint "tsysdonotscan_pkey";
alter table "public"."tsyserrors" drop constraint "tsyserrors_pkey";
alter table "public"."tsyserrortype" drop constraint "tsyserrortype_pkey";
alter table "public"."tsyseventalerts" drop constraint "tsyseventalerts_pkey";
alter table "public"."tsyseventfilter" drop constraint "tsyseventfilter_pkey";
alter table "public"."tsyseventignore" drop constraint "tsyseventignore_pkey";
alter table "public"."tsysfiles" drop constraint "tsysfiles_pkey";
alter table "public"."tsyshisttables" drop constraint "tsyshisttables_pkey";
alter table "public"."tsysipexclude" drop constraint "tsysipexclude_pkey";
alter table "public"."tsysiplocations" drop constraint "tsysiplocations_pkey";
alter table "public"."tsysiprangecredentials" drop constraint "tsysiprangecredentials_pkey";
alter table "public"."tsysipscanranges" drop constraint "tsysipscanranges_pkey";
alter table "public"."tsyslabeldocs" drop constraint "tsyslabeldocs_pkey";
alter table "public"."tsyslastscan" drop constraint "tsyslastscan_pkey";
alter table "public"."tsyslicensetype" drop constraint "tsyslicensetype_pkey";
alter table "public"."tsyslogschedule" drop constraint "tsyslogschedule_pkey";
alter table "public"."tsysmacblacklist" drop constraint "tsysmacblacklist_pkey";
alter table "public"."tsysmacvendor" drop constraint "tsysmacvendor_pkey";
alter table "public"."tsysmailgroups" drop constraint "tsysmailgroups_pkey";
alter table "public"."tsysmanufacturertranslation" drop constraint "tsysmanufacturertranslation_pkey";
alter table "public"."tsysmemorytypes" drop constraint "tsysmemorytypes_pkey";
alter table "public"."tsysmodeltranslation" drop constraint "tsysmodeltranslation_pkey";
alter table "public"."tsysoidlookup" drop constraint "tsysoidlookup_pkey";
alter table "public"."tsysos" drop constraint "tsysos_pkey";
alter table "public"."tsyspackageexecution" drop constraint "tsyspackageexecution_pkey";
alter table "public"."tsyspackagelogs" drop constraint "tsyspackagelogs_pkey";
alter table "public"."tsyspackagelogtype" drop constraint "tsyspackagelogtype_pkey";
alter table "public"."tsyspackages" drop constraint "tsyspackages_pkey";
alter table "public"."tsyspackageschedule" drop constraint "tsyspackageschedule_pkey";
alter table "public"."tsyspackagescheduleasset" drop constraint "tsyspackagescheduleasset_pkey";
alter table "public"."tsyspackagestepconditionlinks" drop constraint "tsyspackagestepconditionlinks_pkey";
alter table "public"."tsyspackagestepconditionnames" drop constraint "tsyspackagestepconditionnames_pkey";
alter table "public"."tsyspackagestepconditions" drop constraint "tsyspackagestepconditions_pkey";
alter table "public"."tsyspackagestepconditiontypes" drop constraint "tsyspackagestepconditiontypes_pkey";
alter table "public"."tsyspackagesteps" drop constraint "tsyspackagesteps_pkey";
alter table "public"."tsyspackagesteptypes" drop constraint "tsyspackagesteptypes_pkey";
alter table "public"."tsyspages" drop constraint "tsyspages_pkey";
alter table "public"."tsyspermissions" drop constraint "tsyspermissions_pkey";
alter table "public"."tsysregistry" drop constraint "tsysregistry_pkey";
alter table "public"."tsysremotedatabases" drop constraint "tsysremotedatabases_pkey";
alter table "public"."tsysreportpages" drop constraint "tsysreportpages_pkey";
alter table "public"."tsysreports" drop constraint "tsysreports_pkey";
alter table "public"."tsysrolemembers" drop constraint "tsysrolemembers_pkey";
alter table "public"."tsysrolepermissions" drop constraint "tsysrolepermissions_pkey";
alter table "public"."tsysroles" drop constraint "tsysroles_pkey";
alter table "public"."tsysscanningmethods" drop constraint "tsysscanningmethods_pkey";
alter table "public"."tsysscanqueue" drop constraint "tsysscanqueue_pkey";
alter table "public"."tsysschedule" drop constraint "tsysschedule_pkey";
alter table "public"."tsysserials" drop constraint "tsysserials_pkey";
alter table "public"."tsysserialtranslation" drop constraint "tsysserialtranslation_pkey";
alter table "public"."tsyssqllicensetypes" drop constraint "tsyssqllicensetypes_pkey";
alter table "public"."tsyssystemskutranslation" drop constraint "tsyssystemskutranslation_pkey";
alter table "public"."tsysuniqueipcredentials" drop constraint "tsysuniqueipcredentials_pkey";
alter table "public"."tsysuniquewindowscredentials" drop constraint "tsysuniquewindowscredentials_pkey";
alter table "public"."tsysupdate" drop constraint "tsysupdate_pkey";
alter table "public"."tsysuseractions" drop constraint "tsysuseractions_pkey";
alter table "public"."tsysuserschedule" drop constraint "tsysuserschedule_pkey";
alter table "public"."tsysvendorlogos" drop constraint "tsysvendorlogos_pkey";
alter table "public"."tsysvendoroid" drop constraint "tsysvendoroid_pkey";
alter table "public"."tsyswaitqueue" drop constraint "tsyswaitqueue_pkey";
alter table "public"."tsyswaittime" drop constraint "tsyswaittime_pkey";
alter table "public"."tsyswarrantyqueue" drop constraint "tsyswarrantyqueue_pkey";
alter table "public"."tsyswebcontrols" drop constraint "tsyswebcontrols_pkey";
alter table "public"."tsyswebroles" drop constraint "tsyswebroles_pkey";
alter table "public"."tsyswebtabcontrols" drop constraint "tsyswebtabcontrols_pkey";
alter table "public"."tsyswebtabs" drop constraint "tsyswebtabs_pkey";
alter table "public"."tsyswebusers" drop constraint "tsyswebusers_pkey";
alter table "public"."tsyswebusersglobaltabs" drop constraint "tsyswebusersglobaltabs_pkey";

-- step 9 - add new primary key constraint on all tables

alter table "public".tsysvendorlogos add constraint "tsysvendorlogos_pkey" primary key (tsysvendorlogoskey);
alter table "public".tsysvendoroid add constraint "tsysvendoroid_pkey" primary key (tsysvendoroidkey);
alter table "public".tsysuseractions add constraint "tsysuseractions_pkey" primary key (tsysuseractionskey);
alter table "public".tsysupdate add constraint "tsysupdate_pkey" primary key (tsysupdatekey);
alter table "public".tsysscanqueue add constraint "tsysscanqueue_pkey" primary key (tsysscanqueuekey);
alter table "public".tsysreports add constraint "tsysreports_pkey" primary key (tsysreportskey);
alter table "public".tsysreportpages add constraint "tsysreportpages_pkey" primary key (tsysreportpageskey);
alter table "public".tsyspages add constraint "tsyspages_pkey" primary key (tsyspageskey);
alter table "public".tsyslogschedule add constraint "tsyslogschedule_pkey" primary key (tsyslogschedulekey);
alter table "public".tsyslicensetype add constraint "tsyslicensetype_pkey" primary key (tsyslicensetypekey);
alter table "public".tsyshisttables add constraint "tsyshisttables_pkey" primary key (tsyshisttableskey);
alter table "public".tsyseventignore add constraint "tsyseventignore_pkey" primary key (tsyseventignorekey);
alter table "public".tsyserrortype add constraint "tsyserrortype_pkey" primary key (tsyserrortypekey);
alter table "public".tsyserrors add constraint "tsyserrors_pkey" primary key (tsyserrorskey);
alter table "public".tsysassetlinks add constraint "tsysassetlinks_pkey" primary key (tsysassetlinkskey);
alter table "public".tsysasseterrortypes add constraint "tsysasseterrortypes_pkey" primary key (tsysasseterrortypeskey);
alter table "public".tsysantivirus add constraint "tsysantivirus_pkey" primary key (tsysantiviruskey);
alter table "public".tsysadmins add constraint "tsysadmins_pkey" primary key (tsysadminskey);
alter table "public".tsysactions add constraint "tsysactions_pkey" primary key (tsysactionskey);
alter table "public".tsyswebusersglobaltabs add constraint "tsyswebusersglobaltabs_pkey" primary key (tsyswebusersglobaltabskey);
alter table "public".tsyswebusers add constraint "tsyswebusers_pkey" primary key (tsyswebuserskey);
alter table "public".tsyswebtabs add constraint "tsyswebtabs_pkey" primary key (tsyswebtabskey);
alter table "public".tsyswebtabcontrols add constraint "tsyswebtabcontrols_pkey" primary key (tsyswebtabcontrolskey);
alter table "public".tsyswebroles add constraint "tsyswebroles_pkey" primary key (tsyswebroleskey);
alter table "public".tsyswebcontrols add constraint "tsyswebcontrols_pkey" primary key (tsyswebcontrolskey);
alter table "public".tsyswaitqueue add constraint "tsyswaitqueue_pkey" primary key (tsyswaitqueuekey);
alter table "public".tsysuserschedule add constraint "tsysuserschedule_pkey" primary key (tsysuserschedulekey);
alter table "public".tsysuniquewindowscredentials add constraint "tsysuniquewindowscredentials_pkey" primary key (tsysuniquewindowscredentialskey);
alter table "public".tsysuniqueipcredentials add constraint "tsysuniqueipcredentials_pkey" primary key (tsysuniqueipcredentialskey);
alter table "public".tsyssystemskutranslation add constraint "tsyssystemskutranslation_pkey" primary key (tsyssystemskutranslationkey);
alter table "public".tsyssqllicensetypes add constraint "tsyssqllicensetypes_pkey" primary key (tsyssqllicensetypeskey);
alter table "public".tsysserialtranslation add constraint "tsysserialtranslation_pkey" primary key (tsysserialtranslationkey);
alter table "public".tsysschedule add constraint "tsysschedule_pkey" primary key (tsysschedulekey);
alter table "public".tsysscanningmethods add constraint "tsysscanningmethods_pkey" primary key (tsysscanningmethodskey);
alter table "public".tsysroles add constraint "tsysroles_pkey" primary key (tsysroleskey);
alter table "public".tsysrolepermissions add constraint "tsysrolepermissions_pkey" primary key (tsysrolepermissionskey);
alter table "public".tsysrolemembers add constraint "tsysrolemembers_pkey" primary key (tsysrolememberskey);
alter table "public".tsysremotedatabases add constraint "tsysremotedatabases_pkey" primary key (tsysremotedatabaseskey);
alter table "public".tsyspermissions add constraint "tsyspermissions_pkey" primary key (tsyspermissionskey);
alter table "public".tsyspackages add constraint "tsyspackages_pkey" primary key (tsyspackageskey);
alter table "public".tsyspackagesteps add constraint "tsyspackagesteps_pkey" primary key (tsyspackagestepskey);
alter table "public".tsyspackagesteptypes add constraint "tsyspackagesteptypes_pkey" primary key (tsyspackagesteptypeskey);
alter table "public".tsyspackagestepconditions add constraint "tsyspackagestepconditions_pkey" primary key (tsyspackagestepconditionskey);
alter table "public".tsyspackagestepconditiontypes add constraint "tsyspackagestepconditiontypes_pkey" primary key (tsyspackagestepconditiontypeskey);
alter table "public".tsyspackagestepconditionnames add constraint "tsyspackagestepconditionnames_pkey" primary key (tsyspackagestepconditionnameskey);
alter table "public".tsyspackagestepconditionlinks add constraint "tsyspackagestepconditionlinks_pkey" primary key (tsyspackagestepconditionlinkskey);
alter table "public".tsyspackagescheduleasset add constraint "tsyspackagescheduleasset_pkey" primary key (tsyspackagescheduleassetkey);
alter table "public".tsyspackageschedule add constraint "tsyspackageschedule_pkey" primary key (tsyspackageschedulekey);
alter table "public".tsyspackagelogs add constraint "tsyspackagelogs_pkey" primary key (tsyspackagelogskey);
alter table "public".tsyspackagelogtype add constraint "tsyspackagelogtype_pkey" primary key (tsyspackagelogtypekey);
alter table "public".tsyspackageexecution add constraint "tsyspackageexecution_pkey" primary key (tsyspackageexecutionkey);
alter table "public".tsysos add constraint "tsysos_pkey" primary key (tsysoskey);
alter table "public".tsysoidlookup add constraint "tsysoidlookup_pkey" primary key (tsysoidlookupkey);
alter table "public".tsysmodeltranslation add constraint "tsysmodeltranslation_pkey" primary key (tsysmodeltranslationkey);
alter table "public".tsysmanufacturertranslation add constraint "tsysmanufacturertranslation_pkey" primary key (tsysmanufacturertranslationkey);
alter table "public".tsysmailgroups add constraint "tsysmailgroups_pkey" primary key (tsysmailgroupskey);
alter table "public".tsysmacvendor add constraint "tsysmacvendor_pkey" primary key (tsysmacvendorkey);
alter table "public".tsysmacblacklist add constraint "tsysmacblacklist_pkey" primary key (tsysmacblacklistkey);
alter table "public".tsyslabeldocs add constraint "tsyslabeldocs_pkey" primary key (tsyslabeldocskey);
alter table "public".tsysipscanranges add constraint "tsysipscanranges_pkey" primary key (tsysipscanrangeskey);
alter table "public".tsysiprangecredentials add constraint "tsysiprangecredentials_pkey" primary key (tsysiprangecredentialskey);
alter table "public".tsysiplocations add constraint "tsysiplocations_pkey" primary key (tsysiplocationskey);
alter table "public".tsysipexclude add constraint "tsysipexclude_pkey" primary key (tsysipexcludekey);
alter table "public".tsyseventfilter add constraint "tsyseventfilter_pkey" primary key (tsyseventfilterkey);
alter table "public".tsyseventalerts add constraint "tsyseventalerts_pkey" primary key (tsyseventalertskey);
alter table "public".tsysdomainexclude add constraint "tsysdomainexclude_pkey" primary key (tsysdomainexcludekey);
alter table "public".tsysdomaincredentials add constraint "tsysdomaincredentials_pkey" primary key (tsysdomaincredentialskey);
alter table "public".tsysdomaincontrollers add constraint "tsysdomaincontrollers_pkey" primary key (tsysdomaincontrollerskey);
alter table "public".tsysdbobjects add constraint "tsysdbobjects_pkey" primary key (tsysdbobjectskey);
alter table "public".tsyscustomnames add constraint "tsyscustomnames_pkey" primary key (tsyscustomnameskey);
alter table "public".tsyscustomfieldtypes add constraint "tsyscustomfieldtypes_pkey" primary key (tsyscustomfieldtypeskey);
alter table "public".tsyscurrentscans add constraint "tsyscurrentscans_pkey" primary key (tsyscurrentscanskey);
alter table "public".tsyscredentials add constraint "tsyscredentials_pkey" primary key (tsyscredentialskey);
alter table "public".tsysassettypes add constraint "tsysassettypes_pkey" primary key (tsysassettypeskey);
alter table "public".tsysassettypeexclude add constraint "tsysassettypeexclude_pkey" primary key (tsysassettypeexcludekey);
alter table "public".tsysassetrelationtypes add constraint "tsysassetrelationtypes_pkey" primary key (tsysassetrelationtypeskey);
alter table "public".tsysassetgroupscan add constraint "tsysassetgroupscan_pkey" primary key (tsysassetgroupscankey);
alter table "public".tsysassetgroupfilter add constraint "tsysassetgroupfilter_pkey" primary key (tsysassetgroupfilterkey);
alter table "public".tsysapikeys add constraint "tsysapikeys_pkey" primary key (tsysapikeyskey);
alter table "public".tsysalertschedule add constraint "tsysalertschedule_pkey" primary key (tsysalertschedulekey);
alter table "public".tsysadsischedule add constraint "tsysadsischedule_pkey" primary key (tsysadsischedulekey);
alter table "public".tsysasworkgroups add constraint "tsysasworkgroups_pkey" primary key (tsysasworkgroupskey);
alter table "public".tsysassites add constraint "tsysassites_pkey" primary key (tsysassiteskey);
alter table "public".tsysasservers add constraint "tsysasservers_pkey" primary key (tsysasserverskey);
alter table "public".tsysasou add constraint "tsysasou_pkey" primary key (tsysasoukey);
alter table "public".tsysasdomains add constraint "tsysasdomains_pkey" primary key (tsysasdomainskey);
alter table "public".tblwinsat add constraint "tblwinsat_pkey" primary key (tblwinsatkey);
alter table "public".tblwarrantydetails add constraint "tblwarrantydetails_pkey" primary key (tblwarrantydetailskey);
alter table "public".tblwarranty add constraint "tblwarranty_pkey" primary key (tblwarrantykey);
alter table "public".tblvproamt add constraint "tblvproamt_pkey" primary key (tblvproamtkey);
alter table "public".tblvolume add constraint "tblvolume_pkey" primary key (tblvolumekey);
alter table "public".tblvmwarenetwork add constraint "tblvmwarenetwork_pkey" primary key (tblvmwarenetworkkey);
alter table "public".tblvmwareinfo add constraint "tblvmwareinfo_pkey" primary key (tblvmwareinfokey);
alter table "public".tblvmwareguestnetwork add constraint "tblvmwareguestnetwork_pkey" primary key (tblvmwareguestnetworkkey);
alter table "public".tblvmwareguest add constraint "tblvmwareguest_pkey" primary key (tblvmwareguestkey);
alter table "public".tblvmwaredisk add constraint "tblvmwaredisk_pkey" primary key (tblvmwarediskkey);
alter table "public".tblvideocontrollerhist add constraint "tblvideocontrollerhist_pkey" primary key (tblvideocontrollerhistkey);
alter table "public".tblvideocontroller add constraint "tblvideocontroller_pkey" primary key (tblvideocontrollerkey);
alter table "public".tblusersingrouphist add constraint "tblusersingrouphist_pkey" primary key (tblusersingrouphistkey);
alter table "public".tblusersingroup add constraint "tblusersingroup_pkey" primary key (tblusersingroupkey);
alter table "public".tblusershist add constraint "tblusershist_pkey" primary key (tblusershistkey);
alter table "public".tblusers add constraint "tblusers_pkey" primary key (tbluserskey);
alter table "public".tbluptime add constraint "tbluptime_pkey" primary key (tbluptimekey);
alter table "public".tblups add constraint "tblups_pkey" primary key (tblupskey);
alter table "public".tblusbdevices add constraint "tblusbdevices_pkey" primary key (tblusbdeviceskey);
alter table "public".tblusbcontrollerhist add constraint "tblusbcontrollerhist_pkey" primary key (tblusbcontrollerhistkey);
alter table "public".tblusbcontroller add constraint "tblusbcontroller_pkey" primary key (tblusbcontrollerkey);
alter table "public".tbltapedrivehist add constraint "tbltapedrivehist_pkey" primary key (tbltapedrivehistkey);
alter table "public".tbltapedrive add constraint "tbltapedrive_pkey" primary key (tbltapedrivekey);
alter table "public".tbltpm add constraint "tbltpm_pkey" primary key (tbltpmkey);
alter table "public".tblsystemenclosurehist add constraint "tblsystemenclosurehist_pkey" primary key (tblsystemenclosurehistkey);
alter table "public".tblsystemenclosure add constraint "tblsystemenclosure_pkey" primary key (tblsystemenclosurekey);
alter table "public".tblsublicensesorders add constraint "tblsublicensesorders_pkey" primary key (tblsublicensesorderskey);
alter table "public".tblsublicenses add constraint "tblsublicenses_pkey" primary key (tblsublicenseskey);
alter table "public".tblsublicensedocs add constraint "tblsublicensedocs_pkey" primary key (tblsublicensedocskey);
alter table "public".tblstate add constraint "tblstate_pkey" primary key (tblstatekey);
alter table "public".tblsqlsubservers add constraint "tblsqlsubservers_pkey" primary key (tblsqlsubserverskey);
alter table "public".tblsqlservers add constraint "tblsqlservers_pkey" primary key (tblsqlserverskey);
alter table "public".tblsqllicensesserverorders add constraint "tblsqllicensesserverorders_pkey" primary key (tblsqllicensesserverorderskey);
alter table "public".tblsqllicensesorders add constraint "tblsqllicensesorders_pkey" primary key (tblsqllicensesorderskey);
alter table "public".tblsqllicenses add constraint "tblsqllicenses_pkey" primary key (tblsqllicenseskey);
alter table "public".tblsqllicensedocs add constraint "tblsqllicensedocs_pkey" primary key (tblsqllicensedocskey);
alter table "public".tblsqldatabases add constraint "tblsqldatabases_pkey" primary key (tblsqldatabaseskey);
alter table "public".tblsounddevicehist add constraint "tblsounddevicehist_pkey" primary key (tblsounddevicehistkey);
alter table "public".tblsounddevice add constraint "tblsounddevice_pkey" primary key (tblsounddevicekey);
alter table "public".tblsoftwareuni add constraint "tblsoftwareuni_pkey" primary key (tblsoftwareunikey);
alter table "public".tblsoftwarehist add constraint "tblsoftwarehist_pkey" primary key (tblsoftwarehistkey);
alter table "public".tblsoftware add constraint "tblsoftware_pkey" primary key (tblsoftwarekey);
alter table "public".tblsharesuni add constraint "tblsharesuni_pkey" primary key (tblsharesunikey);
alter table "public".tblshareshist add constraint "tblshareshist_pkey" primary key (tblshareshistkey);
alter table "public".tblshares add constraint "tblshares_pkey" primary key (tblshareskey);
alter table "public".tblsharepermissions add constraint "tblsharepermissions_pkey" primary key (tblsharepermissionskey);
alter table "public".tblservicesuni add constraint "tblservicesuni_pkey" primary key (tblservicesunikey);
alter table "public".tblservices add constraint "tblservices_pkey" primary key (tblserviceskey);
alter table "public".tblservicestate add constraint "tblservicestate_pkey" primary key (tblservicestatekey);
alter table "public".tblservicestartmode add constraint "tblservicestartmode_pkey" primary key (tblservicestartmodekey);
alter table "public".tblserialnumber add constraint "tblserialnumber_pkey" primary key (tblserialnumberkey);
alter table "public".tblserialporthist add constraint "tblserialporthist_pkey" primary key (tblserialporthistkey);
alter table "public".tblserialport add constraint "tblserialport_pkey" primary key (tblserialportkey);
alter table "public".tblscsicontrollerhist add constraint "tblscsicontrollerhist_pkey" primary key (tblscsicontrollerhistkey);
alter table "public".tblscsicontroller add constraint "tblscsicontroller_pkey" primary key (tblscsicontrollerkey);
alter table "public".tblscanhistory add constraint "tblscanhistory_pkey" primary key (tblscanhistorykey);
alter table "public".tblsafeguids add constraint "tblsafeguids_pkey" primary key (tblsafeguidskey);
alter table "public".tblsnmpinfo add constraint "tblsnmpinfo_pkey" primary key (tblsnmpinfokey);
alter table "public".tblsnmpiftypes add constraint "tblsnmpiftypes_pkey" primary key (tblsnmpiftypeskey);
alter table "public".tblsnmpassetmac add constraint "tblsnmpassetmac_pkey" primary key (tblsnmpassetmackey);
alter table "public".tblregistry add constraint "tblregistry_pkey" primary key (tblregistrykey);
alter table "public".tblquickfixengineeringuni add constraint "tblquickfixengineeringuni_pkey" primary key (tblquickfixengineeringunikey);
alter table "public".tblquickfixengineeringinstalledby add constraint "tblquickfixengineeringinstalledby_pkey" primary key (tblquickfixengineeringinstalledbykey);
alter table "public".tblquickfixengineeringhist add constraint "tblquickfixengineeringhist_pkey" primary key (tblquickfixengineeringhistkey);
alter table "public".tblquickfixengineering add constraint "tblquickfixengineering_pkey" primary key (tblquickfixengineeringkey);
alter table "public".tblproxy add constraint "tblproxy_pkey" primary key (tblproxykey);
alter table "public".tblprocessorhist add constraint "tblprocessorhist_pkey" primary key (tblprocessorhistkey);
alter table "public".tblprocessor add constraint "tblprocessor_pkey" primary key (tblprocessorkey);
alter table "public".tblprocesses add constraint "tblprocesses_pkey" primary key (tblprocesseskey);
alter table "public".tblprintershist add constraint "tblprintershist_pkey" primary key (tblprintershistkey);
alter table "public".tblprinters add constraint "tblprinters_pkey" primary key (tblprinterskey);
alter table "public".tblportablebatteryhist add constraint "tblportablebatteryhist_pkey" primary key (tblportablebatteryhistkey);
alter table "public".tblportablebattery add constraint "tblportablebattery_pkey" primary key (tblportablebatterykey);
alter table "public".tblportconnectorhist add constraint "tblportconnectorhist_pkey" primary key (tblportconnectorhistkey);
alter table "public".tblportconnector add constraint "tblportconnector_pkey" primary key (tblportconnectorkey);
alter table "public".tblpointingdevicehist add constraint "tblpointingdevicehist_pkey" primary key (tblpointingdevicehistkey);
alter table "public".tblpointingdevice add constraint "tblpointingdevice_pkey" primary key (tblpointingdevicekey);
alter table "public".tblphysicalmemoryhist add constraint "tblphysicalmemoryhist_pkey" primary key (tblphysicalmemoryhistkey);
alter table "public".tblphysicalmemoryarrayhist add constraint "tblphysicalmemoryarrayhist_pkey" primary key (tblphysicalmemoryarrayhistkey);
alter table "public".tblphysicalmemoryarray add constraint "tblphysicalmemoryarray_pkey" primary key (tblphysicalmemoryarraykey);
alter table "public".tblphysicalmemory add constraint "tblphysicalmemory_pkey" primary key (tblphysicalmemorykey);
alter table "public".tblparallelporthist add constraint "tblparallelporthist_pkey" primary key (tblparallelporthistkey);
alter table "public".tblparallelport add constraint "tblparallelport_pkey" primary key (tblparallelportkey);
alter table "public".tblpagefilehist add constraint "tblpagefilehist_pkey" primary key (tblpagefilehistkey);
alter table "public".tblpagefile add constraint "tblpagefile_pkey" primary key (tblpagefilekey);
alter table "public".tblpotsmodemhist add constraint "tblpotsmodemhist_pkey" primary key (tblpotsmodemhistkey);
alter table "public".tblpotsmodem add constraint "tblpotsmodem_pkey" primary key (tblpotsmodemkey);
alter table "public".tblpcmciacontrollerhist add constraint "tblpcmciacontrollerhist_pkey" primary key (tblpcmciacontrollerhistkey);
alter table "public".tblpcmciacontroller add constraint "tblpcmciacontroller_pkey" primary key (tblpcmciacontrollerkey);
alter table "public".tblossublicensesorders add constraint "tblossublicensesorders_pkey" primary key (tblossublicensesorderskey);
alter table "public".tblossublicenses add constraint "tblossublicenses_pkey" primary key (tblossublicenseskey);
alter table "public".tblossublicensedocs add constraint "tblossublicensedocs_pkey" primary key (tblossublicensedocskey);
alter table "public".tbloslicenses add constraint "tbloslicenses_pkey" primary key (tbloslicenseskey);
alter table "public".tbloperatingsystemhist add constraint "tbloperatingsystemhist_pkey" primary key (tbloperatingsystemhistkey);
alter table "public".tbloperatingsystem add constraint "tbloperatingsystem_pkey" primary key (tbloperatingsystemkey);
alter table "public".tblonboarddevicehist add constraint "tblonboarddevicehist_pkey" primary key (tblonboarddevicehistkey);
alter table "public".tblonboarddevice add constraint "tblonboarddevice_pkey" primary key (tblonboarddevicekey);
alter table "public".tblosrecoveryconfigurationhist add constraint "tblosrecoveryconfigurationhist_pkey" primary key (tblosrecoveryconfigurationhistkey);
alter table "public".tblosrecoveryconfiguration add constraint "tblosrecoveryconfiguration_pkey" primary key (tblosrecoveryconfigurationkey);
alter table "public".tblntloguser add constraint "tblntloguser_pkey" primary key (tblntloguserkey);
alter table "public".tblntlogsource add constraint "tblntlogsource_pkey" primary key (tblntlogsourcekey);
alter table "public".tblntlogmessage add constraint "tblntlogmessage_pkey" primary key (tblntlogmessagekey);
alter table "public".tblntlogfile add constraint "tblntlogfile_pkey" primary key (tblntlogfilekey);
alter table "public".tblntlog add constraint "tblntlog_pkey" primary key (tblntlogkey);
alter table "public".tblnetworkhist add constraint "tblnetworkhist_pkey" primary key (tblnetworkhistkey);
alter table "public".tblnetworkclienthist add constraint "tblnetworkclienthist_pkey" primary key (tblnetworkclienthistkey);
alter table "public".tblnetworkclient add constraint "tblnetworkclient_pkey" primary key (tblnetworkclientkey);
alter table "public".tblnetworkadapter add constraint "tblnetworkadapter_pkey" primary key (tblnetworkadapterkey);
alter table "public".tblnetwork add constraint "tblnetwork_pkey" primary key (tblnetworkkey);
alter table "public".tblmonitorhist add constraint "tblmonitorhist_pkey" primary key (tblmonitorhistkey);
alter table "public".tblmonitor add constraint "tblmonitor_pkey" primary key (tblmonitorkey);
alter table "public".tblmappeddrives add constraint "tblmappeddrives_pkey" primary key (tblmappeddriveskey);
alter table "public".tblmacpartitions add constraint "tblmacpartitions_pkey" primary key (tblmacpartitionskey);
alter table "public".tblmacosinfo add constraint "tblmacosinfo_pkey" primary key (tblmacosinfokey);
alter table "public".tblmacnetworkvolumes add constraint "tblmacnetworkvolumes_pkey" primary key (tblmacnetworkvolumeskey);
alter table "public".tblmacnetwork add constraint "tblmacnetwork_pkey" primary key (tblmacnetworkkey);
alter table "public".tblmacmodems add constraint "tblmacmodems_pkey" primary key (tblmacmodemskey);
alter table "public".tblmacmemory add constraint "tblmacmemory_pkey" primary key (tblmacmemorykey);
alter table "public".tblmachwoverview add constraint "tblmachwoverview_pkey" primary key (tblmachwoverviewkey);
alter table "public".tblmacfirewires add constraint "tblmacfirewires_pkey" primary key (tblmacfirewireskey);
alter table "public".tblmacdisplays add constraint "tblmacdisplays_pkey" primary key (tblmacdisplayskey);
alter table "public".tblmacdiscburning add constraint "tblmacdiscburning_pkey" primary key (tblmacdiscburningkey);
alter table "public".tblmacapplications add constraint "tblmacapplications_pkey" primary key (tblmacapplicationskey);
alter table "public".tblloginlog add constraint "tblloginlog_pkey" primary key (tblloginlogkey);
alter table "public".tbllinuxvolumes add constraint "tbllinuxvolumes_pkey" primary key (tbllinuxvolumeskey);
alter table "public".tbllinuxsystem add constraint "tbllinuxsystem_pkey" primary key (tbllinuxsystemkey);
alter table "public".tbllinuxsoundcards add constraint "tbllinuxsoundcards_pkey" primary key (tbllinuxsoundcardskey);
alter table "public".tbllinuxsoftware add constraint "tbllinuxsoftware_pkey" primary key (tbllinuxsoftwarekey);
alter table "public".tbllinuxprocessors add constraint "tbllinuxprocessors_pkey" primary key (tbllinuxprocessorskey);
alter table "public".tbllinuxpcicards add constraint "tbllinuxpcicards_pkey" primary key (tbllinuxpcicardskey);
alter table "public".tbllinuxopticaldrives add constraint "tbllinuxopticaldrives_pkey" primary key (tbllinuxopticaldriveskey);
alter table "public".tbllinuxnetworkdetection add constraint "tbllinuxnetworkdetection_pkey" primary key (tbllinuxnetworkdetectionkey);
alter table "public".tbllinuxmemorymodules add constraint "tbllinuxmemorymodules_pkey" primary key (tbllinuxmemorymoduleskey);
alter table "public".tbllinuxmemorydevices add constraint "tbllinuxmemorydevices_pkey" primary key (tbllinuxmemorydeviceskey);
alter table "public".tbllinuxmemorycontroller add constraint "tbllinuxmemorycontroller_pkey" primary key (tbllinuxmemorycontrollerkey);
alter table "public".tbllinuxharddisks add constraint "tbllinuxharddisks_pkey" primary key (tbllinuxharddiskskey);
alter table "public".tbllinuxgraphicscards add constraint "tbllinuxgraphicscards_pkey" primary key (tbllinuxgraphicscardskey);
alter table "public".tbllinuxenclosure add constraint "tbllinuxenclosure_pkey" primary key (tbllinuxenclosurekey);
alter table "public".tbllinuxbios add constraint "tbllinuxbios_pkey" primary key (tbllinuxbioskey);
alter table "public".tbllinuxbaseboard add constraint "tbllinuxbaseboard_pkey" primary key (tbllinuxbaseboardkey);
alter table "public".tbllicenses add constraint "tbllicenses_pkey" primary key (tbllicenseskey);
alter table "public".tbllanguages add constraint "tbllanguages_pkey" primary key (tbllanguageskey);
alter table "public".tblkeyboardhist add constraint "tblkeyboardhist_pkey" primary key (tblkeyboardhistkey);
alter table "public".tblkeyboard add constraint "tblkeyboard_pkey" primary key (tblkeyboardkey);
alter table "public".tblinfrareddevicehist add constraint "tblinfrareddevicehist_pkey" primary key (tblinfrareddevicehistkey);
alter table "public".tblinfrareddevice add constraint "tblinfrareddevice_pkey" primary key (tblinfrareddevicekey);
alter table "public".tblieextensionshist add constraint "tblieextensionshist_pkey" primary key (tblieextensionshistkey);
alter table "public".tblieextensions add constraint "tblieextensions_pkey" primary key (tblieextensionskey);
alter table "public".tbliebarshist add constraint "tbliebarshist_pkey" primary key (tbliebarshistkey);
alter table "public".tbliebars add constraint "tbliebars_pkey" primary key (tbliebarskey);
alter table "public".tbliebhohist add constraint "tbliebhohist_pkey" primary key (tbliebhohistkey);
alter table "public".tbliebho add constraint "tbliebho_pkey" primary key (tbliebhokey);
alter table "public".tblieactivexhist add constraint "tblieactivexhist_pkey" primary key (tblieactivexhistkey);
alter table "public".tblieactivex add constraint "tblieactivex_pkey" primary key (tblieactivexkey);
alter table "public".tblidecontrollerhist add constraint "tblidecontrollerhist_pkey" primary key (tblidecontrollerhistkey);
alter table "public".tblidecontroller add constraint "tblidecontroller_pkey" primary key (tblidecontrollerkey);
alter table "public".tblhypervguest add constraint "tblhypervguest_pkey" primary key (tblhypervguestkey);
alter table "public".tblgroupshist add constraint "tblgroupshist_pkey" primary key (tblgroupshistkey);
alter table "public".tblgroups add constraint "tblgroups_pkey" primary key (tblgroupskey);
alter table "public".tblgroupuni add constraint "tblgroupuni_pkey" primary key (tblgroupunikey);
alter table "public".tblfloppyhist add constraint "tblfloppyhist_pkey" primary key (tblfloppyhistkey);
alter table "public".tblfloppy add constraint "tblfloppy_pkey" primary key (tblfloppykey);
alter table "public".tblfileversions add constraint "tblfileversions_pkey" primary key (tblfileversionskey);
alter table "public".tblfeatureuni add constraint "tblfeatureuni_pkey" primary key (tblfeatureunikey);
alter table "public".tblfeature add constraint "tblfeature_pkey" primary key (tblfeaturekey);
alter table "public".tblerrors add constraint "tblerrors_pkey" primary key (tblerrorskey);
alter table "public".tblenvironment add constraint "tblenvironment_pkey" primary key (tblenvironmentkey);
alter table "public".tblencryptablevolume add constraint "tblencryptablevolume_pkey" primary key (tblencryptablevolumekey);
alter table "public".tbldomainroles add constraint "tbldomainroles_pkey" primary key (tbldomainroleskey);
alter table "public".tbldisplaycontrollerconfigurationhist add constraint "tbldisplaycontrollerconfigurationhist_pkey" primary key (tbldisplaycontrollerconfigurationhistkey);
alter table "public".tbldisplaycontrollerconfiguration add constraint "tbldisplaycontrollerconfiguration_pkey" primary key (tbldisplaycontrollerconfigurationkey);
alter table "public".tbldisplayconfigurationhist add constraint "tbldisplayconfigurationhist_pkey" primary key (tbldisplayconfigurationhistkey);
alter table "public".tbldisplayconfiguration add constraint "tbldisplayconfiguration_pkey" primary key (tbldisplayconfigurationkey);
alter table "public".tbldiskdrives add constraint "tbldiskdrives_pkey" primary key (tbldiskdriveskey);
alter table "public".tbldiskpartitionhist add constraint "tbldiskpartitionhist_pkey" primary key (tbldiskpartitionhistkey);
alter table "public".tbldiskpartition add constraint "tbldiskpartition_pkey" primary key (tbldiskpartitionkey);
alter table "public".tbldesktopmonitorhist add constraint "tbldesktopmonitorhist_pkey" primary key (tbldesktopmonitorhistkey);
alter table "public".tbldesktopmonitor add constraint "tbldesktopmonitor_pkey" primary key (tbldesktopmonitorkey);
alter table "public".tbldesktop add constraint "tbldesktop_pkey" primary key (tbldesktopkey);
alter table "public".tbldcomapplicationhist add constraint "tbldcomapplicationhist_pkey" primary key (tbldcomapplicationhistkey);
alter table "public".tbldcomapplication add constraint "tbldcomapplication_pkey" primary key (tbldcomapplicationkey);
alter table "public".tblcustdevprinter add constraint "tblcustdevprinter_pkey" primary key (tblcustdevprinterkey);
alter table "public".tblconfiglog add constraint "tblconfiglog_pkey" primary key (tblconfiglogkey);
alter table "public".tblcomputersystemhist add constraint "tblcomputersystemhist_pkey" primary key (tblcomputersystemhistkey);
alter table "public".tblcomputersystem add constraint "tblcomputersystem_pkey" primary key (tblcomputersystemkey);
alter table "public".tblcomputersystemproducthist add constraint "tblcomputersystemproducthist_pkey" primary key (tblcomputersystemproducthistkey);
alter table "public".tblcomputersystemproduct add constraint "tblcomputersystemproduct_pkey" primary key (tblcomputersystemproductkey);
alter table "public".tblcomponentcategoryhist add constraint "tblcomponentcategoryhist_pkey" primary key (tblcomponentcategoryhistkey);
alter table "public".tblcomponentcategory add constraint "tblcomponentcategory_pkey" primary key (tblcomponentcategorykey);
alter table "public".tblcodecfilehist add constraint "tblcodecfilehist_pkey" primary key (tblcodecfilehistkey);
alter table "public".tblcodecfile add constraint "tblcodecfile_pkey" primary key (tblcodecfilekey);
alter table "public".tblcplogoninfo add constraint "tblcplogoninfo_pkey" primary key (tblcplogoninfokey);
alter table "public".tblcomapplicationhist add constraint "tblcomapplicationhist_pkey" primary key (tblcomapplicationhistkey);
alter table "public".tblcomapplication add constraint "tblcomapplication_pkey" primary key (tblcomapplicationkey);
alter table "public".tblcdromdrivehist add constraint "tblcdromdrivehist_pkey" primary key (tblcdromdrivehistkey);
alter table "public".tblcdromdrive add constraint "tblcdromdrive_pkey" primary key (tblcdromdrivekey);
alter table "public".tblbushist add constraint "tblbushist_pkey" primary key (tblbushistkey);
alter table "public".tblbus add constraint "tblbus_pkey" primary key (tblbuskey);
alter table "public".tblbootconfigurationuni add constraint "tblbootconfigurationuni_pkey" primary key (tblbootconfigurationunikey);
alter table "public".tblbootconfigurationhist add constraint "tblbootconfigurationhist_pkey" primary key (tblbootconfigurationhistkey);
alter table "public".tblbootconfiguration add constraint "tblbootconfiguration_pkey" primary key (tblbootconfigurationkey);
alter table "public".tblbatteryhist add constraint "tblbatteryhist_pkey" primary key (tblbatteryhistkey);
alter table "public".tblbattery add constraint "tblbattery_pkey" primary key (tblbatterykey);
alter table "public".tblbaseboardhist add constraint "tblbaseboardhist_pkey" primary key (tblbaseboardhistkey);
alter table "public".tblbaseboard add constraint "tblbaseboard_pkey" primary key (tblbaseboardkey);
alter table "public".tblbioshist add constraint "tblbioshist_pkey" primary key (tblbioshistkey);
alter table "public".tblbios add constraint "tblbios_pkey" primary key (tblbioskey);
alter table "public".tblautorununi add constraint "tblautorununi_pkey" primary key (tblautorununikey);
alter table "public".tblautorunloc add constraint "tblautorunloc_pkey" primary key (tblautorunlockey);
alter table "public".tblautorunhist add constraint "tblautorunhist_pkey" primary key (tblautorunhistkey);
alter table "public".tblautorun add constraint "tblautorun_pkey" primary key (tblautorunkey);
alter table "public".tblassets add constraint "tblassets_pkey" primary key (tblassetskey);
alter table "public".tblassetuserrelations add constraint "tblassetuserrelations_pkey" primary key (tblassetuserrelationskey);
alter table "public".tblassetrelations add constraint "tblassetrelations_pkey" primary key (tblassetrelationskey);
alter table "public".tblassetmergelinks add constraint "tblassetmergelinks_pkey" primary key (tblassetmergelinkskey);
alter table "public".tblassetmacaddress add constraint "tblassetmacaddress_pkey" primary key (tblassetmacaddresskey);
alter table "public".tblassetgroups add constraint "tblassetgroups_pkey" primary key (tblassetgroupskey);
alter table "public".tblassetgrouplink add constraint "tblassetgrouplink_pkey" primary key (tblassetgrouplinkkey);
alter table "public".tblassetdocs add constraint "tblassetdocs_pkey" primary key (tblassetdocskey);
alter table "public".tblassetcustom add constraint "tblassetcustom_pkey" primary key (tblassetcustomkey);
alter table "public".tblassetcomments add constraint "tblassetcomments_pkey" primary key (tblassetcommentskey);
alter table "public".tblantivirus add constraint "tblantivirus_pkey" primary key (tblantiviruskey);
alter table "public".tbladusers add constraint "tbladusers_pkey" primary key (tbladuserskey);
alter table "public".tbladobjects add constraint "tbladobjects_pkey" primary key (tbladobjectskey);
alter table "public".tbladmembership add constraint "tbladmembership_pkey" primary key (tbladmembershipkey);
alter table "public".tbladgroups add constraint "tbladgroups_pkey" primary key (tbladgroupskey);
alter table "public".tbladcomputers add constraint "tbladcomputers_pkey" primary key (tbladcomputerskey);
alter table "public".htblzones add constraint "htblzones_pkey" primary key (htblzoneskey);
alter table "public".htblwebroles add constraint "htblwebroles_pkey" primary key (htblwebroleskey);
alter table "public".htblusers add constraint "htblusers_pkey" primary key (htbluserskey);
alter table "public".htblticketuserrelation add constraint "htblticketuserrelation_pkey" primary key (htblticketuserrelationkey);
alter table "public".htbltickettypeteams add constraint "htbltickettypeteams_pkey" primary key (htbltickettypeteamskey);
alter table "public".htbltickettypeslang add constraint "htbltickettypeslang_pkey" primary key (htbltickettypeslangkey);
alter table "public".htbltickettypes add constraint "htbltickettypes_pkey" primary key (htbltickettypeskey);
alter table "public".htbltickettypecustomfield add constraint "htbltickettypecustomfield_pkey" primary key (htbltickettypecustomfieldkey);
alter table "public".htblticketteam add constraint "htblticketteam_pkey" primary key (htblticketteamkey);
alter table "public".htblticketsubscribers add constraint "htblticketsubscribers_pkey" primary key (htblticketsubscriberskey);
alter table "public".htblticketstateslang add constraint "htblticketstateslang_pkey" primary key (htblticketstateslangkey);
alter table "public".htblticketstates add constraint "htblticketstates_pkey" primary key (htblticketstateskey);
alter table "public".htblticketssummaryfilter add constraint "htblticketssummaryfilter_pkey" primary key (htblticketssummaryfilterkey);
alter table "public".htblticketssummary add constraint "htblticketssummary_pkey" primary key (htblticketssummarykey);
alter table "public".htblticketsfilter add constraint "htblticketsfilter_pkey" primary key (htblticketsfilterkey);
alter table "public".htblticketmerges add constraint "htblticketmerges_pkey" primary key (htblticketmergeskey);
alter table "public".htblticketcustomfield add constraint "htblticketcustomfield_pkey" primary key (htblticketcustomfieldkey);
alter table "public".htblticketasset add constraint "htblticketasset_pkey" primary key (htblticketassetkey);
alter table "public".htblticket add constraint "htblticket_pkey" primary key (htblticketkey);
alter table "public".htbltemplateslang add constraint "htbltemplateslang_pkey" primary key (htbltemplateslangkey);
alter table "public".htbltemplates add constraint "htbltemplates_pkey" primary key (htbltemplateskey);
alter table "public".htbltemplatecategories add constraint "htbltemplatecategories_pkey" primary key (htbltemplatecategorieskey);
alter table "public".htblteamslang add constraint "htblteamslang_pkey" primary key (htblteamslangkey);
alter table "public".htblteams add constraint "htblteams_pkey" primary key (htblteamskey);
alter table "public".htblspecialrulestaskteams add constraint "htblspecialrulestaskteams_pkey" primary key (htblspecialrulestaskteamskey);
alter table "public".htblspecialrulestasks add constraint "htblspecialrulestasks_pkey" primary key (htblspecialrulestaskskey);
alter table "public".htblspecialrulestaskagents add constraint "htblspecialrulestaskagents_pkey" primary key (htblspecialrulestaskagentskey);
alter table "public".htblspecialrulesconditions add constraint "htblspecialrulesconditions_pkey" primary key (htblspecialrulesconditionskey);
alter table "public".htblspecialrulesactions add constraint "htblspecialrulesactions_pkey" primary key (htblspecialrulesactionskey);
alter table "public".htblspecialrules add constraint "htblspecialrules_pkey" primary key (htblspecialruleskey);
alter table "public".htblsourcelang add constraint "htblsourcelang_pkey" primary key (htblsourcelangkey);
alter table "public".htblsource add constraint "htblsource_pkey" primary key (htblsourcekey);
alter table "public".htblslausers add constraint "htblslausers_pkey" primary key (htblslauserskey);
alter table "public".htblslatickettypes add constraint "htblslatickettypes_pkey" primary key (htblslatickettypeskey);
alter table "public".htblslasource add constraint "htblslasource_pkey" primary key (htblslasourcekey);
alter table "public".htblsla add constraint "htblsla_pkey" primary key (htblslakey);
alter table "public".htblshownclientrelations add constraint "htblshownclientrelations_pkey" primary key (htblshownclientrelationskey);
alter table "public".htblshortcutslang add constraint "htblshortcutslang_pkey" primary key (htblshortcutslangkey);
alter table "public".htblshortcuts add constraint "htblshortcuts_pkey" primary key (htblshortcutskey);
alter table "public".htblserviceactions add constraint "htblserviceactions_pkey" primary key (htblserviceactionskey);
alter table "public".htblscheduletypeslang add constraint "htblscheduletypeslang_pkey" primary key (htblscheduletypeslangkey);
alter table "public".htblscheduletypes add constraint "htblscheduletypes_pkey" primary key (htblscheduletypeskey);
alter table "public".htblscheduleteams add constraint "htblscheduleteams_pkey" primary key (htblscheduleteamskey);
alter table "public".htblschedulerepeat add constraint "htblschedulerepeat_pkey" primary key (htblschedulerepeatkey);
alter table "public".htblscheduleinfo add constraint "htblscheduleinfo_pkey" primary key (htblscheduleinfokey);
alter table "public".htblscheduleagents add constraint "htblscheduleagents_pkey" primary key (htblscheduleagentskey);
alter table "public".htblschedule add constraint "htblschedule_pkey" primary key (htblschedulekey);
alter table "public".htblsavedcustomfilters add constraint "htblsavedcustomfilters_pkey" primary key (htblsavedcustomfilterskey);
alter table "public".htblreportslang add constraint "htblreportslang_pkey" primary key (htblreportslangkey);
alter table "public".htblreports add constraint "htblreports_pkey" primary key (htblreportskey);
alter table "public".htblprioritieslang add constraint "htblprioritieslang_pkey" primary key (htblprioritieslangkey);
alter table "public".htblpriorities add constraint "htblpriorities_pkey" primary key (htblprioritieskey);
alter table "public".htbloldticketdata add constraint "htbloldticketdata_pkey" primary key (htbloldticketdatakey);
alter table "public".htblnotificationschecked add constraint "htblnotificationschecked_pkey" primary key (htblnotificationscheckedkey);
alter table "public".htblnotes add constraint "htblnotes_pkey" primary key (htblnoteskey);
alter table "public".htblnotehistory add constraint "htblnotehistory_pkey" primary key (htblnotehistorykey);
alter table "public".htblnewslang add constraint "htblnewslang_pkey" primary key (htblnewslangkey);
alter table "public".htblnews add constraint "htblnews_pkey" primary key (htblnewskey);
alter table "public".htblknowledgebasecategoriesteams add constraint "htblknowledgebasecategoriesteams_pkey" primary key (htblknowledgebasecategoriesteamskey);
alter table "public".htblknowledgebasecategorieslang add constraint "htblknowledgebasecategorieslang_pkey" primary key (htblknowledgebasecategorieslangkey);
alter table "public".htblknowledgebasecategories add constraint "htblknowledgebasecategories_pkey" primary key (htblknowledgebasecategorieskey);
alter table "public".htblknowledgebaseattachments add constraint "htblknowledgebaseattachments_pkey" primary key (htblknowledgebaseattachmentskey);
alter table "public".htblknowledgebaselang add constraint "htblknowledgebaselang_pkey" primary key (htblknowledgebaselangkey);
alter table "public".htblknowledgebase add constraint "htblknowledgebase_pkey" primary key (htblknowledgebasekey);
alter table "public".htblhistorytypes add constraint "htblhistorytypes_pkey" primary key (htblhistorytypeskey);
alter table "public".htblhistory add constraint "htblhistory_pkey" primary key (htblhistorykey);
alter table "public".htblfooterattachements add constraint "htblfooterattachements_pkey" primary key (htblfooterattachementskey);
alter table "public".htblfiles add constraint "htblfiles_pkey" primary key (htblfileskey);
alter table "public".htbleventreminders add constraint "htbleventreminders_pkey" primary key (htbleventreminderskey);
alter table "public".htbleventinfochecks add constraint "htbleventinfochecks_pkey" primary key (htbleventinfocheckskey);
alter table "public".htblemailverification add constraint "htblemailverification_pkey" primary key (htblemailverificationkey);
alter table "public".htblemailtemplatestickettypes add constraint "htblemailtemplatestickettypes_pkey" primary key (htblemailtemplatestickettypeskey);
alter table "public".htblemailtemplatesticketstates add constraint "htblemailtemplatesticketstates_pkey" primary key (htblemailtemplatesticketstateskey);
alter table "public".htblemailtemplatespriorities add constraint "htblemailtemplatespriorities_pkey" primary key (htblemailtemplatesprioritieskey);
alter table "public".htblemailtemplatesattachements add constraint "htblemailtemplatesattachements_pkey" primary key (htblemailtemplatesattachementskey);
alter table "public".htblemailtemplateslang add constraint "htblemailtemplateslang_pkey" primary key (htblemailtemplateslangkey);
alter table "public".htblemailtemplates add constraint "htblemailtemplates_pkey" primary key (htblemailtemplateskey);
alter table "public".htblemailfilters add constraint "htblemailfilters_pkey" primary key (htblemailfilterskey);
alter table "public".htblemailaccountsteams add constraint "htblemailaccountsteams_pkey" primary key (htblemailaccountsteamskey);
alter table "public".htblemailaccountslang add constraint "htblemailaccountslang_pkey" primary key (htblemailaccountslangkey);
alter table "public".htblemailaccounts add constraint "htblemailaccounts_pkey" primary key (htblemailaccountskey);
alter table "public".htbldeadlines add constraint "htbldeadlines_pkey" primary key (htbldeadlineskey);
alter table "public".htblcustomticketfilters add constraint "htblcustomticketfilters_pkey" primary key (htblcustomticketfilterskey);
alter table "public".htblcustomticketfilteritems add constraint "htblcustomticketfilteritems_pkey" primary key (htblcustomticketfilteritemskey);
alter table "public".htblcustomfieldvalues add constraint "htblcustomfieldvalues_pkey" primary key (htblcustomfieldvalueskey);
alter table "public".htblcustomfieldvaluelinks add constraint "htblcustomfieldvaluelinks_pkey" primary key (htblcustomfieldvaluelinkskey);
alter table "public".htblcustomfieldslang add constraint "htblcustomfieldslang_pkey" primary key (htblcustomfieldslangkey);
alter table "public".htblcustomfields add constraint "htblcustomfields_pkey" primary key (htblcustomfieldskey);
alter table "public".htblcalendarsettings add constraint "htblcalendarsettings_pkey" primary key (htblcalendarsettingskey);
alter table "public".htblautomaticclosetickettypes add constraint "htblautomaticclosetickettypes_pkey" primary key (htblautomaticclosetickettypeskey);
alter table "public".htblautomaticcloseticketstates add constraint "htblautomaticcloseticketstates_pkey" primary key (htblautomaticcloseticketstateskey);
alter table "public".htblautomaticcloselang add constraint "htblautomaticcloselang_pkey" primary key (htblautomaticcloselangkey);
alter table "public".htblautomaticclose add constraint "htblautomaticclose_pkey" primary key (htblautomaticclosekey);
alter table "public".htblattachements add constraint "htblattachements_pkey" primary key (htblattachementskey);
alter table "public".htblassignexclusions add constraint "htblassignexclusions_pkey" primary key (htblassignexclusionskey);
alter table "public".htblagentteam add constraint "htblagentteam_pkey" primary key (htblagentteamkey);
alter table "public".htblagents add constraint "htblagents_pkey" primary key (htblagentskey);
alter table "public".htblagentlicenses add constraint "htblagentlicenses_pkey" primary key (htblagentlicenseskey);
alter table "public".htblagentconfig add constraint "htblagentconfig_pkey" primary key (htblagentconfigkey);
alter table "public".tsyswarrantyqueue add constraint "tsyswarrantyqueue_pkey" primary key (tsyswarrantyqueuekey);
alter table "public".tsyswaittime add constraint "tsyswaittime_pkey" primary key (tsyswaittimekey);
alter table "public".tsysserials add constraint "tsysserials_pkey" primary key (tsysserialskey);
alter table "public".tsysregistry add constraint "tsysregistry_pkey" primary key (tsysregistrykey);
alter table "public".tsysmemorytypes add constraint "tsysmemorytypes_pkey" primary key (tsysmemorytypeskey);
alter table "public".tsyslastscan add constraint "tsyslastscan_pkey" primary key (tsyslastscankey);
alter table "public".tsysfiles add constraint "tsysfiles_pkey" primary key (tsysfileskey);
alter table "public".tsysdonotscan add constraint "tsysdonotscan_pkey" primary key (tsysdonotscankey);
alter table "public".tsysconfig add constraint "tsysconfig_pkey" primary key (tsysconfigkey);
alter table "public".tsyschassistypes add constraint "tsyschassistypes_pkey" primary key (tsyschassistypeskey);
alter table "public".tblhypervguestnetwork add constraint "tblhypervguestnetwork_pkey" primary key (tblhypervguestnetworkkey);
--added by vivek 
alter table "public".htblemailsetup add constraint "htblemailsetup_pkey" primary key (htblemailsetupkey);
alter table "public".htbllook add constraint "htbllook_pkey" primary key (htbllookkey);
alter table "public".htblsetup add constraint "htblsetup_pkey" primary key (htblsetupkey);
alter table "public".tsyscustomlayout add constraint "tsyscustomlayout_pkey" primary key (tsyscustomlayoutkey);
alter table "public".htblbusinesshours add constraint "htblbusinesshours_pkey" primary key (htblbusinesshourskey);
alter table "public".tsyslanguages add constraint "tsyslanguages_pkey" primary key (tsyslanguageskey);
alter table "public".htblslapriorities add constraint "htblslapriorities_pkey" primary key (htblslaprioritieskey);
alter table "public".htblsladepartments add constraint "htblsladepartments_pkey" primary key (htblsladepartmentskey);
alter table "public".tsysmailconfig add constraint "tsysmailconfig_pkey" primary key (tsysmailconfigkey);
alter table "public".htblslacompanies add constraint "htblslacompanies_pkey" primary key (htblslacompanieskey);


-- step 10 - add new foreign key constraint on all tables

alter table "public".tsysscanqueue add constraint "tsysscanqueue_servername_fkey" foreign key ("servername_key") references tsysasservers(tsysasserverskey) on update cascade on delete cascade;

alter table "public".tsysreportpages add constraint "tsysreportpages_pageid_fkey" foreign key ("pageid_key") references tsyspages(tsyspageskey);

alter table "public".tsysreportpages add constraint "tsysreportpages_homepagequery_fkey" foreign key ("homepagequery_key") references tsysreports(tsysreportskey) on update cascade on delete cascade;

alter table "public".tsyslogschedule add constraint "tsyslogschedule_servername_fkey" foreign key ("servername_key") references tsysasservers(tsysasserverskey) on update cascade on delete cascade;

alter table "public".tsyserrors add constraint "tsyserrors_errortype_fkey" foreign key ("errortype_key") references tsyserrortype(tsyserrortypekey);

alter table "public".tsyswebusersglobaltabs add constraint "tsyswebusersglobaltabs_tabid_fkey" foreign key ("tabid_key") references tsyswebtabs(tsyswebtabskey) on delete cascade;

alter table "public".tsyswebtabs add constraint "tsyswebtabs_pageid_fkey" foreign key ("pageid_key") references tsyswebusers(tsyswebuserskey) on update cascade on delete cascade;

alter table "public".tsyswebtabcontrols add constraint "tsyswebtabcontrols_tabid_fkey" foreign key ("tabid_key") references tsyswebtabs(tsyswebtabskey) on update cascade on delete cascade;

alter table "public".tsyswebtabcontrols add constraint "tsyswebtabcontrols_controlid_fkey" foreign key ("controlid_key") references tsyswebcontrols(tsyswebcontrolskey) on update cascade on delete cascade;

alter table "public".tsyswaitqueue add constraint "tsyswaitqueue_servername_fkey" foreign key ("servername_key") references tsysasservers(tsysasserverskey) on update cascade on delete cascade;

alter table "public".tsysuserschedule add constraint "tsysuserschedule_servername_fkey" foreign key ("servername_key") references tsysasservers(tsysasserverskey) on update cascade on delete cascade;

alter table "public".tsysuniquewindowscredentials add constraint "tsysuniquewindowscredentials_credid_fkey" foreign key ("credid_key") references tsyscredentials(tsyscredentialskey) on update cascade on delete cascade;

alter table "public".tsysuniqueipcredentials add constraint "tsysuniqueipcredentials_credid_fkey" foreign key ("credid_key") references tsyscredentials(tsyscredentialskey) on update cascade on delete cascade;

alter table "public".tsysrolepermissions add constraint "tsysrolepermissions_roleid_fkey" foreign key ("roleid_key") references tsysroles(tsysroleskey) on update cascade on delete cascade;

alter table "public".tsysrolepermissions add constraint "tsysrolepermissions_permissionid_fkey" foreign key ("permissionid_key") references tsyspermissions(tsyspermissionskey) on update cascade on delete cascade;

alter table "public".tsysrolemembers add constraint "tsysrolemembers_roleid_fkey" foreign key ("roleid_key") references tsysroles(tsysroleskey) on delete cascade;
alter table "public".tsyspackagesteps add constraint "tsyspackagesteps_steptype_fkey" foreign key ("steptype_key") references tsyspackagesteptypes(tsyspackagesteptypeskey);
alter table "public".tsyspackagesteps add constraint "tsyspackagesteps_packageid_fkey" foreign key ("packageid_key") references tsyspackages(tsyspackageskey) on delete cascade;
alter table "public".tsyspackagestepconditions add constraint "tsyspackagestepconditions_packagestepid_fkey" foreign key ("packagestepid_key") references tsyspackagesteps(tsyspackagestepskey) on delete cascade;
alter table "public".tsyspackagestepconditions add constraint "tsyspackagestepconditions_conditiontypeid_fkey" foreign key ("conditiontypeid_key") references tsyspackagestepconditiontypes(tsyspackagestepconditiontypeskey);
alter table "public".tsyspackagestepconditions add constraint "tsyspackagestepconditions_conditionnameid_fkey" foreign key ("conditionnameid_key") references tsyspackagestepconditionnames(tsyspackagestepconditionnameskey);
alter table "public".tsyspackagestepconditionlinks add constraint "tsyspackagestepconditionlinks_conditiontypeid_fkey" foreign key ("conditiontypeid_key") references tsyspackagestepconditiontypes(tsyspackagestepconditiontypeskey);
alter table "public".tsyspackagestepconditionlinks add constraint "tsyspackagestepconditionlinks_conditionnameid_fkey" foreign key ("conditionnameid_key") references tsyspackagestepconditionnames(tsyspackagestepconditionnameskey);
alter table "public".tsyspackagescheduleasset add constraint "tsyspackagescheduleasset_scheduleid_fkey" foreign key ("scheduleid_key") references tsyspackageschedule(tsyspackageschedulekey) on delete cascade;
alter table "public".tsyspackagescheduleasset add constraint "tsyspackagescheduleasset_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tsyspackageschedule add constraint "tsyspackageschedule_scheduleid_fkey" foreign key ("scheduleid_key") references tsysschedule(tsysschedulekey);
alter table "public".tsyspackageschedule add constraint "tsyspackageschedule_packageid_fkey" foreign key ("packageid_key") references tsyspackages(tsyspackageskey);
alter table "public".tsyspackageschedule add constraint "tsyspackageschedule_assetgroupid_fkey" foreign key ("assetgroupid_key") references tblassetgroups(tblassetgroupskey) on delete cascade;
alter table "public".tsyspackagelogs add constraint "tsyspackagelogs_typeid_fkey" foreign key ("typeid_key") references tsyspackagelogtype(tsyspackagelogtypekey) on delete cascade;
alter table "public".tsyspackagelogs add constraint "tsyspackagelogs_servername_fkey" foreign key ("servername_key") references tsysasservers(tsysasserverskey) on update cascade on delete cascade;
alter table "public".tsyspackageexecution add constraint "tsyspackageexecution_scanserver_fkey" foreign key ("scanserver_key") references tsysasservers(tsysasserverskey) on update cascade on delete cascade;
alter table "public".tsyspackageexecution add constraint "tsyspackageexecution_packagescheduleid_fkey" foreign key ("packagescheduleid_key") references tsyspackageschedule(tsyspackageschedulekey) on update cascade on delete cascade;
alter table "public".tsysoidlookup add constraint "tsysoidlookup_itemtype_fkey" foreign key ("itemtype_key") references tsysassettypes(tsysassettypeskey) on delete cascade;
alter table "public".tsysmailconfig add constraint "tsysmailconfig_servername_fkey" foreign key ("servername_key") references tsysasservers(tsysasserverskey) on update cascade on delete cascade;
alter table "public".tsysipscanranges add constraint "tsysipscanranges_servername_fkey" foreign key ("servername_key") references tsysasservers(tsysasserverskey) on update cascade on delete cascade;
alter table "public".tsysiprangecredentials add constraint "tsysiprangecredentials_iprangeid_fkey" foreign key ("iprangeid_key") references tsysipscanranges(tsysipscanrangeskey) on delete cascade;
alter table "public".tsysiprangecredentials add constraint "tsysiprangecredentials_credid_fkey" foreign key ("credid_key") references tsyscredentials(tsyscredentialskey) on update cascade on delete cascade;
alter table "public".tsysipexclude add constraint "tsysipexclude_servername_fkey" foreign key ("servername_key") references tsysasservers(tsysasserverskey) on update cascade on delete cascade;
alter table "public".tsyseventfilter add constraint "tsyseventfilter_alertid_fkey" foreign key ("alertid_key") references tsyseventalerts(tsyseventalertskey) on delete cascade;
alter table "public".tsysdomainexclude add constraint "tsysdomainexclude_servername_fkey" foreign key ("servername_key") references tsysasservers(tsysasserverskey) on update cascade on delete cascade;
alter table "public".tsysdomaincredentials add constraint "tsysdomaincredentials_credid_fkey" foreign key ("credid_key") references tsyscredentials(tsyscredentialskey) on update cascade on delete cascade;
alter table "public".tsysdomaincontrollers add constraint "tsysdomaincontrollers_servername_fkey" foreign key ("servername_key") references tsysasservers(tsysasserverskey) on update cascade on delete cascade;
alter table "public".tsyscurrentscans add constraint "tsyscurrentscans_scanserver_fkey" foreign key ("scanserver_key") references tsysasservers(tsysasserverskey) on update cascade on delete cascade;
alter table "public".tsysassettypeexclude add constraint "tsysassettypeexclude_servername_fkey" foreign key ("servername_key") references tsysasservers(tsysasserverskey) on update cascade on delete cascade;
alter table "public".tsysassettypeexclude add constraint "tsysassettypeexclude_assettype_fkey" foreign key ("assettype_key") references tsysassettypes(tsysassettypeskey);
alter table "public".tsysassetgroupscan add constraint "tsysassetgroupscan_servername_fkey" foreign key ("servername_key") references tsysasservers(tsysasserverskey) on update cascade on delete cascade;
alter table "public".tsysassetgroupscan add constraint "tsysassetgroupscan_report_fkey" foreign key ("report_key") references tsysreports(tsysreportskey) on delete cascade;
alter table "public".tsysassetgroupscan add constraint "tsysassetgroupscan_assetgroupid_fkey" foreign key ("assetgroupid_key") references tblassetgroups(tblassetgroupskey) on delete cascade;
alter table "public".tsysassetgroupfilter add constraint "tsysassetgroupfilter_assetgroupid_fkey" foreign key ("assetgroupid_key") references tblassetgroups(tblassetgroupskey) on delete cascade;
alter table "public".tsysalertschedule add constraint "tsysalertschedule_scheduleid_fkey" foreign key ("scheduleid_key") references tsysschedule(tsysschedulekey) on delete cascade;
alter table "public".tsysadsischedule add constraint "tsysadsischedule_servername_fkey" foreign key ("servername_key") references tsysasservers(tsysasserverskey) on update cascade on delete cascade;
alter table "public".tsysasworkgroups add constraint "tsysasworkgroups_servername_fkey" foreign key ("servername_key") references tsysasservers(tsysasserverskey) on update cascade on delete cascade;
alter table "public".tsysassites add constraint "tsysassites_servername_fkey" foreign key ("servername_key") references tsysasservers(tsysasserverskey) on update cascade on delete cascade;
alter table "public".tsysasou add constraint "tsysasou_servername_fkey" foreign key ("servername_key") references tsysasservers(tsysasserverskey) on update cascade on delete cascade;
alter table "public".tsysasdomains add constraint "tsysasdomains_servername_fkey" foreign key ("servername_key") references tsysasservers(tsysasserverskey) on update cascade on delete cascade;
alter table "public".tblwinsat add constraint "tblwinsat_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblwarrantydetails add constraint "tblwarrantydetails_warrantyid_fkey" foreign key ("warrantyid_key") references tblwarranty(tblwarrantykey) on delete cascade;
alter table "public".tblwarranty add constraint "tblwarranty_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblvproamt add constraint "tblvproamt_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblvolume add constraint "tblvolume_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on update cascade on delete cascade;
alter table "public".tblvmwarenetwork add constraint "tblvmwarenetwork_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on update cascade on delete cascade;
alter table "public".tblvmwareinfo add constraint "tblvmwareinfo_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on update cascade on delete cascade;
alter table "public".tblvmwareguestnetwork add constraint "tblvmwareguestnetwork_guestid_fkey" foreign key ("guestid_key") references tblvmwareguest(tblvmwareguestkey) on update cascade on delete cascade;
alter table "public".tblvmwareguest add constraint "tblvmwareguest_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on update cascade on delete cascade;
alter table "public".tblvmwaredisk add constraint "tblvmwaredisk_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on update cascade on delete cascade;
alter table "public".tblvideocontrollerhist add constraint "tblvideocontrollerhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblvideocontroller add constraint "tblvideocontroller_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblusersingrouphist add constraint "tblusersingrouphist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblusersingroup add constraint "tblusersingroup_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblusershist add constraint "tblusershist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblusers add constraint "tblusers_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbluptime add constraint "tbluptime_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblups add constraint "tblups_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblusbdevices add constraint "tblusbdevices_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblusbcontrollerhist add constraint "tblusbcontrollerhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblusbcontroller add constraint "tblusbcontroller_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbltapedrivehist add constraint "tbltapedrivehist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbltapedrive add constraint "tbltapedrive_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbltpm add constraint "tbltpm_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblsystemenclosurehist add constraint "tblsystemenclosurehist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblsystemenclosure add constraint "tblsystemenclosure_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblsublicensesorders add constraint "tblsublicensesorders_licenseidid_fkey" foreign key ("licenseidid_key") references tbllicenses(tbllicenseskey) on update cascade on delete cascade;
alter table "public".tblsublicenses add constraint "tblsublicenses_licenseidid_fkey" foreign key ("licenseidid_key") references tbllicenses(tbllicenseskey) on update cascade on delete cascade;
alter table "public".tblsublicensedocs add constraint "tblsublicensedocs_licenseidid_fkey" foreign key ("licenseidid_key") references tbllicenses(tbllicenseskey) on update cascade on delete cascade;
alter table "public".tblsqlsubservers add constraint "tblsqlsubservers_licenseid_fkey" foreign key ("licenseid_key") references tblsqllicenses(tblsqllicenseskey) on delete cascade;
alter table "public".tblsqlservers add constraint "tblsqlservers_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblsqllicensesserverorders add constraint "tblsqllicensesserverorders_licenseid_fkey" foreign key ("licenseid_key") references tblsqllicenses(tblsqllicenseskey) on delete cascade;
alter table "public".tblsqllicensesorders add constraint "tblsqllicensesorders_licenseid_fkey" foreign key ("licenseid_key") references tblsqllicenses(tblsqllicenseskey) on delete cascade;
alter table "public".tblsqllicenses add constraint "tblsqllicenses_licensetype_fkey" foreign key ("licensetype_key") references tsyssqllicensetypes(tsyssqllicensetypeskey);
alter table "public".tblsqllicensedocs add constraint "tblsqllicensedocs_licenseid_fkey" foreign key ("licenseid_key") references tblsqllicenses(tblsqllicenseskey) on delete cascade;
alter table "public".tblsqldatabases add constraint "tblsqldatabases_sqlserverid_fkey" foreign key ("sqlserverid_key") references tblsqlservers(tblsqlserverskey) on delete cascade;
alter table "public".tblsounddevicehist add constraint "tblsounddevicehist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblsounddevice add constraint "tblsounddevice_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblsoftwarehist add constraint "tblsoftwarehist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblsoftware add constraint "tblsoftware_softid_fkey" foreign key ("softid_key") references tblsoftwareuni(tblsoftwareunikey);
alter table "public".tblsoftware add constraint "tblsoftware_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblshareshist add constraint "tblshareshist_shareuniqueid_fkey" foreign key ("shareuniqueid_key") references tblsharesuni(tblsharesunikey) on update cascade on delete cascade;
alter table "public".tblshareshist add constraint "tblshareshist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblshares add constraint "tblshares_shareuniqueid_fkey" foreign key ("shareuniqueid_key") references tblsharesuni(tblsharesunikey) on update cascade on delete cascade;
alter table "public".tblshares add constraint "tblshares_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblsharepermissions add constraint "tblsharepermissions_shareid_fkey" foreign key ("shareid_key") references tblshares(tblshareskey) on delete cascade;
alter table "public".tblservices add constraint "tblservices_stateid_fkey" foreign key ("stateid_key") references tblservicestate(tblservicestatekey);
alter table "public".tblservices add constraint "tblservices_startid_fkey" foreign key ("startid_key") references tblservicestartmode(tblservicestartmodekey);
alter table "public".tblservices add constraint "tblservices_serviceuniqueid_fkey" foreign key ("serviceuniqueid_key") references tblservicesuni(tblservicesunikey);
alter table "public".tblservices add constraint "tblservices_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblserialnumber add constraint "tblserialnumber_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblserialporthist add constraint "tblserialporthist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblserialport add constraint "tblserialport_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblscsicontrollerhist add constraint "tblscsicontrollerhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblscsicontroller add constraint "tblscsicontroller_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblscanhistory add constraint "tblscanhistory_scanningmethodid_fkey" foreign key ("scanningmethodid_key") references tsysscanningmethods(tsysscanningmethodskey) on delete cascade;
alter table "public".tblscanhistory add constraint "tblscanhistory_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblsnmpinfo add constraint "tblsnmpinfo_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on update cascade on delete cascade;
alter table "public".tblsnmpassetmac add constraint "tblsnmpassetmac_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on update cascade on delete cascade;
alter table "public".tblregistry add constraint "tblregistry_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblquickfixengineeringhist add constraint "tblquickfixengineeringhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblquickfixengineering add constraint "tblquickfixengineering_qfeid_fkey" foreign key ("qfeid_key") references tblquickfixengineeringuni(tblquickfixengineeringunikey);
alter table "public".tblquickfixengineering add constraint "tblquickfixengineering_installedbyid_fkey" foreign key ("installedbyid_key") references tblquickfixengineeringinstalledby(tblquickfixengineeringinstalledbykey);
alter table "public".tblquickfixengineering add constraint "tblquickfixengineering_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblproxy add constraint "tblproxy_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblprocessorhist add constraint "tblprocessorhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblprocessor add constraint "tblprocessor_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblprocesses add constraint "tblprocesses_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblprintershist add constraint "tblprintershist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblprinters add constraint "tblprinters_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblportablebatteryhist add constraint "tblportablebatteryhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblportablebattery add constraint "tblportablebattery_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblportconnectorhist add constraint "tblportconnectorhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblportconnector add constraint "tblportconnector_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblpointingdevicehist add constraint "tblpointingdevicehist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblpointingdevice add constraint "tblpointingdevice_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblphysicalmemoryhist add constraint "tblphysicalmemoryhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblphysicalmemoryarrayhist add constraint "tblphysicalmemoryarrayhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblphysicalmemoryarray add constraint "tblphysicalmemoryarray_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblphysicalmemory add constraint "tblphysicalmemory_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblparallelporthist add constraint "tblparallelporthist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblparallelport add constraint "tblparallelport_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblpagefilehist add constraint "tblpagefilehist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblpagefile add constraint "tblpagefile_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblpotsmodemhist add constraint "tblpotsmodemhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblpotsmodem add constraint "tblpotsmodem_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblpcmciacontrollerhist add constraint "tblpcmciacontrollerhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblpcmciacontroller add constraint "tblpcmciacontroller_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblossublicensesorders add constraint "tblossublicensesorders_oslicenseidid_fkey" foreign key ("oslicenseidid_key") references tbloslicenses(tbloslicenseskey) on update cascade on delete cascade;
alter table "public".tblossublicenses add constraint "tblossublicenses_oslicenseidid_fkey" foreign key ("oslicenseidid_key") references tbloslicenses(tbloslicenseskey) on update cascade on delete cascade;
alter table "public".tblossublicensedocs add constraint "tblossublicensedocs_oslicenseidid_fkey" foreign key ("oslicenseidid_key") references tbloslicenses(tbloslicenseskey) on update cascade on delete cascade;
alter table "public".tbloperatingsystemhist add constraint "tbloperatingsystemhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbloperatingsystem add constraint "tbloperatingsystem_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblonboarddevicehist add constraint "tblonboarddevicehist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblonboarddevice add constraint "tblonboarddevice_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblosrecoveryconfigurationhist add constraint "tblosrecoveryconfigurationhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblosrecoveryconfiguration add constraint "tblosrecoveryconfiguration_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblntlog add constraint "tblntlog_sourcenameid_fkey" foreign key ("sourcenameid_key") references tblntlogsource(tblntlogsourcekey);
alter table "public".tblntlog add constraint "tblntlog_messageid_fkey" foreign key ("messageid_key") references tblntlogmessage(tblntlogmessagekey);
alter table "public".tblntlog add constraint "tblntlog_loguserid_fkey" foreign key ("loguserid_key") references tblntloguser(tblntloguserkey);
alter table "public".tblntlog add constraint "tblntlog_logfileid_fkey" foreign key ("logfileid_key") references tblntlogfile(tblntlogfilekey);
alter table "public".tblntlog add constraint "tblntlog_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblnetworkhist add constraint "tblnetworkhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblnetworkclienthist add constraint "tblnetworkclienthist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblnetworkclient add constraint "tblnetworkclient_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblnetworkadapter add constraint "tblnetworkadapter_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblnetwork add constraint "tblnetwork_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblmonitorhist add constraint "tblmonitorhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblmonitor add constraint "tblmonitor_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblmappeddrives add constraint "tblmappeddrives_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblmacpartitions add constraint "tblmacpartitions_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblmacosinfo add constraint "tblmacosinfo_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblmacnetworkvolumes add constraint "tblmacnetworkvolumes_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblmacnetwork add constraint "tblmacnetwork_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblmacmodems add constraint "tblmacmodems_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblmacmemory add constraint "tblmacmemory_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblmachwoverview add constraint "tblmachwoverview_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblmacfirewires add constraint "tblmacfirewires_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblmacdisplays add constraint "tblmacdisplays_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblmacdiscburning add constraint "tblmacdiscburning_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblmacapplications add constraint "tblmacapplications_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbllinuxvolumes add constraint "tbllinuxvolumes_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbllinuxsystem add constraint "tbllinuxsystem_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbllinuxsoundcards add constraint "tbllinuxsoundcards_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbllinuxsoftware add constraint "tbllinuxsoftware_softwareuniid_fkey" foreign key ("softwareuniid_key") references tblsoftwareuni(tblsoftwareunikey);
alter table "public".tbllinuxsoftware add constraint "tbllinuxsoftware_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbllinuxprocessors add constraint "tbllinuxprocessors_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbllinuxpcicards add constraint "tbllinuxpcicards_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbllinuxopticaldrives add constraint "tbllinuxopticaldrives_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbllinuxnetworkdetection add constraint "tbllinuxnetworkdetection_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbllinuxmemorymodules add constraint "tbllinuxmemorymodules_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbllinuxmemorydevices add constraint "tbllinuxmemorydevices_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbllinuxmemorycontroller add constraint "tbllinuxmemorycontroller_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbllinuxharddisks add constraint "tbllinuxharddisks_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbllinuxgraphicscards add constraint "tbllinuxgraphicscards_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbllinuxenclosure add constraint "tbllinuxenclosure_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbllinuxbios add constraint "tbllinuxbios_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbllinuxbaseboard add constraint "tbllinuxbaseboard_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbllicenses add constraint "tbllicenses_licensetype_fkey" foreign key ("licensetype_key") references tsyslicensetype("tsyslicensetypekey");
alter table "public".tblkeyboardhist add constraint "tblkeyboardhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblkeyboard add constraint "tblkeyboard_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblinfrareddevicehist add constraint "tblinfrareddevicehist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblinfrareddevice add constraint "tblinfrareddevice_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblieextensionshist add constraint "tblieextensionshist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblieextensions add constraint "tblieextensions_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbliebarshist add constraint "tbliebarshist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbliebars add constraint "tbliebars_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbliebhohist add constraint "tbliebhohist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbliebho add constraint "tbliebho_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblieactivexhist add constraint "tblieactivexhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblieactivex add constraint "tblieactivex_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblidecontrollerhist add constraint "tblidecontrollerhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblidecontroller add constraint "tblidecontroller_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblhypervguest add constraint "tblhypervguest_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblgroupshist add constraint "tblgroupshist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblgroups add constraint "tblgroups_groupid_fkey" foreign key ("groupid_key") references tblgroupuni(tblgroupunikey) on update cascade on delete cascade;
alter table "public".tblgroups add constraint "tblgroups_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblfloppyhist add constraint "tblfloppyhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblfloppy add constraint "tblfloppy_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblfileversions add constraint "tblfileversions_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblfeature add constraint "tblfeature_featuniid_fkey" foreign key ("featuniid_key") references tblfeatureuni(tblfeatureunikey);
alter table "public".tblfeature add constraint "tblfeature_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblerrors add constraint "tblerrors_errortype_fkey" foreign key ("errortype_key") references tsysasseterrortypes(tsysasseterrortypeskey);
alter table "public".tblerrors add constraint "tblerrors_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblenvironment add constraint "tblenvironment_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblencryptablevolume add constraint "tblencryptablevolume_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbldisplaycontrollerconfigurationhist add constraint "tbldisplaycontrollerconfigurationhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbldisplaycontrollerconfiguration add constraint "tbldisplaycontrollerconfiguration_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbldisplayconfigurationhist add constraint "tbldisplayconfigurationhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbldisplayconfiguration add constraint "tbldisplayconfiguration_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbldiskdrives add constraint "tbldiskdrives_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbldiskpartitionhist add constraint "tbldiskpartitionhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbldiskpartition add constraint "tbldiskpartition_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbldesktopmonitorhist add constraint "tbldesktopmonitorhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbldesktopmonitor add constraint "tbldesktopmonitor_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbldesktop add constraint "tbldesktop_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbldcomapplicationhist add constraint "tbldcomapplicationhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbldcomapplication add constraint "tbldcomapplication_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblcustdevprinter add constraint "tblcustdevprinter_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblcomputersystemhist add constraint "tblcomputersystemhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblcomputersystem add constraint "tblcomputersystem_domainrole_fkey" foreign key ("domainrole_key") references tbldomainroles(tbldomainroleskey);
alter table "public".tblcomputersystem add constraint "tblcomputersystem_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblcomputersystemproducthist add constraint "tblcomputersystemproducthist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblcomputersystemproduct add constraint "tblcomputersystemproduct_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblcomponentcategoryhist add constraint "tblcomponentcategoryhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblcomponentcategory add constraint "tblcomponentcategory_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblcodecfilehist add constraint "tblcodecfilehist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblcodecfile add constraint "tblcodecfile_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblcplogoninfo add constraint "tblcplogoninfo_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblcomapplicationhist add constraint "tblcomapplicationhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblcomapplication add constraint "tblcomapplication_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblcdromdrivehist add constraint "tblcdromdrivehist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblcdromdrive add constraint "tblcdromdrive_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblbushist add constraint "tblbushist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblbus add constraint "tblbus_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblbootconfigurationhist add constraint "tblbootconfigurationhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblbootconfiguration add constraint "tblbootconfiguration_bootconfigurationuniid_fkey" foreign key ("bootconfigurationuniid_key") references tblbootconfigurationuni(tblbootconfigurationunikey) on update cascade on delete cascade;
alter table "public".tblbootconfiguration add constraint "tblbootconfiguration_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblbatteryhist add constraint "tblbatteryhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblbattery add constraint "tblbattery_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblbaseboardhist add constraint "tblbaseboardhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblbaseboard add constraint "tblbaseboard_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblbioshist add constraint "tblbioshist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblbios add constraint "tblbios_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblautorunhist add constraint "tblautorunhist_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblautorun add constraint "tblautorun_locationid_fkey" foreign key ("locationid_key") references tblautorunloc(tblautorunlockey);
alter table "public".tblautorun add constraint "tblautorun_autorununi_fkey" foreign key ("autorununi_key") references tblautorununi(tblautorununikey);
alter table "public".tblautorun add constraint "tblautorun_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblassets add constraint "tblassets_locationid_fkey" foreign key ("locationid_key") references tsysiplocations(tsysiplocationskey);
alter table "public".tblassets add constraint "tblassets_assettype_fkey" foreign key ("assettype_key") references tsysassettypes(tsysassettypeskey);
alter table "public".tblassetuserrelations add constraint "tblassetuserrelations_username_fkey" foreign key ("userdomain_username_key") references tbladusers(tbladuserskey) on delete cascade;
alter table "public".tblassetuserrelations add constraint "tblassetuserrelations_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblassetrelations add constraint "tblassetrelations_parentassetid_fkey" foreign key ("parentassetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblassetmacaddress add constraint "tblassetmacaddress_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblassetgrouplink add constraint "tblassetgrouplink_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblassetgrouplink add constraint "tblassetgrouplink_assetgroupid_fkey" foreign key ("assetgroupid_key") references tblassetgroups(tblassetgroupskey) on update cascade on delete cascade;
alter table "public".tblassetdocs add constraint "tblassetdocs_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblassetcustom add constraint "tblassetcustom_state_fkey" foreign key ("state_key") references tblstate(tblstatekey);
alter table "public".tblassetcustom add constraint "tblassetcustom_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on update cascade on delete cascade;
alter table "public".tblassetcomments add constraint "tblassetcomments_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tblantivirus add constraint "tblantivirus_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbladusers add constraint "tbladusers_manageradobjectid_fkey" foreign key ("manageradobjectid_key") references tbladobjects(tbladobjectskey);
alter table "public".tbladusers add constraint "tbladusers_adobjectid_fkey" foreign key ("adobjectid_key") references tbladobjects(tbladobjectskey) on delete cascade;
alter table "public".tbladmembership add constraint "tbladmembership_parentadobjectid_fkey" foreign key ("parentadobjectid_key") references tbladobjects(tbladobjectskey) on delete cascade;
alter table "public".tbladmembership add constraint "tbladmembership_childadobjectid_fkey" foreign key ("childadobjectid_key") references tbladobjects(tbladobjectskey);
alter table "public".tbladgroups add constraint "tbladgroups_manageradobjectid_fkey" foreign key ("manageradobjectid_key") references tbladobjects(tbladobjectskey);
alter table "public".tbladgroups add constraint "tbladgroups_adobjectid_fkey" foreign key ("adobjectid_key") references tbladobjects(tbladobjectskey) on delete cascade;
alter table "public".tbladcomputers add constraint "tbladcomputers_manageradobjectid_fkey" foreign key ("manageradobjectid_key") references tbladobjects(tbladobjectskey);
alter table "public".tbladcomputers add constraint "tbladcomputers_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tbladcomputers add constraint "tbladcomputers_adobjectid_fkey" foreign key ("adobjectid_key") references tbladobjects(tbladobjectskey) on delete cascade;
alter table "public".htblticketuserrelation add constraint "htblticketuserrelation_userid_fkey" foreign key ("userid_key") references htblusers(htbluserskey) on delete cascade;
alter table "public".htblticketuserrelation add constraint "htblticketuserrelation_ticketid_fkey" foreign key ("ticketid_key") references htblticket(htblticketkey) on delete cascade;
alter table "public".htbltickettypeteams add constraint "htbltickettypeteams_tickettypeid_fkey" foreign key ("tickettypeid_key") references htbltickettypes(htbltickettypeskey) on delete cascade;
alter table "public".htbltickettypeteams add constraint "htbltickettypeteams_teamid_fkey" foreign key ("teamid_key") references htblteams(htblteamskey) on delete cascade;
alter table "public".htbltickettypeslang add constraint "htbltickettypeslang_tickettypeid_fkey" foreign key ("tickettypeid_key") references htbltickettypes(htbltickettypeskey) on delete cascade;
-- alter table "public".htbltickettypes add constraint "htbltickettypes_replacementid_fkey" foreign key ("replacementid_key") references htbltickettypes(htbltickettypeskey);
alter table "public".htbltickettypes add constraint "htbltickettypes_agentid_fkey" foreign key ("agentid_key") references htblagents(htblagentskey);
alter table "public".htbltickettypecustomfield add constraint "htbltickettypecustomfield_tickettypeid_fkey" foreign key ("tickettypeid_key") references htbltickettypes(htbltickettypeskey) on delete cascade;
alter table "public".htbltickettypecustomfield add constraint "htbltickettypecustomfield_fieldid_fkey" foreign key ("fieldid_key") references htblcustomfields(htblcustomfieldskey) on delete cascade;
alter table "public".htblticketteam add constraint "htblticketteam_ticketid_fkey" foreign key ("ticketid_key") references htblticket(htblticketkey) on delete cascade;
alter table "public".htblticketteam add constraint "htblticketteam_teamid_fkey" foreign key ("teamid_key") references htblteams(htblteamskey) on delete cascade;
alter table "public".htblticketsubscribers add constraint "htblticketsubscribers_ticketid_fkey" foreign key ("ticketid_key") references htblticket(htblticketkey) on delete cascade;
alter table "public".htblticketsubscribers add constraint "htblticketsubscribers_agentid_fkey" foreign key ("agentid_key") references htblagents(htblagentskey) on delete cascade;
alter table "public".htblticketstateslang add constraint "htblticketstateslang_ticketstateid_fkey" foreign key ("ticketstateid_key") references htblticketstates(htblticketstateskey) on delete cascade;
-- alter table "public".htblticketstates add constraint "htblticketstates_replacementid_fkey" foreign key ("replacementid_key") references htblticketstates(htblticketstateskey);
alter table "public".htblticketssummary add constraint "htblticketssummary_userid_fkey" foreign key ("userid_key") references htblusers(htbluserskey) on delete cascade;
alter table "public".htblticketmerges add constraint "htblticketmerges_newtid_fkey" foreign key ("newtid_key") references htblticket(htblticketkey) on update cascade on delete cascade;
alter table "public".htblticketcustomfield add constraint "htblticketcustomfield_ticketid_fkey" foreign key ("ticketid_key") references htblticket(htblticketkey) on delete cascade;
alter table "public".htblticketcustomfield add constraint "htblticketcustomfield_fieldid_fkey" foreign key ("fieldid_key") references htblcustomfields(htblcustomfieldskey) on delete cascade;
alter table "public".htblticketasset add constraint "htblticketasset_ticketid_fkey" foreign key ("ticketid_key") references htblticket(htblticketkey) on delete cascade;
alter table "public".htblticketasset add constraint "htblticketasset_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".htblticket add constraint "htblticket_ticketstateid_fkey" foreign key ("ticketstateid_key") references htblticketstates(htblticketstateskey) on delete cascade;
alter table "public".htblticket add constraint "htblticket_priority_fkey" foreign key ("priority_key") references htblpriorities(htblprioritieskey) on delete cascade;
alter table "public".htblticket add constraint "htblticket_fromuserid_fkey" foreign key ("fromuserid_key") references htblusers(htbluserskey);
alter table "public".htblticket add constraint "htblticket_agentid_fkey" foreign key ("agentid_key") references htblagents(htblagentskey);
alter table "public".htbltemplateslang add constraint "htbltemplateslang_templateid_fkey" foreign key ("templateid_key") references htbltemplates(htbltemplateskey) on delete cascade;
alter table "public".htbltemplates add constraint "htbltemplates_categoryid_fkey" foreign key ("categoryid_key") references htbltemplatecategories(htbltemplatecategorieskey) on delete cascade;
alter table "public".htblteamslang add constraint "htblteamslang_teamid_fkey" foreign key ("teamid_key") references htblteams(htblteamskey) on delete cascade;
alter table "public".htblspecialrulestaskteams add constraint "htblspecialrulestaskteams_teamid_fkey" foreign key ("teamid_key") references htblteams(htblteamskey) on update cascade on delete cascade;
alter table "public".htblspecialrulestaskteams add constraint "htblspecialrulestaskteams_ruletaskid_fkey" foreign key ("ruletaskid_key") references htblspecialrulestasks(htblspecialrulestaskskey) on update cascade on delete cascade;
alter table "public".htblspecialrulestaskagents add constraint "htblspecialrulestaskagents_ruletaskid_fkey" foreign key ("ruletaskid_key") references htblspecialrulestasks(htblspecialrulestaskskey) on update cascade on delete cascade;
alter table "public".htblspecialrulestaskagents add constraint "htblspecialrulestaskagents_agentid_fkey" foreign key ("agentid_key") references htblagents(htblagentskey) on update cascade on delete cascade;
alter table "public".htblspecialrulesconditions add constraint "htblspecialrulesconditions_ruleid_fkey" foreign key ("ruleid_key") references htblspecialrules(htblspecialruleskey) on delete cascade;
alter table "public".htblspecialrulesactions add constraint "htblspecialrulesactions_ruleid_fkey" foreign key ("ruleid_key") references htblspecialrules(htblspecialruleskey) on delete cascade;
alter table "public".htblslausers add constraint "htblslausers_userid_fkey" foreign key ("userid_key") references htblusers(htbluserskey) on delete cascade;
alter table "public".htblslausers add constraint "htblslausers_slaid_fkey" foreign key ("slaid_key") references htblsla(htblslakey) on delete cascade;
alter table "public".htblslatickettypes add constraint "htblslatickettypes_tickettypeid_fkey" foreign key ("tickettypeid_key") references htbltickettypes(htbltickettypeskey) on delete cascade;
alter table "public".htblslatickettypes add constraint "htblslatickettypes_slaid_fkey" foreign key ("slaid_key") references htblsla(htblslakey) on delete cascade;
alter table "public".htblslasource add constraint "htblslasource_sourceid_fkey" foreign key ("sourceid_key") references htblsource(htblsourcekey) on delete cascade;
alter table "public".htblslasource add constraint "htblslasource_slaid_fkey" foreign key ("slaid_key") references htblsla(htblslakey) on delete cascade;
alter table "public".htblslapriorities add constraint "htblslapriorities_slaid_fkey" foreign key ("slaid_key") references htblsla(htblslakey) on delete cascade;
alter table "public".htblslapriorities add constraint "htblslapriorities_priority_fkey" foreign key ("priority_key") references htblpriorities(htblprioritieskey) on delete cascade;
alter table "public".htblsladepartments add constraint "htblsladepartments_slaid_fkey" foreign key ("slaid_key") references htblsla(htblslakey) on delete cascade;
alter table "public".htblslacompanies add constraint "htblslacompanies_slaid_fkey" foreign key ("slaid_key") references htblsla(htblslakey) on delete cascade;
alter table "public".htblshownclientrelations add constraint "htblshownclientrelations_relationtypeid_fkey" foreign key ("relationtypeid_key") references tsysassetrelationtypes(tsysassetrelationtypeskey) on delete cascade;
alter table "public".htblshortcutslang add constraint "htblshortcutslang_keyid_fkey" foreign key ("keyid_key") references htblshortcuts(htblshortcutskey) on delete cascade;
alter table "public".htblscheduletypeslang add constraint "htblscheduletypeslang_typeid_fkey" foreign key ("typeid_key") references htblscheduletypes(htblscheduletypeskey) on delete cascade;
alter table "public".htblscheduleteams add constraint "htblscheduleteams_teamid_fkey" foreign key ("teamid_key") references htblteams(htblteamskey) on update cascade on delete cascade;
alter table "public".htblscheduleteams add constraint "htblscheduleteams_scheduleid_fkey" foreign key ("scheduleid_key") references htblschedule(htblschedulekey) on update cascade on delete cascade;
alter table "public".htblschedulerepeat add constraint "htblschedulerepeat_scheduleid_fkey" foreign key ("scheduleid_key") references htblschedule(htblschedulekey) on delete cascade;
alter table "public".htblscheduleinfo add constraint "htblscheduleinfo_agentid_fkey" foreign key ("agentid_key") references htblagents(htblagentskey) on delete cascade;
alter table "public".htblscheduleagents add constraint "htblscheduleagents_scheduleid_fkey" foreign key ("scheduleid_key") references htblschedule(htblschedulekey) on update cascade on delete cascade;
alter table "public".htblschedule add constraint "htblschedule_typeid_fkey" foreign key ("typeid_key") references htblscheduletypes(htblscheduletypeskey) on delete cascade;
alter table "public".htblschedule add constraint "htblschedule_createdby_fkey" foreign key ("createdby_key") references htblagents(htblagentskey) on delete cascade;
alter table "public".htblsavedcustomfilters add constraint "htblsavedcustomfilters_userid_fkey" foreign key ("userid_key") references htblusers(htbluserskey) on delete cascade;
alter table "public".htblreportslang add constraint "htblreportslang_reportid_fkey" foreign key ("reportid_key") references htblreports(htblreportskey) on delete cascade;
alter table "public".htblprioritieslang add constraint "htblprioritieslang_priority_fkey" foreign key ("priority_key") references htblpriorities(htblprioritieskey) on delete cascade;
alter table "public".htbloldticketdata add constraint "htbloldticketdata_userid_fkey" foreign key ("userid_key") references htblusers(htbluserskey);
alter table "public".htbloldticketdata add constraint "htbloldticketdata_ticketid_fkey" foreign key ("ticketid_key") references htblticket(htblticketkey) on delete cascade;
alter table "public".htblnotificationschecked add constraint "htblnotificationschecked_userid_fkey" foreign key ("userid_key") references htblusers(htbluserskey) on delete cascade;
alter table "public".htblnotificationschecked add constraint "htblnotificationschecked_histid_fkey" foreign key ("histid_key") references htblhistory(htblhistorykey) on delete cascade;
alter table "public".htblnotes add constraint "htblnotes_userid_fkey" foreign key ("userid_key") references htblusers(htbluserskey);
alter table "public".htblnotes add constraint "htblnotes_ticketid_fkey" foreign key ("ticketid_key") references htblticket(htblticketkey) on delete cascade;
alter table "public".htblnotehistory add constraint "htblnotehistory_userid_fkey" foreign key ("userid_key") references htblusers(htbluserskey) on delete cascade;
alter table "public".htblnotehistory add constraint "htblnotehistory_noteid_fkey" foreign key ("noteid_key") references htblnotes(htblnoteskey) on delete cascade;
alter table "public".htblnewslang add constraint "htblnewslang_newsid_fkey" foreign key ("newsid_key") references htblnews(htblnewskey) on delete cascade;
alter table "public".htblknowledgebasecategoriesteams add constraint "htblknowledgebasecategoriesteams_teamid_fkey" foreign key ("teamid_key") references htblteams(htblteamskey) on delete cascade;
alter table "public".htblknowledgebasecategoriesteams add constraint "htblknowledgebasecategoriesteams_categoryid_fkey" foreign key ("categoryid_key") references htblknowledgebasecategories(htblknowledgebasecategorieskey) on delete cascade;
alter table "public".htblknowledgebasecategorieslang add constraint "htblknowledgebasecategorieslang_categoryid_fkey" foreign key ("categoryid_key") references htblknowledgebasecategories(htblknowledgebasecategorieskey) on delete cascade;
alter table "public".htblknowledgebaseattachments add constraint "htblknowledgebaseattachments_kbid_fkey" foreign key ("kbid_key") references htblknowledgebase(htblknowledgebasekey) on delete cascade;
alter table "public".htblknowledgebaseattachments add constraint "htblknowledgebaseattachments_fileid_fkey" foreign key ("fileid_key") references htblfiles(htblfileskey) on delete cascade;
alter table "public".htblknowledgebaselang add constraint "htblknowledgebaselang_kbid_fkey" foreign key ("kbid_key") references htblknowledgebase(htblknowledgebasekey) on delete cascade;
alter table "public".htblknowledgebase add constraint "htblknowledgebase_categoryid_fkey" foreign key ("categoryid_key") references htblknowledgebasecategories(htblknowledgebasecategorieskey);
alter table "public".htblhistory add constraint "htblhistory_userid_fkey" foreign key ("userid_key") references htblusers(htbluserskey);
alter table "public".htblhistory add constraint "htblhistory_userid3_fkey" foreign key ("userid3_key") references htblusers(htbluserskey);
alter table "public".htblhistory add constraint "htblhistory_userid2_fkey" foreign key ("userid2_key") references htblusers(htbluserskey);
alter table "public".htblhistory add constraint "htblhistory_typeid_fkey" foreign key ("typeid_key") references htblhistorytypes(htblhistorytypeskey) on delete cascade;
alter table "public".htblhistory add constraint "htblhistory_ticketid_fkey" foreign key ("ticketid_key") references htblticket(htblticketkey) on delete cascade;
alter table "public".htblhistory add constraint "htblhistory_agentid2_fkey" foreign key ("agentid2_key") references htblagents(htblagentskey);
alter table "public".htblfooterattachements add constraint "htblfooterattachements_userid_fkey" foreign key ("userid_key") references htblusers(htbluserskey) on delete cascade;
alter table "public".htblfooterattachements add constraint "htblfooterattachements_fileid_fkey" foreign key ("fileid_key") references htblfiles(htblfileskey) on delete cascade;
alter table "public".htbleventreminders add constraint "htbleventreminders_eventid_fkey" foreign key ("eventid_key") references htblschedule(htblschedulekey) on delete cascade;
alter table "public".htbleventinfochecks add constraint "htbleventinfochecks_infoid_fkey" foreign key ("infoid_key") references htblscheduleinfo(htblscheduleinfokey) on update cascade on delete cascade;
alter table "public".htblemailverification add constraint "htblemailverification_userid_fkey" foreign key ("userid_key") references htblusers(htbluserskey) on delete cascade;
alter table "public".htblemailtemplatestickettypes add constraint "htblemailtemplatestickettypes_tickettypeid_fkey" foreign key ("tickettypeid_key") references htbltickettypes(htbltickettypeskey) on delete cascade;
alter table "public".htblemailtemplatestickettypes add constraint "htblemailtemplatestickettypes_templateid_fkey" foreign key ("templateid_key") references htblemailtemplates(htblemailtemplateskey) on delete cascade;
alter table "public".htblemailtemplatesticketstates add constraint "htblemailtemplatesticketstates_ticketstateid_fkey" foreign key ("ticketstateid_key") references htblticketstates(htblticketstateskey) on delete cascade;
alter table "public".htblemailtemplatesticketstates add constraint "htblemailtemplatesticketstates_templateid_fkey" foreign key ("templateid_key") references htblemailtemplates(htblemailtemplateskey) on delete cascade;
alter table "public".htblemailtemplatespriorities add constraint "htblemailtemplatespriorities_templateid_fkey" foreign key ("templateid_key") references htblemailtemplates(htblemailtemplateskey) on delete cascade;
alter table "public".htblemailtemplatespriorities add constraint "htblemailtemplatespriorities_priority_fkey" foreign key ("priority_key") references htblpriorities(htblprioritieskey) on delete cascade;
alter table "public".htblemailtemplatesattachements add constraint "htblemailtemplatesattachements_templateid_fkey" foreign key ("templateid_key") references htblemailtemplates(htblemailtemplateskey) on delete cascade;
alter table "public".htblemailtemplatesattachements add constraint "htblemailtemplatesattachements_fileid_fkey" foreign key ("fileid_key") references htblfiles(htblfileskey) on delete cascade;
alter table "public".htblemailtemplateslang add constraint "htblemailtemplateslang_templateid_fkey" foreign key ("templateid_key") references htblemailtemplates(htblemailtemplateskey) on delete cascade;
alter table "public".htblemailaccountsteams add constraint "htblemailaccountsteams_teamid_fkey" foreign key ("teamid_key") references htblteams(htblteamskey) on delete cascade;
alter table "public".htblemailaccountsteams add constraint "htblemailaccountsteams_accountid_fkey" foreign key ("accountid_key") references htblemailaccounts(htblemailaccountskey) on delete cascade;
alter table "public".htblemailaccountslang add constraint "htblemailaccountslang_accountid_fkey" foreign key ("accountid_key") references htblemailaccounts(htblemailaccountskey) on delete cascade;
alter table "public".htblcustomticketfilters add constraint "htblcustomticketfilters_userid_fkey" foreign key ("userid_key") references htblusers(htbluserskey) on delete cascade;
alter table "public".htblcustomticketfilteritems add constraint "htblcustomticketfilteritems_filterid_fkey" foreign key ("filterid_key") references htblcustomticketfilters(htblcustomticketfilterskey) on delete cascade;
alter table "public".htblcustomfieldvalues add constraint "htblcustomfieldvalues_fieldid_fkey" foreign key ("fieldid_key") references htblcustomfields(htblcustomfieldskey) on delete cascade;
alter table "public".htblcustomfieldvaluelinks add constraint "htblcustomfieldvaluelinks_fieldvalueid_fkey" foreign key ("fieldvalueid_key") references htblcustomfieldvalues(htblcustomfieldvalueskey);
alter table "public".htblcustomfieldvaluelinks add constraint "htblcustomfieldvaluelinks_fieldid_fkey" foreign key ("fieldid_key") references htbltickettypecustomfield(htbltickettypecustomfieldkey) on update cascade on delete cascade;
alter table "public".htblcustomfieldslang add constraint "htblcustomfieldslang_fieldid_fkey" foreign key ("fieldid_key") references htblcustomfields(htblcustomfieldskey) on delete cascade;
alter table "public".htblautomaticclosetickettypes add constraint "htblautomaticclosetickettypes_tickettypeid_fkey" foreign key ("tickettypeid_key") references htbltickettypes(htbltickettypeskey) on delete cascade;
alter table "public".htblautomaticclosetickettypes add constraint "htblautomaticclosetickettypes_autocloseid_fkey" foreign key ("autocloseid_key") references htblautomaticclose(htblautomaticclosekey) on delete cascade;
alter table "public".htblautomaticcloseticketstates add constraint "htblautomaticcloseticketstates_ticketstateid_fkey" foreign key ("ticketstateid_key") references htblticketstates(htblticketstateskey) on delete cascade;
alter table "public".htblautomaticcloseticketstates add constraint "htblautomaticcloseticketstates_autocloseid_fkey" foreign key ("autocloseid_key") references htblautomaticclose(htblautomaticclosekey) on delete cascade;
alter table "public".htblautomaticcloselang add constraint "htblautomaticcloselang_autocloseid_fkey" foreign key ("autocloseid_key") references htblautomaticclose(htblautomaticclosekey) on delete cascade;
alter table "public".htblattachements add constraint "htblattachements_noteid_fkey" foreign key ("noteid_key") references htblnotes(htblnoteskey) on delete cascade;
alter table "public".htblattachements add constraint "htblattachements_fileid_fkey" foreign key ("fileid_key") references htblfiles(htblfileskey) on delete cascade;
alter table "public".htblagentteam add constraint "htblagentteam_webroleid_fkey" foreign key ("webroleid_key") references htblwebroles(htblwebroleskey) on delete cascade;
alter table "public".htblagentteam add constraint "htblagentteam_teamid_fkey" foreign key ("teamid_key") references htblteams(htblteamskey) on delete cascade;
alter table "public".htblagentteam add constraint "htblagentteam_agentid_fkey" foreign key ("agentid_key") references htblagents(htblagentskey) on delete cascade;
alter table "public".htblagents add constraint "htblagents_userid_fkey" foreign key ("userid_key") references htblusers(htbluserskey) on delete cascade;
alter table "public".htblagentconfig add constraint "htblagentconfig_agentid_fkey" foreign key ("agentid_key") references htblagents(htblagentskey) on delete cascade;
alter table "public".tsyswarrantyqueue add constraint "tsyswarrantyqueue_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tsyslastscan add constraint "tsyslastscan_cfgcode_fkey" foreign key ("cfgcode_key") references tsyswaittime(tsyswaittimekey);
alter table "public".tsyslastscan add constraint "tsyslastscan_assetid_fkey" foreign key ("assetid_key") references tblassets(tblassetskey) on delete cascade;
alter table "public".tsysdonotscan add constraint "tsysdonotscan_servername_fkey" foreign key ("servername_key") references tsysasservers(tsysasserverskey) on update cascade on delete cascade;
alter table "public".tblhypervguestnetwork add constraint "tblhypervguestnetwork_hypervguestid_fkey" foreign key ("hypervguestid_key") references tblhypervguest(tblhypervguestkey) on delete cascade;

-- step 11 add column installationkey on all tables 

do
$$
declare
  tname record;
begin
  for tname in select t.table_schema, t.table_name
               from information_schema.tables t
               where table_schema = 'public'
                 and not exists (select * 
                                 from information_schema.columns c
                                 where (c.table_schema, c.table_name) = (t.table_schema, t.table_name)
                                   and c.column_name = 'coltest') 
  loop
    -- change column definition in the following string
    execute format('alter table %I.%I add column installationkey bigserial not null;', tname.table_schema, tname.table_name);
  end loop;
end;
$$;

-- step 12 - create client table

create table public.client
(
	clientkey bigserial not null,
	name varchar(500), 
	constraint "client_pkey" primary key (clientkey)
);

-- step 13 - create installation table

create table public.installation
(
	installationkey bigserial not null,
	clientkey bigserial not null, 
	constraint "installation_pkey" primary key (installationkey)
);

-- step 14 add column lastmodifiedon on all tables 

do
$$
declare
  tname record;
begin
  for tname in select t.table_schema, t.table_name
               from information_schema.tables t
               where table_schema = 'public'
                 and not exists (select * 
                                 from information_schema.columns c
                                 where (c.table_schema, c.table_name) = (t.table_schema, t.table_name)
                                   and c.column_name = 'coltest') 
  loop
    -- change column definition in the following string
    execute format('alter table %I.%I add column lastmodifiedon timestamp default now();', tname.table_schema, tname.table_name);
  end loop;
end;
$$;

-- step 15 add column lastmodifiedby on all tables 

do
$$
declare
  tname record;
begin
  for tname in select t.table_schema, t.table_name
               from information_schema.tables t
               where table_schema = 'public'
                 and not exists (select * 
                                 from information_schema.columns c
                                 where (c.table_schema, c.table_name) = (t.table_schema, t.table_name)
                                   and c.column_name = 'coltest') 
  loop
    -- change column definition in the following string
    execute format('alter table %I.%I add column lastmodifiedby varchar(350);', tname.table_schema, tname.table_name);
  end loop;
end;
$$;

-- Steps added by Vivek Arya on 28/08/2018 16:17
-- Step 16 Add column createdat on all tables

do
$$
declare
  tname record;
begin
  for tname in select t.table_schema, t.table_name
               from information_schema.tables t
               where table_schema = 'public'
                 and not exists (select * 
                                 from information_schema.columns c
                                 where (c.table_schema, c.table_name) = (t.table_schema, t.table_name)
                                   and c.column_name = 'createdat') 
  loop
    -- change column definition in the following string
    execute format('alter table %I.%I add column createdat timestamp DEFAULT now();', tname.table_schema, tname.table_name);
  end loop;
end;
$$;

-- Step 17 Add column createdby on all tables

do
$$
declare
  tname record;
begin
  for tname in select t.table_schema, t.table_name
               from information_schema.tables t
               where table_schema = 'public'
                 and not exists (select * 
                                 from information_schema.columns c
                                 where (c.table_schema, c.table_name) = (t.table_schema, t.table_name)
                                   and c.column_name = 'createdby') 
  loop
    -- change column definition in the following string
    execute format('alter table %I.%I add column createdby varchar(350);', tname.table_schema, tname.table_name);
  end loop;
end;
$$;

END TRANSACTION;