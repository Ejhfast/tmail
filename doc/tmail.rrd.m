= module TMail

== Module Functions

: new_boundary -> String
j
    �������Х���������������֤��ޤ���
e
    creates new MIME multipart mail boundary.
.

: new_message_id(fqdn = Socket.gethostname) -> String
    fqdn: String

j
    ��������å����� ID ����������֤��ޤ���
    ���� fqdn ����ά���줿���ϥ�����ۥ��Ȥ�̾����Ȥ��ޤ���
    ���� fqdn ����ꤹ����ϥ�����륢�åפǤ���ʤɤλ���ˤ��
    �ۥ��Ȥ�̾�����Ѥ���ɬ�פ�����Τ��Ȥߤʤ�������� '.tmail' ��
    �Ĥ����ɥᥤ�����Ѥ��ޤ�������ϡ���ʪ�Ρץɥᥤ��Ǻ��������
    ��å����� ID �Ȥν�ʣ���򤱤뤿��Ǥ���
e
    creates new message ID.
.

: message_id?(str) -> true | false
    str: String

j
    str ����å����� ID ��ޤ�Ȥ�����
e
    returns true if STR includes message ID string.
.
