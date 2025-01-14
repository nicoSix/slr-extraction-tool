PGDMP                         y            ardent     14.1 (Ubuntu 14.1-2.pgdg20.04+1)     14.1 (Ubuntu 14.1-2.pgdg20.04+1) G    g           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            h           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            i           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            j           1262    16692    ardent    DATABASE     [   CREATE DATABASE ardent WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE ardent;
                postgres    false            �            1259    16693    answers    TABLE     �   CREATE TABLE public.answers (
    id uuid NOT NULL,
    question_id uuid NOT NULL,
    content character varying NOT NULL,
    username character varying NOT NULL,
    date timestamp with time zone NOT NULL
);
    DROP TABLE public.answers;
       public         heap    postgres    false            �            1259    16698    architectures    TABLE     �   CREATE TABLE public.architectures (
    id uuid NOT NULL,
    reader_description character varying,
    paper_id uuid NOT NULL,
    name character varying NOT NULL,
    author_description character varying,
    project_url character varying NOT NULL
);
 !   DROP TABLE public.architectures;
       public         heap    postgres    false            k           0    0 '   COLUMN architectures.author_description    COMMENT     �   COMMENT ON COLUMN public.architectures.author_description IS 'This field is different from reader_description : content must be extracted from the paper (copy/paste description), rather than explained from our knowledge';
          public          postgres    false    210            �            1259    16703    categories_base    TABLE     d   CREATE TABLE public.categories_base (
    id uuid NOT NULL,
    label character varying NOT NULL
);
 #   DROP TABLE public.categories_base;
       public         heap    postgres    false            �            1259    16708    components_base    TABLE     �   CREATE TABLE public.components_base (
    id uuid NOT NULL,
    name character varying NOT NULL,
    base_description character varying,
    category_id uuid,
    project_url character varying NOT NULL
);
 #   DROP TABLE public.components_base;
       public         heap    postgres    false            �            1259    16713    components_instances    TABLE     �   CREATE TABLE public.components_instances (
    id uuid NOT NULL,
    name character varying NOT NULL,
    architecture_id uuid NOT NULL,
    reader_description character varying,
    author_description character varying,
    component_base_id uuid
);
 (   DROP TABLE public.components_instances;
       public         heap    postgres    false            �            1259    16718    connections    TABLE     �   CREATE TABLE public.connections (
    id uuid NOT NULL,
    first_component uuid NOT NULL,
    second_component uuid NOT NULL,
    datatype character varying,
    direction character varying,
    name character varying
);
    DROP TABLE public.connections;
       public         heap    postgres    false            �            1259    16723    invite_tokens    TABLE     L   CREATE TABLE public.invite_tokens (
    token character varying NOT NULL
);
 !   DROP TABLE public.invite_tokens;
       public         heap    postgres    false            �            1259    16728    papers    TABLE     �  CREATE TABLE public.papers (
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
    comments character varying,
    project_url character varying NOT NULL
);
    DROP TABLE public.papers;
       public         heap    postgres    false            �            1259    16843    project_roles    TABLE     �   CREATE TABLE public.project_roles (
    id uuid NOT NULL,
    username character varying NOT NULL,
    is_admin boolean NOT NULL,
    url character varying NOT NULL
);
 !   DROP TABLE public.project_roles;
       public         heap    postgres    false            �            1259    16836    projects    TABLE     �   CREATE TABLE public.projects (
    name character varying NOT NULL,
    description character varying,
    url character varying NOT NULL
);
    DROP TABLE public.projects;
       public         heap    postgres    false            �            1259    16734    properties_base    TABLE     �   CREATE TABLE public.properties_base (
    id uuid NOT NULL,
    key character varying NOT NULL,
    component_base_id uuid NOT NULL,
    category character varying
);
 #   DROP TABLE public.properties_base;
       public         heap    postgres    false            �            1259    16739    properties_instances    TABLE     �   CREATE TABLE public.properties_instances (
    id uuid NOT NULL,
    key character varying NOT NULL,
    value character varying NOT NULL,
    component_instance_id uuid,
    category character varying
);
 (   DROP TABLE public.properties_instances;
       public         heap    postgres    false            �            1259    16744 	   questions    TABLE     [  CREATE TABLE public.questions (
    id uuid NOT NULL,
    title character varying NOT NULL,
    content character varying NOT NULL,
    username character varying NOT NULL,
    date timestamp with time zone NOT NULL,
    object_id uuid,
    object_type character varying,
    status integer NOT NULL,
    project_url character varying NOT NULL
);
    DROP TABLE public.questions;
       public         heap    postgres    false            �            1259    16749    users    TABLE       CREATE TABLE public.users (
    username character varying NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    role character varying NOT NULL,
    is_admin boolean NOT NULL,
    hash character varying NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            W          0    16693    answers 
   TABLE DATA           K   COPY public.answers (id, question_id, content, username, date) FROM stdin;
    public          postgres    false    209   �\       X          0    16698    architectures 
   TABLE DATA           p   COPY public.architectures (id, reader_description, paper_id, name, author_description, project_url) FROM stdin;
    public          postgres    false    210   �\       Y          0    16703    categories_base 
   TABLE DATA           4   COPY public.categories_base (id, label) FROM stdin;
    public          postgres    false    211   ]       Z          0    16708    components_base 
   TABLE DATA           _   COPY public.components_base (id, name, base_description, category_id, project_url) FROM stdin;
    public          postgres    false    212   .]       [          0    16713    components_instances 
   TABLE DATA           �   COPY public.components_instances (id, name, architecture_id, reader_description, author_description, component_base_id) FROM stdin;
    public          postgres    false    213   K]       \          0    16718    connections 
   TABLE DATA           g   COPY public.connections (id, first_component, second_component, datatype, direction, name) FROM stdin;
    public          postgres    false    214   h]       ]          0    16723    invite_tokens 
   TABLE DATA           .   COPY public.invite_tokens (token) FROM stdin;
    public          postgres    false    215   �]       ^          0    16728    papers 
   TABLE DATA           �   COPY public.papers (id, name, doi, authors, paper_type, journal, added_by, updated_by, status, abstract, comments, project_url) FROM stdin;
    public          postgres    false    216   �]       d          0    16843    project_roles 
   TABLE DATA           D   COPY public.project_roles (id, username, is_admin, url) FROM stdin;
    public          postgres    false    222   �]       c          0    16836    projects 
   TABLE DATA           :   COPY public.projects (name, description, url) FROM stdin;
    public          postgres    false    221   ^       _          0    16734    properties_base 
   TABLE DATA           O   COPY public.properties_base (id, key, component_base_id, category) FROM stdin;
    public          postgres    false    217   "^       `          0    16739    properties_instances 
   TABLE DATA           _   COPY public.properties_instances (id, key, value, component_instance_id, category) FROM stdin;
    public          postgres    false    218   ?^       a          0    16744 	   questions 
   TABLE DATA           t   COPY public.questions (id, title, content, username, date, object_id, object_type, status, project_url) FROM stdin;
    public          postgres    false    219   \^       b          0    16749    users 
   TABLE DATA           V   COPY public.users (username, first_name, last_name, role, is_admin, hash) FROM stdin;
    public          postgres    false    220   y^       �           2606    16758    answers answers_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.answers DROP CONSTRAINT answers_pkey;
       public            postgres    false    209            �           2606    16760     architectures architectures_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.architectures
    ADD CONSTRAINT architectures_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.architectures DROP CONSTRAINT architectures_pkey;
       public            postgres    false    210            �           2606    16762 $   categories_base categories_base_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.categories_base
    ADD CONSTRAINT categories_base_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.categories_base DROP CONSTRAINT categories_base_pkey;
       public            postgres    false    211            �           2606    16764 $   components_base components_base_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.components_base
    ADD CONSTRAINT components_base_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.components_base DROP CONSTRAINT components_base_pkey;
       public            postgres    false    212            �           2606    16766 $   components_instances components_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.components_instances
    ADD CONSTRAINT components_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.components_instances DROP CONSTRAINT components_pkey;
       public            postgres    false    213            �           2606    16768     invite_tokens invite_tokens_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.invite_tokens
    ADD CONSTRAINT invite_tokens_pkey PRIMARY KEY (token);
 J   ALTER TABLE ONLY public.invite_tokens DROP CONSTRAINT invite_tokens_pkey;
       public            postgres    false    215            �           2606    16770    papers papers_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.papers
    ADD CONSTRAINT papers_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.papers DROP CONSTRAINT papers_pkey;
       public            postgres    false    216            �           2606    16849     project_roles project_roles_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.project_roles
    ADD CONSTRAINT project_roles_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.project_roles DROP CONSTRAINT project_roles_pkey;
       public            postgres    false    222            �           2606    16842    projects projects_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (url);
 @   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pkey;
       public            postgres    false    221            �           2606    16772 $   properties_base properties_base_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.properties_base
    ADD CONSTRAINT properties_base_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.properties_base DROP CONSTRAINT properties_base_pkey;
       public            postgres    false    217            �           2606    16774 $   properties_instances properties_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.properties_instances
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.properties_instances DROP CONSTRAINT properties_pkey;
       public            postgres    false    218            �           2606    16776    questions questions_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.questions DROP CONSTRAINT questions_pkey;
       public            postgres    false    219            �           2606    16778    connections relations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.connections
    ADD CONSTRAINT relations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.connections DROP CONSTRAINT relations_pkey;
       public            postgres    false    214            �           2606    16780    users users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    220            �           1259    16781    fki_archConstraint    INDEX     `   CREATE INDEX "fki_archConstraint" ON public.components_instances USING btree (architecture_id);
 (   DROP INDEX public."fki_archConstraint";
       public            postgres    false    213            �           1259    16782     fki_base_component_to_categories    INDEX     c   CREATE INDEX fki_base_component_to_categories ON public.components_base USING btree (category_id);
 4   DROP INDEX public.fki_base_component_to_categories;
       public            postgres    false    212            �           1259    16783    fki_compConstraint    INDEX     f   CREATE INDEX "fki_compConstraint" ON public.properties_instances USING btree (component_instance_id);
 (   DROP INDEX public."fki_compConstraint";
       public            postgres    false    218            �           1259    16784    fki_componentBaseConstraint    INDEX     k   CREATE INDEX "fki_componentBaseConstraint" ON public.components_instances USING btree (component_base_id);
 1   DROP INDEX public."fki_componentBaseConstraint";
       public            postgres    false    213            �           1259    16785    fki_first_component_constraint    INDEX     a   CREATE INDEX fki_first_component_constraint ON public.connections USING btree (first_component);
 2   DROP INDEX public.fki_first_component_constraint;
       public            postgres    false    214            �           1259    16786    fki_paperConstraint    INDEX     S   CREATE INDEX "fki_paperConstraint" ON public.architectures USING btree (paper_id);
 )   DROP INDEX public."fki_paperConstraint";
       public            postgres    false    210            �           1259    16861    fki_projectConstraint    INDEX     P   CREATE INDEX "fki_projectConstraint" ON public.project_roles USING btree (url);
 +   DROP INDEX public."fki_projectConstraint";
       public            postgres    false    222            �           1259    16787    fki_question_to_answer    INDEX     Q   CREATE INDEX fki_question_to_answer ON public.answers USING btree (question_id);
 *   DROP INDEX public.fki_question_to_answer;
       public            postgres    false    209            �           1259    16788    fki_second_component_constraint    INDEX     c   CREATE INDEX fki_second_component_constraint ON public.connections USING btree (second_component);
 3   DROP INDEX public.fki_second_component_constraint;
       public            postgres    false    214            �           1259    16855    fki_userConstraint    INDEX     R   CREATE INDEX "fki_userConstraint" ON public.project_roles USING btree (username);
 (   DROP INDEX public."fki_userConstraint";
       public            postgres    false    222            �           2606    16789 +   components_instances architectureConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.components_instances
    ADD CONSTRAINT "architectureConstraint" FOREIGN KEY (architecture_id) REFERENCES public.architectures(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 W   ALTER TABLE ONLY public.components_instances DROP CONSTRAINT "architectureConstraint";
       public          postgres    false    213    210    3228            �           2606    16794 ,   components_base base_component_to_categories    FK CONSTRAINT     �   ALTER TABLE ONLY public.components_base
    ADD CONSTRAINT base_component_to_categories FOREIGN KEY (category_id) REFERENCES public.categories_base(id) ON UPDATE CASCADE NOT VALID;
 V   ALTER TABLE ONLY public.components_base DROP CONSTRAINT base_component_to_categories;
       public          postgres    false    212    211    3231            �           2606    16799 #   properties_instances compConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.properties_instances
    ADD CONSTRAINT "compConstraint" FOREIGN KEY (component_instance_id) REFERENCES public.components_instances(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 O   ALTER TABLE ONLY public.properties_instances DROP CONSTRAINT "compConstraint";
       public          postgres    false    213    3236    218            �           2606    16804 ,   components_instances componentBaseConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.components_instances
    ADD CONSTRAINT "componentBaseConstraint" FOREIGN KEY (component_base_id) REFERENCES public.components_base(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 X   ALTER TABLE ONLY public.components_instances DROP CONSTRAINT "componentBaseConstraint";
       public          postgres    false    3233    212    213            �           2606    16809 $   connections firstComponentConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.connections
    ADD CONSTRAINT "firstComponentConstraint" FOREIGN KEY (first_component) REFERENCES public.components_instances(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public.connections DROP CONSTRAINT "firstComponentConstraint";
       public          postgres    false    3236    214    213            �           2606    16814    architectures paperConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.architectures
    ADD CONSTRAINT "paperConstraint" FOREIGN KEY (paper_id) REFERENCES public.papers(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 I   ALTER TABLE ONLY public.architectures DROP CONSTRAINT "paperConstraint";
       public          postgres    false    216    210    3246            �           2606    16856    project_roles projectConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.project_roles
    ADD CONSTRAINT "projectConstraint" FOREIGN KEY (url) REFERENCES public.projects(url) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 K   ALTER TABLE ONLY public.project_roles DROP CONSTRAINT "projectConstraint";
       public          postgres    false    222    3257    221            �           2606    16862 !   components_base projectConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.components_base
    ADD CONSTRAINT "projectConstraint" FOREIGN KEY (project_url) REFERENCES public.projects(url) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 M   ALTER TABLE ONLY public.components_base DROP CONSTRAINT "projectConstraint";
       public          postgres    false    212    3257    221            �           2606    16867    questions projectConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.questions
    ADD CONSTRAINT "projectConstraint" FOREIGN KEY (project_url) REFERENCES public.projects(url) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 G   ALTER TABLE ONLY public.questions DROP CONSTRAINT "projectConstraint";
       public          postgres    false    219    3257    221            �           2606    16872    architectures projectConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.architectures
    ADD CONSTRAINT "projectConstraint" FOREIGN KEY (project_url) REFERENCES public.projects(url) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 K   ALTER TABLE ONLY public.architectures DROP CONSTRAINT "projectConstraint";
       public          postgres    false    3257    221    210            �           2606    16877    papers projectConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.papers
    ADD CONSTRAINT "projectConstraint" FOREIGN KEY (project_url) REFERENCES public.projects(url) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 D   ALTER TABLE ONLY public.papers DROP CONSTRAINT "projectConstraint";
       public          postgres    false    221    216    3257            �           2606    16819    answers question_to_answer    FK CONSTRAINT     �   ALTER TABLE ONLY public.answers
    ADD CONSTRAINT question_to_answer FOREIGN KEY (question_id) REFERENCES public.questions(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 D   ALTER TABLE ONLY public.answers DROP CONSTRAINT question_to_answer;
       public          postgres    false    219    209    3253            �           2606    16824 %   connections secondComponentConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.connections
    ADD CONSTRAINT "secondComponentConstraint" FOREIGN KEY (second_component) REFERENCES public.components_instances(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 Q   ALTER TABLE ONLY public.connections DROP CONSTRAINT "secondComponentConstraint";
       public          postgres    false    213    214    3236            �           2606    16850    project_roles userConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.project_roles
    ADD CONSTRAINT "userConstraint" FOREIGN KEY (username) REFERENCES public.users(username) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 H   ALTER TABLE ONLY public.project_roles DROP CONSTRAINT "userConstraint";
       public          postgres    false    222    220    3255            W      x������ � �      X      x������ � �      Y      x������ � �      Z      x������ � �      [      x������ � �      \      x������ � �      ]   6   x����0���p
z��߂�˵m:��?�����	�NZ�
�� �K      ^      x������ � �      d      x������ � �      c      x������ � �      _      x������ � �      `      x������ � �      a      x������ � �      b   �   x��+ά���L��I,��2�\��KJSR�J8K8U��TT|<#�s�<2�"͂���"}+��JS#]�+3C<<*��B�#B�܊��R�}�B��2��'e�-�H-JJ,-�t,.�O�L,IU(�OK�8�(�*F��� �B     