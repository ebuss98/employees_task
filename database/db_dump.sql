toc.dat                                                                                             0000600 0004000 0002000 00000031132 14041364657 0014451 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                           y            employeesdb    13.1    13.2 ,               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                    1262    24867    employeesdb    DATABASE     `   CREATE DATABASE employeesdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE employeesdb;
                evgenijbuss    false                     3079    24963 	   tablefunc 	   EXTENSION     =   CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;
    DROP EXTENSION tablefunc;
                   false                    0    0    EXTENSION tablefunc    COMMENT     `   COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';
                        false    2         ?            1259    24877 	   countries    TABLE     ?   CREATE TABLE public.countries (
    country_id character(2) NOT NULL,
    country_name character varying(40),
    region_id integer
);
    DROP TABLE public.countries;
       public         heap    postgres    false         ?            1259    24898    departments    TABLE     ?   CREATE TABLE public.departments (
    department_id integer,
    department_name character varying(30) NOT NULL,
    manager_id integer,
    location_id integer
);
    DROP TABLE public.departments;
       public         heap    postgres    false         ?            1259    24907    departments_seq    SEQUENCE     }   CREATE SEQUENCE public.departments_seq
    START WITH 280
    INCREMENT BY 10
    NO MINVALUE
    MAXVALUE 9990
    CACHE 1;
 &   DROP SEQUENCE public.departments_seq;
       public          postgres    false         ?            1259    24913 	   employees    TABLE     ?  CREATE TABLE public.employees (
    employee_id integer,
    first_name character varying(20),
    last_name character varying(25) NOT NULL,
    email character varying(25) NOT NULL,
    phone_number character varying(20),
    hire_date date NOT NULL,
    job_id character varying(10) NOT NULL,
    salary numeric(8,2),
    commission_pct numeric(2,2),
    manager_id integer,
    department_id integer,
    CONSTRAINT emp_salary_min CHECK ((salary > (0)::numeric))
);
    DROP TABLE public.employees;
       public         heap    postgres    false         ?            1259    24940    employees_seq    SEQUENCE     x   CREATE SEQUENCE public.employees_seq
    START WITH 207
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.employees_seq;
       public          postgres    false         ?            1259    24868    job_history    TABLE     
  CREATE TABLE public.job_history (
    employee_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    job_id character varying(10) NOT NULL,
    department_id integer,
    CONSTRAINT jhist_date_interval CHECK ((end_date > start_date))
);
    DROP TABLE public.job_history;
       public         heap    postgres    false         ?            1259    24909    jobs    TABLE     ?   CREATE TABLE public.jobs (
    job_id character varying(10),
    job_title character varying(35) NOT NULL,
    min_salary integer,
    max_salary integer
);
    DROP TABLE public.jobs;
       public         heap    postgres    false         ?            1259    24887 	   locations    TABLE     ?   CREATE TABLE public.locations (
    location_id integer,
    street_address character varying(40),
    postal_code character varying(12),
    city character varying(30) NOT NULL,
    state_province character varying(25),
    country_id character(2)
);
    DROP TABLE public.locations;
       public         heap    postgres    false         ?            1259    24896    locations_seq    SEQUENCE     }   CREATE SEQUENCE public.locations_seq
    START WITH 3300
    INCREMENT BY 100
    NO MINVALUE
    MAXVALUE 9900
    CACHE 1;
 $   DROP SEQUENCE public.locations_seq;
       public          postgres    false         ?            1259    24872    regions    TABLE     g   CREATE TABLE public.regions (
    region_id integer NOT NULL,
    region_name character varying(25)
);
    DROP TABLE public.regions;
       public         heap    postgres    false         ?          0    24877 	   countries 
   TABLE DATA           H   COPY public.countries (country_id, country_name, region_id) FROM stdin;
    public          postgres    false    203       3321.dat ?          0    24898    departments 
   TABLE DATA           ^   COPY public.departments (department_id, department_name, manager_id, location_id) FROM stdin;
    public          postgres    false    206       3324.dat ?          0    24913 	   employees 
   TABLE DATA           ?   COPY public.employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) FROM stdin;
    public          postgres    false    209       3327.dat ?          0    24868    job_history 
   TABLE DATA           _   COPY public.job_history (employee_id, start_date, end_date, job_id, department_id) FROM stdin;
    public          postgres    false    201       3319.dat ?          0    24909    jobs 
   TABLE DATA           I   COPY public.jobs (job_id, job_title, min_salary, max_salary) FROM stdin;
    public          postgres    false    208       3326.dat ?          0    24887 	   locations 
   TABLE DATA           o   COPY public.locations (location_id, street_address, postal_code, city, state_province, country_id) FROM stdin;
    public          postgres    false    204       3322.dat ?          0    24872    regions 
   TABLE DATA           9   COPY public.regions (region_id, region_name) FROM stdin;
    public          postgres    false    202       3320.dat            0    0    departments_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.departments_seq', 280, false);
          public          postgres    false    207         	           0    0    employees_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.employees_seq', 207, false);
          public          postgres    false    210         
           0    0    locations_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.locations_seq', 3300, false);
          public          postgres    false    205         d           2606    24881    countries country_c_id_pk 
   CONSTRAINT     _   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT country_c_id_pk PRIMARY KEY (country_id);
 C   ALTER TABLE ONLY public.countries DROP CONSTRAINT country_c_id_pk;
       public            postgres    false    203         i           2606    24918    employees emp_email_uk 
   CONSTRAINT     R   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT emp_email_uk UNIQUE (email);
 @   ALTER TABLE ONLY public.employees DROP CONSTRAINT emp_email_uk;
       public            postgres    false    209         f           1259    24901 
   dept_id_pk    INDEX     R   CREATE UNIQUE INDEX dept_id_pk ON public.departments USING btree (department_id);
    DROP INDEX public.dept_id_pk;
       public            postgres    false    206         j           1259    24919    emp_emp_id_pk    INDEX     Q   CREATE UNIQUE INDEX emp_emp_id_pk ON public.employees USING btree (employee_id);
 !   DROP INDEX public.emp_emp_id_pk;
       public            postgres    false    209         a           1259    24942    jhist_emp_id_st_date_pk    INDEX     i   CREATE UNIQUE INDEX jhist_emp_id_st_date_pk ON public.job_history USING btree (employee_id, start_date);
 +   DROP INDEX public.jhist_emp_id_st_date_pk;
       public            postgres    false    201    201         g           1259    24912 	   job_id_pk    INDEX     C   CREATE UNIQUE INDEX job_id_pk ON public.jobs USING btree (job_id);
    DROP INDEX public.job_id_pk;
       public            postgres    false    208         e           1259    24890 	   loc_id_pk    INDEX     M   CREATE UNIQUE INDEX loc_id_pk ON public.locations USING btree (location_id);
    DROP INDEX public.loc_id_pk;
       public            postgres    false    204         b           1259    24876 	   reg_id_pk    INDEX     I   CREATE UNIQUE INDEX reg_id_pk ON public.regions USING btree (region_id);
    DROP INDEX public.reg_id_pk;
       public            postgres    false    202         n           2606    24882    countries countr_reg_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countr_reg_fk FOREIGN KEY (region_id) REFERENCES public.regions(region_id);
 A   ALTER TABLE ONLY public.countries DROP CONSTRAINT countr_reg_fk;
       public          postgres    false    3170    203    202         p           2606    24902    departments dept_loc_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT dept_loc_fk FOREIGN KEY (location_id) REFERENCES public.locations(location_id);
 A   ALTER TABLE ONLY public.departments DROP CONSTRAINT dept_loc_fk;
       public          postgres    false    206    3173    204         q           2606    24958    departments dept_mgr_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id);
 A   ALTER TABLE ONLY public.departments DROP CONSTRAINT dept_mgr_fk;
       public          postgres    false    206    209    3178         r           2606    24920    employees emp_dept_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT emp_dept_fk FOREIGN KEY (department_id) REFERENCES public.departments(department_id);
 ?   ALTER TABLE ONLY public.employees DROP CONSTRAINT emp_dept_fk;
       public          postgres    false    209    206    3174         s           2606    24925    employees emp_job_fk    FK CONSTRAINT     u   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT emp_job_fk FOREIGN KEY (job_id) REFERENCES public.jobs(job_id);
 >   ALTER TABLE ONLY public.employees DROP CONSTRAINT emp_job_fk;
       public          postgres    false    3175    208    209         t           2606    24930    employees emp_manager_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT emp_manager_fk FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT emp_manager_fk;
       public          postgres    false    209    3178    209         m           2606    24953    job_history jhist_dept_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT jhist_dept_fk FOREIGN KEY (department_id) REFERENCES public.departments(department_id);
 C   ALTER TABLE ONLY public.job_history DROP CONSTRAINT jhist_dept_fk;
       public          postgres    false    206    201    3174         l           2606    24948    job_history jhist_emp_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT jhist_emp_fk FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);
 B   ALTER TABLE ONLY public.job_history DROP CONSTRAINT jhist_emp_fk;
       public          postgres    false    201    209    3178         k           2606    24943    job_history jhist_job_fk    FK CONSTRAINT     y   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT jhist_job_fk FOREIGN KEY (job_id) REFERENCES public.jobs(job_id);
 B   ALTER TABLE ONLY public.job_history DROP CONSTRAINT jhist_job_fk;
       public          postgres    false    3175    201    208         o           2606    24891    locations loc_c_id_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT loc_c_id_fk FOREIGN KEY (country_id) REFERENCES public.countries(country_id);
 ?   ALTER TABLE ONLY public.locations DROP CONSTRAINT loc_c_id_fk;
       public          postgres    false    203    3172    204                                                                                                                                                                                                                                                                                                                                                                                                                                              3321.dat                                                                                            0000600 0004000 0002000 00000000555 14041364657 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        IT	Italy	1
