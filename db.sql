PGDMP         -                y            slr    13.1    13.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24696    slr    DATABASE     X   CREATE DATABASE slr WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE slr;
                postgres    false            �            1259    24697    architectures    TABLE     �   CREATE TABLE public.architectures (
    id uuid NOT NULL,
    description character varying NOT NULL,
    paper_id uuid NOT NULL,
    name character varying NOT NULL
);
 !   DROP TABLE public.architectures;
       public         heap    postgres    false            �            1259    24703 
   components    TABLE     �   CREATE TABLE public.components (
    id uuid NOT NULL,
    name character varying NOT NULL,
    architecture_id uuid NOT NULL,
    description character varying
);
    DROP TABLE public.components;
       public         heap    postgres    false            �            1259    24709    connections    TABLE     �   CREATE TABLE public.connections (
    id uuid NOT NULL,
    first_component uuid NOT NULL,
    second_component uuid NOT NULL
);
    DROP TABLE public.connections;
       public         heap    postgres    false            �            1259    24712    papers    TABLE     �  CREATE TABLE public.papers (
    id uuid NOT NULL,
    name character varying NOT NULL,
    doi character varying,
    authors character varying NOT NULL,
    paper_type character varying,
    journal character varying,
    added_by character varying NOT NULL,
    updated_by character varying NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    abstract character varying,
    comments character varying
);
    DROP TABLE public.papers;
       public         heap    postgres    false            �            1259    24719 
   properties    TABLE     �   CREATE TABLE public.properties (
    id uuid NOT NULL,
    key character varying NOT NULL,
    value character varying NOT NULL,
    component_id uuid
);
    DROP TABLE public.properties;
       public         heap    postgres    false            �          0    24697    architectures 
   TABLE DATA           H   COPY public.architectures (id, description, paper_id, name) FROM stdin;
    public          postgres    false    200   @#       �          0    24703 
   components 
   TABLE DATA           L   COPY public.components (id, name, architecture_id, description) FROM stdin;
    public          postgres    false    201   �)       �          0    24709    connections 
   TABLE DATA           L   COPY public.connections (id, first_component, second_component) FROM stdin;
    public          postgres    false    202   Q/       �          0    24712    papers 
   TABLE DATA              COPY public.papers (id, name, doi, authors, paper_type, journal, added_by, updated_by, status, abstract, comments) FROM stdin;
    public          postgres    false    203   �1       �          0    24719 
   properties 
   TABLE DATA           B   COPY public.properties (id, key, value, component_id) FROM stdin;
    public          postgres    false    204   #8       ?           2606    24726     architectures architectures_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.architectures
    ADD CONSTRAINT architectures_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.architectures DROP CONSTRAINT architectures_pkey;
       public            postgres    false    200            B           2606    24728    components components_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.components
    ADD CONSTRAINT components_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.components DROP CONSTRAINT components_pkey;
       public            postgres    false    201            I           2606    24730    papers papers_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.papers
    ADD CONSTRAINT papers_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.papers DROP CONSTRAINT papers_pkey;
       public            postgres    false    203            L           2606    24732    properties properties_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.properties DROP CONSTRAINT properties_pkey;
       public            postgres    false    204            G           2606    24734    connections relations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.connections
    ADD CONSTRAINT relations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.connections DROP CONSTRAINT relations_pkey;
       public            postgres    false    202            C           1259    24735    fki_archConstraint    INDEX     V   CREATE INDEX "fki_archConstraint" ON public.components USING btree (architecture_id);
 (   DROP INDEX public."fki_archConstraint";
       public            postgres    false    201            J           1259    24736    fki_compConstraint    INDEX     S   CREATE INDEX "fki_compConstraint" ON public.properties USING btree (component_id);
 (   DROP INDEX public."fki_compConstraint";
       public            postgres    false    204            D           1259    24737    fki_first_component_constraint    INDEX     a   CREATE INDEX fki_first_component_constraint ON public.connections USING btree (first_component);
 2   DROP INDEX public.fki_first_component_constraint;
       public            postgres    false    202            @           1259    24738    fki_paperConstraint    INDEX     S   CREATE INDEX "fki_paperConstraint" ON public.architectures USING btree (paper_id);
 )   DROP INDEX public."fki_paperConstraint";
       public            postgres    false    200            E           1259    24739    fki_second_component_constraint    INDEX     c   CREATE INDEX fki_second_component_constraint ON public.connections USING btree (second_component);
 3   DROP INDEX public.fki_second_component_constraint;
       public            postgres    false    202            N           2606    24740 !   components architectureConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.components
    ADD CONSTRAINT "architectureConstraint" FOREIGN KEY (architecture_id) REFERENCES public.architectures(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 M   ALTER TABLE ONLY public.components DROP CONSTRAINT "architectureConstraint";
       public          postgres    false    200    201    3135            Q           2606    24745    properties compConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.properties
    ADD CONSTRAINT "compConstraint" FOREIGN KEY (component_id) REFERENCES public.components(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public.properties DROP CONSTRAINT "compConstraint";
       public          postgres    false    201    3138    204            O           2606    24750 $   connections firstComponentConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.connections
    ADD CONSTRAINT "firstComponentConstraint" FOREIGN KEY (first_component) REFERENCES public.components(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public.connections DROP CONSTRAINT "firstComponentConstraint";
       public          postgres    false    202    3138    201            M           2606    24765    architectures paperConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.architectures
    ADD CONSTRAINT "paperConstraint" FOREIGN KEY (paper_id) REFERENCES public.papers(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 I   ALTER TABLE ONLY public.architectures DROP CONSTRAINT "paperConstraint";
       public          postgres    false    200    203    3145            P           2606    24760 %   connections secondComponentConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.connections
    ADD CONSTRAINT "secondComponentConstraint" FOREIGN KEY (second_component) REFERENCES public.components(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 Q   ALTER TABLE ONLY public.connections DROP CONSTRAINT "secondComponentConstraint";
       public          postgres    false    201    202    3138            �   1  x�}VMo�8='����,�_��c�P4�-���eDQ�Ԓ�S��d�AZ�)����7o���auX��S�٭7�n[7�t�y��]�<�1w���)��{�6xe����$��ɨ���0����)�BoT�����j���L|�ŇW��7��wV�$CQw�Y�g��`�Q��n��:��(�t4��?�!�nGe��jk�>K��\�P�[oS�(u�rZ���kG�����FR��	gM�l�Ī�L
����Ku)"��9WP�QR��۔ �R}�mG�EZ0��V�S�a�l�A�FsYh8�N�s�Cutɀ��o�k�/*٣��`�*ITO1��y��Ho)���m�DR��u�����8K�.T5%� �{�Y��
R.藤N�F#�����J��D>7���
��C�7�^�hD�3��D��I*T�����,��IF�ζB���7�ƷQ�����Wi�y�4�y������Wl��e.�p	����>��1�XhD�Vk3d�>� ?��MeSR�1����
mt��9���{- DEaD�g�_(����h8Z�&��
j.�����Є�Q�`3:�"P�$oldF29��m����b_���N3jT�{�sX�^x��@��,�x]�0�����.��8Qj�.�3�h�d��hARX(��^AqV��)a�G9�;����C��dP@�\@N�;���q���:T뵩��n{�V�݆�z�Z�6w����>��OOPԍ�v��nHW��j�u�w����6)�B<�>�~o"�Q���A�c=Z:gi�TҘ��*9���ck�6I$3/��[gٳ"o��1!Y��t�N�0�`�qJF!�g�*�-ܸ�ֵ`Q�i�����`",�Ť��BN�hH���Xp9VVDn��!6؆.��'���z,|g|��j�9Y��:�H�L��Ɛ��H\fV������ĥc5�އS1�[����s���c��'�x�Z��)���16���B�Q�lv��ބx�g�R�qE~�v/�MJ�t��f���8�,TS�B����M٠D.
O��e�J��'��*�����8���І^��e�Ê�^���t��e�y��5�)9���5��@lG�g�:��c/e�#�W:ޏ�r��#C�G��N�΢[���/>�*��d�~?�U4B��Ű���O���ucs�_����J����5�Cuج�j�`qr���߱c�Mj�q�W�T�JaY��'yīH���f�B��"��'�eI��?�W��������#Ԇ#�aR��9D{"}��M�/�_���h,?��P�$+��s�?�c>'l]�ݽ��Y�e죇��y��*��f,�x_�C����pP�y��[<B~L}�<��
���[ �ʃ���,?������Tc��R��	�і��Ŷ0�\lZ�ޚ�U��ť�7���~vA!���_�_������㗿�5��.:��Ӱ�R;-���ο&�E�ܜ*�Jޮ��f>��lݗ��qܨ�������y�'��]��&�]ݮ��fE�_���������@�m      �   �  x��VM��6=[������!Q_�q&_;�&�L'�%�"Yls-��Hw���oQ�����m�$��ի���A��Z]�mWF!7J���7�N�'�f�W%`3�\7���>��r�b���N����ӑ�=$�^"�Fv�8�X<��K��i��y5$<��=8�c=�sڇɥW�"�?����Qv�(?������e��	N����&*���4�1�`���'J!9�t�?�p���\�Gd��L0���ٱ���O������`��#�i�//�E�L�-���/���pJq����Ü�8:��\z.	}<O8��	�H��%��>��c08�د{�r2�Q��c�Na��x��)��Iu����y�|�����W��DT\U kSY+�+��4}�3���ĥ]1�`��=��/�H0�j��������d��O-}�#a1�O.i���)c���S�	|�Y|�	�������V��g�o3����qW(ї�Z^����岮znd	J*��m��i!p�{peϑ8��+^{�d2RBǷ�ݡ��As�(J�j��TLk���h;=g� �}�|�K�0�K��m;a�s20��}�2`o思'����:j�0�. �u^��iěz�cEkK�`[nzE�Yq�Ps�u�V��>��V�_��cG������O��?�sV�m���3Ɯ�",bE:����iն��K)S��+���ѯ��U���R��%�s㚾��h9��1��˪��Ϊ-�
{�ES	���p	���5��7ߡ��@E���퀯�Q�KE)m�5s��6%�!�l8ھG#-���t����(}W܏:kM������"������l���S�H��Vr�P����jkyM��jDgK�<�>��z������e��t��,��`���`QZ�_$��dy|�j�ueKɟ�4+*�4NDoK���=�Τ�p�S�D��t�yrY���q���;,�F��Z"�Ɗ�A��JԦ6C���㑬�S,"�N�i���Q"�;'^��:�l}�vq�xv�B�S�vH�H-ĸ
���wy$��J�N[ b�Aר6�ʊ�z씰U'n]�B�����9�=��3n�*ʺ�(��4�Vs�:R�D�V��o6_���}9|Ea)��j9}����&e����@�;a�>��-�},�m�^�G��6}�pi�e�h{PI+�l�:"�%�5s3W�ޠu�ȼZ_��en֎���y������b�G�ɢ!�3�����g�{Xn/n�ˮ襪L3Լ�k� �:���x_�Fʺ�����~f�MZQ��7���5��PץŶ,�^5�yx���"�89�a�-핑�Ӈ���t����,�rG�q\]D-��YWf�q���3b:�.w����^��-�����'�]��yj��ז��L��j{��_y���7�"�Q��RIಪ��֕�����އN�ۮ(��6��      �   �  x����$!E�=��� ����a鍠/]����_��Ƶ�-.L�}��Nɜ6�E�k�ceI�p���ڐ���q)���ABI7��I��m��#��	���R�h���/)"m�_���$�x(���Eμ�M-������+�&LW��dz�#Oy_�����N��y6��or6㊰CG���=u�CC�Tm?gU��Pl���9&�{�6�:_�I�ٷ9?����N�m���JN=���U��},�f_d��Ӊxtx���d���)u9X���`���ru��p������.��m��5f}��9���¼���۟��{#���W���0u��{��1i]��9FMυz@N�#5z������7�/A�R$?�a�V����XY���n<ψX�6�m�N��i��
�c�7��X���x߽�q!�2��ѓ:6?��p�Ӱ��(R'������z���+g��/�aYƖ�� wS��AP{����N�;�M��u~�Z��r��F���*	�$4H���ܧ�ԙ�no�4���`o���@M�i�|�N����]N��Nמ�$z܇]�X�d�^9*j�)
;�S��<q�|�b��yR�~�bu���m�1r���ӯ���qڂ�61��|�:}
�Vݧ�������|�g      �     x��WMo7=ۿ����,8����m_Ҡ6�K.#.W;0�ܒ\�����Z��C"���{o�w77׷�^]���ۋ7o����\\^�\�}s}yyyu�W�(Xט?����(qؚ=��|��>ڎ8���ȗ�Rrg�>�}��Ð�u���,�e~�?�g_�z霡�3�5}l\
���~Q��B�q�.�4��}1TL����2:�v�`��i���2&\�����sϞ�)�9Kxē���s�y*���K9�[�Y�����f��bƍ�3K����E	��П۹t@=��BM��N�!�%O�VR�oz;9S����1�|���rq�TT؅bl��:2�a�3q�gP���e�!��z.E�RH'�cJ(`�"D΅�X;�D��_�tEI�5r�c��`�<�@���f2.����(�|/͍Y�W�1=�6�^iӖ�ȥM��T�4R{�Rcp9��
��jUP���##��c���HH�k�e���\pY��1)�O =��Nv�F�7�<��0-ْM�b_��dڲd�i���2��|hVf"�dٺ0rP�h�t��k��(ҐJ'��{���2��<�<�?L4`�\4�{@������E���t�{|����7�e{}uI?��lI1�="�P��3��-�ِ(P�]����\�= � %[�龗�S~��6�U��`�� b�4����uİ�C�U��M�t��^L`����^Dd`W��#�V��-�wd�J�`rp2��ޛj4�-�~)Vԉ�͹�.J|���q�G'�T	C��7c�A+!���}�b#��׭P0���,7�T�f�@��O^-�����vE�+@�7񜞄dA�k�^A0$"�H� &HF.U2��X̳H��1&F�X�J���OV����� �GF�{5�_�|��Mwz��hu���=L�vR�L�*黄�9��F��_#0� �؎�u:e�,�Vbh#V�� �,"Z���y�E4L��\��~���~t�B�d;��v�D��]|ޑs��4?�+?״><^0�=���ה�6�3�a�g@M{@��o?�D�����zq��C� T�^ZqM�J�Q�ބX���#X8E]0�w�e�V	��GdH"�:��_ ;���GH�^tX���#fz]�>G��q�mb$)���W�yZ�J/oiA�]9�;A�s�%�Vš�9���ȿ����O�yCg�F� S�U�OV-�N�׬��;�\�gZٙ}��5�tY�)!`���Q�6@�X�5�<�pn�W��Ad�g�v�7�m����`V3��s/�_d%���Soҝ�VB��N_���e#���R:��U��s9��<�~M���*�Ϙ,D,��Z7�m��煼Y��{�Q�ʓem�F}��G{�r�R>.V��y�����h�s*j�������2��G|���h8�w犁{�d�j�$�(���Z<�:�%,�G�fE	 , W9>K�f����ݑ���5q(sK�Ռ�ɓl���@WI��8�V~ş"��w�+��z<�2�d*�@峂��O[�����u6      �   f  x��UMo#E=��� m�������@�,�¥��:�⌃=�U���I !�#�0�{�U�z�u	Q�NV�)Hi$�Ҕ����4��:�2�χ/�WM-�M}^�L��ب�lx����T�\Tbs$�ْ�����0�t>�O[������az�{��E���x8��f�{���]�B:����'߈��Wo�I��| yz��p\v�)ӔG����X�ƞJk�C�Nm޴�[
=�5�QH����̎�0�/�>^��~�q^�������v{��<�}�vjI�����j@���l�G륺�ڦW�As���(8��TA'��Hk:/G����>}:����-f�C�L0G�PI�Hc�����tßAV煷�ӣN��^mwm9�t�#�i�� �a!�<�k>�u�����Owzz��Y��Ԟe1@��25��)��W�)���l�;C�s�fz?����;��O��B⒌\j`���1�D���%��uL���ͻ߱�t������f{ŧ��|�=��I\6��Hޡ^�!R�6S/��H}���j�s���]g��`\���U}�m�:̻6B�g!�Y۲��[��l��<���i�R�p!�ق����1��I$�4�n�g��AxX���W��̨�3�t�NOۇ�~�=��Ev�;�*u�b�k�"�Fc|����Lj^����Bq҆!�ڽ)��Z��r8������`��'�3q�|�A}"�O7|\�VǴesޞWZn�]WHVS���`7�ΐq �+��1�w8�ipS
5�B��q�e4;5��ɵ_�٬Hj�#�Tt� 1�\�Iܰ��5�,b�y��Z�"�S�=9��߱�~�ӣ"�.�+���^�AcE�ժ�%w�`��+c�Kf�N��C߂`V�_����F����}����w��������ؕG��
,`�3	<)T���"mz��v-����^�R,�Q��w����4(H�zr��,�@��	r�����\�5����#��p)�X*G�}SF0Y�LԵG�w�;��̶6��!�y ��?>�׆,�t.b{���0��6d)����Ƌ�M��9�n�8���	���6;ZM>�WJ�Qy�ܽ��"�߾�l6��m     