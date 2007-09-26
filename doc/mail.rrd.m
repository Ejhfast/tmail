@nocode MH
= class TMail::Mail

== Class Methods

: new(port = TMail::StringPort.new, config = DEFAULT_CONFIG) -> TMail::Mail
    port: TMail::Port
    config: TMail::Config

j
    port ���� Mail ���֥������Ȥ�������ޤ���
e
    creates a new 'TMail::Mail' object from PORT.
.

: load(filename) -> TMail::Mail
    filename: String

j
    �ե����� filename ����᡼�����ɤ��� Mail ���֥������Ȥ�������ޤ���
    ���ɤ���ե������ MH �Υ᡼��Τ褦�˥᡼����̤��ե�����ҤȤĤ�
    �б����Ƥ��ʤ���Ф����ޤ���

    ,UNIX mbox �Τ褦�ʷ�����ñ�ȤǤ��б����Ƥ��ޤ���
    <a href="mbox.html">�᡼��ܥå������饹</a>��ȤäƤ���������
e
    creates a new 'TMail::Mail' object. FILENAME is the name of file
    which contains just one mail (e.g. MH mail file).
.

: parse(str) -> TMail::Mail
    str: String

j
    ʸ���� str ��ѡ������� TMail::Mail ���֥������Ȥ�������ޤ���
    str �ϥ᡼�����ʬ�Ǥʤ���Ф����ޤ���
e
    parses STR and creates a new 'TMail::Mail' object.
.

== Instance Methods

: port -> TMail::Port
j
    ���Υ᡼�륪�֥������Ȥ��������Υݡ��ȤǤ���
e
    the source port of this mail.
.

: body_port -> TMail::Port
j
    �᡼����ʸ����¸���Ƥ���ݡ��Ȥ��֤��ޤ���

    �����������˽񤭤���Ǥ���ɸ��Υե�����(��ʸ����)���ѹ�����ޤ���
    �ºݤ��ѹ����뤿��ˤϤ��Υݡ��Ȥ˽񤭤������ #write_back ��Ƥ�
    ɬ�פ�����ޤ���
e
    the port to save body of this mail.
.

: each {|line| .... }
    line: String

j
    ��ʸʸ����γƹԤ��Ф��뷫���֤���
    body_port.ropen {|f| f.each } ��Ʊ���Ǥ���
e
    iterates for each lines of mail body.
.

: body -> String
: preamble -> String
j
    �᡼��ܥǥ�(��ʸ)���Ƥ�ʸ����Ȥ����֤��ޤ���
    MIME �ޥ���ѡ��ȥ᡼��ΤȤ��� preamble ���������ޤ���
    �����֤��ͤ��ѹ����Ƥ⥪�ꥸ�ʥ���ѹ�����ޤ���
e
    the mail body. If the mail is a MIME multipart mail,
    this attribute represents "preamble".
.

: parts -> [TMail::Mail]
j
    �᡼�뤬 MIME �ޥ���ѡ��ȥ᡼��λ����ƥѡ��Ȥ� TMail::Mail ������Ȥ���
    ��Ǽ����Ƥ��ޤ����ޥ���ѡ��ȥ᡼��Ǥʤ��Ȥ��϶�������Ǥ���

    �����������˽񤭤���Ǥ���ɸ��Υե�����(��ʸ����)���ѹ�����ޤ���
    �ºݤ��ѹ����뤿��ˤϤ��Υ��֥������Ȥ˽񤭤�������� #write_back ��
    �Ƥ�ɬ�פ�����ޤ���
e
    parts of this mail. (valid only if this mail is a MIME multipart mail)
.

: epilogue -> String
j
    MIME �ޥ���ѡ��ȥ᡼��Ǥ� epilogue ����������ʸ����Ǥ���
    �̾�Υ᡼��ΤȤ��϶�ʸ�������äƤ��ޤ���

    �����������˽񤭤���Ǥ���ɸ��Υե�����(��ʸ����)���ѹ�����ޤ���
    �ºݤ��ѹ����뤿��ˤϽ񤭤������ #write_back ��Ƥ�ɬ�פ�����ޤ���
e
    If the mail was MIME multipart mail, this represent "epilogue" string.
    Else, empty string.
.

: multipart?
j
    �᡼�뤬 MIME �ޥ���ѡ��ȤΤȤ�����
    ���Υ᥽�åɤ� Content-Type �إå������Ƥǿ�����Ƚ�Ǥ��ޤ���
e
    true if the message is a multi-part mail.
.

: encoded(eol = "\n", encoding = 'j') -> String
    eol: String
    encoding: String

j
    �᡼��� RFC2822 �����˥��󥳡��ɤ���ʸ������Ѵ����ޤ���
    ���κݡ��إå��ι��������ɤ� eol �ˡ��إå���Υ��󥳡�������
    ���ܸ�ʸ�����ʸ�������ɤ� encoding ���Ѵ����ޤ���
    ���������� encoding �� "j" (JIS) ���������ư��ޤ���

    �С������ 0.9 ����� #to_s �� #decoded ����̾�ˤʤä��Τǡ�����
    �᥽�åɤȤϰ㤦�Ϥ��餭�򤷤ޤ���
e
    converts the mail object to a MIME encoded string.
.

: decoded(eol = "\n", encoding = 'e') -> String
: to_s(eol = "\n", encoding = 'e') -> String
    eol: String
    encoding: String

j
    �᡼���ǥ����ɤ��줿ʸ������Ѵ����ޤ������κݡ��إå��ι���
    �����ɤ� eol �ˡ��إå���Υ��󥳡����������ܸ�ʸ�����ʸ�������ɤ�
    encoding ���Ѵ����ޤ���

    �С������ 0.9 �ʹߤ� #to_s �Ϥ��Υ᥽�åɤ���̾�ˤʤ�ޤ�����
e
    converts the mail object to a decoded string.
.

: inspect -> String
j
    ������ #decoded ����̾�Ǥ������С������ 0.9 �����
    "#<TMail::Mail port=<StringPort:str=...>>"
    �Τ褦�ʴʷ��ʸ���󲽤�Ԥ��ޤ���
e
    returns simple string representation like
    '"#<TMail::Mail port=<StringPort:str=...>>"'
.

: write_back(eol = "\n", encoding = 'e')
    eol: String
    encoding: String

j
    �᡼�����Τ�ʸ���󲽤� body_port �˽��ᤷ�ޤ������κݡ��إå���
    ���������ɤ� eol �ˡ��إå�������ܸ�ʸ�����ʸ�������ɤ� encoding ��
    �Ѵ����ޤ���
e
    converts this mail into string and write back to 'body_port',
    setting line terminator to EOL.
.

j
=== °�����������Τ���Υ᥽�å�
e
=== Property Access Method
.

: date(default = nil) -> Time
: date=(datetime)
    datetime: Time
    default: Object

j
    Date: �إå����б����� Time ���֥������ȡ�
    ��˥����륿������Ѵ�����ޤ���
e
    a Time object of Date: header field.
.

: strftime(format, default = nil) -> String
    format: String
    default: Object

j
    Date: �إå���ɽ�����줿������б����� Time ���֥������Ȥ��Ф�
    strftime ��ƤӤޤ���Date: �إå���¸�ߤ��ʤ����� default ��
    �֤��ޤ���
e
    is equals to 'date.strftime(format)'.
    If date is not exist, this method does nothing and
    returns DEFAULT.
.

: to(default = nil)  ->  [String]
: to=(specs)
    specs: String | [String]
    default: Object

j
    To: ���ɥ쥹�� spec ������
e
    address specs for To: header field.
.

: to_addrs(default = nil)  ->  [TMail::Address | TMail::AddressGroup]
: to_addrs=(addrs)
    addrs: TMail::Address | [TMail::Address]
    default: Object

j
    To: ���ɥ쥹������
e
    adresses which is represented in To: header field.
.

: cc(default = nil)  ->  [String]
: cc=(specs)
    specs: String | [String]
    default: Object

j
    Cc: ���ɥ쥹�� spec ������
e
    address specs for Cc: header field.
.

: cc_addrs(default = nil)  ->  [TMail::Address]
: cc_addrs=(addrs)
    addrs: TMail::Address | [TMail::Address]
    default: Object