JP	Japan	3
US	United States of America	2
CA	Canada	2
CN	China	3
IN	India	3
AU	Australia	3
ZW	Zimbabwe	4
SG	Singapore	3
UK	United Kingdom	1
FR	France	1
DE	Germany	1
ZM	Zambia	4
EG	Egypt	4
BR	Brazil	2
CH	Switzerland	1
NL	Netherlands	1
MX	Mexico	2
KW	Kuwait	4
IL	Israel	4
DK	Denmark	1
HK	HongKong	3
NG	Nigeria	4
AR	Argentina	2
BE	Belgium	1
RF	Russia	1
\.


                                                                                                                                                   3324.dat                                                                                            0000600 0004000 0002000 00000001205 14041364657 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        10	Administration	200	1700
20	Marketing	201	1800
30	Purchasing	114	1700
40	Human Resources	203	2400
50	Shipping	121	1500
60	IT	103	1400
70	Public Relations	204	2700
80	Sales	145	2500
90	Executive	100	1700
100	Finance	108	1700
110	Accounting	205	1700
120	Treasury	\N	1700
130	Corporate Tax	\N	1700
140	Control And Credit	\N	1700
150	Shareholder Services	\N	1700
160	Benefits	\N	1700
170	Manufacturing	\N	1700
180	Construction	\N	1700
190	Contracting	\N	1700
200	Operations	\N	1700
210	IT Support	\N	1700
220	NOC	\N	1700
230	IT Helpdesk	\N	1700
240	Government Sales	\N	1700
250	Retail Sales	\N	1700
260	Recruiting	\N	1700
270	Payroll	\N	1700
\.


                                                                                                                                                                                                                                                                                                                                                                                           3327.dat                                                                                            0000600 0004000 0002000 00000020325 14041364657 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        100	Steven	King	SKING	515.123.4567	1987-06-17	AD_PRES	24000.00	\N	\N	90
