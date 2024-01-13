#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��7�emenu.sh �=kwG���EGF�Ֆ1hv&���لp��ɱ=:m�-7HjE��&�{H���cfB`$�M $�`f��`��_Y�,����^���ղllCf�����n�wUW��U6+ڰn�n�[%����3�&� ��UCwry�^q��]�,��H�lr��.'Iz�,�:�bM?F�{��z툟�2/>��Fr����;�Po*EʎWug���C{M����vM+Yy�D�U���
Rk#��K���Z�^*��_n���)�z�mU+_E�T\员�%�WK���.������5��^-莑ˏ�#�):�E���y��J~d̶��UQH�Y2r�ldWH��Ů�襒��^�C^Z��R�m'�5GL��s̲���� 2�	eE��@�R��m�$��
����Ae�:H�x[�-��5���K�4)".P����J0ï!e�q�v���U3M��VYØ����w�pǨ8�&��8*B&RM��6T���ǎ �7(ه�(9��5�%у&��V}ó��MV@A]6���A�r�"�Q�U2��e�L`�m0!r@�ܢ�@��t�6��H_PU��\�nr�D��v�*$���x(urKѨ5�����d�^@j%�H�-7g�7�|�N�j�~o�ҍ�ً���ܿ\h\�j������W�[:3Ӈ��DDrQf�j����f�"s_6A2౫+�ڋ
�G��g�<�z�S,�,�W�D[W�SI�$%
](œ�h;B)��J��AL�Z�r�SX6�3G� PA��T�ԍ��"gԨ����ua�a�?]X:q�=�9sݝ���N���5�MQ5a�BMTIX��&?�K�֬�a۹qL�(y�&�a��b��e��uۨ��ʈ?ɸ�Z$�T(Xe�	��_c�ˁ�aQW���q\��jĔQ{nB�Ld8���rd��<� �vf�˙��SNڑ�;�|����Yj�""AD��[�1��@Ecv������s������ůB���G�Oo���U9c�@�l&k�t�N?ڶ&F����
�;� ���ub��~543��x�f��t�%��w�|+�Y9��xUƧ��¸ЬT�N;�(�>(*a�"���"���K�\F�|��[L�nx⣂���L�"#u��O��7��;T`�j|vc!(!�b�0�:a0���0,��������I�W��u��DP���Z
����?�,��'��%C�x
�Ɍ�M���F���
Fg_�D�= �����`s@~� �U$f%�K�r�,�H����!/�f?��Y?l#\,MbM�,�#
�D�df�
a�Ą2��*{c�Ąq�TM��;��]���v�MXj�>>��G�$�!b��M����q��U��C��Q����?���m2��V~%t��	,��R�O�b����]��-<�G�������(34)��h����1�r�fBH+�
�r��J
� �q����|���ҥ�ͧ��k�-��S�$�N+ pX���;Cҏ�����|�mc���`#��q�2�m>�Mu&���t�1�^kGi��q�P-,=�|gN����Օ�D�wY��h�y����Wp�8	+	�"��B���p�+�u%�%_'Č�ӓ��ٕU���}�ጄ���z	���4�>v��t���uq��{n�q�\�NLm��#�e����W~� ����W�}������%�Y�s"Z+��ez7X�
?���_��*����d�つl����r�>�V0�ҥO������CKg�A�/�8����Uo�P�EbW�<^&�%A��KavX�X�h -D<�[��X��R,�K��~�]��
�3�m�"��_�H,(�:⍯R4+�q��f�`�"�:�`����Cp�zT���Ή���j��pV #����%�1^mc�"�%=&�-r
u��w�lg��6�>Jj�Ym[�m�f����jRJ"|��:��
 S����c�O��l��(R�|�U%��WM�-�y&���v&�#�a���M�pF-0UG���w�ZV�G���[5gD�Z�c���]LH����S��Z�6�5mӪxKW�=�����bp�i�NR{�� .2БF@)���X���42�UlL	�r�h�Yj&�r	��9�g��\��
�f�|�!�Q`�7+uCȌGA���ʤR`��]⨌3�a$076����(��h���b:���;�@�bొ��'�+�X�T�R[)�9�dɭ�@�{��+�J�)XQ�Ы(����V� �V޳��ƪ	-�+!�_3����N���Ƹz�Pk'������V]���4��K��c�AE:FsC69�U��_Ԥ١`^�I�^�%x�G4)��������߽��%��ݓII#G����V$`a���2@��uX�`�UݶǬ�¶G��5f[�#��T� ���8B�Mi ә@���9wpj	�f�y�3�ށ�z�j������ԁ�T Y��L����؊<�O��g��}�Ô.���g2+k���oO�e��C� .�ݮ��V���2yJE
�r@	BT��,����l���ͨ����J�c��I0�m�#pM�qMa�|Li	�gs�Ђє�%�q^�ȱ�(b����c��v5� �KK�?/r�/���+!P*���}L28/Q�gR����1$�),��D$��B�cZ���~�j�z^���o���E��2����l����~��1�� �(~���bfΰ�z��?�-���b�'mm`P�6�nӊ�h?(K��P6 .h�a�?�r�1ۇC*���vhCZUjئ"�(չ���&�7k�Ӭ�CO������w���q���������*5�N�N��ףi�d$5�Yطo_�8�(q�9_��\	�s-vjIECqL"��U0
��-��:ߘ���N����DQڲ�<���C+�E �"-k)��@{x�r�x��x�<��!^��X+/�+�v^�rӋy�2V�ų���=b��x��^��֋�����⣛#V�Ň@��i�_͋�b�_ԋo��M/~�^�Fզ���oz�^�?�/����9���ŋ�X/��0��x��ae;"� Zn`��Z�fn�G|, k �ʭ]���>�+	�Zz��甁�T;!)5���k�*a��#��K���*�����!�<� $��.�JĹ��q�S���A���z[��!�F�g�K��b�RېX�@�#�n���^K�Vt���=Y��V����#��ɏ�ҍu�6����X'?��8�܇/���n�=��QEq�Y�������;K,��æ`~>�.�ͨ�?�Q��죦`~6���e�CY�1���J^dlF6�{d#bw?����.�!@���F�^ߘ�q�-���<؏�1�0�ŐF��h/��N��w�-�|%��]�'����j��`�!!��-^��8{����fQ�{�v�Ƀ�_g�>��a��-<����2��0��� ���F}O��wa���/��6c+ؘ�j�~c�$䳪M"ז;�]�W���O�1��X0"�����xpb�8Rm�#[��gV�*�Y�7��_�3��_�G��Ht��΄��ggK�s�JIY��r(�G&�p�dz�jN����&�-��T^W�z�%����V���n�*�T^��kSym*�EyMn���9���;��L��Jr�1]eɈ�������՗uu���o�&�L���Ε�fz& J���I�ұ�d��/��4��ST��!fų�q#�'�.:B� �o{ ��t�K�d�b���.'��%�g%�jIh/o�iZQH���H�s���r�m5� aL�`�eG���LL�W�h���]��:�@j)��3��(�� Q?�Q{�_/��	�v)��L�-�|���G�^����������򞯂X�jXK4�`���W��Ky� �����p�;|�iÊS�&�j`D�����18
a9�4��Tx�wt��Z5��w�5�<��7����6M7G�c���l��
�3���p��*�˕ܘYpF��n�8�A�\f:��,�� b�Etb/�(N^���k������L�x]Ծ"�D����QY��.�	X?Q�0.jD{˨}�����\YݿW�G�ݍ2 �!���KO�
�X�d�pj;��V����.���c�'wr����鍊��K!�Xo7AU�ˢ^�m|�`�JӸ�����B%�=����~mz\2mǨ�0L��1���1w{�t�䀯���ߥ�[���P��,�COn����ɯ�{7y�G;���y�f9 Ǐx�����Y�h�		�������-����k�L/��N�ŋ��ѓP��̊��щ���H$��ŲT���;�if��Q�Y�%��8�7�F�}ȕ&��ˏ҃43�V7���a�RaX��{��MBIgy���׎�\��DIҎb#p{r�Nr�$��:�wM�^C��$���Y�Y���B�M2g���L���p����B�S.3���qE�7�(Ҩ`>��!����s�3b��܇�����m
�[��vp�d]��?��2�ra;2�`����(�$'ʞ���Qر�XjPf2���9�Z\)����{���0�<��SDW�7>Z�w�xT��'>�$��HD%#�Ǟe�\�NX����R_p��/�B�[d�:��c�t�b��Z�6�\}��[�����]�zM��Ο�O�ϖ�]>�J���X"�5Ƭ���j�n�1�T�9�M(�ە��]�ji�	r~�VY��	Wb��ۗ��-- aM�l M��fF���������-XG��Q�Ԃe�b��3��Ν���� '��lŷ�������&��7��`����ѺorK(���VRI��/��FPQ�
u�B���G�VL��P�me>�!�|/��}K0��	�
�Ͱ�sX��o���%�o�:p�`69���;Ѝ�<5J��i�$z	��~�u��1�pl�p��O�Ӭ�m{z;������c��w.�p���F�?°T~vM���֌���F�M)�W�%�e�e9�����c�^R�F8e�+9��}�^���=��bj�ڜ;��O�?^v/L��o_n|�9�m\�i����K�''L��'.�OO.~w�}2�N���"�קZk�4�|z&��={z�/7Wn�3��)x�ϻg��_���^���sz���
.���#|+ �!���]�٥t��v�Վ�����7�:��U��G�"Y��s܃�2�?�<�P&��$iŮ;&>dC)�������j�6H6_����a�.�0'��8
Y��]x��K1�W�@�c����N�H�Ǭ�z�T5�'�֌��o2�s�H�R�W��-f+M ��J�	�6�����7�|x�$&��U�+�* B����ߛ?�B�Ӵ��nA5jz����տ6���R���|���1.��}F��[u�O��*T�L�yM
�|�`�kJ��UA��L�5z�J��N	�@5�І��J�/�ۊ�_� $
7��� Z\EE�Jr����]��9�I��2�[�I�ύ]Q���<�vqN����f��={�J� ��-.	޻1�:"s�y���޽�g��ſ����H~�f��7��ܸ�#�p���iR˲��b���(�: �彋VŞ�g�4?�5�> �-�()��zz��xڪ%����i�PO��5l�+�#�����?����S����`���"�L��	�#FԹ��G'�_}���"AW㯳��� S����㑳�њ��{O��*���i�I�}��o����q��%y=�l����WH���t�dL�^U׿��<�؝�]�����;sY�G��N�nξ���vL��0w��K�og����~y�,����{�GB��uA����{�s���hW<�8�`�̌;�؎4L�K�fɪFJz�����3�_3=�Hw���14Οo>�d����G�r�ٙ����&q����O�X#<ܼz��y�����1�܇��橫�,MR�.^�#���7�{d5g���^?GE��2d���nw���3��i��o��nB��,N�Y:y������˿7��.�����	�3�/�����m|z��d�=��{��{�(x(I�
ck�"��'5�،�av����Q�q���!��?yҍvQ�s/4nއJ���{�)�i/���o�n��ߟ�t�˲d��T�Mz���Uқ_~�j	i0
z��5�ˤ!�c�Hi�!	M���4a��Uj��_�
w��sfΌF�lQ�5s���g�7�'�/��P�S4/�xc��_�c�=4���p��t\���S�L���@h�Z���f����|�!>�K�c�T�U`Q�Z�r�n6Ņ{�p� 9�Cc�Lc�V�>{����٥�9�7K��f�a��B��ڰ��#]2|��I����@�߾)�ou}_��g?��R��x��ů��3����߮._��2��/��#�+tI ���m�4�+�O�}��� �Zs�������l���<�ӃS�<��#9��?����g�0����~���w�y;�` �,a��Y��c/�v쁷���H���-�����B�u@z�E�J�"�x�L+@Tc�f�әƿΊk��K�2��>Go���|(DJ6Z)[����}� m��)ۀxJ��=�*0L�����@�'�(�+_#[h��C�=�w�q��2�pM��b�f�gWRm�Nǵf���}r��쁂aT�ZN"��7:�Hx�����z���C�rOc%�"1�;D��:�J(j�I�C�M�E������$������6��{�����3�IB��
�6߃>�+�X�ˍ�lF%?�)������C�ޛ퍲���@�	�N@��@\+:����dMd����p�����44f~s�DѮ9v9W=:^��`��f�$]����`��W���{0�ۖR��軗�V��@M^B�ˉؔ�m:c�r4�F� �*� �_��+��%�bH�η�[ &����0n�~����8T\�w�B��ǫ��uU��U�x�d�B�?<(��
���86�[m��!�h�.�� �m��S˖��"��'�zt�Bv��гf؇U�.���s�w��6ݵ^pڭu��X�4��z`#M����N��;n�
m p����
�X�T3x,�v �L�ZNL10�S�4a��+s��� Pj��z�#P� 2Ĩ������1�
b]3���脍���(n|���<��(g/A�X��#�u�����Gˠ�{e��	�4i>���2n���H�ȶ�g��R��Б�Q�o�64��'��W��Hjh����2�<�8{���w���O�N�׻��Iw�Tɓ_��Z��&r��S
�{�ʈ�����3�0.�`H����l
>>5q�R��0�����=C�E��:V��?�SY:�,Ÿ�S: '����G�z�$Ƭ�p���	k�W.�K+�iV�8���!e_���i�je�j[�Z��q���%���I$�["#�i*��)>�NWƉ�'Q��%�
Xw�	R-�`܃~	M���g��U��>j?���CFA h|�]��7T����ߤ�Y�I�x�9�^�I��%Cj>�(rj�T�0_?s3@NݫD�+�5�*e��A'�K����;vL�T3�l��9�%3�ly��ң����pƌ}���y�xU't��߱Є0枝�&pnɒ�т��^��9Wr�Z�%A+�2]��1ޟ��wI^�柼�O]O�/\�/ۺ�q�u9Z��OԊ�.�\咽�+�]�����ɏ���^���}9�o@#ҁ�t�R�v�d��l	���-/^q�}����9�N�LM�ѝ"�jj�G���1hߟHa�v�_)�@u�%3�4bXR?�'g�~,����2�l������%�dv � ���q�d}�j���c|,�JH�L8�T}T�@�A�G�<�������h�<@[�c}���A�\��` ��.�4���Hl(
�AM�½�+��	v9��K}� ��RVJ��PWe��G��b+!wՓ�^��g��-�5d-��#�K�<��NCT�9$����4�~2B6:d��mo$�!�h,���4�o��c�˟�
�'��!{:糛RAY�O��5n��4�>{�����^���9��kw�U'l_�	f���W8@K��)���R}��p��2Y�s5;�)O����SuEOKfBڷ%ƃh���c6~����_���|4a8+ �g�\���=����Ӎ��X���pE��Lm��V�p��ԩ��	;�ϼ%O��#t {�����~�uP�9�����!%a�Q��Q�?��/zx�6Y
���w��Z����QM��pL�7e����p2�՛��������[����$���Q�v�3׫� ͐�� ��v��a3} ���ƙ��G&�\bR��d0\�rX�T�$A�ބ�
�G��	�\��u��>T�~v�)K�bژ`�������A=�=�1Ό)�L��ބ��m�@!�%�9#��m�
%�P*�Z����Fd�UH�րqBX�����L��Y�\w�˄6����}�����|;�h:�m�82���{1(.���g�e���\�63�b[&%tL���}~9E�����9t��|m��s;�~�}JS�V��R�5����e���D8W)��u׬�RՅ d�Ƴ�l	�2B����e*�p؇��F�[R50���v`� ��E6�NNN�E�)B,��^*����?_�M�X��!��KX��2ȍV�4�����B?,	~�ݒ����|+��h�XJ\���Q
^om6�%ꎔ�Ο&0t�f�L�T ��6 =��
k���rv�Ƣ�Th�^a���ZX�����qoxClzp�uh�}M���/I��4�[�[<G���T��~�phJ*�cƲg��� \�n}5��=����\��7����j�&D�`�Wa1h?i�*lL�jL`��ҍZ�-I Y%�X_�!���)]kyI�AVR�/L��b�0~�`Z	ٶ�M�(�1�i�3.J��b�/���W��� ļ���H��:�EglT�9�{j��"��>44@k%e�xW��+���%���ִՂ���?�\.����˨�W�~�(G���,������M�H�(U�nb'��CR3�x���8��XU��T�Y;�����!�fL9#���N-�"d�r�����>)rY�E���t�|�>9��>���{�xY�s�]��	vsp��~,��FJA�����M�UL���̤k������=���\A��i+���.���.��X�Ć���wp���a>�*<��$��lկ_>o�)e��.Zܚ��_�4�^��/�V�sh��Mȯ�����o�5uunznK.`�}^�Z�G�SP'��"�׹� ;:��q���^�܄gD�^tGp������#n���C��e�s��B������;N�C�#��"m�FJ�iYA+���3�B���*գXHy2��E.�0��h-5�0��$���� �^h��>nF�G��X��%���-��4�uJ��8�y:$f��_�k�t�k�ԗ�S�η�>f�J2���4������o�'|����Q�]�ߍ��8��n���z�����0ڱ�\�웝}�={��=��q�4^
/�o��B�9�\i�Ҍ7r��>��5oː�J�Bc�1��Y�!�t�c�����xF��3���/��M�M͓zi��	�"�s��npm�G��&�3�_bnP֠�(nC1���t���^fC�O���=��ÿ�ϣ��'aU@c�t�S�'_A;���Q^+��޳0Ӳ7�S��?d�d��\�p���=	|c����%K���D������͓ a�Pu94��ݻK�.,]?V���L2x<`#�Yq���x}v�Ŵ4���~�<:U��|��i�/���p��X�ւ��ރe�pU��^����J�JNf��7n�l�=�������'�TV��+˟����?����e�o����	��n�+�y������./~��Lմ<3S?yO���Q;-6��Iz�tz�H����JA��l�P)k>���<s�Q�\�X�vf���m}�R��S~�ê]���5=�/������sX�jo�R#���[��d��{nz��j�}���?S+��{����@�;7����^�J���f��X˲�0��',��Ln\���4��8{�%,ECO���}:*�4�#l<�:��{%�#�&Y�9�|����j-�w<
��f]��3��I�4I-S�uJh��.%xZ(ź.)�)��O��������\�.���+��y{Y��{ӟ��^����O�#�YE�e^Љ�U���v�Z�'�2�O9��X�
���c��S��wje�\g��0�[��^E�Y;����&��	\s�
�����'kr�R*U�2;7V-�%aԪ��$9�����PgD?�a��,<��|ST��MiNs�וѻ(�����?�OBP�,6[����{Mxx��z�V�-���``Snno/ ���^�Q��̠�F��é����}V����j��I�POHD���q��Ӕ���gϰ
%�j��~Y?q|i�.+۳t���+ �ט?_�����N,�>�G�4_�A������������@0?��h����Jt��@�6��`~DV9�l#p��G��,}}
�� ���%��x�;������� �4��������7�X�������ad{ʼ���؊)K���x��`�7sds9��f��J	��l�*�H��ʳr�u�Й����~�w���0�2���ϭ�ۇ:y'�,���,~7�4w}��K���K.���0�7X���l��=��IZ�{oDg#`Q����ɫM1��$e�ۤ5*-�H'�;�����TH��ն��N'◷��ώ��'/��W�3���ҵ�+wl�r�	����y����5v�>sR��g� �,D���z���9z4�èz�<�29쩪��w֩��7/-��}�v�Edk��pʱ8�Ȍ$��Tb?��XY!vFoZ-�LW���MF"�VD�Q����x����J][X�:�5�BYI�L_a�gU�o%���e_����pP%�������{M��˹� 7Tf��~evYRݧ�fV�T�L���
�TZ���$��D������Y�\_ɐ�X����t:95��<�	�p&�;�j�� I���Wi�W_l��<'�(Oa+��B:���4o R5.64PH������N�N��e����"G�qQ@����3���H�U��I��F��؜��
��I�e(��U�t0]LW�)`�_�%�G�����Ϧ�S�|1�����=���H�5M�J����2��MF!]	��#�������Z���P'1�N�@+�є��B�� ���4�O�[R�,�iV���a���Ҁ������ꆿ�P_1L[�W(0<��
<�Ŗ���Y�y�p`�rY���K�fgM�0�F>>푏k�8�b����@�5jr�ۡ �+�_	Sx��s�&,�{-� ��i^�*!+V�i�rk���Zi����Qu��~�e?TD��ȋGS#&�r��� �Y՛��z������ O��2��se�՛T3{�Ð�z*#�SeCЌ�.���_�����&p�����+.�~�Ee�B>J���"���aLO! �*-ܽ��eN�ֿ����k ȅ{7��<�%81����ܝ�\�����m|�I�»�{=um���Z	��a��Tl+�?��/01�^��֥a c+f��ɿg��O�)�UQ+-��J���?��tд���^� ���X�L��n&4�� ^�MG���� w�����'� xO$��NΘEye��
J&��G|���<&��_���gNL�^����� 0��@|GD�g���5n�`������q��ץ�I48�R���SF�E&	�ɄS�U�`�ӂ2��O�ޢ+�t������
+�6�@���RWZ�JK]i�+-u������Liú�ޮ��k��z���;���Le&��qN��E��
�bv?-�t��e�<b�'�Xϊ���g�'ܟ���yZ�P%o�*�|�R͌W�5'r���kF(�,/��s�h���p�УQ����y��`q�q<A3ݡ�ǀ�)������	[�ox��b����y�n|	_cX6P-H����_��/~5_��ti�~}���M;$���D=��v�'Sz`�?|U�r�nt_ 8_��_�x�M9Bv��[�IlJ�n��}��,Ub���>�K���lXJgP<cD�*��6�l��2%�W'#}��?X���ch�P?'o�,��	�a�<���c�i_d%��	XMƟٷ�U���N��U�"[ھm��6��#%H�ܡ�`܀/*�5t�h�8^�H�`��]���~�?�{���{����MFͪ`������}�t�ga�0��1��U��5�G�M�_C��W,�@r��T��dx)���,��s���qz��癁*l���;��^��m����;���{n��LL�R�ɑ��R�ur[���R��q&+�|%�Dҡǔ���Ni�����2��K��;fn���+�N%w�	��s�
\�!Yˀ`�dp5A�'�R�ߊ��|����+�e)w2�@���$���>W�ғ����1K��;�׎���F��ݘ����{�1T|M�lyo(���h���EG�>Jb�T*<� ��-�^^&;G��d�?�v�9Cp�����@2��{3[PX	j�_�����D���0+�,��!'	�dc�{�����'I�l��@A��=�yߠ6�V�l�竲(�����m��� �u��=�C0B�r"��.�<�T ���������z5�D o@ɂ��gd�Y�E��Y���xֱ����e6T�]n��m4g$�H~c]�\[T�c��<"�`��6��+�m֎��[a]��Zv%��T�g�q)f3Qf�N��h_NϷQR�4*ϛ�=�µ䏚�H{\��R[M\���.���_��H�x�r.ke�d�\��>85���5t1� ��� 2e�Be��S������� �t갻�T%fVH�BJ&i\��_xw�������_^�pj�����*��f�_�U�S���A�B�-�%���-}�R�֗fXVub'X�0ۚ�#r�������6��1\��D=�Z!2h[|A$2��}��*���(LL�n��l��2c��ZY6Ig4�s��_ ����^>a��$ߔ�Vy�t8�_��> �^��2�k�.���e�be�:|��Q'`��j�f��v�bq"#�!�5��{�{��d���� �ق�#��Ѿ�b��m��l�d9*9�F�ޅ�����$@�c�Wʖ'�Ex;>Q��g
��bQ_`D �����{�t�3��4s"')N���m�J��B9{ӹ�o������6�+O�rt*2�*�?�꧘$I�oW
:a�);�haD	:�`/�M*�|�t	C�'���H��!��0�'���p�O: Vf��rf��Hե�c��HA��
�>��A:K��[�i��h��<�&�}�4!E��aF�V5��ɌN_�:��R����`N0�3x..ՊN�Lt��d�v��o��e�P)���zI3�J�oIw��>@O�[fm�U�W���E��#v�*�蛩i2���(��L1:���A��D",���x	�;�.<��~�̓Nk���V��>{�q�4�፫�)��mt���K�H�lz���Dl*h�¾i�r��Z�< �C6����CWl	߀NN���(Wj/� ;A�Ɯ��}�tb�X� �a��xh����.iA9��K}�@ͮ�+�Z^��J�ې�s��`U�v2�/T���n��F|c)�1��ܑ�%DG��,R��	��G�F�,��M6��z���O�>���ٝ��h�q�3X���6�v�y���&s�8��#������*��)�UƵ4�W�f��p[rvfb��)��L�q���Y"wS�D�%����W�~��1���r�#*M�we���!�����j��A'�K����;vL�ܺ�$���W�o0+8%Vա92�g�,=:)b�.�F��"��D .(�jy�i"��Ifs�q�`�����Ǚ���ۙ�'I�p�����L��1W=:�,Nq�|�M&c�͜���)ql.wҸ%���M�ر9^��Ђ��*/�c9_F��|�J��B˻����%$TvfB>LL�TK$~@�v�e���-��U�2�CY8�����_��\�Es��F���	xrQ�E�:
�����CP�X�D9?Hv��|�Q��@��,����:y�ǁlS�3��
h�}�}eEwHm���=�ʖPP��2E�I!��i+ XF)ka*c�5԰@��9�aU�H=��Li<�1�b-�a+8����Ҧ�a�|���&�DN����
^Ӿ�;Z�.R4.b�?�g�_��W������T�硄�>Y��l}��O��1������Sѕ�K_]@ؑ�m}͸�~^�1�lU$��]���u��^X�ǄD	�L�+*��K�!L �_�dH?�ŏ�@2ޛ��2&\2TΞ3���`��@0��}lYz<�@SY�M�4j�kOŅb�"�S�ypI�S��:��Ly��߮������}�b�>.��a�$	y_��cA�l(Fc�@:� p��q�����[jl�D��g�ȅ��:i���To�۬`�٩�D�qf��:�8�P����+7�)d4�-�p$AyAJ��>���6��l�:��c��P;���)[/�1�wc�7���&�
CnB7)���,��7]����6��)���e�Y�R�ԓ�&Z�.q�2Qſ��U�s+�	�ؤ��J�g<\�T�҇��q1)=߁be2��ī��#��<�Mڪ�rA�����j�d�{(l�:~4_�R��[B��;�p�&��f�`B;�DE����S�ak�JYָ��V6�����؄+[��Q��r�؃>����Q�+;Q�����}`V�W?���~����%�M�t=�O�\`�𮳿�㿧{���ǵ��B����t�m�|[�)��P���,�I��u�Y�M���&�Mv������V9t�����ƥ��k�f��g	���V��q�x0�}����ځ�x�x49<�m��S���<h�P5)� "�`6@\ï��٥���گ_�G_.}zb���;;BsQ�Zw#D�� 2�#����G�vA��i��1o��=޽!:���n�k�Q���g�K��� ����,E� ��p����\v�[L�pU��!A{G��%FG7%�x�L�[�]����4U�H��-�����Z@T�, ވ(c�NũtkźQK�Vl�R���fc��v��v�P_Z1���j\��ή	� ��
?�����ԏ�3�;�*� ����+S	k"��ܒ��H��B�C���M��u �*T)u��-�y�H?u+���{�[����z�-P���
 V@�hK��,8)����~G��0>)0@�2XWp 㓫�����Nw�Zwk���k���[� �I�A�1�k124�C��K[�e��_�<��!y^��@�/vhK���I�d ����N���c�a��#OΠNl"��R�ܠR�{�PX℗UM��V�MN���q:s�"���;��~���� ���o������{V���U=m!>%b�.&VH�VM<}�A�(B�ï�}*���J���s]0ھ-w @Tm����6�5  ��Txs���" �������R
�-��?�"H��#��=�[I$4Y���$���{��6���,���.�Á���/���.�� �ȳm�� c�~�xB�-��ˤ��M�`py
��4�<@��C��	�@^���/�����;K�>\>y��h���̃�G���Β�4�|�K��]�D}�뱝l�'xj˂հX���덏-��,�f����[���|��!'�AM֡A+,,%化i;����|�f~ib�V�\'�W��/�;�������c����y1��Ʃ;h���n���X�I�س�%��燍�?4N]�d�f~��n��8_ߓ�O�l���>Z�xS�\������0��gN��*�l3�[�1��u������ǘ����Nfٓ�:�������w�����]�?x�����]�{�������z�>�>_�1�����{������p'e���]��r�=���u��gwݳ���]��{v�=���u��gwݳ���]�� ��������8���S���������Q�:�����\{>|�C��|�n�����DRv���ɼ�dg�FesZH������T�th�{i���<�;��q���V~&S�h&��0�́_�p���.��5״}J
���8~{�� �V�G#ݯ�UEG�D��1���䣨���c�F��Tj��3�t���+n���[J�4�S�a��ru"[�/��f���D��D�t}lYj�����hͩ��s�����?���	8Տ�GG�����������N��J�Wȝ���i�D"O�+~3�=ן�O�QHC�.8��a
�$Q*`I'8ނ9R��iK�T�X3gĶ}�*�|�A�n,�9�u�_h}�d���P,8 �g���\��_����=�Hvi�u���q��Jn!U6b2T+��LM�����|��;�8)k��];Xɏ���#
��
"#K��2��Oc��=�w�8�Lr^ox�.6
���֘��d��S�ӹ����uط���x�j#�R���t9[+������ȳ8�l~�.�:�����*@��My�?x4�*�8i'[̖��]݄���쁿2㓛J�6���T(�#��I/D��馿~B����ȏ��ױg��1u����<�x
��άX�#>�Oj~��ӷ�1N�FOdB���6}�i[�Mb�k�c!~5�Qy},�Q�qEi�"/�l@ԉ��D�_�5z�SeH��P��,��8��%ր��/�E�s/�G��N3�m0��'V��*����7�dś�b,���U�(X�7q�_��B�Z��Ǳ��8�� +��[6�MɆG1��V��Rؓ /�5�|s�����Avڊ��/UN0B-R��N�8l��H9Q����~S�7 Ir
�u�ۨ驹���Jֲ9!���(��|T֮��>YGY��Z&�6������%��	�x�υ��.^��8u����߻b���ٵ}+�Ohen��LKp����	�K��Wq�;�?ᗫ�-;�c�H�ڒ��/���s���k�?��X�퉥�qrQ}$kZ��

&�!m����!���@h����h��M�l+���83M�j��@̦2q#�*|Ŧ(� ��Y�^ߓ�M�4ݎ)�j9V����7�:j]#m��Tb�j�16(ʋ:I� U({��Աd
�1�=��~�j���6�;���P6�-z�՘E�Q&FǦ&ظj8E�nm�˯�[+ҩ�]h.�+Wbh^f��Z��k.��p� ��|�nR�6�.�k�R���3�����ץ?��=�CY]e�'3���������/�xꧫҍ�p����&�d��|*��T��u@�2������+�*y�T��+Uz��ν��2)�ry�K>�4�Q]���<�U�=��=�Yb�����a��Di��l�oe'��jiM}��~���0*c�-?�"��i�k�0HmP��T���o�_ٵ���v��גi���G{ q Y>q~��������X�����J!w0k�+ي��O٢�Dq���䜰}��;�4<��O$ET��j�9��S�Ε���D�v���5Oor,��|Bc|��)�#1vL�:�b��$�n�ho,Oϔ�3��L)�
Y�[7���򇏐���U��3C�U�ӊ�� DZ�K�����ūg6$7F,<��8>o�ZGj$�lڐ�F���O�xO���{�S�7>����x:�e��i��}��p���)�����bŞ������I��7��9޸�b�Q^��Ɓmp����^��2�"�K:$t�� �,ҴYs�c3B�&� �ӃS�O,ϼ�x��½w�7�x^�����E�ƥ���76��д��DƆK�.�?�����K�W���w�zm&����{#��`6�@�tlJi�e�R2l�7qpIςL2�-+W���;Ӕq��@�l�%�n?=����7-sJ	�'B�		�_`
��b�<8]��h�%[p�0w���܌�F/`8�(���_��*%�d������� � R�χ+Ú�?_�0��/9F�w�����2H��[�����U�����R: Ӓ~8V�7͒�؞�_�/<�
�%G����B���	�f����]+̙/�Jxo2�̾cI�{�ߐ��ыa<rА�kծMT˞v�-*ק�$%.
\��ܞ�1f��*
��R'��f�� �a�G�u`�
eD1}E��>dR�oB�8d<�m2�qHW!&���tt�\��OUPh��!������[�ʞrqG��U�w��+��L坥�_���\��I��D��S��{�� /L���=��'�gL��t<�H����g��zڈM����敏�y�.=�����5����U�e�i�~S��M�-6��o��_�6~����R��:A�£� #�͙������[����r#tw�����]/�f<���J��ؕ�RcWj|2�F�<�.�Fj-�0jQhT��㗔]ׯ2H)�b�v	���j��	6M�c~�I�=�����&x����M8�΢ݓ!������/w��꠰�8����ٖ�%�`8m�d򢽿�-�d�����M�m��� e���M:SB3�nd4�q�i��5�X�a����vxmA�UR��,.�%/��G0��Q��Lp�;���	��&4;\}���Gw�'n/���ҿ.�ϝ��d�]>��=�4�#̐`$��	/۵^��jh�t �� X��6���`f��_W�%�>�L�p�swq͸�vm�r[ck�l_z��VX������u��g�5��b��8���#�\�
G�/!�����o�3�[zta����3�7f�[&�Y�;�|q�-��P�.�����_�<���g������וOZ�O�`���%�`b	3�/�}�q�����Wo23�OBa���@e�P	E��DBa��<�`�P;8�?S�:�u6*�yV���6����lFX�	�an��~`��#4ɠ��Ll�$��ĜѠ+!�G	��N�^�k}��=�BCz��� 