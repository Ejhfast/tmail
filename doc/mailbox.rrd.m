= Mailbox Classes

== class TMail::MhMailbox

j
MH �����Υ᡼��ܥå������ä��륯�饹��
e
The class to handle MH mailboxes.
.

=== Class Methods

: new(dirname) -> TMail::MhMailbox
    dirname: String

j
    MhMailbox ���֥������Ȥ��������ޤ���
    dirname �� MH �᡼��ܥå����Ȥ��ƻȤ��ǥ��쥯�ȥ�̾�Ǥ���
    ���Ǥ˺������ߤǤʤ���Ф����ޤ���
e
    creates new MhMailbox object.
    DIRNAME must be valid MH mailbox directory.
.

=== Instance Methods

: each_port {|port| .... }
: each {|port| .... }
    port: TMail::FilePort

j
    �᡼��ܥå����Υ᡼����Ф��ƸŤ��᡼�뤫����֤˷����֤��ޤ���
e
    iterates for each mail in the mailbox,
    in assendant order (older mail first).
.

: reverse_each_port {|port| .... }
: reverse_each {|port| .... }
    port: TMail::FilePort

j
    �ǥ��쥯�ȥ���Υ᡼����Ф��ƿ������᡼�뤫����֤˷����֤��ޤ���
e
    iterates for each mail in the mailbox,
    in descendant order (newer mail first).
.

: last_atime -> Time
: last_atime=(time)
    time: Time

j
    �Ǹ�� each_new_port/each_port/reverse_each_port ��ƤӽФ������֡�
e
    The time which last each_new_port/each_port/reverse_each_port is called.
.

: each_new_port(time = last_atime()) {|port| .... }
    time: Time
    port: TMail::FilePort

j
    ����᡼��Τߤ��Ф��Ƥ��꤫�����ޤ���
    ���� time ��Ϳ����줿�Ȥ��Ϥ��λ���ʹߤ˹������줿�᡼�����Ȥߤʤ��ޤ���
    Ϳ�����ʤ��ä���������� each_mail, reverse_each_mail, each_new_port �θ��
    �������줿�᡼�����Ȥߤʤ��ޤ���
e
    iterates for each mails in mailbox, which are newer than TIME.
.

: new_port -> TMail::FilePort
j
    �������᡼����б�����ե�������������
    �б����� TMail::Port ���֥������Ȥ��֤���
e
    creates a new file in the mailbox and returns its port.
.

: close
j
    �ʤˤ⤷�ޤ���
e
    does nothing.
.

== class TMail::UNIXMbox

j
UNIX mbox �򰷤����饹�����ߤμ����Ǥϡ��������� MH �������Ѵ�����
����Ū�� close �ƤӽФ��� GC �Υ����ߥ󥰤ǥե�����˽��ᤷ�ޤ���
e
The class to handle UNIX mbox.
Current implementation creates temporary MH mbox.
.

=== Class Methods

: new(filename) -> TMail::UNIXMbox
    filename: String

j
    ������ TMail::UNIXMbox ���֥������Ȥ��������ޤ���
    filename �� UNIX mbox �ե�����̾�Ǥ���
e
    creates new TMail::UNIMbox object.
    FILENAME must be valid UNIX mbox file name.
.

=== Instance Methods

: each_port {|port| .... }
: each {|port| .... }
    port: TMail::FilePort

j
    �᡼��ܥå����Υ᡼����Ф��ƸŤ��᡼�뤫����֤˷����֤��ޤ���
e
    iterates for each mail in the mailbox,
    in assendant order (older mail first).
.

: reverse_each_port {|port| ... }
: reverse_each {|port| ... }
    port: TMail::FilePort

j
    �ǥ��쥯�ȥ���Υ᡼����Ф��ƿ������᡼�뤫����֤˷����֤��ޤ���
e
    iterates for each mail in the mailbox,
    in descendant order (newer mail first).
.

: each_new_port(time = @last_loaded_time) {|port| .... }
    time: Time
    port: TMail::FilePort

j
    ����᡼��Τߤ��Ф��Ƥ��꤫�����ޤ���
    ���� time ��Ϳ����줿�Ȥ��Ϥ��λ���ʹߤ˹������줿�᡼�����Ȥߤʤ��ޤ���
    Ϳ�����ʤ��ä���������� each_mail, reverse_each_mail, each_new_port �θ��
    �������줿�᡼�����Ȥߤʤ��ޤ���
e
    iterates for each mails in mailbox, which are newer than TIME.
    @last_loaded_time is updated when each_new_port/each_port is
    called.
.

: new_port -> TMail::FilePort
j
    �������᡼����б�����ե�������������
    �б����� TMail::Port ���֥������Ȥ��֤���
e
    creates a new file in the mailbox and returns its port.
.

: close
j
    ����Ū�˥᡼��ܥå�������ᤷ�ޤ����ʸ塢���Υ��֥������Ȥ�
    �Ф��ƥ᡼�����᥽�åɤ�ƤӽФ��������㳰�ˤʤ�ޤ���
e
    forces an UNIXMbox to write back mails to real mbox file.
    Once this method is called, any method calls causes to raise
    IOError exception.
.

== class TMail::Maildir

j
qmail �����Ѥ���᡼��ܥå��� maildir ���ä��륯�饹��
e
The class to handle "maildir" mailbox.
.

=== Class Methods

: new(dirname) -> TMail::Maildir
    dirname: String

j
    ������ TMail::Maildir ���֥������Ȥ��������ޤ���
    dirname �� maildir �᡼��ܥå����Ȥ��ƻȤ��ǥ��쥯�ȥ�̾�Ǥ���
    �ǥ��쥯�ȥ�Ϥ��Ǥ˺������ߤǤʤ���Ф����ޤ���
e
    creates new TMail::Maildir object.
    DIRNAME must be valid maildir.
.

=== Instance Methods

: each_port {|port| .... }
: each {|port| .... }
    port: TMail::FilePort

j
    �᡼��ܥå����Υ᡼����Ф��ƸŤ��᡼�뤫����֤˷����֤��ޤ���
e
    iterates for each mail in the mailbox,
    in assendant order (older mail first).
.

: reverse_each_port {|port| .... }
: reverse_each {|port| .... }
    port: TMail::FilePort

j
    �ǥ��쥯�ȥ���Υ᡼����Ф��ƿ������᡼�뤫����֤˷����֤��ޤ���
e
    iterates for each mail in the mailbox,
    in descendant order (newer mail first).
.

: each_new_port {|port| .... }
    port: TMail::FilePort

j
    MAILDIR/new �Υ᡼����Ф��ơ�cur �˰�ư�����Τ��˷����֤��ޤ���
e
    iterates for each mails in MAILDIR/new.
.

: new_port -> TMail::FilePort
j
    �������᡼����б�����ե�������������
    �б����� Port ���֥������Ȥ��֤���
e
    creates a new file in the mailbox and returns its port.
.
