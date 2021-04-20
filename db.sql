PGDMP         $                y           slr    13.2    13.1 #    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16738    slr    DATABASE     h   CREATE DATABASE slr WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United Kingdom.1252';
    DROP DATABASE slr;
                postgres    false            �            1259    16739    architectures    TABLE     �   CREATE TABLE public.architectures (
    id uuid NOT NULL,
    reader_description character varying,
    paper_id uuid NOT NULL,
    name character varying NOT NULL,
    author_description character varying
);
 !   DROP TABLE public.architectures;
       public         heap    postgres    false            �           0    0 '   COLUMN architectures.author_description    COMMENT     �   COMMENT ON COLUMN public.architectures.author_description IS 'This field is different from reader_description : content must be extracted from the paper (copy/paste description), rather than explained from our knowledge';
          public          postgres    false    200            �            1259    16819    components_base    TABLE     �   CREATE TABLE public.components_base (
    id uuid NOT NULL,
    name character varying NOT NULL,
    base_description character varying
);
 #   DROP TABLE public.components_base;
       public         heap    postgres    false            �            1259    16745    components_instances    TABLE     �   CREATE TABLE public.components_instances (
    id uuid NOT NULL,
    name character varying NOT NULL,
    architecture_id uuid NOT NULL,
    reader_description character varying,
    author_description character varying,
    component_base_id uuid
);
 (   DROP TABLE public.components_instances;
       public         heap    postgres    false            �            1259    16751    connections    TABLE     �   CREATE TABLE public.connections (
    id uuid NOT NULL,
    first_component uuid NOT NULL,
    second_component uuid NOT NULL
);
    DROP TABLE public.connections;
       public         heap    postgres    false            �            1259    25038    invite_tokens    TABLE     L   CREATE TABLE public.invite_tokens (
    token character varying NOT NULL
);
 !   DROP TABLE public.invite_tokens;
       public         heap    postgres    false            �            1259    16754    papers    TABLE     �  CREATE TABLE public.papers (
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
       public         heap    postgres    false            �            1259    16811    properties_base    TABLE     �   CREATE TABLE public.properties_base (
    id uuid NOT NULL,
    key character varying NOT NULL,
    component_base_id uuid NOT NULL
);
 #   DROP TABLE public.properties_base;
       public         heap    postgres    false            �            1259    16761    properties_instances    TABLE     �   CREATE TABLE public.properties_instances (
    id uuid NOT NULL,
    key character varying NOT NULL,
    value character varying NOT NULL,
    component_instance_id uuid,
    is_default boolean DEFAULT false NOT NULL,
    property_base_id uuid
);
 (   DROP TABLE public.properties_instances;
       public         heap    postgres    false            �            1259    25013    users    TABLE       CREATE TABLE public.users (
    username character varying NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    role character varying NOT NULL,
    is_admin boolean NOT NULL,
    hash character varying NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            K           2606    16768     architectures architectures_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.architectures
    ADD CONSTRAINT architectures_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.architectures DROP CONSTRAINT architectures_pkey;
       public            postgres    false    200            ]           2606    16826 $   components_base components_base_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.components_base
    ADD CONSTRAINT components_base_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.components_base DROP CONSTRAINT components_base_pkey;
       public            postgres    false    206            N           2606    16770 $   components_instances components_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.components_instances
    ADD CONSTRAINT components_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.components_instances DROP CONSTRAINT components_pkey;
       public            postgres    false    201            a           2606    25045     invite_tokens invite_tokens_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.invite_tokens
    ADD CONSTRAINT invite_tokens_pkey PRIMARY KEY (token);
 J   ALTER TABLE ONLY public.invite_tokens DROP CONSTRAINT invite_tokens_pkey;
       public            postgres    false    208            V           2606    16772    papers papers_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.papers
    ADD CONSTRAINT papers_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.papers DROP CONSTRAINT papers_pkey;
       public            postgres    false    203            [           2606    16818 $   properties_base properties_base_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.properties_base
    ADD CONSTRAINT properties_base_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.properties_base DROP CONSTRAINT properties_base_pkey;
       public            postgres    false    205            Y           2606    16774 $   properties_instances properties_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.properties_instances
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.properties_instances DROP CONSTRAINT properties_pkey;
       public            postgres    false    204            T           2606    16776    connections relations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.connections
    ADD CONSTRAINT relations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.connections DROP CONSTRAINT relations_pkey;
       public            postgres    false    202            _           2606    25020    users users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    207            O           1259    16777    fki_archConstraint    INDEX     `   CREATE INDEX "fki_archConstraint" ON public.components_instances USING btree (architecture_id);
 (   DROP INDEX public."fki_archConstraint";
       public            postgres    false    201            W           1259    16778    fki_compConstraint    INDEX     f   CREATE INDEX "fki_compConstraint" ON public.properties_instances USING btree (component_instance_id);
 (   DROP INDEX public."fki_compConstraint";
       public            postgres    false    204            P           1259    25012    fki_componentBaseConstraint    INDEX     k   CREATE INDEX "fki_componentBaseConstraint" ON public.components_instances USING btree (component_base_id);
 1   DROP INDEX public."fki_componentBaseConstraint";
       public            postgres    false    201            Q           1259    16779    fki_first_component_constraint    INDEX     a   CREATE INDEX fki_first_component_constraint ON public.connections USING btree (first_component);
 2   DROP INDEX public.fki_first_component_constraint;
       public            postgres    false    202            L           1259    16780    fki_paperConstraint    INDEX     S   CREATE INDEX "fki_paperConstraint" ON public.architectures USING btree (paper_id);
 )   DROP INDEX public."fki_paperConstraint";
       public            postgres    false    200            R           1259    16781    fki_second_component_constraint    INDEX     c   CREATE INDEX fki_second_component_constraint ON public.connections USING btree (second_component);
 3   DROP INDEX public.fki_second_component_constraint;
       public            postgres    false    202            c           2606    16782 +   components_instances architectureConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.components_instances
    ADD CONSTRAINT "architectureConstraint" FOREIGN KEY (architecture_id) REFERENCES public.architectures(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 W   ALTER TABLE ONLY public.components_instances DROP CONSTRAINT "architectureConstraint";
       public          postgres    false    200    2891    201            g           2606    16787 #   properties_instances compConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.properties_instances
    ADD CONSTRAINT "compConstraint" FOREIGN KEY (component_instance_id) REFERENCES public.components_instances(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 O   ALTER TABLE ONLY public.properties_instances DROP CONSTRAINT "compConstraint";
       public          postgres    false    2894    204    201            d           2606    25007 ,   components_instances componentBaseConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.components_instances
    ADD CONSTRAINT "componentBaseConstraint" FOREIGN KEY (component_base_id) REFERENCES public.components_base(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 X   ALTER TABLE ONLY public.components_instances DROP CONSTRAINT "componentBaseConstraint";
       public          postgres    false    201    206    2909            e           2606    16792 $   connections firstComponentConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.connections
    ADD CONSTRAINT "firstComponentConstraint" FOREIGN KEY (first_component) REFERENCES public.components_instances(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public.connections DROP CONSTRAINT "firstComponentConstraint";
       public          postgres    false    2894    202    201            b           2606    16797    architectures paperConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.architectures
    ADD CONSTRAINT "paperConstraint" FOREIGN KEY (paper_id) REFERENCES public.papers(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 I   ALTER TABLE ONLY public.architectures DROP CONSTRAINT "paperConstraint";
       public          postgres    false    203    200    2902            f           2606    16802 %   connections secondComponentConstraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.connections
    ADD CONSTRAINT "secondComponentConstraint" FOREIGN KEY (second_component) REFERENCES public.components_instances(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 Q   ALTER TABLE ONLY public.connections DROP CONSTRAINT "secondComponentConstraint";
       public          postgres    false    201    2894    202           