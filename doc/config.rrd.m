= class TMail::Config

== Class Methods

: new(strict) -> TMail::Config
    strict: true | false

j
    TMail::Config ���֥������Ȥ��������ޤ���strict �����ξ�硢
    �������줿 Config ���֥������ȤΤ��٤Ƥ� strict_* �ե饰��
    ����ˤ��ޤ���
e
    create a TMail::Config object.
    set true to all strict_* attributes if STRICT is true.
.

== Instance Methods

: strict_parse?
j
    ���ʤ�� TMail �Υѡ����ϥإå��ѡ������ȯ������
    TMail::SyntaxError ���֤��ޤ���
e
    If this flag is true, TMail's parsers may raise
    TMail::SyntaxError. If not, it never raises SynaxError.
.