101	Neena	Kochhar	NKOCHHAR	515.123.4568	1989-09-21	AD_VP	17000.00	\N	100	90
102	Lex	De Haan	LDEHAAN	515.123.4569	1993-01-13	AD_VP	17000.00	\N	100	90
103	Alexander	Hunold	AHUNOLD	590.423.4567	1990-01-03	IT_PROG	9000.00	\N	102	60
104	Bruce	Ernst	BERNST	590.423.4568	1991-05-21	IT_PROG	6000.00	\N	103	60
105	David	Austin	DAUSTIN	590.423.4569	1997-06-25	IT_PROG	4800.00	\N	103	60
106	Valli	Pataballa	VPATABAL	590.423.4560	1998-02-05	IT_PROG	4800.00	\N	103	60
107	Diana	Lorentz	DLORENTZ	590.423.5567	1999-02-07	IT_PROG	4200.00	\N	103	60
108	Nancy	Greenberg	NGREENBE	515.124.4569	1994-08-17	FI_MGR	12000.00	\N	101	100
109	Daniel	Faviet	DFAVIET	515.124.4169	1994-08-16	FI_ACCOUNT	9000.00	\N	108	100
110	John	Chen	JCHEN	515.124.4269	1997-09-28	FI_ACCOUNT	8200.00	\N	108	100
111	Ismael	Sciarra	ISCIARRA	515.124.4369	1997-09-30	FI_ACCOUNT	7700.00	\N	108	100
112	Jose Manuel	Urman	JMURMAN	515.124.4469	1998-03-07	FI_ACCOUNT	7800.00	\N	108	100
113	Luis	Popp	LPOPP	515.124.4567	1999-12-07	FI_ACCOUNT	6900.00	\N	108	100
114	Den	Raphaely	DRAPHEAL	515.127.4561	1994-12-07	PU_MAN	11000.00	\N	100	30
115	Alexander	Khoo	AKHOO	515.127.4562	1995-05-18	PU_CLERK	3100.00	\N	114	30
116	Shelli	Baida	SBAIDA	515.127.4563	1997-12-24	PU_CLERK	2900.00	\N	114	30
117	Sigal	Tobias	STOBIAS	515.127.4564	1997-07-24	PU_CLERK	2800.00	\N	114	30
118	Guy	Himuro	GHIMURO	515.127.4565	1998-11-15	PU_CLERK	2600.00	\N	114	30
119	Karen	Colmenares	KCOLMENA	515.127.4566	1999-08-10	PU_CLERK	2500.00	\N	114	30
120	Matthew	Weiss	MWEISS	650.123.1234	1996-07-18	ST_MAN	8000.00	\N	100	50
121	Adam	Fripp	AFRIPP	650.123.2234	1997-04-10	ST_MAN	8200.00	\N	100	50
122	Payam	Kaufling	PKAUFLIN	650.123.3234	1995-05-01	ST_MAN	7900.00	\N	100	50
123	Shanta	Vollman	SVOLLMAN	650.123.4234	1997-10-10	ST_MAN	6500.00	\N	100	50
124	Kevin	Mourgos	KMOURGOS	650.123.5234	1999-11-16	ST_MAN	5800.00	\N	100	50
125	Julia	Nayer	JNAYER	650.124.1214	1997-07-16	ST_CLERK	3200.00	\N	120	50
126	Irene	Mikkilineni	IMIKKILI	650.124.1224	1998-09-28	ST_CLERK	2700.00	\N	120	50
127	James	Landry	JLANDRY	650.124.1334	1999-01-14	ST_CLERK	2400.00	\N	120	50
128	Steven	Markle	SMARKLE	650.124.1434	2000-03-08	ST_CLERK	2200.00	\N	120	50
129	Laura	Bissot	LBISSOT	650.124.5234	1997-08-20	ST_CLERK	3300.00	\N	121	50
130	Mozhe	Atkinson	MATKINSO	650.124.6234	1997-10-30	ST_CLERK	2800.00	\N	121	50
131	James	Marlow	JAMRLOW	650.124.7234	1997-02-16	ST_CLERK	2500.00	\N	121	50
132	TJ	Olson	TJOLSON	650.124.8234	1999-04-10	ST_CLERK	2100.00	\N	121	50
133	Jason	Mallin	JMALLIN	650.127.1934	1996-06-14	ST_CLERK	3300.00	\N	122	50
134	Michael	Rogers	MROGERS	650.127.1834	1998-08-26	ST_CLERK	2900.00	\N	122	50
135	Ki	Gee	KGEE	650.127.1734	1999-12-12	ST_CLERK	2400.00	\N	122	50
136	Hazel	Philtanker	HPHILTAN	650.127.1634	2000-02-06	ST_CLERK	2200.00	\N	122	50
137	Renske	Ladwig	RLADWIG	650.121.1234	1995-07-14	ST_CLERK	3600.00	\N	123	50
138	Stephen	Stiles	SSTILES	650.121.2034	1997-10-26	ST_CLERK	3200.00	\N	123	50
139	John	Seo	JSEO	650.121.2019	1998-02-12	ST_CLERK	2700.00	\N	123	50
140	Joshua	Patel	JPATEL	650.121.1834	1998-04-06	ST_CLERK	2500.00	\N	123	50
141	Trenna	Rajs	TRAJS	650.121.8009	1995-10-17	ST_CLERK	3500.00	\N	124	50
142	Curtis	Davies	CDAVIES	650.121.2994	1997-01-29	ST_CLERK	3100.00	\N	124	50
143	Randall	Matos	RMATOS	650.121.2874	1998-03-15	ST_CLERK	2600.00	\N	124	50
144	Peter	Vargas	PVARGAS	650.121.2004	1998-07-09	ST_CLERK	2500.00	\N	124	50
145	John	Russell	JRUSSEL	011.44.1344.429268	1996-10-01	SA_MAN	14000.00	0.40	100	80
146	Karen	Partners	KPARTNER	011.44.1344.467268	1997-01-05	SA_MAN	13500.00	0.30	100	80
147	Alberto	Errazuriz	AERRAZUR	011.44.1344.429278	1997-03-10	SA_MAN	12000.00	0.30	100	80
148	Gerald	Cambrault	GCAMBRAU	011.44.1344.619268	1999-10-15	SA_MAN	11000.00	0.30	100	80
149	Eleni	Zlotkey	EZLOTKEY	011.44.1344.429018	2000-01-29	SA_MAN	10500.00	0.20	100	80
150	Peter	Tucker	PTUCKER	011.44.1344.129268	1997-01-30	SA_REP	10000.00	0.30	145	80
151	David	Bernstein	DBERNSTE	011.44.1344.345268	1997-03-24	SA_REP	9500.00	0.25	145	80
152	Peter	Hall	PHALL	011.44.1344.478968	1997-08-20	SA_REP	9000.00	0.25	145	80
153	Christopher	Olsen	COLSEN	011.44.1344.498718	1998-03-30	SA_REP	8000.00	0.20	145	80
154	Nanette	Cambrault	NCAMBRAU	011.44.1344.987668	1998-12-09	SA_REP	7500.00	0.20	145	80
155	Oliver	Tuvault	OTUVAULT	011.44.1344.486508	1999-11-23	SA_REP	7000.00	0.15	145	80
156	Janette	King	JKING	011.44.1345.429268	1996-01-30	SA_REP	10000.00	0.35	146	80
157	Patrick	Sully	PSULLY	011.44.1345.929268	1996-03-04	SA_REP	9500.00	0.35	146	80
158	Allan	McEwen	AMCEWEN	011.44.1345.829268	1996-08-01	SA_REP	9000.00	0.35	146	80
159	Lindsey	Smith	LSMITH	011.44.1345.729268	1997-03-10	SA_REP	8000.00	0.30	146	80
160	Louise	Doran	LDORAN	011.44.1345.629268	1997-12-15	SA_REP	7500.00	0.30	146	80
161	Sarath	Sewall	SSEWALL	011.44.1345.529268	1998-11-03	SA_REP	7000.00	0.25	146	80
162	Clara	Vishney	CVISHNEY	011.44.1346.129268	1997-11-11	SA_REP	10500.00	0.25	147	80
163	Danielle	Greene	DGREENE	011.44.1346.229268	1999-03-19	SA_REP	9500.00	0.15	147	80
164	Mattea	Marvins	MMARVINS	011.44.1346.329268	2000-01-24	SA_REP	7200.00	0.10	147	80
165	David	Lee	DLEE	011.44.1346.529268	2000-02-23	SA_REP	6800.00	0.10	147	80
166	Sundar	Ande	SANDE	011.44.1346.629268	2000-03-24	SA_REP	6400.00	0.10	147	80
167	Amit	Banda	ABANDA	011.44.1346.729268	2000-04-21	SA_REP	6200.00	0.10	147	80
168	Lisa	Ozer	LOZER	011.44.1343.929268	1997-03-11	SA_REP	11500.00	0.25	148	80
169	Harrison	Bloom	HBLOOM	011.44.1343.829268	1998-03-23	SA_REP	10000.00	0.20	148	80
170	Tayler	Fox	TFOX	011.44.1343.729268	1998-01-24	SA_REP	9600.00	0.20	148	80
171	William	Smith	WSMITH	011.44.1343.629268	1999-02-23	SA_REP	7400.00	0.15	148	80
172	Elizabeth	Bates	EBATES	011.44.1343.529268	1999-03-24	SA_REP	7300.00	0.15	148	80
173	Sundita	Kumar	SKUMAR	011.44.1343.329268	2000-04-21	SA_REP	6100.00	0.10	148	80
174	Ellen	Abel	EABEL	011.44.1644.429267	1996-05-11	SA_REP	11000.00	0.30	149	80
175	Alyssa	Hutton	AHUTTON	011.44.1644.429266	1997-03-19	SA_REP	8800.00	0.25	149	80
176	Jonathon	Taylor	JTAYLOR	011.44.1644.429265	1998-03-24	SA_REP	8600.00	0.20	149	80
177	Jack	Livingston	JLIVINGS	011.44.1644.429264	1998-04-23	SA_REP	8400.00	0.20	149	80
178	Kimberely	Grant	KGRANT	011.44.1644.429263	1999-05-24	SA_REP	7000.00	0.15	149	\N
179	Charles	Johnson	CJOHNSON	011.44.1644.429262	2000-01-04	SA_REP	6200.00	0.10	149	80
180	Winston	Taylor	WTAYLOR	650.507.9876	1998-01-24	SH_CLERK	3200.00	\N	120	50
181	Jean	Fleaur	JFLEAUR	650.507.9877	1998-02-23	SH_CLERK	3100.00	\N	120	50
182	Martha	Sullivan	MSULLIVA	650.507.9878	1999-06-21	SH_CLERK	2500.00	\N	120	50
183	Girard	Geoni	GGEONI	650.507.9879	2000-02-03	SH_CLERK	2800.00	\N	120	50
184	Nandita	Sarchand	NSARCHAN	650.509.1876	1996-01-27	SH_CLERK	4200.00	\N	121	50
185	Alexis	Bull	ABULL	650.509.2876	1997-02-20	SH_CLERK	4100.00	\N	121	50
186	Julia	Dellinger	JDELLING	650.509.3876	1998-06-24	SH_CLERK	3400.00	\N	121	50
187	Anthony	Cabrio	ACABRIO	650.509.4876	1999-02-07	SH_CLERK	3000.00	\N	121	50
188	Kelly	Chung	KCHUNG	650.505.1876	1997-06-14	SH_CLERK	3800.00	\N	122	50
189	Jennifer	Dilly	JDILLY	650.505.2876	1997-08-13	SH_CLERK	3600.00	\N	122	50
190	Timothy	Gates	TGATES	650.505.3876	1998-07-11	SH_CLERK	2900.00	\N	122	50
191	Randall	Perkins	RPERKINS	650.505.4876	1999-12-19	SH_CLERK	2500.00	\N	122	50
192	Sarah	Bell	SBELL	650.501.1876	1996-02-04	SH_CLERK	4000.00	\N	123	50
193	Britney	Everett	BEVERETT	650.501.2876	1997-03-03	SH_CLERK	3900.00	\N	123	50
194	Samuel	McCain	SMCCAIN	650.501.3876	1998-07-01	SH_CLERK	3200.00	\N	123	50
195	Vance	Jones	VJONES	650.501.4876	1999-03-17	SH_CLERK	2800.00	\N	123	50
196	Alana	Walsh	AWALSH	650.507.9811	1998-04-24	SH_CLERK	3100.00	\N	124	50
197	Kevin	Feeney	KFEENEY	650.507.9822	1998-05-23	SH_CLERK	3000.00	\N	124	50
198	Donald	OConnell	DOCONNEL	650.507.9833	1999-06-21	SH_CLERK	2600.00	\N	124	50
199	Douglas	Grant	DGRANT	650.507.9844	2000-01-13	SH_CLERK	2600.00	\N	124	50
200	Jennifer	Whalen	JWHALEN	515.123.4444	1987-09-17	AD_ASST	4400.00	\N	101	10
201	Michael	Hartstein	MHARTSTE	515.123.5555	1996-02-17	MK_MAN	13000.00	\N	100	20
202	Pat	Fay	PFAY	603.123.6666	1997-08-17	MK_REP	6000.00	\N	201	20
203	Susan	Mavris	SMAVRIS	515.123.7777	1994-06-07	HR_REP	6500.00	\N	101	40
204	Hermann	Baer	HBAER	515.123.8888	1994-06-07	PR_REP	10000.00	\N	101	70
205	Shelley	Higgins	SHIGGINS	515.123.8080	1994-06-07	AC_MGR	12000.00	\N	101	110
206	William	Gietz	WGIETZ	515.123.8181	1994-06-07	AC_ACCOUNT	8300.00	\N	205	110
\.


                                                                                                                                                                                                                                                                                                           3319.dat                                                                                            0000600 0004000 0002000 00000000575 14041364657 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        102	1993-01-13	1998-07-24	IT_PROG	60
