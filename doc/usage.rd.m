j
= TMail �λȤ���
e
= TMail Usage
.

j
== TMail �γ���
e
== Abstruction
.

j
TMail ���Żҥ᡼��򰷤���������饤�֥��Ǥ����᡼��ȥ᡼��
�ܥå����Υϥ�ɥ�󥰤��ä��ޤ����������Ū���᡼��κ������ä�
���ᡢ��ʻȤ����Ȥ��Ƥϡ֥᡼�뤫����������סֿ������᡼�����������
������ब���ꤵ��Ƥ��ꡢ���饤�����¦�ν����˶����ʤäƤ��ޤ���
e
TMail is 90% RFC compatible mail library. By using TMail, You can
get data from internet mail (e-mail) and write data to mail,
without knowning standard details.
.

j
== �᡼�뤫����������

����ϰ��ֺǽ�˼������줿��ʬ�Ǥ��ꡢTMail ���Ǥ����դȤ�������Ǥ�
����ޤ���
e
== Getting information from e-mail
.

j
=== TMail::Mail ���饹
e
=== class TMail::Mail
.

j
TMail::Mail ���饹�ϥ᡼����̤��ä��륪�֥������ȤǤ����ޤ��ɤ��ˤ�
���Ƥ��Υ��֥������Ȥ���ʤ��Ȥ����ޤ��󡣤��Υ��֥������Ȥ�����ˡ��
���̤ꤢ��ޤ���

  (1) ʸ���󤫤�Ĥ���
  (2) �ե�����(̾)����Ĥ���
  (3) Port ����Ĥ���

ʸ���󡢥ե�����Ϥ��줾��᡼�����ʬ������ޤ�Ǥ��ʤ���Ф����ޤ���
���Τ����ǰʲ��Τ褦�˺������ޤ���
e
At first you must create TMail::Mail object. There's three ways
to create Mail object. First one is "creating from string", second
way is "creating from file (name)". Examples are below:
.
--
require 'tmail'
mail = TMail::Mail.parse(string)    # from String
mail = TMail::Mail.load(filename)   # from file
--
j
�����ˤ��ä�����Ϥʤ��Ȼפ��ޤ���
.

j
=== Port �� Loader
e
=== Port and Loader
.

j
Port �Ȥ����Τ� TMail �ˤ�����᡼�륽���������ɽ���Ǥ������Ȥ���
��Ҥ���ʸ�����ե�����̾��᡼�륽�����ǡ�TMail::Mail#parse �� load ��
ʸ�����ե��������� Port �ǥ�åפ��������� Mail ���֥������Ȥ����
���Ƥ��ޤ������� Port �ǥ�åפ��뤳�Ȥ�ʸ���󡢥ե�����
(����Ū�ˤ� IMAP �ץ�ȥ���⡩) �ΰ㤤���ä��Ƥ��ޤ���

��������Port ��桼����ľ�ܺ�뤳�ȤϤ��ޤ�ʤ��Ǥ��礦����˥桼����
Port �򤵤�뤳�Ȥˤʤ�Τϡ��᡼��ܥå����Υ�åѡ��Ǥ��� Loader ��
�Ȥ��Ȥ��Ǥ������Ȥ��� MH �᡼��ܥå�������ˤ���᡼�����֤˽�������
����ˤϰʲ��Τ褦�ˤ��ޤ���
e
The third way to get TMail::Mail object is using the "port".
"port" is the abstruction of mail sources, e.g. strings or file names.
You can get ports by using mail loaders (TMail::*Loader classes).
Here's simple example:
.
--
require 'tmail'

loader = TMail::MhLoader.new( '/home/aamine/Mail/inbox' )
loader.each_port do |port|
  mail = TMail::Mail.new(port)
  # ....
end
--

j
=== TMail::Mail ���֥������Ȥ�����������
e
=== Accessing EMail Attributes via TMail::Mail object
.

j
�ʾ�Τ褦�ʼ��ʤ� TMail::Mail ���֥������Ȥ��ä��顢���ȤϤ��Υ᥽�åɤ�
�Ƥ֤����Ǥ����Ƥ��Τ��ȤϤǤ��ޤ������Ȥ��� To: ���ɥ쥹����ʤ�
e
Now you can get any data from e-mail, by calling methods of
TMail::Mail object. For example, to get To: addresses...
.
--
require 'tmail'
mail = TMail::Mail.parse( 'To: Minero Aoki <aamine@loveruby.net>' )
p mail.to   # => ["aamine@loveruby.net"]
--
j
Subject: �ʤ��
e
to get subject,
.
--
p mail.subject
--
j
�᡼�����Τʤ��
e
to get mail body,
--
p mail.body
--
j
�Ȥ����褦�ˡ��ȤƤ��ñ�Ǥ���
.

