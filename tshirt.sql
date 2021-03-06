PGDMP                          y            tshirt    13.1    13.1 )    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    49152    tshirt    DATABASE     b   CREATE DATABASE tshirt WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_France.1252';
    DROP DATABASE tshirt;
                postgres    false            �            1259    49153    avis    TABLE     �   CREATE TABLE public.avis (
    note integer NOT NULL,
    contenu text NOT NULL,
    id_avis integer NOT NULL,
    titre text NOT NULL,
    id_user integer NOT NULL,
    id_tshirt integer NOT NULL
);
    DROP TABLE public.avis;
       public         heap    postgres    false            �            1259    49159    avis_id_avis_seq    SEQUENCE     �   CREATE SEQUENCE public.avis_id_avis_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.avis_id_avis_seq;
       public          postgres    false    200            �           0    0    avis_id_avis_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.avis_id_avis_seq OWNED BY public.avis.id_avis;
          public          postgres    false    201            �            1259    49161    couleurs    TABLE     p   CREATE TABLE public.couleurs (
    nom text NOT NULL,
    id_couleur integer NOT NULL,
    hex text NOT NULL
);
    DROP TABLE public.couleurs;
       public         heap    postgres    false            �            1259    49167    couleur_id_couleur_seq    SEQUENCE     �   CREATE SEQUENCE public.couleur_id_couleur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.couleur_id_couleur_seq;
       public          postgres    false    202            �           0    0    couleur_id_couleur_seq    SEQUENCE OWNED BY     R   ALTER SEQUENCE public.couleur_id_couleur_seq OWNED BY public.couleurs.id_couleur;
          public          postgres    false    203            �            1259    49169    couleur_tshirt    TABLE     h   CREATE TABLE public.couleur_tshirt (
    id_tshirt integer NOT NULL,
    id_couleur integer NOT NULL
);
 "   DROP TABLE public.couleur_tshirt;
       public         heap    postgres    false            �            1259    49172    tshirt    TABLE     �   CREATE TABLE public.tshirt (
    description text NOT NULL,
    id_user integer NOT NULL,
    image text,
    id_tshirt integer NOT NULL,
    titre text NOT NULL,
    id_type integer NOT NULL
);
    DROP TABLE public.tshirt;
       public         heap    postgres    false            �            1259    49178    tshirt_id_tshirt_seq    SEQUENCE     �   CREATE SEQUENCE public.tshirt_id_tshirt_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tshirt_id_tshirt_seq;
       public          postgres    false    205            �           0    0    tshirt_id_tshirt_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tshirt_id_tshirt_seq OWNED BY public.tshirt.id_tshirt;
          public          postgres    false    206            �            1259    49180    types    TABLE     r   CREATE TABLE public.types (
    nom text NOT NULL,
    description text NOT NULL,
    id_type integer NOT NULL
);
    DROP TABLE public.types;
       public         heap    postgres    false            �            1259    49186    type_id_type_seq    SEQUENCE     �   CREATE SEQUENCE public.type_id_type_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.type_id_type_seq;
       public          postgres    false    207            �           0    0    type_id_type_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE public.type_id_type_seq OWNED BY public.types.id_type;
          public          postgres    false    208            �            1259    49188    users    TABLE     �   CREATE TABLE public.users (
    pseudo text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    description text,
    id_user integer NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    49194    users_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_id_user_seq;
       public          postgres    false    209            �           0    0    users_id_user_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id_user;
          public          postgres    false    210            C           2604    49196    avis id_avis    DEFAULT     l   ALTER TABLE ONLY public.avis ALTER COLUMN id_avis SET DEFAULT nextval('public.avis_id_avis_seq'::regclass);
 ;   ALTER TABLE public.avis ALTER COLUMN id_avis DROP DEFAULT;
       public          postgres    false    201    200            D           2604    49197    couleurs id_couleur    DEFAULT     y   ALTER TABLE ONLY public.couleurs ALTER COLUMN id_couleur SET DEFAULT nextval('public.couleur_id_couleur_seq'::regclass);
 B   ALTER TABLE public.couleurs ALTER COLUMN id_couleur DROP DEFAULT;
       public          postgres    false    203    202            E           2604    49198    tshirt id_tshirt    DEFAULT     t   ALTER TABLE ONLY public.tshirt ALTER COLUMN id_tshirt SET DEFAULT nextval('public.tshirt_id_tshirt_seq'::regclass);
 ?   ALTER TABLE public.tshirt ALTER COLUMN id_tshirt DROP DEFAULT;
       public          postgres    false    206    205            F           2604    49199    types id_type    DEFAULT     m   ALTER TABLE ONLY public.types ALTER COLUMN id_type SET DEFAULT nextval('public.type_id_type_seq'::regclass);
 <   ALTER TABLE public.types ALTER COLUMN id_type DROP DEFAULT;
       public          postgres    false    208    207            G           2604    49200    users id_user    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    210    209            �          0    49153    avis 
   TABLE DATA           Q   COPY public.avis (note, contenu, id_avis, titre, id_user, id_tshirt) FROM stdin;
    public          postgres    false    200   {*       �          0    49169    couleur_tshirt 
   TABLE DATA           ?   COPY public.couleur_tshirt (id_tshirt, id_couleur) FROM stdin;
    public          postgres    false    204   l+       �          0    49161    couleurs 
   TABLE DATA           8   COPY public.couleurs (nom, id_couleur, hex) FROM stdin;
    public          postgres    false    202   �+       �          0    49172    tshirt 
   TABLE DATA           X   COPY public.tshirt (description, id_user, image, id_tshirt, titre, id_type) FROM stdin;
    public          postgres    false    205   �+       �          0    49180    types 
   TABLE DATA           :   COPY public.types (nom, description, id_type) FROM stdin;
    public          postgres    false    207   K,       �          0    49188    users 
   TABLE DATA           N   COPY public.users (pseudo, email, password, description, id_user) FROM stdin;
    public          postgres    false    209   �,       �           0    0    avis_id_avis_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.avis_id_avis_seq', 6, true);
          public          postgres    false    201            �           0    0    couleur_id_couleur_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.couleur_id_couleur_seq', 3, true);
          public          postgres    false    203            �           0    0    tshirt_id_tshirt_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tshirt_id_tshirt_seq', 15, true);
          public          postgres    false    206            �           0    0    type_id_type_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.type_id_type_seq', 3, true);
          public          postgres    false    208            �           0    0    users_id_user_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_id_user_seq', 3, true);
          public          postgres    false    210            I           2606    49202    avis avis_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.avis
    ADD CONSTRAINT avis_pkey PRIMARY KEY (id_avis);
 8   ALTER TABLE ONLY public.avis DROP CONSTRAINT avis_pkey;
       public            postgres    false    200            K           2606    49204    couleurs couleur_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.couleurs
    ADD CONSTRAINT couleur_pkey PRIMARY KEY (id_couleur);
 ?   ALTER TABLE ONLY public.couleurs DROP CONSTRAINT couleur_pkey;
       public            postgres    false    202            M           2606    49206    tshirt tshirt_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.tshirt
    ADD CONSTRAINT tshirt_pkey PRIMARY KEY (id_tshirt);
 <   ALTER TABLE ONLY public.tshirt DROP CONSTRAINT tshirt_pkey;
       public            postgres    false    205            O           2606    49208    types type_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.types
    ADD CONSTRAINT type_pkey PRIMARY KEY (id_type);
 9   ALTER TABLE ONLY public.types DROP CONSTRAINT type_pkey;
       public            postgres    false    207            Q           2606    49210    users users_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    209            �   �   x�M�AN�@EדS8�n )�� TR7�K6Nb���L��T��#���j���߿u{��t�=A/ӈ�1@ς��k��4F_榩V�-�7f�ߧO������1�0�&xt�|$�iy�.ݚTo9��$�.fe����]�SТ����f����Y^��n�6_*e��,�Ongx5l�3e�a�Y�����&�����C��`��#���vO��܄6��CUU?�m�      �      x�34�4�24�4�24���=... ,�F      �   3   x��/MO�4�Tvs3 ��ԢNcNe� �SNj)�!������� <�      �   _   x��-��,*Q(�8�"7U!�$�H!<���Ӑ3Ə�А3� !c�KIUH�/�I--RH����`MFpM QNcl��K�S����CE�b���� ^�0R      �   �   x�u�=�0���ޘ�D9BW&L,Vbh�Ƒܘ3q.V����=��o����pb���Ey���<fm��ZMP}�d��b2���	c!ɟ��F�R%��܅���^WL��~k�SS���ow�{ Q-9Z      �   �   x�Mͽ�0�ṽ�$n((�1�D�AD��hU䟏F��N.ϻ���8Q6��)�$���L��,�Ҙ��^/�ٮd�|������\/:W�u7_��m*2�
r��I�IƁ��L���Z.4t1�ww&e]��_�AG^�ᇓn��vV=�K�Ԍ�vx��4�?5zq""
2�!�d��6�C�     