101	1989-09-21	1993-10-27	AC_ACCOUNT	110
101	1993-10-28	1997-03-15	AC_MGR	110
201	1996-02-17	1999-12-19	MK_REP	20
114	1998-03-24	1999-12-31	ST_CLERK	50
122	1999-01-01	1999-12-31	ST_CLERK	50
200	1987-09-17	1993-06-17	AD_ASST	90
176	1998-03-24	1998-12-31	SA_REP	80
176	1999-01-01	1999-12-31	SA_MAN	80
200	1994-07-01	1998-12-31	AC_ACCOUNT	90
\.


                                                                                                                                   3326.dat                                                                                            0000600 0004000 0002000 00000001313 14041364657 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        AD_PRES	President	20000	40000
AD_VP	Administration Vice President	15000	30000
AD_ASST	Administration Assistant	3000	6000
FI_MGR	Finance Manager	8200	16000
FI_ACCOUNT	Accountant	4200	9000
AC_MGR	Accounting Manager	8200	16000
AC_ACCOUNT	Public Accountant	4200	9000
SA_MAN	Sales Manager	10000	20000
SA_REP	Sales Representative	6000	12000
PU_MAN	Purchasing Manager	8000	15000
PU_CLERK	Purchasing Clerk	2500	5500
ST_MAN	Stock Manager	5500	8500
ST_CLERK	Stock Clerk	2000	5000
SH_CLERK	Shipping Clerk	2500	5500
IT_PROG	Programmer	4000	10000
MK_MAN	Marketing Manager	9000	15000
MK_REP	Marketing Representative	4000	9000
HR_REP	Human Resources Representative	4000	9000
PR_REP	Public Relations Representative	4500	10500
\.


                                                                                                                                                                                                                                                                                                                     3322.dat                                                                                            0000600 0004000 0002000 00000002262 14041364657 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1000	1297 Via Cola di Rie	00989	Roma	\N	IT