j
    Cc: ���ɥ쥹������
e
    addresses which is represented in Cc: header field.
.

: bcc(default = nil)  ->  [String]
: bcc=(specs)
    specs: String | [String]
    default: Object

j
    Bcc: ���ɥ쥹�� spec ������
e
    address specs for Bcc: header field.
.

: bcc_addrs(default = nil) -> [TMail::Address]
: bcc_addrs=(addrs)
    addrs: TMail::Address | [TMail::Address]
    default: Object

j
    Bcc: ���ɥ쥹������
e
    adresses which is represented in Bcc: header field.
.

: from(default = nil) -> [String]
: from=(specs)
    specs: String | [String]
    default: Object

j
    From: ���ɥ쥹�� spec ������
e
    address specs for From: header field.
.

: from_addrs(default = nil) -> [TMail::Address]
: from_addrs=(addrs)
    addrs: TMail::Address | [TMail::Address]
    default: Object

j
    From: ���ɥ쥹������
e
    adresses which is represented in From: header field.
.

: friendly_from(default = nil) -> String
    default: Object

j
    From: �κǽ�Υ��ɥ쥹�� phrase �ޤ��� spec��
    From: ��¸�ߤ��ʤ��Ȥ��� default ���֤��ޤ���
e
    a "phrase" part or address spec of the first From: address.
.

: reply_to(default = nil) -> [String]
: reply_to=(specs)
    specs: String | [String]
    default: Object

j
    Reply-To: ���ɥ쥹�� spec ������
e
    address specs of Reply-To: header field.
.

: reply_to_addrs(default = nil) -> [TMail::Address]
: reply_to_addrs=(addrs)
    addrs: TMail::Address | [TMail::Address]
    default: Object

j
    Reply-To: ���ɥ쥹������
e
    adresses which is represented in Reply-To: header field.
.

: sender(default = nil) -> String
: sender=(spec)
    spec: String

j
    Sender: ���ɥ쥹�� spec
e
    address spec for Sender: header field.
.

: sender_addr(default = nil) -> TMail::Address
: sender_addr=(addr)
    addr: TMail::Address

j
    Sender: ���ɥ쥹
e
    an address which is represented in Sender: header field.
.

: subject(default = nil) -> String
: subject=(sbj)
    sbj: String

j
    Subject: �����ơ�
    Subject: ��¸�ߤ��ʤ��Ȥ��� default ���֤��ޤ���
e
    the subject of the message.
.

: message_id(default = nil) -> String
: message_id=(id)
    id: String

j
    �᡼��Υ�å����� ID��
e
    message ID string.
.

: in_reply_to(default = nil) -> [String]
: in_reply_to=(ids)
    ids: String | [String]

j
    In-Reply-To: �˴ޤޤ���å����� ID �Υꥹ�ȡ�
e
    message IDs of replying mails.
.

: references(default = nil) -> [String]
: references=(ids)
    ids: String | [String]

j
    References: �˴ޤޤ���å����� ID �Υꥹ�ȡ�
    ���ߤ� References: �ˤϥ�å����� ID �ʳ���
    �ޤ���ޤ���(RFC2822)
e
    message IDs of all referencing (replying) mails.
.

: mime_version(default = nil) -> String
: mime_version=(ver)
    ver: String

j
    MIME �С�����󡣸��ߤϾ�� "1.0" �Ǥ���
    �إå���¸�ߤ��ʤ����� default ���֤��ޤ���
e
    MIME version.
    If it does not exist, returns the DEFAULT.
.

: set_mime_version(major, minor)
    major: Integer
    minor: Integer

j
    MIME �С������򥻥åȤ��ޤ���
e
    set MIME version from integers.
.

: content_type(default = nil) -> String
j
    �᡼�����ΤΥե����륿���פ򼨤�ʸ�����㤨�� "text/plain"��
    �إå���¸�ߤ��ʤ����� default ���֤��ޤ���
e
    the content type of the mail message (e.g. "text/plain").
    If it does not exist, returns the DEFAULT.
.

