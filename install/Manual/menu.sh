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
�nѓex.sh �=is�Ķ��+1�x�h�q�N��+�AH]ýT�fJ��m%3�0�x��-�ıC�s!@by���q���W�5�/�ӛ������!���>}���gS���ǔ>�P�Tk����5���ͪag3�ڡ���}Ѭd�=Zw{)�R���@E%E�e�r�+zWT��9�Dk�x�t �j1��\��rj�oM���B���	��h�VQm-��[�)4ւৢ�$��T��]��s������/\�M��]\p��\�㯗/���k/>W�ha��l'�A����7+��U�f� �h6A��e[[*uLR��0�0J��8Q�85Q���h˶J	^$���x��G�ŋX��ih��n���h�����C�u#�2BB��&jG�G�=�ngZ~�D�2������_�[��p�ܭ��93�g��k1�ۨ��j�@��\1�e�F�<��B`���ҍ��K
����*9�觃H�E̒�9}��V�*�E�g0�"c@7F|�,� �߯���E77�ۃ��jT�"��H�D��o��)M�-���uB��	L��:�<� ���֯�[Z�XZ�n��}���](Y��a��+�޿Dy2<�56JD�È�����P*�!x1���뚤�2���n��v@�Sau���?�Q6d�1�����$B��H@�����#!��C�����1G��R�T[�I�CHk���2Ո��4":�D�GБL#D)%�<k<+!=�)�Ę���K�G�a�#	|�̑�=�[{,�������Tу\�t��x���$T����G>`�=�v�;xy������4�&�6�X�+łW¥}�	Z��[����1�1�B�֑�2��B�������no�z��w��6P������^�w����ʅ��G�˟/-ޣ�B:��  ��ჍU8�2���f��3���P�f����|�������;��pc�:�6j�}�e�e�����U��1�r*%܆:�*��CS@I�-	7����<���8�mY)����c~��H)�GO
��jYe�3�Ӏ3R�e�(�LD������>?왧���}��N�xf�l�n*o0B�|��F���
?�g��Q��El}���=H�3y��m�]���r������w�̑�33��W&�k�#q�;�Q��M�7qK0]��R�*J�̫EE��
���M�_H��L�k��ζd����թ(u8= �I�[V�fk��KJ�ز,�WE7�l���ĉ�u�W��!Ũ���{3���묆����I�r�P܊<!���_��-�M�K��Rc�D�o��[S��ה���M�%�#����d��Zp%T0����g+h�\?�����h��%�mM�Z�YIEҍ>��KR�+fզ7
*'Ip���U� �H6���p$�{�����hT�PB�+/='�
Բ.���Ŷx�q�(@��-A7�e_I��B.?�VԼ�U�\�������r�,�f�b��hgG�%WʕyH�t��<��l���p��̹�r�t�1�@�.6 F!���	⑎�3pS�#ۿ����$���W+m�4K}'R/
߭�M#^E	e�tQo/v-��Ѝ�&�#a�`��2� v�f�o!��a��\`���I`D鑔�=X�z<�p�����,#��dJ>���R%ǈ�Ǔ�A�1�;���֖L�|v�,�m@(�gNm7zI���U���?q!@���_�#��R9~��ٽ���U�=c��^�B�.Q��c`j-�:���q�ǈ�Z$gk%0����3!��J�R?h:����<�E�n5ИE��4�#���绺r#���ϋڐ��Ǔ��`�F�F:g�%m5�v�<�jY��a��D�֠Z0�-3��M5�
��#t.:���Y-H7����q�	�Yw�}���owg\�Jgo_�6p��A�Ts=湛'��y�(�i~WDz�q�z0z;A��N�7�٨;�;��y(��%p>4C�ICE�Qi�)�*��T���$?D	=�x.I���@Hq3q�j�o���\$*�jKq%\��"�j���p�s�P��(Rj���E��"�,HEL;_x�qN�n�D�)	�g�1G���ϑ#J�]�\���Ύ���,�9���<�D`>6տ��p^zL�E���;������I�_�����Px��p����r�]c��I�N ��`L���D������{�aN��jY+=���j�'-��G�۫���U�a<��[�ެ�߹�^���O��l��/�Wz�rЫM�Qjo	�h���Jܣ��Y�����DZ�qw\=�s,���z�e ^l�
�-�����B��Pi8H8z�h@ ��Hq~9�Fq�<�p�)��ԩN�1E�y��rA* �r��	B�,��:�g�`B�Hkr�\���C)A��B=+� ��wc-������ڸ�&"�v��ؖ�]�Q���k^��܍ۅ��I�:�v�b�q�+�^�.`���~���齽q{���F�� ����C����0���q{F����۷S�v��ݸ}7nߍ�wJ�ބ�]��7�s �u�.ⱡ����Z�5�V�Z�@���[�Z�H��'`T#���m���5�����=�@���~���u�X���\q�r��!x�8��;%�Rst`�8C�@Z��z�s��Bl���fH,���]��k���j������5e�V ='�O�<D����<D`��F�[��u��<�N�G-u]����/�37!b�O�>�c٘͒M��~�.5����j�7O5�ۗ&�k�I4�-s�����d��/���?g�;��˼���y!��xޅ���."ɻ��������D�q�&�7,!����⨽Lp�Z7/!�U0RBn���71�{<�0�2�����GWkoϣV�����;�O�W>��EL��;�;�.�3S����mu¶���?�W%;by�&rKln�#��Z�3�$&��%��'�B��G>$|��NI�};�e�;&�����Dt��@�����ӦmӶ٥l6��C�O�٤��ˇP�"�䟝	�E� ��a.���Q*9eYƈ��Dh4OČ�k������lŚ��0T��T�QK�t��^õ�U�Pw��돸�r�p��]õk���k-�xKh�)�����S�`�ԢNפ��H ��#��'#�f�q�ot��O�r����cO�������f:���Zh����W�M&%k@��ƽ����4Lg��k*j�p�%�N���9%dE�H�	j	�El	��'��_��9.�&�%�k)��|I��v�T����$	���ְ���]S��B 6J��C��8���5*e�.�M�4Ա��ת��AnS��`�7�dJ��'#��t���� �;$��3!R� �}0�vIf�o����C�����YB��@�-�y>��Yw�1(������R�>��ZS�U�.��WE�����D;a5�'��%���mHeѷ�e݆a{K+P�ҕ(��Ez��SݫY���w�|�D�� 1��~ƥ&�+��\�X-�a�`f��#�m{�"~Ж�Ȑ2��t@ur	+zI���h������ ������J73����W���tQ�$�-��1F�IJ���X�l�rDx^��-�|o�J�}XU�j���]D�m����e�
�-��%~�$ր"R%~ΐ����B�鼭i�����5���DTR�V���1��Ȇ�ޘ�����q�̌s~޹�3w��×��b�����s̳�}������F:����p���~�+�[�̷�+p��\��-��o��Fr���xY�׈�^m�Ʉk��K&�w�L����%���6R�Ǳ�@��8�pc��������`�v��g8w��u�tMz
٣e����C&ΰ�t+��c�Dڊ�]~����I��h!_��P�<�E愑����@zo[tL�qh31ն	��~�ط����3�n����Mt���^�����_��e���:�`�����i� _bQ��ϑ��-�X������=H���%�^��J��K7��������<����-E��36���~�PH���i{�,�XGr����2@�VeS����kq���� ݣ:#,φ1]���EGY0�̬�H�B?ˏ��w>G𽋷NF�ԩ�J���!��x-���Wc'��hU�|s�F����CV���I>����x(+�a�Ă�G��-+e$�W8n*L���`�l�����g��Q8?��v���1L����$ )%�|�W�K$�ϸ#�U�;�y�W늏1�H/.�"�Y��g$�����b�����}4�	{,׃��;��� �=��i�f�*��1lP��<�?�{�=y�F������e��k]O��kޤ�d���V0(��U�3X�f��~>��c�T̓fA+�r�4+ь�F++<x ��|KotI*`�oǟ��L��|d���V�U��g�}�9�
���S��
~�U��U�L~T4��l~t�S��`l[��#h�M4-���j6pF�Q��#�#�g�/�Zi|,ľ�>��o��A�9_D�K�y	��r@�믾ԥ���h��:�;+A�hЩ�������B������}d��ȹ9]����@�s���;��S����!8-_��|��I�G�:���˗/.�P�����8g��.�Y�����x�ԧ���6�GQ�\PmM,�xb�B�WՋY�,�o�Z%�gYE�ŗ�����.3@.�y�,���y�h��	�P`Ud)>f� ��$���Q��~��7���� ��s39�����N��,=�R`4���ɋ��}��k�B5��[�[/+>���d4� �繟Ix3"�n��'��`7�@)#n��?G��g~r�E����ܷ������������r�9?CڃH;��ȗ�c<�����x���L}\�z�.-����K�_3*ચI��*V}}i�PMkU_�}Z�`����y��-_����3� ��g��u~8O1�MO8�ÄL�,ߟ��e����'�K��3��!G��2�hugja�h��ɴ�@��~6X.�0�A`n����o�ջ�e�E��+�w8��K��r���|~R��i}���;�I3���x������6�l�k�0+Iu| ݻ��ɟɠ�s�n0���|4	]�>݁���rf֙�O���DɤR�lѬ^(���[�)Ўo3I��ҚV��=j���mr ֣�Ԥ3���pq�9Υ�c]��΃����g�p�`R��K�U��@�B57��ҝ+�¿���[�Hѹiz�(���:!����.��x�+Pv����s�@��+�� ���M]�/p���@}J���Cħ��pf��=�>����s�����s�)¹ə��W)�����q���/�l�}�s��9�4���I�+���q�>uH�q/?����C ��P�ƴ��V�D�w��1"�wj7��&��G�9�g�gf�7oR^�^��A�,QEo�τuݯ��Ú��|7��~	r�]������߽�x{����s+s0��{��U<_8FD����;w~����?��I���ǒ&�� 9�a~K� ���咀�7����~ ��������t��=�=���#y��˗o�> ��~Y����[.S�Nsi�O	��siA�@���f5�ǘo!����K� �a����vYR���Vȕ+Z�>³���vs���v��{1����
�W��庩������٨n�K:<�4�g��~F��:g�����7ҽ�z��]�<E�|���{k���Tj�4��T-����6��w����V��ǅ��ͮ'��G����`�[�����G��a�d)	���o�b��ۿ��8���[�응�ɗ�~!�ۥ�|�]\��R
�`�k�ǜmC3	?S��/�x?��n�a[Ln�/�~�k+�'jč45;��K8x�c>��Z���F#Q�T8P��!L�/�+����0�%� �{* 4:�k\����gYBG(?��5c��!w:��a��exxX)j6Ğ��h��P�4$�kXkz���6?78���� ��<���6����)A0S�~N$�]�@
}ĵF�e���.�)�a�=&���,|V��he�R����e��Oز��E�g%����)��ERc��f��â��#T��ʱ���fÇ�
�R�	,�	q��|^q�M絘�sgK�Nܞ��F��Z`���w��MW�����E�6�,��P�L�����~jDپ1����`"<c2%��%�I�Ih�)����	%��Ē�'�����{�^Y�e��_,]�=wg�9{�o=�ؚ��94��=��ˢ�S�b�;l�%��]^kH���y�-�Z��$���Dix��=�����糶ZfM���+��SY�b��`&��[7�e���U%�Z%+WNT������S�F�7��\�F�9�g!���O����F�KNL�r���<˫�@�4N��9�����f�vf{4�PGN�%X������.PR�A1_�U�Iuf�d�2tTrh���c�����'ҫ
��&ћ���	�O�V�x�iU�~����4�Z��y��YK��vN�RŢy�f���D~�HC~�a�
ɐa�ix�F!��|��|Zc����޷��bi4ݒ\,E� Q�`�ɔ��*�!���E1���Ǎ�.[k"Z��l�(��6v�+�xI�;��Rzo���i-����/4��8[.��:���fL��A�~���ړ�!���w����o�x[��}F��Z̘[�`�C?�q���Q	!�]�RRC���R�,�*B/��BA�P�ˡJ���a��d�WT�����C�|�~�:u�˘_;�L����Q���kA�Qa�q�aԉ�dju��PP�,Tl�g��I��!�n>��wsf�:ԯ��»Q�g����Hr��(��1��F��X�h�I���s��T[ɾ?��O��������)��GċR�D�}0u<�ᴊ�\��I9��TPcsB9x)�$�.ԭ7�ZTA	n��e߳~���(�as>�ۧ����Xz�V�	fB��2��rah�g�m��r�_�� #�:<	�N�@z�H��1
(���=9W�!����0~P���������#�� :s<�-�Ufk�&�D����S������=Q�s4Kt�N�@�T{
c�D�)�1��l�3*rt,MF��s� v�&�o�狭Ne0��� �T�u� �x(OU�,7�\�G��j�q�%'X�\m԰һ�BX��D�s�8ۄ��b7k�U䶐���X2�NӨ�	T�C�o|B��f��,|�Y��?#]�>c��pö�e�nʩ]"ڈ�a�ͅ[�.�T�SA�o.��7�˦eء�j�K�D�8s�<.�v^�a��v�s��xP�����v�Z��%�NaW�j�e�]J)7�0���
(G�����O�כg����X�g4��9
<ƙ���X�Tç8�{�0��	D���J�:��Ø�O�>/<.E[c*���{l� �0ǅ���G�1)Z�D?�f����f�ɟ�wo�~�;�"�Gϸq�&2:T�ڸbBvc��Ŝ�U<���K�!�B��ݐ
��3���C����ջ�����p>ͩ��1�:�e@9�S�>4���0B��cc^�LK�?rS�A�"r��zrQR34��n �5s ���[�u�;F%e��M����Տ��Y>O���'�vH4w)�<�����$Y?2�s�C�0{��J6���v��ؼ�چp��LOy�Iu�Ouq��p-��1�60�D�2��"��Z�AiЌ��_?�(v��+�E�Np����z 6�;fi P���^?��梤��s�_��L�:�=��ם;d�<��y��s���eYٵ{���,+�z���ūo��C�N%^Cv9](���*�#f���a��Qn��oL람F6u���������H�ەO����[)�:�� �ܺ��m���6��O;ǃ�@xLX��d�7i�>`�G��e�����\�&��-�^0g��|A���2 R���\���)���n�\�j�_j1z��-B�����$���D8̩0��60^0�c�5@\�4��!�������KWX��!"�Aa|�J��5�����2�Xze��?�ݾp~�޷�/���s��`�n߽޹��Χ���@@�:��+�B��D<V?z_��y��̯s���^J�S��<c�s��Χ�� 챇�������%�8�#.{��ɦ��ɤ�tK��C��U!e�~��,A����v����	�P7��ff#٪��ݽ�ޓo��F�ENO��Ӫs%O�zꂭ�?�x�_g���m�P2�5#��DA�Q�R��ӿA�W��FL-��lqtX8���
�aSq��>��b���
��hč$#f�Y���i�n$�����:�:�I��ǵ��b���I��Bp������tۅ�Y�J4�����9_�[���G]�Q�k�@}m��p�X_r���H.�I�(W$*�Z,(@)��H,tWf�$�eҺ5�M���y���<W��Vq�حp�A6[�fc�Nu�'.k�[U�W����X̷E˸D�K�0�7��$?Jxf��E�i8�!��Ǉ���*��Õb�Py����"��ҹ��h~�����vB���tY"����'iC��갽}ac�6�n�E$���iq����&��=��i��1��o��""�7lq�f�=�Nü7A��LC�-���I�mL�BD�U^w΅��Nwt�qGG�	��Kt���|J�L���B'EDRj�q�zyf���#�|�TLj^R^o��	\)�Θ,w��{���m�Ńs��t�&Iiy�^�ܫ$������`���p0&a����n�^��D��f�9������ɲ_%��q$�$V�w������n�<���T�lu��`"w�xh��!!IOr1�(�c�Sz���-��6?{�������z���^�%�O�⸫8��q�6�-y�2�d�*/��g�O�!�ŏ�����{����X��}�s�/+�>$�
���Q���^=zxr/�|������y�at,pQ�ec���I�'!����#�Ï�Xabb�]�PM6��y����쇷�A_Az������V��LB���Zyr�s����:��
�M�u������ʓ{�k�1�C�}��W�@Y�K�䁢�����[:7�~�0r��[�l�:�(��O��r�Çn;AO��OzǼ��� [�:k�����0��g�.�2��g�.�K�&X{)�Z��'i��Ȥ����Y��71�1x+yP(�
�wQ���
�bs��x�:c�0hN�4ye�i��H"��&�o���>�z�EId&m2F�_L��ve;�;������D㠃F8�0�@>1�v�E"����ԜHf��'��L�>9.��O����=�Ьi�[G�=vUpJ]�L
0<Q�:��A�����qҚN��j�v��  