1100	93091 Calle della Testa	10934	Venice	\N	IT
1200	2017 Shinjuku-ku	1689	Tokyo	Tokyo Prefecture	JP
1300	9450 Kamiya-cho	6823	Hiroshima	\N	JP
1400	2014 Jabberwocky Rd	26192	Southlake	Texas	US
1500	2011 Interiors Blvd	99236	South San Francisco	California	US
1600	2007 Zagora St	50090	South Brunswick	New Jersey	US
1700	2004 Charade Rd	98199	Seattle	Washington	US
1800	147 Spadina Ave	M5V 2L7	Toronto	Ontario	CA
1900	6092 Boxwood St	YSW 9T2	Whitehorse	Yukon	CA
2000	40-5-12 Laogianggen	190518	Beijing	\N	CN
2100	1298 Vileparle (E)	490231	Bombay	Maharashtra	IN
2200	12-98 Victoria Street	2901	Sydney	New South Wales	AU
2300	198 Clementi North	540198	Singapore	\N	SG
2400	8204 Arthur St	\N	London	\N	UK
2500	Magdalen Centre, The Oxford Science Park	OX9 9ZB	Oxford	Oxford	UK
2600	9702 Chester Road	09629850293	Stretford	Manchester	UK
2700	Schwanthalerstr. 7031	80925	Munich	Bavaria	DE
2800	Rua Frei Caneca 1360 	01307-002	Sao Paulo	Sao Paulo	BR
2900	20 Rue des Corps-Saints	1730	Geneva	Geneve	CH
3000	Murtenstrasse 921	3095	Bern	BE	CH
3100	Pieter Breughelstraat 837	3029SK	Utrecht	Utrecht	NL
3200	Mariano Escobedo 9991	11932	Mexico City	Distrito Federal,	MX
\.


                                                                                                                                                                                                                                                                                                                                              3320.dat                                                                                            0000600 0004000 0002000 00000000071 14041364657 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Europe