: main_type(default = nil) -> String
j
    �᡼�����ΤΥᥤ�󥿥��� (�㡧"text")��
    ��˾�ʸ�������줵��ޤ���
    �إå���¸�ߤ��ʤ����� default ���֤��ޤ���
e
    the main content type of the mail message. (e.g. "text")
    If it does not exist, returns the DEFAULT.
.

: sub_type(default = nil) -> String
j
    �᡼�����ΤΥ��֥����� (�㡧"plain")��
    ��˾�ʸ�������줵��ޤ���
    �إå���¸�ߤ��ʤ����� default ���֤��ޤ���
e
    the sub content type of the mail message. (e.g. "plain")
    If it does not exist, returns the DEFAULT.
.

: content_type=(ctype)
    ctype: String

j
    Content-Type �Υᥤ�󥿥��ס����֥����פ� main_sub ���饻�å�
    ���ޤ���main_sub ���㤨�� "text/plain" �Τ褦�ʷ����Ǥʤ����
    �����ޤ���
e
    set content type to STR.
.

: set_content_type(main, sub, params = nil)
    main: String
    sub: String
    params: {String => String}

j
    ����ƥ�ȥ����פ� main/sub; param; param; ... �Τ褦�����ꤷ�ޤ���
e
    set Content-type: header as "main/sub; param=val; param=val; ...".
.

: type_param(name, default = nil) -> String
    name: String

j
    Content-Type �� name �ѥ�᡼�����ͤ��֤��ޤ���
    name ���б������ͤ�إå����Τ�Τ�¸�ߤ��ʤ����� default ��
    �֤��ޤ���
e
    returns the value corresponding to the case-insensitive
    NAME of Content-Type parameter.
    If it does not exist, returns the DEFAULT.
.
      --
      # example
      mail['Content-Type'] = 'text/plain; charset=iso-2022-jp'
      p mail.type_param('charset')   # "iso-2022-jp"
      --

: multipart? -> true | false
j
    Content-Type �� MIME �ޥ���ѡ��ȥ᡼��Ǥ��뤳�Ȥ�
    �������Ƥʤ�п���
e
    judge if this mail is MIME multi part mail,
    by inspecting Content-Type: header field.
.

: transfer_encoding(default = nil) -> String
: transfer_encoding=(encoding)
    encoding: String
j
    ž������Ŭ�Ѥ������󥳡��ǥ��� (Content-Transfer-Encoding)��
    '7bit' '8bit' 'Base64' 'Binary' �ʤɡ�
e
    Content-Transfer-Encoding. (e.g. "7bit" "Base64")
.

: disposition(default = nil) -> String
: disposition=(pos)
    pos: String

j
    Content-Disposition �μ��� (ʸ����)���֤��ͤϾ�˾�ʸ�������줵��ޤ���
    name ���б������ͤ�إå����Τ�Τ�¸�ߤ��ʤ����� default ��
    �֤��ޤ���
e
    Content-Disposition main value (e.g. "attachment").
    If it does not exist, returns the DEFAULT.
.
      --
      # example
      mail['Content-Disposition'] = 'attachement; filename="test.rb"'
      p mail.disposition   # "attachment"
      --

: set_content_disposition(pos, params = nil)
    pos: String
    params: {String => String}

j
    disposition ʸ����ȥѥ�᡼���Υϥå��夫�� Content-Disposition ��
    ���åȤ��ޤ���
e
    set content disposition.
.

: disposition_param(key, default = nil) -> String
    key: String

j
    Content-Disposition ���ղåѥ�᡼���� name ���ͤ�������ޤ���
    name ���б������ͤ�إå����Τ�Τ�¸�ߤ��ʤ����� default ��
    �֤��ޤ���
e
    returns a value corresponding to the Content-Disposition
    parameter NAME (e.g. filename).
    If it does not exist, returns the DEFAULT.
.
      --
      # example
      mail.disposition_param('filename')
      -- 

: destinations(default = nil) -> [String]
j
    To��Cc��Bcc ���٤ƤΥ��ɥ쥹���ڥå�ʸ����������
    �֤��ޤ����ҤȤĤ�¸�ߤ��ʤ���� default ���֤��ޤ���
e
    all address specs which are contained in To:, Cc: and
    Bcc: header fields.
.