j
�ܤ����� TMail::Mail ���饹�Υ�ե���󥹤�
������Ū����Ȥ��Ƥ� sample/from-check.rb �򸫤Ƥ���������
e
For more TMail::Mail class details, see reference manual.
For more examples, see sample/from-check.rb.
.

j
=== MIME �ޥ���ѡ��ȥ᡼��

MIME �ޥ���ѡ��ȥ᡼��ˤ��б����Ƥ��ޤ����ޥ���ѡ��ȤΤȤ���
Mail#multipart? �����ˤʤꡢ#parts �� TMail::Mail ���֥������Ȥ�
��������ޤ���
e
=== MIME multipart mail

TMail also supports MIME multipart mails.
If mail is multipart mail, Mail#multipart? returns true,
and Mail#parts contains an array of parts (TMail::Mail object).
.
--
require 'tmail'
mail = TMail::Mail.parse( multipart_mail_string )
if mail.multipart? then
  mail.parts.each do |m|
    puts m.main_type
  end
end
--
j
������Ū����Ȥ��Ƥ� sample/multipart.rb �򸫤Ƥ���������
e
For examples, see sample/multipart.rb.
.

j
=== TMail �����ʤ�����

TMail �ϡ��إå��ϼ�ư�ǥǥ����ɡ����󥳡��ɤ��ޤ���������(��ʸ)��
�����ѹ����ޤ��󡣤������ᤤ����ˤ� Base64 �Υǥ����ɤϼ�ư�Ǥ��
���⤷��ޤ���
e
=== What TMail is NOT

TMail does not touch mail body. Does not decode body,
does not encode body, does not change line terminator.
(I want to support Base64 auto-decoding although.)
.


j
== �������᡼����������

������� TMail::Mail ���饹�����ΤǤ����Ȥˤ����᡼�����Ф���
���϶�ʸ���󤫤顢�᡼��ܥå����˺�ꤿ�����ϥ������ͳ����
�ݡ��Ȥ�������Ƥ������顢�᡼�륪�֥������Ȥ���ޤ���
e
== Creating New Mail
.
--
require 'tmail'

# Example 1: create mail on only memory
mail = TMail::Mail.new

# Example 2: create mail on mailbox (on disk)
loader = TMail::MhLoader.new('/home/aamine/Mail/drafts')
mail = TMail::Mail.new( loader.new_port )
--
j
��ä��顢��Ȥ�����ޤ���
e
then fill headers and body.
.
--
mail.to = 'test@loveruby.net'
mail.from = 'Minero Aoki <aamine@loveruby.net>'
mail.subject = 'test mail'
mail.date = Time.now
mail.mime_version = '1.0'
mail.set_content_type 'text', 'plain', {'charset'=>'iso-2022-jp'}
mail.body = 'This is test mail.'
--
j
�ɤΥإå��򥻥åȤ����餤�����ʤɺ٤�����ʬ��⤦����äȥ��С�
�������ΤǤ������ޤ��������Ƥ��ޤ��󡣤Ȥꤢ�����嵭�Υإå���
���åȤ����ۤ����褤�Ǥ��礦���ޤ��ֿ���ž���ξ��Ϥޤ����줾��
���󤬤���ޤ�������⥫�С��������ΤǤ����ޤ��������Ƥ��ޤ���
�С������ 1.0 �˴��Ԥ��Ƥ���������

�Ǹ��ʸ���󲽤��ޤ���
e
At last, convert mail object to string.
.
--
str = mail.encoded
--
j
�������ݡ��Ȥ˽��᤹�ʤ顢�����˰ʲ��Τ褦�ˤ��ޤ���
e
If you want to write mails against files directly
(without intermediate string), use Mail#write_back.
.
--
mail.write_back
--
j
write_back �����ʸ�����𤹤뤳�Ȥʤ��ե������ľ�ܽ񤭤��ߤޤ���

������Ū����Ȥ��Ƥ� sample/sendmail.rb �򸫤Ƥ���������
e
For more examples, see sample/sendmail.rb.
.