2	Americas
3	Asia
4	Middle East and Africa
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                       restore.sql                                                                                         0000600 0004000 0002000 00000025214 14041364657 0015402 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE employeesdb;
--
-- Name: employeesdb; Type: DATABASE; Schema: -; Owner: evgenijbuss
--

CREATE DATABASE employeesdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE employeesdb OWNER TO evgenijbuss;

\connect employeesdb

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: tablefunc; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;


--
-- Name: EXTENSION tablefunc; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    country_id character(2) NOT NULL,
    country_name character varying(40),
    region_id integer
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    department_id integer,
    department_name character varying(30) NOT NULL,
    manager_id integer,
    location_id integer
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: departments_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_seq
    START WITH 280
    INCREMENT BY 10
    NO MINVALUE
    MAXVALUE 9990
    CACHE 1;


ALTER TABLE public.departments_seq OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employee_id integer,
    first_name character varying(20),
    last_name character varying(25) NOT NULL,
    email character varying(25) NOT NULL,
    phone_number character varying(20),
    hire_date date NOT NULL,
    job_id character varying(10) NOT NULL,
    salary numeric(8,2),
    commission_pct numeric(2,2),
    manager_id integer,
    department_id integer,
    CONSTRAINT emp_salary_min CHECK ((salary > (0)::numeric))
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: employees_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_seq
    START WITH 207
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_seq OWNER TO postgres;

