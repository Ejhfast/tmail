= Address Classes

== class TMail::Address

=== Class Methods

: parse(str)  ->  TMail::Address | TMail::AddressGroup
    str: String

j
    ʸ���� str ���� TMail::Address �ޤ��� TMail::AddressGroup
    ���֥������Ȥ��������ޤ���str ���᡼�륢�ɥ쥹�Ȥߤʤ��ʤ�
    �Ȥ����㳰 TMail::SyntaxError ��ȯ�����ޤ���
e
    parses STR and creates new 'TMail::Address' object.
    If STR did not follow the internet address format,
    'TMail::SyntaxError' exception is raised.
.

: new(locals, domains)  ->  TMail::Address | TMail::AddressGroup
    locals: [String]
    domains: [String]

j
    ������ TMail::Address ���֥������Ȥ��������ޤ���locals��domains �Ϥ��줾��
    ���ɥ쥹���ڥå� (...@...) �Ρ����κ�¦�ȱ�¦��ɥåȤ� split ����
    ����Ǥ������Υ᥽�åɤ������ѤǤ���Ȥ��ˤ����ʤäƤ��ޤ���
    Address.parse ��ȤäƤ���������
e
    creates new 'TMail::Address' object consist from local part
    LOCALS and domain part DOMAINS.
.

=== Instance Methods

: address_group?  ->  true | false
j
    ��� false
e
    returns false.
.

: spec -> String
j
    ���ɥ쥹���ڥå�ʸ���� ("....@....")��
e
    an address spec ("....@....").
.

: routes -> [String]
j
    ������ϩ��ɽ��ʸ���������'@' �ϴޤޤʤ���
e
    delivery routes. Strings do not include character "@".
.

: name -> String
: phrase -> String
j
    ¯�˸������ɥ쥹�Ρ���̾����ʬ���ǥ����ɤ���Ƥ��ޤ���
e
    short description for this address (e.g. real name).
.

: encoded(eol = "\r\n", encoding = 'j') -> String
    eol: String
    encoding: String

j
    B ���󥳡��ɤ��줿 RFC2822 ������ʸ����ɽ�����֤��ޤ���
    ���������ɤ� eol��ʸ�����󥳡��ǥ��󥰤� encoding ��Ȥ��ޤ���
    ������ encoding �� j ������������Ƥ��ޤ���
e
    converts this object into MIME-encoded string.
.

: to_s(eol = "\n", encoding = 'e') -> String
: decoded(eol = "\n", encoding = 'e') -> String
    eol: String
    encoding: String

j
    �ǥ����ɤ��줿 RFC2822 ������ʸ����ɽ�����֤��ޤ���
    ���������ɤ� eol��ʸ�����󥳡��ǥ��󥰤� encoding ��Ȥ��ޤ���
e
    converts this object into decoded string.
.

: ==(other) -> true | false
    other: Object

j
    spec ��Ʊ��Ƚ��ˤ�ä� self �� other ����������Ƚ�ꤷ�ޤ���
    name �� routes �ϱƶ����ޤ���
e
    judge if self equals to other by inspecting addr-spec string (#spec).
    #name and #routes never affects the return value.
.


== class TMail::AddressGroup

=== Class Methods

: new(name, addrs) -> TMail::AddressGroup
    name: String
    addrs: [TMail::Address | TMail::AddressGroup]

j
    ������ TMail::AddressGroup ���֥������Ȥ�������ޤ���
    name �ϥ��롼��̾�򼨤�ʸ����addrs �� TMail::Address �ޤ���
    TMail::AddressGroup ������Ǥʤ���Ф����ޤ���
e
    creates new 'TMail::AddressGroup' object.
    NAME is the name of this group, ADDRS is addresses
    which belongs to this group.
.

=== Instance Methods

: address_group?  ->  true | false
j
    ��� true
e
    returns true.
.

: name -> String
j
    ���롼��̾��
e
    the human readable name of this group.
.

: addresses -> [TMail::Address | TMail::AddressGroup]
j
    TMail::Address �ޤ��� TMail::AddressGroup ���֥������Ȥ�����
e
    addresses which belongs to this group.
.

: to_a -> [TMail::Address | TMail::AddressGroup]
: to_ary -> [TMail::Address | TMail::AddressGroup]
j
    addresses.dup ��Ʊ���Ǥ���
e
    equals to 'addresses.dup'.
.

: flatten -> [TMail::Address]
j
    �Ƶ�Ū�� TMail::AddressGroup ���֥������Ȥ�ʿó������
    TMail::Address ���֥������Ȥ���������ޤ���
e
    flatten this group into one level of array of 'TMail::Address'.
.

: add(addr)
: push(addr)
    addr: TMail::Address | TMail::AddressGroup

j
    TMail::Address �ޤ��� TMail::AddressGroup ���֥������Ȥ�
    ���Υ��롼�פ��ɲä��ޤ���
e
    adds an address or an address group to this group.
.

: delete(addr)
    addr: TMail::Address | TMail::AddressGroup

j
    TMail::Address �ޤ��� TMail::AddressGroup ���֥������Ȥ�
    ���Υ��롼�פ����������� nil ���֤��ޤ�����Ȥ�Ȥ���
    ���ɥ쥹�����롼�����¸�ߤ��ʤ�����̵�뤷�� nil ���֤��ޤ���
e
    removes ADDR from this group.
.

: each {|a| .... }
    a: TMail::Address | TMail::AddressGroup

j
    #addresses ���Ф��뷫���֤���
e
    equals to 'addresses.each {|a| .... }'.
.

: each_address {|a| .... }
    a: TMail::Address

j
    #addresses ���Ф��뷫���֤��������� TMail::AddressGroup ���֥������Ȥ�
    �Ф��Ƥ����������äƺƵ�Ū�˷����֤��ޤ���
e
    equals to 'flatten.each {|a| .... }'
.

: encoded(eol = "\r\n", encoding = 'j')  ->  String
    eol: String
    encoding: String

j
    ,B ���󥳡��ɤ��줿 ,RFC2822 ������ʸ����ɽ�����֤��ޤ���
e
    converts this object into MIME-encoded string.
.

: decoded(eol = "\n", encoding = 'e')  ->  String
    eol: String
    encoding: String

j
    �ǥ����ɤ��줿 RFC2822 ������ʸ����ɽ�����֤��ޤ���
e
    converts this object into decoded string.
.

: ==(other)    ->  true | false
: eql?(other)  ->  true | false
    other: Object

j
    #addresses ��Ʊ��Ƚ��ˤ�ä�Ʊ�����Ƥ��ɤ�����Ƚ�Ǥ��ޤ���
    #name �ϱƶ����ޤ���
e
    judges if self is equal to OTHER, by comparing 'self.addresses' and
    'other.addresses'. ('self.name' is meanless)
.
