PGDMP         (        
         y            tshirt_time    13.1    13.1 )    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    32768    tshirt_time    DATABASE     g   CREATE DATABASE tshirt_time WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_France.1252';
    DROP DATABASE tshirt_time;
                postgres    false            �            1259    32769    avis    TABLE     �   CREATE TABLE public.avis (
    note integer NOT NULL,
    contenu text NOT NULL,
    id_avis integer NOT NULL,
    titre text NOT NULL,
    id_user integer NOT NULL,
    id_tshirt integer NOT NULL
);
    DROP TABLE public.avis;
       public         heap    postgres    false            �            1259    32775    avis_id_avis_seq    SEQUENCE     �   CREATE SEQUENCE public.avis_id_avis_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.avis_id_avis_seq;
       public          postgres    false    200            �           0    0    avis_id_avis_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.avis_id_avis_seq OWNED BY public.avis.id_avis;
          public          postgres    false    201            �            1259    41100    couleurs    TABLE     �   CREATE TABLE public.couleurs (
    nom text NOT NULL,
    red integer NOT NULL,
    id_couleur integer NOT NULL,
    green integer NOT NULL,
    blue integer NOT NULL
);
    DROP TABLE public.couleurs;
       public         heap    postgres    false            �            1259    41098    couleur_id_couleur_seq    SEQUENCE     �   CREATE SEQUENCE public.couleur_id_couleur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.couleur_id_couleur_seq;
       public          postgres    false    209            �           0    0    couleur_id_couleur_seq    SEQUENCE OWNED BY     R   ALTER SEQUENCE public.couleur_id_couleur_seq OWNED BY public.couleurs.id_couleur;
          public          postgres    false    208            �            1259    41109    couleur_tshirt    TABLE     h   CREATE TABLE public.couleur_tshirt (
    id_tshirt integer NOT NULL,
    id_couleur integer NOT NULL
);
 "   DROP TABLE public.couleur_tshirt;
       public         heap    postgres    false            �            1259    32777    tshirt    TABLE     �   CREATE TABLE public.tshirt (
    description text NOT NULL,
    id_user integer NOT NULL,
    image text NOT NULL,
    id_tshirt integer NOT NULL,
    titre text NOT NULL,
    id_type integer NOT NULL
);
    DROP TABLE public.tshirt;
       public         heap    postgres    false            �            1259    32783    tshirt_id_tshirt_seq    SEQUENCE     �   CREATE SEQUENCE public.tshirt_id_tshirt_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tshirt_id_tshirt_seq;
       public          postgres    false    202            �           0    0    tshirt_id_tshirt_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tshirt_id_tshirt_seq OWNED BY public.tshirt.id_tshirt;
          public          postgres    false    203            �            1259    41089    types    TABLE     r   CREATE TABLE public.types (
    nom text NOT NULL,
    description text NOT NULL,
    id_type integer NOT NULL
);
    DROP TABLE public.types;
       public         heap    postgres    false            �            1259    41087    type_id_type_seq    SEQUENCE     �   CREATE SEQUENCE public.type_id_type_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.type_id_type_seq;
       public          postgres    false    207            �           0    0    type_id_type_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE public.type_id_type_seq OWNED BY public.types.id_type;
          public          postgres    false    206            �            1259    32785    users    TABLE     �   CREATE TABLE public.users (
    pseudo text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    description text,
    id_user integer NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    32791    users_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_id_user_seq;
       public          postgres    false    204            �           0    0    users_id_user_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id_user;
          public          postgres    false    205            C           2604    32793    avis id_avis    DEFAULT     l   ALTER TABLE ONLY public.avis ALTER COLUMN id_avis SET DEFAULT nextval('public.avis_id_avis_seq'::regclass);
 ;   ALTER TABLE public.avis ALTER COLUMN id_avis DROP DEFAULT;
       public          postgres    false    201    200            G           2604    41103    couleurs id_couleur    DEFAULT     y   ALTER TABLE ONLY public.couleurs ALTER COLUMN id_couleur SET DEFAULT nextval('public.couleur_id_couleur_seq'::regclass);
 B   ALTER TABLE public.couleurs ALTER COLUMN id_couleur DROP DEFAULT;
       public          postgres    false    209    208    209            D           2604    32794    tshirt id_tshirt    DEFAULT     t   ALTER TABLE ONLY public.tshirt ALTER COLUMN id_tshirt SET DEFAULT nextval('public.tshirt_id_tshirt_seq'::regclass);
 ?   ALTER TABLE public.tshirt ALTER COLUMN id_tshirt DROP DEFAULT;
       public          postgres    false    203    202            F           2604    41092    types id_type    DEFAULT     m   ALTER TABLE ONLY public.types ALTER COLUMN id_type SET DEFAULT nextval('public.type_id_type_seq'::regclass);
 <   ALTER TABLE public.types ALTER COLUMN id_type DROP DEFAULT;
       public          postgres    false    207    206    207            E           2604    32795    users id_user    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    205    204            �          0    32769    avis 
   TABLE DATA           Q   COPY public.avis (note, contenu, id_avis, titre, id_user, id_tshirt) FROM stdin;
    public          postgres    false    200   �*       �          0    41109    couleur_tshirt 
   TABLE DATA           ?   COPY public.couleur_tshirt (id_tshirt, id_couleur) FROM stdin;
    public          postgres    false    210   +       �          0    41100    couleurs 
   TABLE DATA           E   COPY public.couleurs (nom, red, id_couleur, green, blue) FROM stdin;
    public          postgres    false    209   *+       �          0    32777    tshirt 
   TABLE DATA           X   COPY public.tshirt (description, id_user, image, id_tshirt, titre, id_type) FROM stdin;
    public          postgres    false    202   k+       �          0    41089    types 
   TABLE DATA           :   COPY public.types (nom, description, id_type) FROM stdin;
    public          postgres    false    207   �+       �          0    32785    users 
   TABLE DATA           N   COPY public.users (pseudo, email, password, description, id_user) FROM stdin;
    public          postgres    false    204   �,       �           0    0    avis_id_avis_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.avis_id_avis_seq', 1, false);
          public          postgres    false    201            �           0    0    couleur_id_couleur_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.couleur_id_couleur_seq', 3, true);
          public          postgres    false    208            �           0    0    tshirt_id_tshirt_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tshirt_id_tshirt_seq', 1, false);
          public          postgres    false    203            �           0    0    type_id_type_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.type_id_type_seq', 3, true);
          public          postgres    false    206            �           0    0    users_id_user_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_id_user_seq', 3, true);
          public          postgres    false    205            I           2606    32797    avis avis_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.avis
    ADD CONSTRAINT avis_pkey PRIMARY KEY (id_avis);
 8   ALTER TABLE ONLY public.avis DROP CONSTRAINT avis_pkey;
       public            postgres    false    200            Q           2606    41108    couleurs couleur_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.couleurs
    ADD CONSTRAINT couleur_pkey PRIMARY KEY (id_couleur);
 ?   ALTER TABLE ONLY public.couleurs DROP CONSTRAINT couleur_pkey;
       public            postgres    false    209            K           2606    32799    tshirt tshirt_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.tshirt
    ADD CONSTRAINT tshirt_pkey PRIMARY KEY (id_tshirt);
 <   ALTER TABLE ONLY public.tshirt DROP CONSTRAINT tshirt_pkey;
       public            postgres    false    202            O           2606    41097    types type_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.types
    ADD CONSTRAINT type_pkey PRIMARY KEY (id_type);
 9   ALTER TABLE ONLY public.types DROP CONSTRAINT type_pkey;
       public            postgres    false    207            M           2606    32801    users users_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    204            �      x������ � �      �      x������ � �      �   1   x�s�I-�4�4b#SS�����T��(b��ZTd���b���� �	�      �      x������ � �      �   +  x�5��N1D뻯�����AhP AE��[rF>۬�H�M:�w܏����#yv��l��K�C���U�0v셫�i���dbQ+��PCщ��+�1���Q�F�)x�%�i.ڍ�|k�v��2�!�-RJ6x\�)X�]�q�c�mZȴulp3bK#ҿG�'�
�����
���\O�,B��
��r9��e!=�Y�)�͇��,!�κ�����|Xa�!�	�b� �����p�4E�������LZ�`����!�-.]-�Ĳ�uK#S�@�E�k�Og��CG�� �ag�u�nڶ��͙g      �   �   x�M���0  ��;�Q��Fh	A@E�Bi}�7�X�z����)�4��gk�x� cA�
7��u���)S�<�ׁ�κ�!�EJ�<�=S3�j���CIz��@��TyEq�X�Z�7`^D��ho��%H��������Hjgj��3Xwi�����/B�;<     