--
-- Name: job_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_history (
    employee_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    job_id character varying(10) NOT NULL,
    department_id integer,
    CONSTRAINT jhist_date_interval CHECK ((end_date > start_date))
);


ALTER TABLE public.job_history OWNER TO postgres;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    job_id character varying(10),
    job_title character varying(35) NOT NULL,
    min_salary integer,
    max_salary integer
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    location_id integer,
    street_address character varying(40),
    postal_code character varying(12),
    city character varying(30) NOT NULL,
    state_province character varying(25),
    country_id character(2)
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- Name: locations_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_seq
    START WITH 3300
    INCREMENT BY 100
    NO MINVALUE
    MAXVALUE 9900
    CACHE 1;


ALTER TABLE public.locations_seq OWNER TO postgres;

--
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    region_id integer NOT NULL,
    region_name character varying(25)
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (country_id, country_name, region_id) FROM stdin;
\.
COPY public.countries (country_id, country_name, region_id) FROM '$$PATH$$/3321.dat';

--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (department_id, department_name, manager_id, location_id) FROM stdin;
\.
COPY public.departments (department_id, department_name, manager_id, location_id) FROM '$$PATH$$/3324.dat';

--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) FROM stdin;
\.
COPY public.employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) FROM '$$PATH$$/3327.dat';