: reply_addresses(default = nil) -> [TMail::Address]
j
    �ֿ����٤����ɥ쥹��Ƚ�Ǥ���Address ���֥������Ȥ�
    ������֤��ޤ����ֿ����٤����ɥ쥹���ߤĤ���ʤ����
    DEFAULT ���֤��ޤ���
e
    addresses to we reply to.
.

: error_reply_addresses(default = nil) -> [TMail::Address]
j
    ���顼�᡼����������٤����ɥ쥹��Ƚ�Ǥ���Address ���֥������Ȥ�
    ������֤��ޤ����������٤����ɥ쥹���ߤĤ���ʤ���� default ���֤��ޤ���
e
    addresses to use when returning error message.
.

j
=== �إå��ե������ľ������ѥ᥽�å�
e
=== Direct Header Handling Methods
.

: clear
j
    �إå������ƾõ�ޤ���
e
    clears all header.
.

: keys -> [TMail::HeaderField]
j
    �إå�̾��������֤��ޤ���
e
    returns an array of contained header names.
.

: [](name) -> TMail::HeaderField
    name: String

j
    �إå�̾����إå����֥������Ȥ��֤��ޤ���
e
    returns a header field object corresponding to the case-insensitive
    key NAME. e.g. mail["To"]
.

: []=(name, field)
    name: String
    field: TMail::HeaderField

j
    name �إå��� field �����ꤷ�ޤ���field ��ʸ���� TMail::HeaderField ���֥������ȤǤ���
    Received �ʤɰ����Υإå����Ф��ƤϤ���ˤ��������Ϳ���뤳�Ȥ��Ǥ��ޤ���
e
    set NAME header field to FIELD.
.

: delete(name)
    name: String
j
    name �إå���ä��ޤ���
e
    deletes header corresponding to case-insensitive key NAME.
.

: delete_if {|name, field| .... }
    name: String
    field: TMail::HeaderField

j
    �إå�̾�ȥإå���Ϳ���ƥ֥�å���ɾ���������ʤ餽�δ�Ϣ�Ť���ä��ޤ���
e
    evaluates block with a name of header and header field object,
    and delete the header if block returns true.
.

: each_header {|name, field| .... }
: each_pair {|name, field| .... }
    name: String
    field: TMail::HeaderField

j
    ���ƤΥإå�̾�ȥإå����֥������Ȥ��Ф��뤯�꤫������
e
    iterates for each header name and its field object.
.

: each_header_name {|name| .... }
: each_key {|name| .... }
    name: String

j
    ���ƤΥإå�̾���Ф��뤯�꤫������
e
    iterates for each contained header names.
.

: each_field {|field| .... }
: each_value {|field| .... }
    field: TMail::HeaderField

j
    ���ƤΥإå����֥������Ȥ��Ф��뤯�꤫������
e
    iterates for each header field objects.

: orderd_each {|name, field| .... }
    name: String
    field: TMail::HeaderField

j
    �إå��ν�������դ��� each_header �Ǥ����ǽ�˻��ꤷ����Τ����ꤷ��
    ���֤��¤ӡ�����¾�Υإå����������³���ޤ��������ʸ���������
    TMail::Mail::FIELD_ORDER �����ꤷ�Ƥ�������(�ܺ٤ϥ����������ɤ򻲾�)��
e
    iterates for each header field objects, in canonical order.
.

: key?(name)
    name: String

j
    name �إå�������п���
e
    returns true if the mail has NAME header.
.

: value?(field)
    field: TMail::HeaderField

j
    field �إå����֥������Ȥ�����п���
e
    returns true if the mail has FIELD header field object.
.

: values_at(*names) -> [TMail::HeaderField]
: indexes(*names) -> [TMail::HeaderField]
: indices(*names) -> [TMail::HeaderField]
    names: [String]

j
    ���Ƥ� names �ˤĤ��� fetch ������̤�������֤��ޤ���
e
    equals to 'names.collect {|k| mail[k] }'.
.

: values -> [TMail::HeaderField]
j
    ��Ͽ����Ƥ������ƤΥإå����֥������Ȥ�������֤��ޤ���
e
    returns an array of all header field object.
.
