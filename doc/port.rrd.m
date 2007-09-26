= Port Classes

== class TMail::Port

j
TMail::Port �� TMail �饤�֥��ǤΥե������ʸ��������ɽ���Ǥ���
�᡼�����ʬ�ˤ�����꥽�������ä��ޤ���
e
TMail::Port is the abstruction of mail source.
.

=== Instance Methods

: ropen -> IO
j
    �ɤߤ����ѥ��ȥ꡼����֤��ޤ���
e
    opens stream for read.
.

: wopen -> IO
j
    �񤭤����ѥ��ȥ꡼����֤��ޤ���
e
    opens stream for write.
.

: aopen -> IO
j
    �ɲý񤭤����ѥ��ȥ꡼����֤��ޤ���
e
    opens stream for adding.
.

== class TMail::FilePort < TMail::Port

=== Class Methods

: new(filename) -> TMail::FilePort
    filename: String

j
    FilePort ���֥������Ȥ��������ޤ���
    filename �ϥ᡼����̤򤪤��᤿�ե�����̾�Ǥʤ���Ф����ޤ���
e
    creates new TMail::FilePort object.
.

: filename -> String
j
    ���Υݡ��Ȥ����ä��Ƥ���ե�����̾���֤��ޤ���
e
    returns file name which this port is wrapping.
.

== class TMail::StringPort < TMail::Port

=== Class Methods

: new(src = '') -> TMail::StringPort
    src: String

j
    StringPort ���֥������Ȥ��������ޤ���
    string �ϥ᡼�����ʬ��ʸ����Ǥʤ���Ф����ޤ���
e
    creates new TMail::StringPort object from
    mail source string.
.