--
-- Data for Name: job_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_history (employee_id, start_date, end_date, job_id, department_id) FROM stdin;
\.
COPY public.job_history (employee_id, start_date, end_date, job_id, department_id) FROM '$$PATH$$/3319.dat';

--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (job_id, job_title, min_salary, max_salary) FROM stdin;
\.
COPY public.jobs (job_id, job_title, min_salary, max_salary) FROM '$$PATH$$/3326.dat';

--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (location_id, street_address, postal_code, city, state_province, country_id) FROM stdin;
\.
COPY public.locations (location_id, street_address, postal_code, city, state_province, country_id) FROM '$$PATH$$/3322.dat';

--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regions (region_id, region_name) FROM stdin;
\.
COPY public.regions (region_id, region_name) FROM '$$PATH$$/3320.dat';

--
-- Name: departments_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_seq', 280, false);


--
-- Name: employees_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_seq', 207, false);


--
-- Name: locations_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_seq', 3300, false);


--
-- Name: countries country_c_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT country_c_id_pk PRIMARY KEY (country_id);


--
-- Name: employees emp_email_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT emp_email_uk UNIQUE (email);


--
-- Name: dept_id_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX dept_id_pk ON public.departments USING btree (department_id);


--
-- Name: emp_emp_id_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX emp_emp_id_pk ON public.employees USING btree (employee_id);


--
-- Name: jhist_emp_id_st_date_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX jhist_emp_id_st_date_pk ON public.job_history USING btree (employee_id, start_date);


--
-- Name: job_id_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX job_id_pk ON public.jobs USING btree (job_id);


--
-- Name: loc_id_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX loc_id_pk ON public.locations USING btree (location_id);


--
-- Name: reg_id_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX reg_id_pk ON public.regions USING btree (region_id);


--
-- Name: countries countr_reg_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countr_reg_fk FOREIGN KEY (region_id) REFERENCES public.regions(region_id);


--
-- Name: departments dept_loc_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT dept_loc_fk FOREIGN KEY (location_id) REFERENCES public.locations(location_id);


--
-- Name: departments dept_mgr_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id);


--
-- Name: employees emp_dept_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT emp_dept_fk FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- Name: employees emp_job_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT emp_job_fk FOREIGN KEY (job_id) REFERENCES public.jobs(job_id);


--
-- Name: employees emp_manager_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT emp_manager_fk FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id);


--
-- Name: job_history jhist_dept_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT jhist_dept_fk FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- Name: job_history jhist_emp_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT jhist_emp_fk FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);


--
-- Name: job_history jhist_job_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT jhist_job_fk FOREIGN KEY (job_id) REFERENCES public.jobs(job_id);


--
-- Name: locations loc_c_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT loc_c_id_fk FOREIGN KEY (country_id) REFERENCES public.countries(country_id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    